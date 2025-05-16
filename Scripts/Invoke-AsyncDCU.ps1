


class BackgroundJob {
    # Properties
    hidden $PowerShell = [powershell]::Create()
    hidden $Handle = $null
    hidden $Runspace = $null
    $Result = $null
    $RunspaceID = $This.PowerShell.Runspace.ID
    $PSInstance = $This.PowerShell
 
    # Constructor (just code block)
    BackgroundJob ([scriptblock]$Code) {
        $This.PowerShell.AddScript($Code)
    }
 
    # Constructor (code block + arguments)
    BackgroundJob ([scriptblock]$Code, $Arguments) {
        $This.PowerShell.AddScript($Code)
        foreach ($Argument in $Arguments) {
            $This.PowerShell.AddArgument($Argument)
        }
    }
 
    # Constructor (code block + arguments + functions)
    BackgroundJob ([scriptblock]$Code, $Arguments, $Functions) {
        $InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
        $Scope = [System.Management.Automation.ScopedItemOptions]::AllScope

        foreach ($Function in $Functions) {
            $FunctionName = $Function.Split('\')[1]
            $FunctionDefinition = Get-Content $Function -ErrorAction Stop
            $SessionStateFunction = New-Object -TypeName System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList $FunctionName, $FunctionDefinition, $Scope, $null
            $InitialSessionState.Commands.Add($SessionStateFunction)
        }

        $This.Runspace = [runspacefactory]::CreateRunspace($InitialSessionState)
        $This.PowerShell.Runspace = $This.Runspace
        $This.Runspace.Open()
        $This.PowerShell.AddScript($Code)
        foreach ($Argument in $Arguments) {
            $This.PowerShell.AddArgument($Argument)
        }
    }
 
    # Start Method
    Start() {
        $This.Handle = $This.PowerShell.BeginInvoke()
    }
 
    # Stop Method
    Stop() {
        $This.PowerShell.Stop()
    }
 
    # Receive Method
    [object]Receive() {
        $This.Result = $This.PowerShell.EndInvoke($This.Handle)
        return $This.Result
    }
 
    # Remove Method
    Remove() {
        $This.PowerShell.Dispose()
        If ($This.Runspace) {
            $This.Runspace.Dispose()
        }
    }
 
    # Get Status Method
    [object]GetStatus() {
        return $This.PowerShell.InvocationStateInfo
    }
}

function New-BackgroundJob {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ScriptBlock] $ScriptBlock,
        [Parameter()]
        $Arguments,
        [Parameter()]
        $Functions
    )

    if ($ScriptBlock -and $Arguments -and $Functions) {
        $Job = [BackgroundJob]::new($ScriptBlock, $Arguments, $Functions)
    }
    elseif ($ScriptBlock -and $Arguments) {
        $Job = [BackgroundJob]::new($ScriptBlock, $Arguments)
    }
    else {
        $Job = [BackgroundJob]::new($ScriptBlock)
    }
    
    $Job.Start()

}


class DCURemote {
    [String]$ComputerName
    [String]$Ping
    [PSObject]$ScanResult

    DCURemote([String]$ComputerName) {
        $this.ComputerName = $ComputerName
    }

}

function New-JobProgress {
    [CmdletBinding()]
    param(
        $Job
    )

    #Make sure the first child job exists
    if ($null -ne $Job.ChildJobs[0].Progress) {
        #Extracts the latest progress of the job and writes the progress
        $jobProgressHistory = $Job.ChildJobs[0].Progress;
        $latestProgress = $jobProgressHistory[$jobProgressHistory.Count - 1];
        $latestPercentComplete = $latestProgress | Select-Object -expand PercentComplete;
        $latestActivity = $latestProgress | Select-Object -expand Activity;
        $latestStatus = $latestProgress | Select-Object -expand StatusDescription;
    
        #When adding multiple progress bars, a unique ID must be provided. Here I am providing the JobID as this
        Write-Progress -Id $Job.Id -Activity $latestActivity -Status $latestStatus -PercentComplete $latestPercentComplete;
    }
}

