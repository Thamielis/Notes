[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "")]
$ErrorActionPreference = 'Stop'

# Define List of IPs / Hosts to Ping
# $Computers = 'host1', 'host2', 'host3'
#$Computers = 1..254 | ForEach-Object {
#    "192.168.0.$_"
#}

$Computers = 'PC1264', 'PC1136', 'PC1159'#, 'PC1154', 'PC1155', 'PC1180'#, 'PC683', 'PC331', 'PC973', 'PC1153', 'PC722', 'PC723', 'PC1097'

$Global:SyncHash = [Hashtable]::Synchronized(@{})
$Global:SyncHash.Host = $Host
$Global:SyncHash.Computers = $Computers
#$Global:SyncHash.ComputerOnline = [System.Collections.ArrayList]::Synchronized([System.Collections.ArrayList]::new())
$Global:SyncHash.ComputerOnline = [System.Collections.ArrayList]::new()
$Global:SyncHash.AsyncResults = [System.Collections.ArrayList]::new()
$Global:SyncHash.AllResults = [System.Collections.ArrayList]::new()

$Global:SyncHash.Scan = [Hashtable]::Synchronized(@{})
$Global:SyncHash.Scan.Result = [Ordered]@{
    NotOnline = $null
    NoUpdates = $null
    ScanUnknown = $null
    ScanErrors = $null
    FoundUpdates = $null
}

function Get-CmdRuntime {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $ComputerName,
        [Parameter()]
        [String] $FunctionName,
        [Switch] $AllProperties
    )

    $stoppuhr = [system.diagnostics.stopwatch]::StartNew()
    $stoppuhr.restart()

    if ($AllProperties) {
        $Properties = "-Properties '*'"
    }

    $Result = Invoke-Expression "$FunctionName -ComputerName $ComputerName $Properties"

    $stoppuhr.stop()
    Write-Host -Message "[$FunctionName] ExecutionTime: $($stoppuhr.Elapsed.TotalSeconds)"

    if ($Result) {
        $Result | Add-Member -MemberType NoteProperty -Name 'Runtime' -Value $($stoppuhr.Elapsed.TotalSeconds)
    }
    
    return $Result
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
    }
    elseif (Test-path -Path 'C:\Program Files\Dell\CommandUpdate\dcu-cli.exe') {
        $ProcessPath = 'C:\Program Files\Dell\CommandUpdate\dcu-cli.exe'
    }
    else {
        throw "No DCU Installed"
    }

    if ($Silent) {
        $SilentArg = '-Silent'
    }
    else {
        $SilentArg = ''
    }

    if ($Reboot) {
        $RebootArg = '-reboot=enable'
    }
    else {
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
        $NotOnline = $Global:SyncHash.Computers.Count - $AllResults.Count

    }
    process {
        
        if ($NoUpdates) {
            Write-Host "`nNo Updates: $($NoUpdates.Count)" -ForegroundColor Green #-NoNewline
            $Global:SyncHash.Scan.NoUpdates = $NoUpdates
        }

        if ($ScanUnknown) {
            Write-Host "`nUnknown:" -ForegroundColor Yellow
            $ScanUnknown | Sort-Object -Property Computer | Format-Table -AutoSize -HideTableHeaders
            $Global:SyncHash.Scan.ScanUnknown = $ScanUnknown
        }

        if ($ScanErrors) {
            Write-Host "`nError:" -ForegroundColor Red -NoNewline
            $ScanErrors | Sort-Object -Property Computer | Select-Object -Property Computer, Reason, ReturnCode | Format-Table -AutoSize -HideTableHeaders
            $Global:SyncHash.Scan.ScanErrors = $ScanErrors
        }

        if ($NotOnline -gt 0) {
            Write-Host "`nNot Online: $($NotOnline)" -ForegroundColor Red #-NoNewline
            $Global:SyncHash.Scan.NotOnline = $NotOnline
        }

        if ($FoundUpdates) {
            Write-Host "`nUpdates found:" -ForegroundColor Green -NoNewline
            $FoundUpdates | Sort-Object -Property Computer | Select-Object -Property Computer, Updates | Format-Table -AutoSize -HideTableHeaders
            $Global:SyncHash.Scan.FoundUpdates = $FoundUpdates
        }
    }
}

