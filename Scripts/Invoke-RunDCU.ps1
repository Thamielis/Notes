using namespace System
using namespace System.Collections
using namespace System.Collections.Generic
using namespace System.Management.Automation
using namespace System.Management.Automation.Language
using namespace System.Management.Automation.Runspaces
using namespace System.Threading.Tasks

# Add-Type -Path "AsyncProgressCmdlet.cs"

function InitAsync {
    [CmdletBinding()]
    param (
        [scriptblock] $Action, 
        [object[]] $ArgumentList
    )

    begin {

        class InitTask {
            hidden [powershell] $_pwsh
            hidden [IAsyncResult] $_asyncResult

            static [InitTask] Create([scriptblock] $action, [object[]] $argumentList) {
                $task = [InitTask]::new()
                $task._pwsh = [powershell]::Create()
                $task._pwsh.AddScript($Action, $true)
                if ($argumentList) {
                    $task._pwsh.AddArguments($argumentList)
                }

                $task._asyncResult = $task._pwsh.BeginInvoke()
                return $task
            }

            [PSDataCollection[psobject]] Wait() {
                return $this._pwsh.EndInvoke($this._asyncResult)
            }
        }
    }
    end {
        return [InitTask]::Create($Action, $ArgumentList)
    }
}

function WaitAsync {
    [CmdletBinding()]
    param (
        [ref] $Job
    )
    
    if (-not $Job.Value) {
        return
    }

    $Job.Value.Wait()
    $Job.Value = $null
}