function Invoke-AsyncPing {
    [CmdletBinding()]
    param (
        [Parameter()]
        $Computers
    )

    # Initiate a Ping asynchronously per remote host, pick up the result task objects
    $Tasks = foreach ($ComputerName in $Computers) {
        #(New-Object System.Net.NetworkInformation.Ping).SendPingAsync($ComputerName)
        $PingObject = [System.Net.NetworkInformation.Ping]::new()
        $PingObject.SendPingAsync($ComputerName)
    }

    # Wait for all tasks to finish
    [System.Threading.Tasks.Task]::WaitAll($Tasks)

    # Output results
    $Tasks | Select-Object -Expand Result

}

function Get-DCUParams {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet("Scan", "ScanToXML", "Bios", "Firmware", "Driver", "Application", "Other", "CleanImage")]
        [string] $UpdateType = "Scan",
        [bool] $Silent,
        [bool] $Reboot
    )
    
    $DCUReturnTablet = @(
        @{
            ReturnCode  = "0"; 
            Description = "Command execution was successful."; 
            Resolution  = "None" 
        }
        @{
            ReturnCode  = "1"; 
            Description = "A reboot was required from the execution of an operation."; 
            Resolution  = "Reboot the system to complete the operation." 
        }
        @{
            ReturnCode  = "2"; 
            Description = "An unknown application error has occurred."; 
            Resolution  = "None" 
        }
        @{
            ReturnCode  = "3"; 
            Description = "The current system manufacturer is not Dell."; 
            Resolution  = "Dell Command | Update can only be run on Dell systems." 
        }
        @{
            ReturnCode  = "4"; 
            Description = "The CLI was not launched with administrative privilege."; 
            Resolution  = "Invoke the Dell Command | Update CLI with administrative privileges." 
        }
        @{
            ReturnCode  = "5"; 
            Description = "A reboot was pending from a previous operation."; 
            Resolution  = "Reboot the system to complete the operation." 
        }
        @{
            ReturnCode  = "6"; 
            Description = "Another instance of the same application (UI or CLI) is already running."; 
            Resolution  = "Close any running instance of Dell Command | Update UI or CLI and retry the operation." 
        }
        @{
            ReturnCode  = "7"; 
            Description = "The application does not support the current system model."; 
            Resolution  = "Contact your administrator if the current system model in not supported by the catalog." 
        }
        @{
            ReturnCode  = "8"; 
            Description = "No update filters have been applied or configured."; 
            Resolution  = "Supply at least one update filter." 
        }
        @{
            ReturnCode  = "107"; 
            Description = "While evaluating the command line parameters, one or more values provided to the specific option was invalid."; 
            Resolution  = "Provide an acceptable value. See Command line interface reference section, for more information."
        }
        @{
            ReturnCode  = "500"; 
            Description = "No updates were found for the system when a scan operation was performed."; 
            Resolution  = "The system is up to date or no updates were found for the provided filters. Modify the filters and rerun the commands." 
        }
        @{
            ReturnCode  = "501"; 
            Description = "An error occurred while determining the available updates for the system, when a scan operation was performed."; 
            Resolution  = "Retry the operation." 
        }
        @{
            ReturnCode  = "503"; 
            Description = "An error occurred while downloading a file during the scan operation."; 
            Resolution  = "Check your network connection, ensure there is Internet connectivity and Retry the command." 
        }
        @{
            ReturnCode  = "1000"; 
            Description = "An error occurred when retrieving the result of the apply updates operation."; 
            Resolution  = "Retry the operation." 
        }
        @{
            ReturnCode  = "1001"; 
            Description = "The cancellation was initiated, Hence, the apply updates operation is canceled."; 
            Resolution  = "Retry the operation." 
        }
        @{
            ReturnCode  = "1002"; 
            Description = "An error occurred while downloading a file during the apply updates operation."; 
            Resolution  = "Check your network connection, ensure there is Internet connectivity, and retry the command." 
        }
        @{
            ReturnCode  = "3003"; 
            Description = "The Dell Client Management Service is busy."; 
            Resolution  = "Wait until the service is available to process new requests." 
        }

    )

    $LogFolder = "C:\Temp\DCU"
    $LogFile = "$LogFolder\DCU.log"

    if (Test-path -Path 'C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe') {
        $ProcessPath = 'C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe'
    } elseif (Test-path -Path 'C:\Program Files\Dell\CommandUpdate\dcu-cli.exe') {
        $ProcessPath = 'C:\Program Files\Dell\CommandUpdate\dcu-cli.exe'
    } else {
        throw "No DCU Installed"
    }

    if ($Silent) {
        $SilentArg = '-Silent'
    } else {
        $SilentArg = ''
    }

    if ($Reboot) {
        $RebootArg = '-reboot=enable'
    } else {
        $RebootArg = '-reboot=disable'
    }

    switch ($UpdateType) {
        'Scan' {
            $ProcessArgs = "/Scan -outputLog=$($LogFile) $($SilentArg)"
        }
        'ScanToXML' {
            $ProcessArgs = "/Scan -report=$($LogFolder)"
        }
        'CleanImage' {
            $ProcessArgs = "/DriverInstall -outputLog=$LogFile $RebootArg"
        }
        'Drivers' {
            $ProcessArgs = "/DriverInstall -outputLog=$LogFile $RebootArg $SilentArg"
        }
        Default {
            $ProcessArgs = "/applyUpdates -updateType=$UpdateType -outputLog=$LogFile $RebootArg $SilentArg"
        }
    }

    [PSCustomObject]@{
        LogFolder       = $LogFolder
        LogFile         = $LogFile
        UpdateType      = $UpdateType
        ProcessPath     = $ProcessPath
        ProcessArgs     = $ProcessArgs
        DCUReturnTablet = $DCUReturnTablet
    }

}