function Test-ICMPConnection {
    [cmdletbinding(DefaultParameterSetName = 'DefaultParams')]
    param(
        [parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string[]] $Address,
        [parameter(ParameterSetName = 'DefaultParams', Position = 1)]
        [int] $Count = 4,
        [parameter(ParameterSetName = 'DefaultParams', Position = 2)]
        [int] $TimeOut = 1000,
        [parameter(ParameterSetName = 'Quiet', Position = 1)]
        [switch] $Quiet,
        [parameter(ParameterSetName = 'DefaultParams', Position = 3)]
        [string] $Buffer = 'aaaaaaaaaa'
    )

    begin {
        $ping = [System.Net.NetworkInformation.Ping]::new()
        $options = [System.Net.NetworkInformation.PingOptions]::new()
        $data = [System.Text.Encoding]::Unicode.GetBytes($Buffer)
        $hostname = $env:COMPUTERNAME
        $options.DontFragment = $true
    }
    process {
        foreach ($i in $Address) {
            if ($Quiet.IsPresent) {
                return [bool]$ping.Send($i, $TimeOut, $data, $options).RoundtripTime
            }

            $resolver = try {
                [System.Net.Dns]::GetHostEntry($i).HostName
            }
            catch { '*' }

            1..$Count | ForEach-Object {
                $response = $ping.Send($i, $TimeOut, $data, $options)
                $latency = (
                    '*', [string]::Format('{0} ms', $response.RoundtripTime)
                )[$response.Status -eq 'Success']

                [pscustomobject]@{
                    Ping        = $_
                    #Source      = $hostname
                    Address     = $response.Address
                    Destination = $resolver
                    Latency     = $latency
                    Status      = $response.Status
                }
            }
        }
    }
    end {
        $ping.ForEach('Dispose')
    }
}

# Store the function Definition
$funcDef = ${function:Test-ICMPConnection}.ToString()
$scriptBlock = {
    param (
        [string] $ip, 
        [string] $funcDef,
        $DCUParams,
        $SyncHash
    )

    # Load the function in this Scope
    ${function:Test-ICMPConnection} = $funcDef

    # Define which arguments will be used for Pinger
    # Default Values are:
    #
    #   -Count 1
    #   -TimeOut 1000 (Milliseconds)
    #   -Buffer 'aaaaaaaaaa' (10 bytes)
    #   -Quiet:$false

    $Result = Test-ICMPConnection -Address $ip -Count 1
    $SyncHash.Scan.PingResult += $Result
    $ComputerOnline = $Result | Where-Object { $_.Status -eq 'Success' }

    if ($ComputerOnline) {
        
        try {
            $ComputerName = $ComputerOnline.Destination
            $JobName = "$($ComputerName)-DCU-$($DCUParams.UpdateType)-$($StartTime.Ticks)"

            $ScriptBlock = {

                $SyncHash = $Using:SyncHash
                $DCUParams = $Using:DCUParams
                $ComputerName = $env:COMPUTERNAME

                try {
            
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

                    $Message = "[$($ComputerName)][$($DCUParams.UpdateType)] DCU Finished with Code: $($DCU.ExitCode) | $($DCUReturn.Description)"
                    Write-Host $Message -ForegroundColor Green
                    #$SyncHash.Host.UI.WriteLine("[$ComputerName] DCU Finished")
                }
                catch {
                    $Message = "[$($_.InvocationInfo.ScriptLineNumber)] $($ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                    Write-Host $Message -ForegroundColor Red
                    #$SyncHash.$ComputerName.Message = $Message
                    #$SyncHash.Host.UI.WriteErrorLine($Message)
                }
                #finally {
                    #$SyncHash.ComputerOnline += $Message
                #}
        
            }

            $CmdParams = @{
                #Session     = $Sessions
                ComputerName = $ComputerName
                ScriptBlock  = $ScriptBlock
                #AsJob        = $True
                #JobName      = $JobName
            }

            Invoke-Command @CmdParams
        }
        catch {
            $Message = "[$($_.InvocationInfo.ScriptLineNumber)] $($ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
            Write-Host $Message -ForegroundColor Red
        }

    }
    
}