function Wait-AsyncResult {
    [Alias('swait')]
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)]
        [psobject[]] $InputObject
    )

    begin {

        $VoidTaskType = $script:VoidTaskType

        if (-not $VoidTaskType) {
            $voidTask = [Task]::Delay(1)

            if ($null -eq $voidTask.Result) {
                # The void task type is no longer a thing
                $script:VoidTaskType = $VoidTaskType = [void]
            }
            else {
                $script:VoidTaskType = $VoidTaskType = [Task`1].MakeGenericType([Task]::Delay(1).Result.GetType())
            }
        }

        $tasksToAwait = $null
        $otherAsyncResults = $null
    }
    process {

        foreach ($awaitable in $InputObject) {

            if ($awaitable -is [Task]) {

                if ($null -eq $tasksToAwait) {
                    $tasksToAwait = [List[Task]]::new()
                }

                $tasksToAwait.Add($awaitable)

                continue
            }

            if ($null -eq $otherAsyncResults) {
                $otherAsyncResults = [List[IAsyncResult]]::new()
            }

            if ($awaitable -isnot [IAsyncResult]) {

                $exception = [PSArgumentException]::new(
                    'The specified value does not implement the interface "IAsyncResult".')

                $PSCmdlet.WriteError(
                    [ErrorRecord]::new(
                        <# exception:     #> $exception,
                        <# errorId:       #> 'InputNotAwaitable',
                        <# errorCategory: #> [ErrorCategory]::InvalidArgument,
                        <# targetObject:  #> $awaitable))

                continue
            }

            $otherAsyncResults.Add($awaitable)
        }
    }
    end {

        if ($null -ne $tasksToAwait) {

            while ($tasksToAwait) {

                $task = [Task]::WhenAny($tasksToAwait)

                while (-not $task.AsyncWaitHandle.WaitOne(200)) { }

                $finishedTask = $task.GetAwaiter().GetResult()

                $null = $tasksToAwait.Remove($finishedTask)

                if ($finishedTask -is $VoidTaskType) {
                    $null = $finishedTask.GetAwaiter().GetResult()
                    continue
                }


                $finishedTask.GetAwaiter().GetResult()
            }
        }

        foreach ($singleAwaitable in $otherAsyncResults) {
            while (-not $singleAwaitable.AsyncWaitHandle.WaitOne(200)) { }
        }
    }
}

class DelegateMethods {
    [String] $LogFolder = 'C:\Temp\DCU'
    [String] $ComputerName
    [String] $UpdateType
    [String] $ProcessPath
    [String] $ProcessArgs
    [PSObject] $DCUReturnTablet
    [String] $ScriptName

    DelegateMethods([String]$ComputerName, [String]$UpdateType, [String]$ProcessPath, [String]$ProcessArgs, [PSObject]$DCUReturnTablet, [String]$ScriptName) {
        $this.ComputerName = $ComputerName
        $this.UpdateType = $UpdateType
        $this.ProcessPath = $ProcessPath
        $this.ProcessArgs = $ProcessArgs
        $this.DCUReturnTablet = $DCUReturnTablet
        $this.ScriptName = $ScriptName
    }

    [Void] RunDCU() {
        if (Test-Connection -ComputerName $this.ComputerName -Count 1 -Quiet) {
            Write-Host "[$($this.ComputerName)][$($this.UpdateType)] Device is online" -ForegroundColor Cyan

            try {
                Write-Host "[$($this.ComputerName)][$($this.UpdateType)] Start DCU" -ForegroundColor Cyan

                Invoke-Command -ComputerName $this.ComputerName -ScriptBlock {

                    if (!(Test-Path -Path $using:this.LogFolder)) {
                        try {
                            [void][System.IO.Directory]::CreateDirectory($using:this.LogFolder)
                        }
                        catch {
                            $Message = "[$($using:this.ScriptName)][$($_.InvocationInfo.ScriptLineNumber)] $($using:this.ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                            Write-Host $Message -ForegroundColor Red
                        }
            
                    }

                    $DCU = Start-Process -FilePath $using:this.ProcessPath -ArgumentList $using:this.ProcessArgs -Wait -PassThru -NoNewWindow
                    $DCUReturn = $using:this.DCUReturnTablet | Where-Object { $_.ReturnCode -eq $DCU.ExitCode }

                    Write-Host "[$($using:this.ComputerName)][$($using:this.UpdateType)] DCU Finished with Code: $($DCU.ExitCode) | $($DCUReturn.Description)" -ForegroundColor Green
                }
            }
            catch {
                $Message = "[$($this.ScriptName)][$($_.InvocationInfo.ScriptLineNumber)] $($this.ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                Write-Host $Message -ForegroundColor Red
            }

        }
        else {
            Write-Host "[$($this.ComputerName)][$($this.UpdateType)] Device is offline" -ForegroundColor Cyan
        }
    }

}

function New-DelegatedTask {
    [CmdletBinding()]
    param (
        [Parameter()]
        [PSObject] $Method
    )

    $Delegate = New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $Method, [DelegateMethods].GetMethod('RunDCU')))
    return [System.Threading.Tasks.Task]::Run($Delegate)

}

function Start-TasksRun {

}

function Invoke-Async {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ScriptBlock] $ScriptBlock
    )

    $AsyncScriptBlock = [ScriptBlock]::Create($ScriptBlock.ToString())

    $Runspace = [System.Management.Automation.Runspaces.RunspaceFactory]::CreateRunspace()
    $Runspace.Open()
    $PowerShell = [PowerShell]::Create()
    $PowerShell.Runspace = $Runspace 
    $PowerShell.AddScript("Write-Host `$ComputerName $AsyncScriptBlock");
    #$Result = $PowerShell.InvokeAsync()

    #$Result.IsCompleted
    #$Result.Result

    $PowerShell.InvokeAsync()

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

    begin {

        # Add-Type -AssemblyName System.Threading.Tasks
        Import-Module "C:\Program Files\WindowsPowerShell\Modules\PSRunspacedDelegate\0.1\PSRunspacedDelegate.psd1"

        $ScriptName = $MyInvocation.MyCommand.Name
    
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

    }
    process {

        $PSArray = [System.Collections.ArrayList]::new()
        $JobArray = [System.Collections.ArrayList]::new()
        $Results = [System.Collections.ArrayList]::new()

        $Block = {
            param($ComputerName,$RunDCU)

            class DelegateMethods {
                [String] $LogFolder = 'C:\Temp\DCU'
                [String] $ComputerName
                [String] $UpdateType
                [String] $ProcessPath
                [String] $ProcessArgs
                [PSObject] $DCUReturnTablet
                [String] $ScriptName

                DelegateMethods([String]$ComputerName, [String]$UpdateType, [String]$ProcessPath, [String]$ProcessArgs, [PSObject]$DCUReturnTablet, [String]$ScriptName) {
                    $this.ComputerName = $ComputerName
                    $this.UpdateType = $UpdateType
                    $this.ProcessPath = $ProcessPath
                    $this.ProcessArgs = $ProcessArgs
                    $this.DCUReturnTablet = $DCUReturnTablet
                    $this.ScriptName = $ScriptName
                }

                [Void] RunDCU() {
                    if (Test-Connection -ComputerName $this.ComputerName -Count 1 -Quiet) {
                        Write-Host "[$($this.ComputerName)][$($this.UpdateType)] Device is online" -ForegroundColor Cyan

                        try {
                            Write-Host "[$($this.ComputerName)][$($this.UpdateType)] Start DCU" -ForegroundColor Cyan

                            Invoke-Command -ComputerName $this.ComputerName -ScriptBlock {

                                if (!(Test-Path -Path $using:this.LogFolder)) {
                                    try {
                                        [void][System.IO.Directory]::CreateDirectory($using:this.LogFolder)
                                    }
                                    catch {
                                        $Message = "[$($using:this.ScriptName)][$($_.InvocationInfo.ScriptLineNumber)] $($using:this.ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                                        Write-Host $Message -ForegroundColor Red
                                    }
            
                                }

                                $DCU = Start-Process -FilePath $using:this.ProcessPath -ArgumentList $using:this.ProcessArgs -Wait -PassThru -NoNewWindow
                                $DCUReturn = $using:this.DCUReturnTablet | Where-Object { $_.ReturnCode -eq $DCU.ExitCode }

                                Write-Host "[$($using:this.ComputerName)][$($using:this.UpdateType)] DCU Finished with Code: $($DCU.ExitCode) | $($DCUReturn.Description)" -ForegroundColor Green
                            }
                        }
                        catch {
                            $Message = "[$($this.ScriptName)][$($_.InvocationInfo.ScriptLineNumber)] $($this.ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                            Write-Host $Message -ForegroundColor Red
                        }

                    }
                    else {
                        Write-Host "[$($this.ComputerName)][$($this.UpdateType)] Device is offline" -ForegroundColor Cyan
                    }
                }

            }

            Import-Module "C:\Program Files\WindowsPowerShell\Modules\PSRunspacedDelegate\0.1\PSRunspacedDelegate.psd1"
            
            New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $RunDCU, [DelegateMethods].GetMethod('RunDCU')))
        }

        foreach ($ComputerName in $Computers) {

            $RunDCU = [DelegateMethods]::new($ComputerName, $UpdateType, $ProcessPath, $ProcessArgs, $DCUReturnTablet, $ScriptName)

            $PS = [PowerShell]::Create().AddScript($Block).AddArgument(@($ComputerName, $RunDCU))
            $Job = $PS.BeginInvoke()

            [Void]$PSArray.Add($PS)
            [Void]$JobArray.Add($Job)
        }

        while ($PSArray.Count -gt 0) {
            for ($i = 0; $i -lt $PSArray.Count; $i++) {
                $PS = $PSArray[$i]
                $Job = $JobArray[$i]

                if ($null -ne $PS) {
                    if ($Job.IsCompleted) {
                        [Void]$Results.Add($PS.EndInvoke($Job))

                        $PS.Dispose()
                        $PSArray.RemoveAt($i)
                        $JobArray.RemoveAt($i)

                        { break outer } > $null
                    }
                }
            }
        }

        foreach ($Result in $Results) {
            Write-Host $Result
        }

    }

    
}

function Invoke-RunDCU {
    <#
    https://dl.dell.com/content/manual13608255-dell-command-update-version-4-x-reference-guide.pdf
    #Update Type: bios, firmware, driver, apps, and others
    #>
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

    # Add-Type -AssemblyName System.Threading.Tasks
    Import-Module "C:\Program Files\WindowsPowerShell\Modules\PSRunspacedDelegate\0.1\PSRunspacedDelegate.psd1"

    $ScriptName = $MyInvocation.MyCommand.Name
    
    $DCUReturnTablet = @(
        @{
            ReturnCode = "0"; 
            Description = "Command execution was successful."; 
            Resolution = "None" 
        }
        @{
            ReturnCode = "1"; 
            Description = "A reboot was required from the execution of an operation."; 
            Resolution = "Reboot the system to complete the operation." 
        }
        @{
            ReturnCode = "2"; 
            Description = "An unknown application error has occurred."; 
            Resolution = "None" 
        }
        @{
            ReturnCode = "3"; 
            Description = "The current system manufacturer is not Dell."; 
            Resolution = "Dell Command | Update can only be run on Dell systems." 
        }
        @{
            ReturnCode = "4"; 
            Description = "The CLI was not launched with administrative privilege."; 
            Resolution = "Invoke the Dell Command | Update CLI with administrative privileges." 
        }
        @{
            ReturnCode = "5"; 
            Description = "A reboot was pending from a previous operation."; 
            Resolution = "Reboot the system to complete the operation." 
        }
        @{
            ReturnCode = "6"; 
            Description = "Another instance of the same application (UI or CLI) is already running."; 
            Resolution = "Close any running instance of Dell Command | Update UI or CLI and retry the operation." 
        }
        @{
            ReturnCode = "7"; 
            Description = "The application does not support the current system model."; 
            Resolution = "Contact your administrator if the current system model in not supported by the catalog." 
        }
        @{
            ReturnCode = "8"; 
            Description = "No update filters have been applied or configured."; 
            Resolution = "Supply at least one update filter." 
        }
        @{
            ReturnCode = "107"; 
            Description = "While evaluating the command line parameters, one or more values provided to the specific option was invalid."; 
            Resolution = "Provide an acceptable value. See Command line interface reference section, for more information."
        }
        @{
            ReturnCode = "500"; 
            Description = "No updates were found for the system when a scan operation was performed."; 
            Resolution = "The system is up to date or no updates were found for the provided filters. Modify the filters and rerun the commands." 
        }
        @{
            ReturnCode = "501"; 
            Description = "An error occurred while determining the available updates for the system, when a scan operation was performed."; 
            Resolution = "Retry the operation." 
        }
        @{
            ReturnCode = "503"; 
            Description = "An error occurred while downloading a file during the scan operation."; 
            Resolution = "Check your network connection, ensure there is Internet connectivity and Retry the command." 
        }
        @{
            ReturnCode = "1000"; 
            Description = "An error occurred when retrieving the result of the apply updates operation."; 
            Resolution = "Retry the operation." 
        }
        @{
            ReturnCode = "1001"; 
            Description = "The cancellation was initiated, Hence, the apply updates operation is canceled."; 
            Resolution = "Retry the operation." 
        }
        @{
            ReturnCode = "1002"; 
            Description = "An error occurred while downloading a file during the apply updates operation."; 
            Resolution = "Check your network connection, ensure there is Internet connectivity, and retry the command." 
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
    
    $Tasks = @()
    foreach ($ComputerName in $Computers) {
        $RunDCU = [DelegateMethods]::new($ComputerName, $UpdateType, $ProcessPath, $ProcessArgs, $DCUReturnTablet, $ScriptName)
        $Tasks += New-DelegatedTask -Method $RunDCU
        #$Delegate = New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $RunDCU, [DelegateMethods].GetMethod('RunDCU')))
        #[System.Threading.Tasks.Task]::Run($Delegate)
        Start-Sleep -Milliseconds 10
    }

    #$Tasks.ForEach($_.Start())

    $Tasks = foreach ($ComputerName in $Computers) {
        $RunDCU = [DelegateMethods]::new($ComputerName, $UpdateType, $ProcessPath, $ProcessArgs, $DCUReturnTablet, $ScriptName)
        #New-DelegatedTask -Method $RunDCU
        $Delegate = New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $RunDCU, [DelegateMethods].GetMethod('RunDCU')))
        
        [System.Threading.Tasks.Task]::new($Delegate)
        #Start-Sleep -Milliseconds 10
    }
    
    [System.Threading.Tasks.Task]::WaitAll($Tasks)

    #############################################################################################################################################
    #TODO: Ausgabe bzw. Resultat ausgeben

    $Tasks = foreach ($ComputerName in $Computers) {

        $RunDCU = [DelegateMethods]::new($ComputerName, $UpdateType, $ProcessPath, $ProcessArgs, $DCUReturnTablet, $ScriptName)

        $ScriptBlock = {

            class DelegateMethods {
                [String] $LogFolder = 'C:\Temp\DCU'
                [String] $ComputerName
                [String] $UpdateType
                [String] $ProcessPath
                [String] $ProcessArgs
                [PSObject] $DCUReturnTablet
                [String] $ScriptName

                DelegateMethods([String]$ComputerName, [String]$UpdateType, [String]$ProcessPath, [String]$ProcessArgs, [PSObject]$DCUReturnTablet, [String]$ScriptName) {
                    $this.ComputerName = $ComputerName
                    $this.UpdateType = $UpdateType
                    $this.ProcessPath = $ProcessPath
                    $this.ProcessArgs = $ProcessArgs
                    $this.DCUReturnTablet = $DCUReturnTablet
                    $this.ScriptName = $ScriptName
                }

                [Void] RunDCU() {
                    if (Test-Connection -ComputerName $this.ComputerName -Count 1 -Quiet) {
                        Write-Host "[$($this.ComputerName)][$($this.UpdateType)] Device is online" -ForegroundColor Cyan

                        try {
                            Write-Host "[$($this.ComputerName)][$($this.UpdateType)] Start DCU" -ForegroundColor Cyan

                            Invoke-Command -ComputerName $this.ComputerName -ScriptBlock {

                                if (!(Test-Path -Path $using:this.LogFolder)) {
                                    try {
                                        [void][System.IO.Directory]::CreateDirectory($using:this.LogFolder)
                                    }
                                    catch {
                                        $Message = "[$($using:this.ScriptName)][$($_.InvocationInfo.ScriptLineNumber)] $($using:this.ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                                        Write-Host $Message -ForegroundColor Red
                                    }
            
                                }

                                $DCU = Start-Process -FilePath $using:this.ProcessPath -ArgumentList $using:this.ProcessArgs -Wait -PassThru -NoNewWindow
                                $DCUReturn = $using:this.DCUReturnTablet | Where-Object { $_.ReturnCode -eq $DCU.ExitCode }

                                Write-Host "[$($using:this.ComputerName)][$($using:this.UpdateType)] DCU Finished with Code: $($DCU.ExitCode) | $($DCUReturn.Description)" -ForegroundColor Green
                            }
                        }
                        catch {
                            $Message = "[$($this.ScriptName)][$($_.InvocationInfo.ScriptLineNumber)] $($this.ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                            Write-Host $Message -ForegroundColor Red
                        }

                    }
                    else {
                        Write-Host "[$($this.ComputerName)][$($this.UpdateType)] Device is offline" -ForegroundColor Cyan
                    }
                }

            }

            Import-Module "C:\Program Files\WindowsPowerShell\Modules\PSRunspacedDelegate\0.1\PSRunspacedDelegate.psd1"
            
            New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $RunDCU, [DelegateMethods].GetMethod('RunDCU')))

        }

        Invoke-Async -ScriptBlock $ScriptBlock

    }

    #############################################################################################################################################
    
    foreach ($ComputerName in $Computers) {

        $Method = [DelegateMethods]::new($ComputerName, $UpdateType, $ProcessPath, $ProcessArgs, $DCUReturnTablet, $ScriptName)

        $Delegate = New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $Method, [DelegateMethods].GetMethod('RunDCU')))
        #$Tasks += [System.Threading.Tasks.Task]::Run($Delegate)

        $Tasks += InitAsync -Action { $Delegate }

    }

    ########################################################################
    $Tasks = @()
    $TaskFactory = [System.Threading.Tasks.TaskFactory]::new()

    foreach ($ComputerName in $Computers) {
        $Method = [DelegateMethods]::new($ComputerName, $UpdateType, $ProcessPath, $ProcessArgs, $DCUReturnTablet, $ScriptName)
        #$Delegate = New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $Method, [DelegateMethods].GetMethod('RunDCU')))
        #$Tasks += $TaskFactory.StartNew($Delegate)

        New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $Method, [DelegateMethods].GetMethod('RunDCU')))
    }

    [System.Threading.Tasks.Parallel]::Invoke()
    ########################################################################

    $LoopBody = [System.Action[Object]] {
        param($ComputerName)

        $Method = [DelegateMethods]::new($ComputerName, $UpdateType, $ProcessPath, $ProcessArgs, $DCUReturnTablet, $ScriptName)
        New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $Method, [DelegateMethods].GetMethod('RunDCU')))
    }

    [System.Threading.Tasks.Parallel]::ForEach($Computers, $LoopBody)

    ########################################################################

    $Tasks = @()

    foreach ($ComputerName in $Computers) {
        $Method = [DelegateMethods]::new($ComputerName, $UpdateType, $ProcessPath, $ProcessArgs, $DCUReturnTablet, $ScriptName)
        #$Delegate = New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $Method, [DelegateMethods].GetMethod('RunDCU')))
        #$Tasks += $TaskFactory.StartNew($Delegate)

        $Tasks += { New-RunspacedDelegate([System.Action]::CreateDelegate([System.Action], $Method, [DelegateMethods].GetMethod('RunDCU'))) }
    }

    [System.Threading.Tasks.Parallel]::Invoke($Tasks)

    ########################################################################
    #While (-not [System.Threading.Tasks.Task]::WaitAll($Tasks, 200)) { }
    #$Tasks.ForEach( { 
    #    $_.GetAwaiter().GetResult() 
    #})

    <#
    $Tasks = @()
    foreach ($ComputerName in $Computers) {
        $Delegate = New-RunspacedDelegate(
            [System.Action] {
                try {
                    Write-Host "[$ComputerName][$UpdateType] Start DCU" -ForegroundColor Cyan

                    Invoke-Command -ComputerName $ComputerName -ScriptBlock {

                        if (!(Test-Path -Path $using:LogFolder)) {
                            try {
                                [void][System.IO.Directory]::CreateDirectory($using:LogFolder) 
                            }
                            catch {
                                throw
                            }
            
                        }

                        $DCU = Start-Process -FilePath $using:ProcessPath -ArgumentList $using:ProcessArgs -Wait -PassThru -NoNewWindow
                        $DCUReturn = $using:DCUReturnTablet | Where-Object { $_.ReturnCode -eq $DCU.ExitCode }

                        Write-Host "[$using:ComputerName][$using:UpdateType] DCU Finished with Code: $($DCU.ExitCode) : $($DCUReturn.Description)" -ForegroundColor Green
                    }
                }
                catch {
                    $Message = "[$ScriptName][$($_.InvocationInfo.ScriptLineNumber)] $($ComputerName) |`n`t Error: $($_.Exception.Message) - InnerException: $($_.Exception.InnerException)"
                    Write-Host $Message -ForegroundColor Red
                }
            }
        )

        $Tasks += [System.Threading.Tasks.Task]::Run($Delegate)
    }
    #>
    
    #if ($Tasks) {
    #    While (-not [System.Threading.Tasks.Task]::WaitAll($Tasks, 200)) { }
    #    $Tasks.ForEach( { $_.GetAwaiter().GetResult() })
    #}
    
    #$DCU = Start-Process -FilePath $ProcessPath -ArgumentList $ProcessArgs -Wait -PassThru -NoNewWindow
    #$DCUReturn = $DCUReturnTablet | Where-Object { $_.ReturnCode -eq $DCU.ExitCode }

    #Write-Host "[$ComputerName][$UpdateType] DCU Finished with Code: $($DCU.ExitCode): $($DCUReturn.Description)"
}