function Invoke-AsyncDCU {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [String[]] $Computers,
        [Parameter(Mandatory = $false)]
        [ValidateSet("Scan", "ScanToXML", "Bios", "Firmware", "Driver", "Application", "Other", "CleanImage")]
        [string] $UpdateType = "Scan",
        [switch] $Silent,
        [switch] $Reboot
    )

    $ScriptName = $MyInvocation.MyCommand.Name

    $Global:SyncHash = [Hashtable]::Synchronized(@{})
    $SyncHash.Host = $Host
    $SyncHash.ScriptName = $ScriptName
    $SyncHash.DCUParams = Get-DCUParams -UpdateType $UpdateType -Silent $Silent -Reboot $Reboot

    $Results = @{}

    foreach ($ComputerName in $Computers) {

        $SyncHash.$ComputerName = @{}
        $SyncHash.$ComputerName.ComputerName = $ComputerName

        if (Test-Connection $SyncHash.$ComputerName.ComputerName -Count 1 -Quiet) {

            Write-Host "[$($SyncHash.$ComputerName.ComputerName)][$($SyncHash.DCUParams.UpdateType)] Device is online" -ForegroundColor Cyan

            $ScriptBlock = {

                try {
                    #Write-Host "[$($this.ComputerName)][$($this.UpdateType)] Start DCU" -ForegroundColor Cyan
                    $SyncHash.Host.UI.WriteLine("[$($SyncHash.$ComputerName.ComputerName)][$($SyncHash.DCUParams.UpdateType)] Start DCU")

                    Invoke-Command -ComputerName $SyncHash.$ComputerName.ComputerName -ScriptBlock {
                        param($SyncHash, $ComputerName)

                        if (!(Test-Path -Path $SyncHash.DCUParams.LogFolder)) {
                            try {
                                [void][System.IO.Directory]::CreateDirectory($SyncHash.DCUParams.LogFolder)
                            }
                            catch {
                                $Message = "[$($SyncHash.ScriptName)][$($_.InvocationInfo.ScriptLineNumber)] $($SyncHash.$ComputerName.ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                                #Write-Host $Message -ForegroundColor Red
                                $SyncHash.$ComputerName.Message = $Message
                                $SyncHash.Host.UI.WriteErrorLine($Message)
                            }
                            
                        }

                        $SyncHash.Host.UI.WriteLine("[$($SyncHash.$ComputerName.ComputerName)][$($SyncHash.DCUParams.UpdateType)] Start DCU")

                        $SyncHash.$ComputerName.DCU = Start-Process -FilePath $SyncHash.DCUParams.ProcessPath -ArgumentList $SyncHash.DCUParams.ProcessArgs -Wait -PassThru -NoNewWindow
                        $SyncHash.$ComputerName.DCUReturn = $SyncHash.DCUParams.DCUReturnTablet | Where-Object { $_.ReturnCode -eq $SyncHash.$ComputerName.DCU.ExitCode }

                        #Write-Host "[$($Hash.ComputerName)][$($Hash.DCUParams.UpdateType)] DCU Finished with Code: $($DCU.ExitCode) | $($DCUReturn.Description)" -ForegroundColor Green

                    } -ArgumentList @($SyncHash, $SyncHash.$ComputerName.ComputerName) -EnableNetworkAccess -RunAsAdministrator

                }
                catch {
                    $Message = "[$($SyncHash.ScriptName)][$($_.InvocationInfo.ScriptLineNumber)] $($SyncHash.$ComputerName.ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                    #Write-Host $Message -ForegroundColor Red
                    $SyncHash.$ComputerName.Message = $Message
                    $SyncHash.Host.UI.WriteErrorLine($Message)
                }

            }

            $Runspace = [RunspaceFactory]::CreateRunspace()
            $Runspace.Open()
            $Runspace.SessionStateProxy.SetVariable('SyncHash', $SyncHash)
            $Runspace.SessionStateProxy.SetVariable('ComputerName', $ComputerName)

            $PowerShell = [PowerShell]::Create()
            $PowerShell.Runspace = $Runspace
            $PowerShell.AddScript($ScriptBlock) #| Out-Null
            $Handle = $PowerShell.BeginInvoke()
            $SyncHash.$ComputerName.Error = $PowerShell.Streams.Error

            while (-not $Handle.IsCompleted) {
                Start-Sleep -Milliseconds 100
            }

            Write-Host "[$($SyncHash.$ComputerName.ComputerName)][$($SyncHash.DCUParams.UpdateType)] DCU Finished with Code: $($SyncHash.$ComputerName.DCU.ExitCode) | $($SyncHash.$ComputerName.DCUReturn.Description)" -ForegroundColor Green
            
            $PowerShell.EndInvoke($Handle)
            $Runspace.Close()
            $PowerShell.Dispose()

        }
        else {
            Write-Host "[$($SyncHash.$ComputerName.ComputerName)][$($SyncHash.DCUParams.UpdateType)] Device is offline" -ForegroundColor Cyan
        }

        $Results[$SyncHash.$ComputerName.ComputerName] = $SyncHash.$ComputerName

    }

    return $Results

}