& {
    try {

        $UpdateType = 'Scan'
        $DCUParams = Get-DCUParams -UpdateType $UpdateType -Silent $True -Reboot $False
        $Global:SyncHash.Scan.DCUParams = $DCUParams

        # Change this value for tweaking
        $Threshold = 100
        $RunspacePool = [runspacefactory]::CreateRunspacePool(1, $Threshold)
        $Global:SyncHash.RunspacePool = $RunspacePool
        $RunspacePool.Open()
        

        $Global:SyncHash.Runspaces = foreach ($ip in $Computers) {
            $params = @{
                IP        = $ip
                funcDef   = $funcDef
                DCUParams = $DCUParams
            }

            $psinstance = [powershell]::Create().AddScript($scriptBlock).AddParameters($params).AddArgument($SyncHash)
            $psinstance.RunspacePool = $RunspacePool

            #$AsyncResult = $psinstance.BeginInvoke()
            $AsyncResult = $psinstance.InvokeAsync()

            [pscustomobject]@{
                Instance = $psinstance
                Handle   = $AsyncResult #$psinstance.BeginInvoke()
            }
            
            $Global:SyncHash.AsyncResults += $AsyncResult
        }

        #foreach ($r in $runspaces) {
            #$r.Instance.EndInvoke($r.Handle)
            #$r.Instance.foreach('Dispose')
        #}
    }
    catch {
        Write-Warning $_.Exception.Message
    }
    #finally {
        #$runspaces.foreach('Clear')
        #$RunspacePool.foreach('Dispose')
    #}
} #| Format-Table -AutoSize

#$Global:SyncHash

#foreach ($r in $Global:SyncHash.Runspaces) {
#    $r.Instance.EndInvoke($r.Handle)
#    $r.Instance.foreach('Dispose')
#}

#$Global:SyncHash.Runspaces.foreach('Clear')

#$Global:SyncHash

#While (-not [System.Threading.Tasks.Task]::WaitAll($Global:SyncHash.AsyncResults, 200)) {}
#$Global:SyncHash.AsyncResults.ForEach( { $_.GetAwaiter().GetResult() })
$JobsCount = $Global:SyncHash.AsyncResults.Count
$JobStartTime = Get-Date
while ($true) {

    Start-Sleep -Milliseconds 100

    $span = ((Get-Date) - $JobStartTime)
    $RunTime = '{0:00}:{1:00}:{2:00}' -f $span.Hours, $span.Minutes, $span.Seconds

    $Completed = $Global:SyncHash.AsyncResults | Where-Object { $_.IsCompleted -eq $True }
    $PercentComplete = ($Completed.Count / $JobsCount) * 100
    $Status = " [$($Completed.Count)/$($JobsCount)] $($PercentComplete.ToString())% Complete"
    $Activity = "[$RunTime] Processing DCU on remote devices"

    Write-Progress -Id 5 -Activity $Activity -Status $Status -PercentComplete $PercentComplete

    #Write-Host -Object '.' -NoNewline -ForegroundColor Green
    $Global:SyncHash.AsyncResults | Where-Object { $_.IsCompleted -eq $False } | ForEach-Object { Continue }

    # Clean up objects and break out of the While loop: 
    Write-Progress -Id 5 -Activity $Activity -Status $Status -Completed
    
    $Global:SyncHash.AsyncResults | ForEach-Object { $_.AsyncWaitHandle.Close() }
    $Global:SyncHash.AsyncResults = @() 
    $Global:SyncHash.Runspaces = $null 
    $Global:SyncHash.RunspacePool.Close()
    $Global:SyncHash.RunspacePool.Dispose()
    
    Break 
}

#$Global:SyncHash

foreach ($Computer in $Computers) {

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
            
        
        }
        else {
            #Write-Host "`n"
        
            $ScanResult = 'NoResult'
            $ResultStatus = 'NoFile'
            Receive-Job -Location $Computer -Job $Jobs

            $Message = "No Result or connection failure"
            Write-Host "[$Computer] `t$Message" -ForegroundColor Red

        }
        
        $Global:SyncHash.AllResults += [PSCustomObject]@{
            Computer    = $Computer
            ReturnCode  = $ScanReturnCode
            Description = $DCUReturn.Description
            Result      = $ScanResult
            Status      = $ResultStatus
            Reason      = $Message
            Updates     = $Updates
        }
        
}

Get-DCUScanResult -AllResults $Global:SyncHash.AllResults

Start-Sleep -Seconds 1