function Set-DCUAutoUpdate {
    <#
    Enables DCU Auto Update
    #>

    if (Test-path -Path 'C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe') {
        $ProcessPath = 'C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe'
    }

    if (Test-path -Path 'C:\Program Files\Dell\CommandUpdate\dcu-cli.exe') {
        $ProcessPath = 'C:\Program Files\Dell\CommandUpdate\dcu-cli.exe'
    }
    else {
        throw "No DCU Installed"
    }

    $ProcessArgs = "/configure -scheduleAuto -scheduleAction=DownloadInstallAndNotify -scheduledReboot=60"
    $DCU = Start-Process -FilePath $ProcessPath -ArgumentList $ProcessArgs -Wait -PassThru -NoNewWindow
    $DCUReturn = $DCUReturnTablet | Where-Object { $_.ReturnCode -eq $DCU.ExitCode }

    Write-Host "DCU Finished with Code: $($DCU.ExitCode): $($DCUReturn.Description)"
}

$Computers = 'PC1264', 'PC1180', 'PC683'
#Invoke-RunDCU -Computers $Computers -UpdateType Scan -Silent #-Verbose
Invoke-AsyncDCU -Computers $Computers -UpdateType Scan -Silent

Start-Sleep -Seconds 1


function Invoke-AsyncParallel {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String[]] $Computers
    )

    $Start = Get-Date

    $Block = {
        param($ComputerName)

        Write-Host $ComputerName
    }

    $PSArray = [System.Collections.ArrayList]::new()
    $JobArray = [System.Collections.ArrayList]::new()
    $Results = [System.Collections.ArrayList]::new()

    foreach ($ComputerName in $Computers) {
        $PS = [PowerShell]::Create().AddScript($Block).AddArgument($ComputerName)
        $Job = $PS.BeginInvoke()

        [Void]$PSArray.Add($PS)
        [Void]$JobArray.Add($Job)
    }

    while ($PSArray.Count -gt 0) {
        for ($i = 0; $i -lt $PSArray.Count; $i++) {
            $PS = $PSArray[$i]
            $Job = $JobArray[$i]

            if ($null -ne $PS) {
                if ($Job.IsCompleted) {
                    [Void]$Results.Add($PS.EndInvoke($Job))

                    $PS.Dispose()
                    $PSArray.RemoveAt($i)
                    $JobArray.RemoveAt($i)

                    { break outer } > $null
                }
            }
        }
    }

    foreach ($Result in $Results) {
        Write-Host $Result
    }

    $End = Get-Date
    '{0,-30} : {1,10:#,##0.00} ms' -f 'Time to run code', ($end - $start).TotalMilliseconds

}



####################

class CustomData {
    [long]$CreationTime
    [int]$Name
    [int]$ThreadNum
}

# Create an array to hold the task objects
$taskArray = @()

# Loop to initialize and start tasks
for ($i = 0; $i -lt 10; $i++) {
    $task = Start-ThreadJob -ScriptBlock {
        param($data)

        # PowerShell jobs don't have direct access to the thread id like in C#, but you can simulate workload here
        $data.ThreadNum = [System.Threading.Thread]::CurrentThread.ManagedThreadId

        # Output the modified data object
        return $data
    } -ArgumentList ( [CustomData]@{ Name = $i; CreationTime = [DateTime]::Now.Date } )

    # Add the task to the array
    $taskArray += $task
}

# Wait for all tasks to complete
$taskArray | Wait-Job

# Output results
$taskArray | ForEach-Object {
    $result = Receive-Job -Job $_
    Write-Output "Task #$($result.Name) created at $($result.CreationTime), ran on thread #$(if ($result.ThreadNum) { $result.ThreadNum } else { 'N/A' })."
}

# Clean up
$taskArray | Remove-Job