function Get-DCUScanResult {
    [CmdletBinding()]
    param (
        [Parameter()]
        $AllResults
    )

    begin {

        $NoUpdates = $AllResults | Where-Object { $_.Status -eq 'valid' -and $_.Updates -eq 0 }
        $FoundUpdates = $AllResults | Where-Object { $_.Status -eq 'valid' -and $_.Updates -gt 0 }
        $ScanErrors = $AllResults | Where-Object { $_.Status -eq 'error' }
        $ScanUnknown = $AllResults | Where-Object { $_.Status -eq 'unknown' }
        $NotOnline = $Computers.Count - $AllResults.Count

    }
    process {
        
        if ($NoUpdates) {
            Write-Host "`nNo Updates: $($NoUpdates.Count)" -ForegroundColor Green #-NoNewline
        }

        if ($ScanUnknown) {
            Write-Host "`nUnknown:" -ForegroundColor Yellow
            $ScanUnknown | Sort-Object -Property Computer | Format-Table -AutoSize -HideTableHeaders
        }

        if ($ScanErrors) {
            Write-Host "`nError:" -ForegroundColor Red -NoNewline
            $ScanErrors | Sort-Object -Property Computer | Select-Object -Property Computer, Reason, ReturnCode | Format-Table -AutoSize -HideTableHeaders
        }

        if ($NotOnline -gt 0) {
            Write-Host "`nNot Online: $($NotOnline)" -ForegroundColor Red #-NoNewline
        }

        if ($FoundUpdates) {
            Write-Host "`nUpdates found:" -ForegroundColor Green -NoNewline
            $FoundUpdates | Sort-Object -Property Computer | Select-Object -Property Computer, Updates | Format-Table -AutoSize -HideTableHeaders
        }
    }
}

$Computers = 'PC1264', 'PC1136', 'PC1159', 'PC1154', 'PC1155', 'PC1180', 'PC683', 'PC331', 'PC973', 'PC1153', 'PC722', 'PC723', 'PC796', 'PC1122', 'LP1023', 'PC1420', 'PC1411', 'PC626', 'PC1156', 'PC1416', 'PC1093', 'PC1094', 'PC1095', 'PC1096', 'PC1097', 'PC1098'
$Computers = 'PC1264', 'PC1136', 'PC1159', 'PC1154', 'PC1155', 'PC1180', 'PC683', 'PC331', 'PC973', 'PC1153', 'PC722', 'PC723', 'PC1097'
#$Results = Invoke-AsyncDCU -Computers $Computers -UpdateType Scan -Silent

#Start-Sleep -Seconds 1

###################################################################################################################


#$Creds = Get-Credential -Message 'Creds' -UserName 'SERVER\admmellunigm'
#$Creds | Export-Clixml -Path 'Secure.cred'

$Creds = Import-Clixml -Path "$PSScriptRoot\Secure.cred"

$UpdateType = 'Scan'
$DCUParams = Get-DCUParams -UpdateType $UpdateType -Silent $True -Reboot $False
$StartTime = Get-Date
$JobName = "DCU-$UpdateType-$($StartTime.Ticks)"
$AllResults = [System.Collections.ArrayList]::new()

#$PingComputers = Invoke-AsyncPing -Computers $Computers

#Enable-WSManCredSSP -Role Client -DelegateComputer $Computers

$SessParams = @{
    ComputerName        = $Computers
    Credential          = $Creds
    Authentication      = 'Kerberos'
    #EnableNetworkAccess = $True
    #ThrottleLimit       = 10
    ErrorAction         = 'SilentlyContinue'
}

#$Sessions = New-PSSession -ComputerName $Computers -ErrorAction SilentlyContinue
$Sessions = New-PSSession @SessParams

#Invoke-Command -Session $Sessions -ScriptBlock { Enable-WSManCredSSP -Role Server -Force }

$ScriptBlock = {

    $DCUParams = $Using:DCUParams
    $ComputerName = $env:COMPUTERNAME

    #$Activity = "[$ComputerName] Processing DCU"

    try {

        #$PercentComplete = 0
        #$Status = "$($PercentComplete)% Complete "
        #Write-Progress -Activity $Activity -Status $Status -PercentComplete $PercentComplete

        #Write-Host "[$($ComputerName)][$($DCUParams.UpdateType)] Start DCU" -ForegroundColor Cyan
        #$SyncHash.Host.UI.WriteLine("[$($SyncHash.$ComputerName.ComputerName)][$($SyncHash.DCUParams.UpdateType)] Start DCU")

        #Invoke-Command -ComputerName $SyncHash.$ComputerName.ComputerName -ScriptBlock {
        #    param($SyncHash, $ComputerName)

        if (!(Test-Path -Path $DCUParams.LogFolder)) {
            try {
                [void][System.IO.Directory]::CreateDirectory($DCUParams.LogFolder)
            }
            catch {
                $Message = "[$($_.InvocationInfo.ScriptLineNumber)] $($ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                Write-Host $Message -ForegroundColor Red
                #$SyncHash.$ComputerName.Message = $Message
                #$SyncHash.Host.UI.WriteErrorLine($Message)
            }
                            
        }

        #$SyncHash.Host.UI.WriteLine("[$($SyncHash.$ComputerName.ComputerName)][$($SyncHash.DCUParams.UpdateType)] Start DCU")

        $DCU = Start-Process -FilePath $DCUParams.ProcessPath -ArgumentList $DCUParams.ProcessArgs -Wait -PassThru -Verb RunAs -WindowStyle Hidden
        $DCUReturn = $DCUParams.DCUReturnTablet | Where-Object { $_.ReturnCode -eq $DCU.ExitCode }

        Write-Host "[$($ComputerName)][$($DCUParams.UpdateType)] DCU Finished with Code: $($DCU.ExitCode) | $($DCUReturn.Description)" -ForegroundColor Green

        #} -ArgumentList @($SyncHash, $SyncHash.$ComputerName.ComputerName) -EnableNetworkAccess -RunAsAdministrator

    }
    catch {
        $Message = "[$($_.InvocationInfo.ScriptLineNumber)] $($ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
        Write-Host $Message -ForegroundColor Red
        #$SyncHash.$ComputerName.Message = $Message
        #$SyncHash.Host.UI.WriteErrorLine($Message)
    }

    #$PercentComplete = 100
    #$Status = "$($PercentComplete)% Complete "
    #Write-Progress -Activity $Activity -Status $Status -PercentComplete $PercentComplete

}

$CmdParams = @{
    Session     = $Sessions
    ScriptBlock = $ScriptBlock
    AsJob       = $True
    JobName     = $JobName
}

try {
    if ($Sessions) {
        Invoke-Command @CmdParams | Out-Null
    }
    else {
        Write-Host "No Sessions connected"
        Exit
    }
}
catch {
    $ErrorMessage = "[$($_.InvocationInfo.ScriptLineNumber)] Error connecting Sessions. `n$(Resolve-Error)"
    Write-Error -Message $ErrorMessage
}


$Jobs = Get-Job -Name $JobName
#$i = 0

if ($Jobs) {

    $JobStartTime = [DateTime]$Jobs.PSBeginTime
    $JobsCount = $Jobs.ChildJobs.Count

    <#
    While (@($Jobs | Where-Object { $_.State -eq "Running" }).Count -ne 0) {
        #while ($Jobs.State -ne 'Completed') {
        Clear-Host
        
        $span = ((Get-Date) - $JobStartTime)
        $RunTime = '{0:00}:{1:00}:{2:00}' -f $span.Hours, $span.Minutes, $span.Seconds
    
        $Completed = $Jobs.ChildJobs | Where-Object { $_.State -eq 'Completed' }

        Write-Host "[$RunTime] " -NoNewline
        Write-Host "[$($Completed.Count)/$($JobsCount)] " -ForegroundColor Cyan -NoNewline
        Write-Host "Processing DCU on remote devices" -ForegroundColor Yellow -NoNewline
        #Write-Host ("." * $i) -ForegroundColor Yellow -NoNewline
    
        Start-Sleep -Seconds 1
        #$i++
    }
    #>
    Clear-Host

    While (@($Jobs | Where-Object { $_.State -eq "Running" }).Count -ne 0) {
        #New-JobProgress -Job $Jobs
        #Clear-Host
        
        $span = ((Get-Date) - $JobStartTime)
        $RunTime = '{0:00}:{1:00}:{2:00}' -f $span.Hours, $span.Minutes, $span.Seconds
    
        $Completed = $Jobs.ChildJobs | Where-Object { $_.State -eq 'Completed' }
        $PercentComplete = ($Completed.Count / $JobsCount) * 100
        $Status = " $($PercentComplete.ToString())% Complete [$($Completed.Count)/$($JobsCount)]"
        $Activity = "[$RunTime] Processing DCU on remote devices"

        Write-Progress -Id $Jobs.Id -Activity $Activity -Status $Status -PercentComplete $PercentComplete

        Start-Sleep -Seconds 1
    }

    Write-Progress -Id $Jobs.Id -Activity $Activity -Status $Status -Completed

    #$Jobs | Format-List -Property *
    #$Results = $Jobs | Receive-Job
    #Clear-Host
    foreach ($Computer in $Sessions.ComputerName) {

        #Write-Host "`n[$Computer][$UpdateType] Result:"

        $Updates = 0
        $DCUResult = $null
        $ScanResult = $null
        $ResultStatus = $null
        $NoUpdates = $null
        $ScanAvailable = $null
        $FailedCatalogDownload = $null
        $NetworkError = $null
        $Message = $null

        $DCUResultPath = Join-Path -Path "\\$Computer" -ChildPath "C$\Temp\DCU\DCU.log" #-Resolve -ErrorAction SilentlyContinue

        if (Test-Path -Path $DCUResultPath) {
            $DCUResult = Get-Content -Path $DCUResultPath
        
            $ScanResult = $DCUResult | Select-String -Pattern 'The scan result is'
            
            if ($ScanResult) {
                $ScanResult = $ScanResult.ToString()

                switch ($ScanResult) {
                    { $_ -match 'VALID_RESULT' } {

                        $ResultStatus = 'valid'
                        $NoUpdates = $DCUResult | Select-String -Pattern NO_INVENTORIED_UPDATES_FOUND

                        if (-not $NoUpdates) {
                            $ScanAvailable = $DCUResult | Select-String -pattern Urgent, Recommended, Optional
                        }

                    }
                    { $_ -match 'DOWNLOAD_ERROR' } {
                        $ResultStatus = 'error'
                    }
                    DEFAULT {
                        $ResultStatus = 'unknown'
                    }
                }

                switch ($ResultStatus) {
                    'valid' {

                        if ($ScanAvailable) {
                        
                            $ScanAvailable.ForEach({ Write-Host "[$Computer] `t$($_)" -ForegroundColor Green; $Updates++ })

                        }
                        else {
                            $Message = "No updates found"
                            #Write-Host "[$Computer] `t$Message" -ForegroundColor Green
                        }

                    }
                    'error' {
                        $FailedCatalogDownload = $DCUResult | Select-String -Pattern INDEX_CATALOG_FAILED_DOWNLOAD
                        $NetworkError = $DCUResult | Select-String -Pattern NETWORK_ERROR

                        if ($FailedCatalogDownload) {
                            $Message = "Unable to download Catalog"
                        }

                        if ($NetworkError) {
                            $Message += " Reason: Network Error"
                        }

                        Write-Host "[$Computer] `t$Message" -ForegroundColor Red
                    }
                    'unknown' {
                        $Message = "Scanresult is unknown"
                        Write-Host "[$Computer] `t$Message" -ForegroundColor Yellow
                    }
                }
                
            }

            $ScanReturnCode = $DCUResult | Select-String -Pattern 'return code:'
            $ScanReturnCode = $ScanReturnCode.ToString().Split('code: ')[1].Trim()

            $DCUReturn = $DCUParams.DCUReturnTablet | Where-Object { $_.ReturnCode -eq $ScanReturnCode }

            <#
            $ScanValid = $DCUResult | Select-String -Pattern VALID_RESULT
            $ScanFailed = $DCUResult | Select-String -Pattern FAILED
            $ScanError = $DCUResult | Select-String -Pattern ERROR
            $FailedCatalogDownload = $DCUResult | Select-String -Pattern DOWNLOAD_ERROR


            if ($ScanValid) {
                $NoUpdates = $DCUResult | Select-String -Pattern NO_INVENTORIED_UPDATES_FOUND

                if (-not $NoUpdates) {
                    $ScanAvailable = $DCUResult | Select-String -pattern Urgent, Recommended, Optional
                }
            }

            if ($ScanAvailable -or $FailedCatalogDownload -or $ScanFailed) {
                #    Write-Host "`n[$Computer][$UpdateType] Result:"
                Write-Host "`n"
            
                Receive-Job -Location $Computer -Job $Jobs

                if ($ScanAvailable) {
                    $ScanAvailable.ForEach({ Write-Host "[$Computer] `t$($_)" -ForegroundColor Green })
                }
            
                if ($FailedCatalogDownload) {
                    $FailedCatalogDownload.ForEach({ Write-Host "[$Computer] `t$($_)" -ForegroundColor Yellow })
                }
        
                if ($ScanFailed) {
                    $ScanFailed.ForEach({ Write-Host "[$Computer] `t$($_)" -ForegroundColor Red })
                }

            }
            #>
        
        }
        else {
            #Write-Host "`n"
        
            $ScanResult = 'NoResult'
            $ResultStatus = 'NoFile'
            Receive-Job -Location $Computer -Job $Jobs

            $Message = "No Result or connection failure"
            Write-Host "[$Computer] `t$Message" -ForegroundColor Red

        }
        
        $AllResults += [PSCustomObject]@{
            Computer    = $Computer
            ReturnCode  = $ScanReturnCode
            Description = $DCUReturn.Description
            Result      = $ScanResult
            Status      = $ResultStatus
            Reason      = $Message
            Updates     = $Updates
        }

        Remove-PSSession -ComputerName $Computer
    }

    $Jobs | Remove-Job

}


Get-DCUScanResult -AllResults $AllResults


#Start-Sleep -Seconds 1
