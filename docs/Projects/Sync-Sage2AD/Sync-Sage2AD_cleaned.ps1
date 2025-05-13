using namespace System
using namespace System.Management.Automation
using namespace System.Management.Automation.Language
using namespace System.Management.Automation.Runspaces
using namespace System.Windows
using namespace System.Collections.Generic
using namespace System.Data
using namespace System.Diagnostics
using namespace System.Diagnostics.CodeAnalysis
using namespace System.Threading
using namespace System.Threading.Tasks
#using module functions\AsyncClass.ps1
#using module classes\Timer.ps1
#using module modules\New-ThreadController\New-ThreadController.psm1

$Script:ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
[string]$ScriptName = [System.IO.Path]::GetFileName($MyInvocation.MyCommand.Definition)
[string]$ScriptFullName = Join-Path -Path $ScriptPath -ChildPath $ScriptName

$Script:LogsPath = [System.IO.Path]::Combine($ScriptPath, '.logs')
#$Script:LogsPath = Join-Path -Path $Script:ScriptPath -ChildPath '.logs'
$Script:ExportsPath = [System.IO.Path]::Combine($ScriptPath, 'exports')
#$Script:ExportsPath = Join-Path -Path $Script:ScriptPath -ChildPath 'exports'

$SageCSVPath = "\\atklprint\sageimport$"
$SageCSVFilePath = Join-Path -Path $SageCSVPath -ChildPath 'canon.csv'

$Script:TextInfo = (Get-Culture).TextInfo
$Script:NewMailbox = [System.Collections.ArrayList]::new()
$Script:Runtimes = [hashtable]::Synchronized(@{})

$Script:Config = @{
    KeinVorgesetzter = @{
        8901 = 'Kostwein Hans'
        8902 = 'Kostwein Heinz'
        8904 = 'Schrott-Kostwein Ulrike'
        1561 = 'Kostwein Stefan'
        1597 = 'Schlagbauer Peter'
        8905 = 'Schumy Oliver'
    }
    NoAccessUser     = @{
        1603 = 'Schrott-Kostwein Philipp'
        9633 = 'Kurtak Dario'
        1501 = 'Dolzer Paul'
        1644 = 'Sibitz Dietmar'
        1594 = 'Robl Thomas'
        1650 = 'Begusch Stefan'
        1663 = 'Hafner Georg'
    }
    MFAGroupMembers  = @{

    }
    SageGF           = @{
        8901 = 'Kostwein Hans'
        8902 = 'Kostwein Heinz'
        8904 = 'Schrott-Kostwein Ulrike'
        # 1561 = 'Kostwein Stefan'
    }
    ADGroups         = @{
        SageGroups = @{
            Path = 'OU=Sage,OU=Gruppen,OU=Allgemein,OU=Kostwein Gruppe,DC=kostweingroup,DC=intern'
        }
    }
    Paths            = @{
        SageCSVFile = $SageCSVFilePath
    }
    TextInfo         = $TextInfo
}

#region    Sync
$global:ScriptFlow = [hashtable]::Synchronized(@{})

$global:SyncHash = [hashtable]::Synchronized(@{})
$global:SyncHash.Config = $Script:Config
$Global:SyncHash.Config.Paths = [Hashtable]::Synchronized(@{})

$Global:SyncHash.Config.Paths.ScriptPath = $Script:ScriptPath
$Global:SyncHash.Config.Paths.Logs = $Script:LogsPath
$Global:SyncHash.Config.Paths.LogTargets = Join-Path -Path $Script:ScriptPath -ChildPath 'LogTargets'
$Global:SyncHash.Config.Paths.Functions = Join-Path -Path $Script:ScriptPath -ChildPath 'functions'
$Global:SyncHash.Config.Paths.Classes = Join-Path -Path $Script:ScriptPath -ChildPath 'classes'
$Global:SyncHash.Config.Paths.Helpers = "A:\GitHub\PowerShelf"
$Global:SyncHash.Config.Paths.Exports = $Script:ExportsPath
$Global:SyncHash.Config.Paths.SageCSVFile = $SageCSVFilePath

$Global:SyncHash.Runtimes = $Script:Runtimes

#region    Sync - ObjectsCache
$global:SyncHash.ObjectsCache = [PSCustomObject]@{
    Today      = [datetime]::now
    Users      = [Hashtable]::Synchronized(@{})
    ADUsers    = [Hashtable]::Synchronized(@{})
    Groups     = [Hashtable]::Synchronized(@{})
    SageGroups = [Hashtable]::Synchronized(@{})
}
<#
$global:SyncHash.ObjectsCache.Users | Add-Member -MemberType ScriptMethod -Name Update -Value {
    $Properties = @("SamAccountName", "pager", "Personalnummer", "Company", "Country", "co", "State", "Department", "departmentNumber", "language", "preferredLanguage", "jpegPhoto", "photo", "employeeType", "Office", "StreetAddress", "Created", "Description", "EmailAddress", "mail", 'ProxyAddresses', "HomeMDB", "msExchMailboxGuid", "Enabled", "EmployeeID", "Manager", "Title", "GivenName", "Surname", "Name", "LastLogonDate", "LockedOut", "logonCount", "LogonWorkstations", "MobilePhone", "mobile", "MemberOf", "pager", "Modified", "whenChanged", "whenCreated")
    Get-ADUser -Filter '*' -Properties $Properties | ForEach-Object {
        $this["$($_.SamAccountName.ToLower())"] = $_
    }
}

$global:SyncHash.ObjectsCache | Add-Member -MemberType ScriptMethod -Name GetADUsers -Value {
    $this.Users.Update()
    $this.Users.Values | Where-Object {
        $_.Name -notmatch '(^(Adm_|SVC_|DMC|MNC|EROWA|guest|6|Monitoring|Video|Toolset)|(t|T)est)|((M|m)essraum)' -and
        $null -ne $_.SurName -and $null -ne $_.GivenName -and
        $_.Description -notmatch 'Dienstkonto|[Ss]ervice' -and
        $_.DistinguishedName -notmatch '(?:OU|CN)\=(?:Allgemein|Service|IUSR_|Ressource)'
    } | ForEach-Object { $this.ADUsers["$($_.SamAccountName.ToLower())"] = $_ } | Sort-Object
}

$global:SyncHash.ObjectsCache.Groups | Add-Member -MemberType ScriptMethod -Name Update -Value {
    Get-ADGroup -Filter '*' | ForEach-Object {
        $this["$($_.Name)"] = $_
    }
}

$global:SyncHash.ObjectsCache | Add-Member -MemberType ScriptMethod -Name GetSageGroups -Value {
    $this.Groups.Update()
    $this.Groups.Values | Where-Object {
        $_.DistinguishedName -match "$($global:SyncHash.Config.ADGroups.SageGroups.Path)"
    } | ForEach-Object { $this.SageGroups["$($_.Name)"] = $_ } | Sort-Object
}
#>
#endregion Sync - ObjectsCache


$global:SyncHash.AD = @{}
$global:SyncHash.Employees = [hashtable]::Synchronized(@{})
$global:SyncHash.ADChanges = @{}
$Global:SyncHash.Errors = [System.Collections.ArrayList]::new()

#region    Sync - Sage
$global:SyncHash.Sage = [hashtable]::Synchronized(@{
        DataRaw   = @{}
        CleanData = @{}
        Objects   = @{}
    })
<#
$global:SyncHash.Sage | Add-Member -MemberType ScriptMethod -Name GetRawData -Value {
    $this.DataRaw = Get-Content -Path $global:SyncHash.Config.Paths.SageCSVFile -Raw -Encoding ansi | ConvertFrom-Csv -Delimiter ';'
}

$global:SyncHash.Sage | Add-Member -MemberType ScriptMethod -Name CleanRawData -Value {
    if (-not $this.DataRaw) { $this.GetRawData() }
    Get-NameExtraction -csvData $this.DataRaw | Where-Object { $_.Kostenstelle -notin @('10099', '10098') -and $_.'Pers.Nr.' -ne '6100' } | Where-Object { -not [string]::IsNullOrEmpty($_.Vorname) -and $_.Nachname -notmatch 'Reinigung|Betriebsarzt' }
}

$global:SyncHash.Sage | Add-Member -MemberType ScriptMethod -Name ProcessData -Value {
    if (-not $this.Objects) {
        if (-not $this.CleanData) { 
            $this.CleanRawData() 
        }
        #$this.Objects = $this.CleanData | ForEach-Object { New-SageObject -sUser $_ }
        $this.CleanData | ForEach-Object {
            $global:SyncHash.Sage.Objects.Add((New-SageObject -sUser $_)) 
        }
    }
    
}
#>
#endregion Sync - Sage

#region    Sync - Data
$global:Data = [hashtable]::Synchronized(@{})

$global:Data.Employees = [hashtable]::Synchronized([PSCustomObject]@{})

#endregion Sync - Data

#region    Sync - Imports
$Global:SyncHash.Config.Imports = [Hashtable]::Synchronized(@{})
$global:SyncHash.Config.Imports.Functions = @()
$Global:SyncHash.Config.Imports.Functions += $ScriptFullName
$global:SyncHash.Config.Imports.Classes = @()

$Global:SyncHash.Config.Imports.Names = @{
    Modules   = @(
        'PSSharedGoods'
        'PSWriteColor'
        'Logging'
        'ActiveDirectory'
        'PSTimers'
        #'PSRunspacedDelegate'
        #'New-DispatchThread'
    )
    Functions = @(
        'Runspace-Functions'
        'New-Runspace'
        'AsyncClass'
    )
    Classes   = @(
        #'MyLogger'
        #'Timer'
    )
}

if ((Get-PSRepository -Name PSGallery).InstallationPolicy -ne 'Trusted') {
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
}

foreach ($ImportType in $Global:SyncHash.Config.Imports.Names.Keys) {
    foreach ($Import in $Global:SyncHash.Config.Imports.Names.$ImportType) {

        switch ($ImportType) {
            'Modules' {
                if (!(Get-Module -Name $Import -ListAvailable -ErrorAction SilentlyContinue)) {
                    Install-Module -Name $Import -Scope CurrentUser
                }
                $ImportObj = $Import
                break
            }
            'Classes' {
                $FileName = "$($Import).ps1"
                $FilePath = Join-Path -Path $Global:SyncHash.Config.Paths.$ImportType -ChildPath $FileName
                if (Test-Path -Path $FilePath) {
                    $ImportObj = $FilePath
                    $global:SyncHash.Config.Imports.Classes += $ImportObj
                }
            }
            Default {
                $FileName = "$($Import).ps1"
                $FilePath = Join-Path -Path $Global:SyncHash.Config.Paths.$ImportType -ChildPath $FileName
                if (Test-Path -Path $FilePath) {
                    $ImportObj = $FilePath
                    $global:SyncHash.Config.Imports.Functions += $ImportObj
                }

                break
            }
            
        }

        try {
            Import-Module $ImportObj -Force -WarningAction SilentlyContinue -InformationAction SilentlyContinue
        }
        catch {
            $ErrorMessage = "[$($_.InvocationInfo.ScriptLineNumber)][$Import] Error catched:`n`t$($_)"
            Write-Error $ErrorMessage
        }
        
    }
    
}
#endregion Sync - Imports

#endregion Sync

###################################################################################################
#region    Classes
class PathsManager {
    static [string] $ScriptPath = $Script:ScriptPath
    static [hashtable] $Folder = @{
        Logs       = '.logs'
        LogTargets = 'LogTargets'
        Config     = 'config'
        Classes    = 'classes'
        Functions  = 'functions'
        Modules    = 'modules'
        Exports    = 'exports'
    }
    
    static [string] GetScriptPath([string]$key) {
        
        if ([PathsManager]::Folder.ContainsKey($key)) {
            $Path = [System.IO.Path]::Combine([PathsManager]::ScriptPath, [PathsManager]::Folder.$key)
            #$Path = Join-Path -Path ([PathsManager]::ScriptPath) -ChildPath ([PathsManager]::Folder.$key)

            if (-not (Test-Path -Path $Path)) {
                New-Item -Path $Path -ItemType Directory -Force | Out-Null
            }

            return $Path
        }
        else {
            throw "Invalid path key: $key"
        }
    }
}

class LogPatterns {
    static [hashtable] $PatternLevel = @{
        Debug = '[%{pid}] [%{lineno:-4}] [%{level:-7}] [%{caller}] [%{body}] [%{execinfo}] %{message}'
        Info  = '[%{lineno:-4}] [%{level:-7}] %{message}'
    }

    static [hashtable] $Pattern = @{
        Console = '[%{timestamp:+%T:8}] '
        File    = '[%{timestamp}] '
    }

    static [string] GetPatterns($Level, $Type) {

        return ([LogPatterns]::Pattern.$Type + [LogPatterns]::PatternLevel.$Level)


        $Script:DebugLogPattern = '[%{pid}] [%{lineno:-4}] [%{level:-7}] [%{caller}] [%{body}] [%{execinfo}] %{message}'

        if ($DefaultLogLevel -eq 'DEBUG') {
            $Script:LogPattern = '[%{pid}] [%{lineno:-4}] [%{level:-7}] [%{caller}] %{message}'
        }
        else {
            $Script:LogPattern = '[%{lineno:-4}] [%{level:-7}] %{message}'
        }

        $Script:DebugLogConsolePattern = '[%{timestamp:+%T:8}] ' + $Script:DebugLogPattern
        $Script:LogConsolePattern = '[%{timestamp:+%T:8}] ' + $Script:LogPattern
        $Script:LogFilePattern = '[%{timestamp}] ' + $Script:LogPattern
        $Script:ResultLogFormat = '[%{timestamp:+%T:8}] [%{level:-7}] %{message}'
    }
}

# Logger class with singleton pattern
class Logger {
    static [Logger] $Instance
    [string] $LogFilePath
    [string] $LogCustomTargetsPath
    [string] $DefaultLogLevel

    Logger([string]$DefaultLogLevel = 'INFO') {
        $this.DefaultLogLevel = $DefaultLogLevel
        $this.InitializeLogging()
    }

    static [Logger] GetInstance() {
        if (-not [Logger]::Instance) {
            [Logger]::Instance = [Logger]::new('INFO')
        }

        return [Logger]::Instance
    }

    hidden [void] InitializeLogging() {

        Set-LoggingDefaultLevel -Level $this.DefaultLogLevel

        $LogName = $(($Script:ScriptName -split '\.')[0])
        $LogFileName = "$($LogName)_$((Get-Date -Format 'yyyy.MM.dd')).log"
        #$this.LogFilePath = Join-Path -Path ([PathsManager]::GetScriptPath('Logs')) -ChildPath $LogFileName
        $this.LogFilePath = [System.IO.Path]::Combine([PathsManager]::GetScriptPath('Logs'), $LogFileName)
        $this.LogCustomTargetsPath = [PathsManager]::GetScriptPath('LogTargets')

        Set-LoggingCustomTarget -Path $this.LogCustomTargetsPath

        Add-LoggingLevel -LevelName 'RUNNING' -Level 50
        Add-LoggingLevel -LevelName 'RESULT' -Level 60
        Add-LoggingLevel -LevelName 'TIME' -Level 70
        Add-LoggingLevel -LevelName 'MESSAGE' -Level 80
        Add-LoggingLevel -LevelName 'GF' -Level 85

        Add-LoggingTarget -Name File -Configuration @{
            Path           = $this.LogFilePath
            Append         = $true
            PrintException = $true
            Format         = [LogPatterns]::GetPatterns($this.DefaultLogLevel, 'File')
        }
        
        Add-LoggingTarget -Name MyConsole -Configuration @{
            Level          = 'DEBUG'
            Format         = [LogPatterns]::GetPatterns('Debug', 'Console')
            PrintException = $true                              # <Not required> Prints stacktrace
            ColorMapping   = @{
                GF      = 'Blue'
                MESSAGE = 'White'
                TIME    = 'DarkCyan' #'Magenta'
                RUNNING = 'DarkYellow'
                RESULT  = 'DarkCyan'
                DEBUG   = 'Blue'
                INFO    = 'Green'
                WARNING = 'Yellow'
                ERROR   = 'Red'
            }
        }
        <#
        Add-LoggingTarget -Name Console -Configuration @{
            Format       = [LogPatterns]::GetPatterns($this.DefaultLogLevel, 'Console')
            ColorMapping = @{
                GF      = 'Blue'
                MESSAGE = 'White'
                TIME    = 'DarkCyan' #'Magenta'
                RUNNING = 'DarkYellow'
                RESULT  = 'Cyan'
                INFO    = 'Green'
                WARNING = 'Yellow'
                ERROR   = 'Red'
                DEBUG   = 'Blue'
            }
        }
        #>

        #Write-Log -Level INFO -Message "Logging initialized at level: $($this.DefaultLogLevel)"
    }

    [void] Log([string]$Level, [string]$Message) {
        Write-Log -Level $Level -Message $Message
    }
    
    [void] Log([string]$Level, [string]$Message, $LogBody) {
        Write-Log -Level $Level -Message $Message -Body $LogBody
    }
}

[NoRunspaceAffinity()]
class Timer {
    static [Timer] $Instance
    static [Hashtable] $Runtimes = $global:SyncHash.Runtimes #@{}
    [string] $Context
    [string] $Component
    [System.Management.Automation.CommandOrigin] $CommandOrigin

    Init() {
        $this.CommandOrigin = $MyInvocation.CommandOrigin
        $this.Context = $this.GetInvocationContext()
        $this.Component = $this.GetType().FullName
    }

    Timer() {
        #$this.Init()
    }

    Timer($FunctionName, $Description) {
        $this.Get($FunctionName, $Description)
    }

    Get($FunctionName, $Description) {
        [Timer]::GetTimer($FunctionName, $Description)
    }

    InvokeTimer() {
        $MethodName = [StackTrace]::new($true).GetFrame(1).GetMethod().Name
        [Timer]::GetTimer($this.GetType().Name, $MethodName, $this.Context)
    }

    [string] GetInvocationContext() {
        
        if ($this.CommandOrigin -eq 'Runspace') {
            #$runspaceName = (Get-Variable -Name 'RunspaceName' -ErrorAction SilentlyContinue).Value
            #return "Runspace: $runspaceName"
            return "Runspace: "
        }
        else {
            #return "Direct: $runspaceName"
            return [Timer]::GetCallStack((Get-PSCallStack))
        }
    }

    static [Timer] GetInstance() {
        if (-not [Timer]::Instance) {
            [Timer]::Instance = [Timer]::new()
        }

        return [Timer]::Instance
    }

    static [Void] GetTimer([String]$ClassName, [String]$MethodName, [String]$Description) {
        #TODO: Anpassen an FunctionLogging
        $TimerKey = "$ClassName::$MethodName::$($Description.Trim(' '))"
        $TimerMessage = "[$ClassName][$MethodName]"
        
        try {
            $runningTimers = [Timer]::Runtimes.Values | Where-Object { $_.Status -eq 'Running' }
            $spaces = ' ' * $runningTimers.Count
            $TimerMessage = "$spaces$TimerMessage"

            if (-not [Timer]::Runtimes.ContainsKey($TimerKey)) {
                [Timer]::Runtimes.Add($TimerKey, (Start-MyTimer -Name $TimerKey -Description $runningTimers.Count))
                Write-Log -Level TIME -Message "$spaces$TimerMessage Start - $Description"
            }
            elseif ([Timer]::Runtimes.$TimerKey.Status -eq 'Running') {
                Stop-MyTimer -Name $TimerKey
                $Duration = [Timer]::FormatDuration($TimerKey)
                
                [Int]$SpacesCount = [Timer]::Runtimes.$TimerKey.Description
                if ($SpacesCount -gt 0) {
                    $SpacesCount--
                }
                $spaces = ' ' * $SpacesCount

                Write-Log -Level TIME -Message "$spaces$TimerMessage End - Runtime: $Duration"
            }
        }
        catch {
            Write-Log -Level ERROR -Message $TimerMessage -ExceptionInfo $_
        }

        Wait-Logging

    }

    static [Void] GetTimer([string]$FunctionName, [String]$Description) {
        $thisContext = [Timer]::GetInvocationContextStatic()
        #$TimerMessage = ""

        if (-not [string]::IsNullOrEmpty($thisContext.RunspaceName)) {
            $RunspaceName = $thisContext.Runspace
            $TimerKey = "$FunctionName::$RunspaceName"
        }
        else {
            $TimerKey = $FunctionName
        }

        $TimerKey = "$TimerKey::$($Description.Replace(' ', ''))"
        
        $FncsLength = 0
        if ($global:SyncHash.Runspace.Functions) {
            $FncsLength = $global:SyncHash.Runspace.Functions | ForEach-Object { $_.Length } | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum
        }

        $LogBody = @{
            ScriptName = $thisContext.ScriptName
            Runspace   = $thisContext.RunspaceName
            Command    = $thisContext.Command
            Function   = $thisContext.FunctionName
            FncsLength = $FncsLength
        }
        
        $Job = $global:SyncHash.Runspace.Jobs | Where-Object { $_.FunctionName -eq $FunctionName -and $_.Message -eq $Description }
        if ($Job) {
            if (-not $Job.Body) {
                $Job.LogBody = $LogBody
            }
            if (-not $Job.Context) {
                $JobContext = [ordered]@{
                    Start = $null
                    Ende  = $null
                }
                $Job | Add-Member -MemberType NoteProperty -Name 'Context' -Value $JobContext
            }
            
        }
        
        try {
            $runningTimers = $global:SyncHash.Runtimes | Where-Object { $_.Status -eq 'Running' }
            $spaces = ' ' * $runningTimers.Count
            #$TimerMessage = "$spaces$TimerMessage"
            $TimerMessage = "$spaces$Description"

            if (-not $global:SyncHash.Runtimes.ContainsKey($TimerKey)) {
                $global:SyncHash.Runtimes.Add($TimerKey, (Start-MyTimer -Name $TimerKey -Description $runningTimers.Count))
                
                #$LogMessage = "$TimerMessage $Description"
                $LogMessage = $TimerMessage
                Write-Log -Level TIME -Message $LogMessage -Body $LogBody
                #$global:SyncHash.Logger.Log('INFO', $LogMessage)
                #$global:SyncHash.Log.Time($LogMessage)
                if ($Job) {
                    $Job.Context.Start = $thisContext
                }
            }
            elseif ($global:SyncHash.Runtimes.$TimerKey.Status -eq 'Running') {
                Stop-MyTimer -Name $TimerKey
                $Duration = [Timer]::FormatDuration($TimerKey)
                
                [Int]$SpacesCount = $global:SyncHash.Runtimes.$TimerKey.Description
                if ($SpacesCount -gt 0) {
                    $SpacesCount--
                }
                $spaces = ' ' * $SpacesCount

                #$LogMessage = "$spaces$TimerMessage finished Runtime: $Duration"
                $LogMessage = "$($spaces)finished Runtime: $Duration"
                Write-Log -Level TIME -Message $LogMessage -Body $LogBody
                #$global:SyncHash.Log.Time($LogMessage)

                if ($Job) {
                    $Job.Context.Ende = $thisContext
                }
            }
            elseif ($global:SyncHash.Runtimes.$TimerKey.Status -eq 'Stopped') {
                $Duration = [Timer]::FormatDuration($TimerKey)
                
                [Int]$SpacesCount = $global:SyncHash.Runtimes.$TimerKey.Description
                if ($SpacesCount -gt 0) {
                    $SpacesCount--
                }
                $spaces = ' ' * $SpacesCount
                
                $LogMessage = "$($spaces)finished Runtime: $Duration"
                Write-Log -Level TIME -Message $LogMessage -Body $LogBody
            }
        }
        catch {
            Write-Log -Level ERROR -Message "$TimerKey" -Body $LogBody -ExceptionInfo $_
        }

        Wait-Logging

    }

    static [Void] GetTimer([string]$FunctionName, [String]$Description, [hashtable]$LogBody) {
        $TimerKey = "$FunctionName::$($Description.Replace(' ', ''))"

        if ($global:SyncHash.Runtimes.$TimerKey.Status -eq 'Stopped') {
            $Duration = [Timer]::FormatDuration($TimerKey)
                
            [Int]$SpacesCount = $global:SyncHash.Runtimes.$TimerKey.Description
            if ($SpacesCount -gt 0) {
                $SpacesCount--
            }
            $spaces = ' ' * $SpacesCount
                
            $LogMessage = "$($spaces)finished Runtime: $Duration"
            Write-Log -Level TIME -Message $LogMessage -Body $LogBody
        }

        Wait-Logging
    }

    static [String] FormatDuration([string]$TimerKey) {
        return [Timer]::FormatDuration([Timer]::Runtimes.$TimerKey.Duration)
    }

    static [string] FormatDuration([TimeSpan]$Duration) {
        $DurationMessage = ''

        switch ($Duration) {
            { $_.Hours -gt 0 } {
                $Hours = "{0:D2}h" -f $Duration.Hours
                $DurationMessage = "$Hours "
            }
            { $_.Minutes -gt 0 } {
                $Minutes = "{0:D2}min" -f $Duration.Minutes
                $DurationMessage = "$DurationMessage$Minutes "
            }
            { $_.Seconds -gt 0 } {
                $Seconds = "{0:D2}sec" -f $Duration.Seconds
                $DurationMessage = "$DurationMessage$Seconds "
            }
            { $_.Milliseconds -gt 0 } {
                $Milliseconds = "{0:D2}ms" -f $Duration.Milliseconds
                $DurationMessage = "$DurationMessage$Milliseconds"
            }
        }
        
        return $DurationMessage
    }
    
    static [PSCustomObject] GetInvocationContextStatic() {
        $_commandOrigin = $MyInvocation.CommandOrigin
        
        $CallStack = [Timer]::GetCallStack((Get-PSCallStack))

        if ($_commandOrigin -eq 'Runspace') {
            $RunspaceName = (Get-Variable -Name 'RunspaceName' -ErrorAction SilentlyContinue).Value
            
            $CallStack.RunspaceName = $RunspaceName

        }
        
        return $CallStack
    }

    static [PSCustomObject] GetCallStack($CallStack) {
        $PSCallStackIndex = 2
        Set-LoggingCallerScope -CallerScope 2
        
        switch ($CallStack) {
            { $CallStack[2].FunctionName -match 'GetTimer|Write\-Log' } {
                $PSCallStackIndex = 3
                Set-LoggingCallerScope -CallerScope 3
                break
            }
            Default {
                
            }
        }

        $ScriptName = $CallStack[$PSCallStackIndex].ScriptName
        if ($ScriptName) {
            $ScriptName = $ScriptName | Split-Path -Leaf
        }
        
        return [PSCustomObject]@{
            Callstack        = (Get-PSCallStack)
            Command          = $CallStack[$PSCallStackIndex].Command
            ScriptName       = $ScriptName
            ScriptLineNumber = $CallStack[$PSCallStackIndex].ScriptLineNumber.ToString()
            FunctionName     = $CallStack[$PSCallStackIndex].FunctionName
            RunspaceName     = ''
        }
    }
}

#endregion Classes
###################################################################################################
#region Functions

#region    Helper Functions
function Initialize-Logging {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $DefaultLogLevel = 'INFO'
    )

    if (!(Get-Module -Name Logging -ListAvailable -ErrorAction SilentlyContinue)) {
        Install-Module -Name Logging -Scope CurrentUser
    }

    Import-Module Logging

    Set-LoggingDefaultLevel -Level $DefaultLogLevel
    #Set-LoggingCustomTarget -Path $Global:SyncHash.Config.Paths.LogTargets
    Set-LoggingCustomTarget -Path ([PathsManager]::GetScriptPath('LogTargets'))

    $LogName = $(($Script:ScriptName -split '\.')[0])
    $LogFileName = "$($LogName)_$((Get-Date -Format 'yyyy.MM.dd').ToString()).log"
    #$FullLogFilePath = Join-Path -Path $Script:LogsPath -ChildPath $LogFileName
    $FullLogFilePath = [System.IO.Path]::Combine([PathsManager]::GetScriptPath('Logs'), $LogFileName)

    $Script:DebugLogPattern = '[%{pid}] [%{lineno:-4}] [%{level:-7}] [%{caller}] [%{body}] [%{execinfo}] %{message}'

    if ($DefaultLogLevel -eq 'DEBUG') {
        $Script:LogPattern = '[%{pid}] [%{lineno:-4}] [%{level:-7}] [%{caller}] %{message}'
    }
    else {
        $Script:LogPattern = '[%{lineno:-4}] [%{level:-7}] %{message}'
    }

    $Script:DebugLogConsolePattern = '[%{timestamp:+%T:8}] ' + $Script:DebugLogPattern
    $Script:LogConsolePattern = '[%{timestamp:+%T:8}] ' + $Script:LogPattern
    $Script:LogFilePattern = '[%{timestamp}] ' + $Script:LogPattern
    $Script:ResultLogFormat = '[%{timestamp:+%T:8}] [%{level:-7}] %{message}'

    Add-LoggingLevel -LevelName 'RUNNING' -Level 50
    Add-LoggingLevel -LevelName 'RESULT' -Level 60
    Add-LoggingLevel -LevelName 'TIME' -Level 70
    Add-LoggingLevel -LevelName 'MESSAGE' -Level 80
    Add-LoggingLevel -LevelName 'GF' -Level 85

    Add-LoggingTarget -Name MyConsole -Configuration @{
        Level          = 'DEBUG'
        Format         = $Global:DebugLogConsolePattern
        PrintException = $true                              # <Not required> Prints stacktrace
        ColorMapping   = @{
            GF      = 'Blue'
            MESSAGE = 'White'
            TIME    = 'DarkCyan' #'Magenta'
            RUNNING = 'DarkYellow'
            RESULT  = 'Cyan'
            DEBUG   = 'Blue'
            INFO    = 'Green'
            WARNING = 'Yellow'
            ERROR   = 'Red'
        }
    }
    <#
    Add-LoggingTarget -Name Console -Configuration @{
        Format         = $Global:LogConsolePattern          # <Not required> Sets the logging format for this target
        PrintException = $true                              # <Not required> Prints stacktrace
        ColorMapping   = @{
            GF      = 'Blue'
            MESSAGE = 'White'
            TIME    = 'DarkCyan' #'Magenta'
            RUNNING = 'DarkYellow'
            RESULT  = 'Cyan'
            DEBUG   = 'Blue'
            INFO    = 'Green'
            WARNING = 'Yellow'
            ERROR   = 'Red'
        }
    }
    #>
    Add-LoggingTarget -Name File -Configuration @{
        Path           = $FullLogFilePath    # <Required> Sets the file destination (eg. 'C:\Temp\%{+%Y%m%d}.log')
        PrintBody      = $false              # <Not required> Prints body message too
        PrintException = $true               # <Not required> Prints stacktrace
        Append         = $true               # <Not required> Append to log file
        Format         = $Script:LogFilePattern            # <Not required> Sets the logging format for this target
    }
    
    Write-Log -Level DEBUG -Message 'Logging Module configured'
}

# Initialize logging at the start
Initialize-Logging

function Invoke-Timer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $FunctionName,
        [Parameter()]
        [string] $Description
    )

    #if (-not (Get-LoggingTarget).ContainsKey('MyConsole')) {
    #    Initialize-Logging
    #}
    [Timer]::GetTimer($FunctionName, $Description)

    <#
    if (-not ($global:SyncHash.Runtimes[$FunctionName])) {
        $global:SyncHash.Runtimes[$FunctionName] = Start-MyTimer -Name $FunctionName -Description $Description
        #Write-Log -Level RUNNING -Message $Description
        $SyncHash.Logger.Log('RUNNING', $Description)
    }
    elseif ($global:SyncHash.Runtimes[$FunctionName].Status -eq 'Running') {
        Stop-MyTimer -Name $FunctionName
        $Duration = "{0:D2}:{1:D2} min" -f $global:SyncHash.Runtimes.$FunctionName.Duration.Minutes, $global:SyncHash.Runtimes.$FunctionName.Duration.Seconds
        
        $Message = "  [$FunctionName] Runtime: $Duration"
        #Write-Log -Level TIME -Message $Message
        $SyncHash.Logger.Log('TIME', $Message)
    }
    #>

    #$FunctionName = $MyInvocation.MyCommand.Name
    #$Description = "Processing Sage UserData and find AD Account [$($SageData.Count)]"
    #$Script:Runtimes[$FunctionName] = Start-MyTimer -Name $FunctionName -Description $Description
    #Write-Log -Level INFO -Message $Description

    #Stop-MyTimer -Name $FunctionName
    #$Duration = "{0:D2}:{1:D2} min" -f $Script:Runtimes.$FunctionName.Duration.Minutes, $Script:Runtimes.$FunctionName.Duration.Seconds
    #Write-Log -Level INFO -Message "[$FunctionName] Runtime: $Duration"
}

function ConvertTo-CamelCase {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $Name
    )

    $TextInfo = (Get-Culture).TextInfo

    $TextInfo.ToTitleCase($Name)
}

<#
function Send-Mail {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $SMTPServer = 'atklmail01.kostweingroup.intern',
        [Parameter()]
        [String] $From = 'SyncSage2AD@kostwein.at',
        [Parameter()]
        [String] $To = 'Mario.Mellunig@kostwein.at',
        [Parameter()]
        [String] $Subject = 'Test',
        [Parameter()]
        [String] $Body = 'TestMail',
        [Parameter()]
        [String] $Attachment,
        [switch] $Ticket
    )


    # Erstelle das Mail-Objekt
    $MailMessage = [System.Net.Mail.MailMessage]::new()
    $MailMessage.from = $From
    $MailMessage.To.Add($To)
    if ($Ticket) {
        $MailMessage.To.Add('Administrator@kostwein.at')
    }
    $MailMessage.Subject = $Subject
    $MailMessage.Body = $Body
    $MailMessage.IsBodyHtml = $true
    
    if ($Attachment) {
        $MailMessage.Attachments.Add($Attachment)
    }

    # Erstelle das SMTP-Client-Objekt
    $SmtpClient = [System.Net.Mail.SmtpClient]::new()
    $SmtpClient.Host = $SmtpServer
    $SmtpClient.UseDefaultCredentials = $true

    # Sende die E-Mail
    try {
        $SmtpClient.Send($MailMessage)
        Write-Host "E-Mail erfolgreich gesendet an $To"
    }
    catch {
        Write-Host "Fehler beim Senden der E-Mail: $_"
    }
}
#>

function Build-MailBody {
    [CmdletBinding()]
    param (
        [Parameter()]
        $NewSageADGroups
    )
    
    $HTMLContent = foreach ($GroupName in $NewSageADGroups) {
        @"
        <p class=MsoNormal style='text-indent:35.4pt'>
            <span>
                $GroupName
            </span>
            <o:p></o:p>
        </p>

"@
    }

    $Body = @"
<body lang=DE-AT link="#0563C1" vlink="#954F72">
    <div class=WordSection1>
        <p class=MsoNormal>
            <b>
                <span>
                    Neu angelegte Sage AD Gruppen: 
                    <o:p></o:p>
                </span>
            </b>
        </p>
$HTMLContent
        <p class=MsoNormal>
            <o:p>&nbsp;</o:p>
        </p>
    </div>
</body>
"@

    return $Body
}

function Send-Mail {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $SMTPServer = 'atklmail01.kostweingroup.intern',
        [Parameter()]
        [String] $From = 'SyncSage2AD@kostwein.at',
        [Parameter()]
        [String] $To = 'Administrator@kostwein.at',
        [Parameter()]
        [String] $Subject = 'Test',
        [Parameter()]
        [String] $Body = 'TestMail',
        [Parameter()]
        [String] $Attachment
    )

    $MellunigM = 'mario.mellunig@kostwein.at'
    $PetritschS = 'sabrina.petritsch@kostwein.at'

    # Erstelle das Mail-Objekt
    $MailMessage = [System.Net.Mail.MailMessage]::new()
    $MailMessage.from = $From
    $MailMessage.To.Add($To)
    $MailMessage.To.Add($MellunigM)
    $MailMessage.To.Add($PetritschS)
    $MailMessage.Subject = $Subject
    $MailMessage.BodyEncoding = [System.Text.Encoding]::UTF8
    $MailMessage.Body = $Body
    $MailMessage.IsBodyHtml = $true
    
    if ($Attachment) {
        $MailMessage.Attachments.Add($Attachment)
    }

    # Erstelle das SMTP-Client-Objekt
    $SmtpClient = [System.Net.Mail.SmtpClient]::new()
    $SmtpClient.Host = $SmtpServer
    $SmtpClient.UseDefaultCredentials = $true

    # Sende die E-Mail
    try {
        $SmtpClient.Send($MailMessage)
        Write-Log -Level INFO -Message "E-Mail erfolgreich gesendet an $To"
    }
    catch {
        Write-Host -Level ERROR -Message "Fehler beim Senden der E-Mail: $_"
    }

    Wait-Logging
}

function Get-DynamicThrottleLimit {
    [CmdletBinding()]
    param (
        [int]$MaxLimit = 16
    )

    $ProcTime = '\Processor(_Total)\% Processor Time'     # enUS
    $ProcTime = '\prozessor(_total)\prozessorzeit (%)'    # deAT
    

    $CPUUsage = (Get-Counter $ProcTime).CounterSamples[0].CookedValue
    $CPUUsage = [math]::Round($CPUUsage, 2)

    $ThrottleLimit = if ($CPUUsage -lt 50) { 
        $MaxLimit 
    }
    else { 
        [math]::Max([math]::Floor($MaxLimit / 2), 1) 
    }
    
    Write-Log -Level INFO -Message "Throttle limit set to: $ThrottleLimit (CPU Usage: $CPUUsage%)"
    
    return $ThrottleLimit
}

function Get-Functions {
    [CmdletBinding()]
    param (
        [Parameter()]
        $_MyInvocation
    )

    $OutputParameter = @()

    foreach ($BlockName in @("BeginBlock", "ProcessBlock", "EndBlock")) {
        $CurrentBlock = $_MyInvocation.MyCommand.ScriptBlock.Ast.$BlockName

        foreach ($Statement in $CurrentBlock.Statements) {
            $Extent = $Statement.Extent.ToString()

            if ([String]::IsNullOrWhiteSpace($Statement.Name) -Or $Extent -inotmatch ('function\W+(?<name>{0})' -f $Statement.Name)) {
                continue
            }

            $OutputParameter += $Statement.Name
        }
    }

    return $OutputParameter

}

function Get-FunctionsFromScript {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $FilePath
    )

    $OutputParameter = @()
    $FNCs = [System.Management.Automation.Language.Parser]::ParseFile($FilePath, [ref]$null, [ref]$Null)

    foreach ($BlockName in @("BeginBlock", "ProcessBlock", "EndBlock")) {
        $CurrentBlock = $FNCs.$BlockName

        foreach ($Statement in $CurrentBlock.Statements) {
            $Extent = $Statement.Extent.ToString()

            if ([String]::IsNullOrWhiteSpace($Statement.Name) -Or $Extent -inotmatch ('function\W+(?<name>{0})' -f $Statement.Name)) {
                continue
            }

            $OutputParameter += $Statement.Name
        }

    }

    return $OutputParameter
}
<#
function Get-Timer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $FunctionName,
        [Parameter()]
        [string] $Description
    )

    [Timer]::GetTimer($FunctionName, $Description)
}
#>
#endregion Helper Functions
################################################################################################
#region    Not In Workflow Functions

#endregion Not In Workflow Functions
################################################################################################
################################################################################################
#region    Sage Functions
<#
function Import-SageData {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$SageCSVFilePath
    )

    Write-Log -Level INFO -Message "Importing Sage Data from $SageCSVFilePath"

    try {
        $SageData = Get-Content -Path $SageCSVFilePath -Raw -Encoding ansi | ConvertFrom-Csv -Delimiter ';'
        $global:SyncHash.Sage.DataRaw = $SageData

        Write-Log -Level INFO -Message "Sage Data successfully imported."
        return $SageData
    }
    catch {
        Write-Log -Level ERROR -Message "Failed to import Sage data from $SageCSVFilePath." -ExceptionInfo $_
        throw "Error reading Sage CSV file."
    }
}
#>

function Get-NameExtraction {
    [CmdletBinding()]
    param (
        [Parameter()]
        $csvData
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Cleaning Sage Data"
    $global:SyncHash.Timer::GetTimer($FunctionName, $Description)
    #Invoke-Timer -FunctionName $FunctionName -Description $Description
    
    foreach ($row in $csvData) {
        $nameField = $row.NAME -replace '\s+', ' ' # Normalize whitespace
        
        if ($nameField -match 'HECTAS') {
            $leihFirma, $sName = $nameField.Split(', ')
            $lastName, $firstName = $sName.Split(' ').ToLower().Trim()
        }
        # Improved Regex pattern for handling new cases
        elseif ($nameField -match '^([^/]+)\s*/\s*([^,]+),\s*(.+)$') {
            # Case with Leihfirma
            $lastName = $matches[1].ToLower().Trim()
            $leihFirma = $matches[2].ToLower().Trim()
            $firstName = $matches[3].ToLower().Trim()
        }
        elseif ($nameField -match '^([^,]+),\s*(.+)$') {
            # Case without Leihfirma
            $lastName = $matches[1].ToLower().Trim()
            $firstName = $matches[2].ToLower().Trim()
            $leihFirma = $null
        }
        else {
            # Default case if no match
            $lastName = ''
            $firstName = ''
            $leihFirma = ''
        }

        # Convert extracted data to CamelCase
        $lastName = ConvertTo-CamelCase -Name $lastName
        $firstName = ConvertTo-CamelCase -Name $firstName
        if ($leihFirma) {
            $leihFirma = ConvertTo-CamelCase -Name $leihFirma
        }

        # Add properties to the row
        $row | Add-Member -MemberType NoteProperty -Name 'Nachname' -Value $lastName -Force
        $row | Add-Member -MemberType NoteProperty -Name 'Vorname' -Value $firstName -Force
        $row | Add-Member -MemberType NoteProperty -Name 'Leihfirma' -Value $leihFirma -Force

        if ($lastName -and $firstName) {
            $GeneratedSAMAccount = ($lastName.Trim() + $firstname.Substring(0, 1).Trim()).ToLower() -replace ' ', ''
        }
        else {
            $GeneratedSAMAccount = ''
        }

        $row | Add-Member -MemberType NoteProperty -Name 'GenSamAcc' -Value $GeneratedSAMAccount -Force

        if (-not([string]::IsNullOrWhiteSpace($row.Kostenstelle) -and [string]::IsNullOrWhiteSpace($row.Abteilung))) {
            
            $SageGroupAbteilung = $row.Abteilung -replace '[- ]+', '_' -replace '\.|\(|\)', ''
            $GroupName = "Sage_{0}_{1}" -f $SageGroupAbteilung, $row.Kostenstelle
            
        }
        else {
            $GroupName = ''
        }

        $row | Add-Member -MemberType NoteProperty -Name 'SageADGroup' -Value $GroupName -Force


        $sVorgesetzterNachname, $sVorgesetzterVorname = $row.'Vorgesetzter Name'.Split(', ').ToLower()
        if ($sVorgesetzterNachname -and $sVorgesetzterVorname) {
            $Vorgesetzter = -join ($global:SyncHash.Config.TextInfo.ToTitleCase($sVorgesetzterNachname), ' ', $global:SyncHash.Config.TextInfo.ToTitleCase($sVorgesetzterVorname))
        }
        else {
            $Vorgesetzter = ''
        }

        $row | Add-Member -MemberType NoteProperty -Name 'Vorgesetzter' -Value $Vorgesetzter -Force
        
    }

    #$csvData | Export-Csv -Path "clean_canon.csv" -NoTypeInformation
    $global:SyncHash.Sage.CleanData = $csvData

    #Invoke-Timer -FunctionName $FunctionName -Description $Description
    $global:SyncHash.Timer::GetTimer($FunctionName, $Description)
}

function New-SageObject {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $sUser
    )

    if ([string]::IsNullOrEmpty($sUser.WINDOWS)) {
        
        if ([string]::IsNullOrEmpty($sUser.GenSamAcc)) {
            $SamAccount = $null
        }
        else {
            $SamAccount = ($sUser.GenSamAcc).ToLower()
        }
    }
    else {
        $SamAccount = ($sUser.WINDOWS).ToLower().Trim()
    }

    if ($null -ne $SamAccount) {
        $MFAExchangeGroup = 'KOW_MFA_Exchange'
        $MFASkipExchangeGroup = 'KOW_MFA_Skip_Exchange'

        $MFAGroupMembers = @{

        }

        if ($SamAccount -notin $MFAGroupMembers) {
            $ExchangeGroup = $MFASkipExchangeGroup
        }
        else {
            $ExchangeGroup = $MFAExchangeGroup
        }
    }
    
    $sStandort = $sUser.Standort
        
    switch ($sStandort) {
        { $_ -match 'Klgft.|Ratzendorf|Zentrallager|Völkermarkt|Unterbergen|St.Veit' } {
            $sFirma = 'Kostwein Maschinenbau GmbH'
            $sCountry = 'AT'
            $sStaat = 'Österreich'
            $sCity = 'Klagenfurt'
            $sState = 'Kärnten'
            $sPostalCode = '9020'
            $sStreetAddress = 'Berthold-Schwarz-Straße 51'
            $preferredLanguage = 'de-AT'
            $ADCountry = @{
                c           = 'AT'
                co          = 'Österreich'
                countrycode = 40
            }
        }
        { $_ -eq 'Ratzendorf' } {
            $sCity = 'Maria Saal'
            $sPostalCode = '9063'
            $sStreetAddress = 'Ratzendorf 2A'
        }
        { $_ -eq 'Zentrallager' } {
            $sStreetAddress = 'Fallegasse 3'
        }
        { $_ -eq 'Völkermarkt' } {
            $sCity = 'Völkermarkt'
            $sPostalCode = '9100'
            $sStreetAddress = 'Petzenweg 7'
        }
        { $_ -eq 'Unterbergen' } {
            $sCity = 'Unterbergen'
            $sPostalCode = '9163'
            $sStreetAddress = 'Unterbergen 24'
        }
        { $_ -eq 'St.Veit' } {
            $sCity = 'Sankt Veit/Glan'
            $sPostalCode = '9300'
            $sStreetAddress = 'Industrieparkstraße 1'
        }
        { $_ -match 'Kroatien|SDK' } {
            $sFirma = 'Proizvodnja Strojeva d.o.o.'
            $sCountry = 'HR'
            $sStaat = 'Kroatien'
            $sCity = 'Varazdin'
            $sState = ''
            $sPostalCode = '42000'
            $sStreetAddress = 'Podravska ulica 37'
            $preferredLanguage = 'hr-HR'
            $ADCountry = @{
                c           = 'HR'
                co          = 'Kroatien'
                countrycode = 191
            }
        }
        { $_ -match 'Trnovec' } {
            $sCity = 'Trnovec Bartolovecki'
            $sPostalCode = '42202'
            $sStreetAddress = 'Gospodarska 11'
        }
        { $_ -match 'Italien' } {
            $sFirma = 'Kostwein Metalinox S.r.l.'
            $sCountry = 'IT'
            $sStaat = 'Italien'
            $sCity = 'Fiumicello Villa Vicentina'
            $sState = ''
            $sPostalCode = '33059'
            $sStreetAddress = 'Via Cortona, 13'
            $preferredLanguage = 'it-IT'
            $ADCountry = @{
                c           = 'IT'
                co          = 'Italien'
                countrycode = 380
            }
        }
        { $_ -match 'Indien' } {
            $sFirma = 'India Company Private Ltd'
            $sCountry = 'IN'
            $sStaat = 'Indien'
            $sCity = 'Ahmedabad'
            $sState = ''
            $sPostalCode = '382405'
            $sStreetAddress = 'Plot N0. 170, N.I D.C. Industrial Estate'
            $preferredLanguage = 'hi-IN'
            $ADCountry = @{
                c           = 'IN'
                co          = 'Indien'
                countrycode = 356
            }
        }
        { $_ -match 'USA' } {
            $sFirma = 'Kostwein Corporation'
            $sCountry = 'US'
            $sStaat = 'Amerika'
            $sCity = 'Greenville'
            $sState = ''
            $sPostalCode = 'SC29615'
            $sStreetAddress = '500 Hartness Dr'
            $preferredLanguage = 'en-US'
            $ADCountry = @{
                c           = 'US'
                co          = 'USA'
                countrycode = 840
            }
        }
        DEFAULT {
            Write-Log WARNING "[$sStandort] Fehlender Standort"
        }
    }
        
    $PrinzipalDomain = if ($sCountry -ne 'IT') { 
        'kostwein' 
    }
    else { 
        'kostwein-metalinox' 
    }
    $UserPrincipalName = "$($sUser.Vorname).$($sUser.Nachname)@$($PrinzipalDomain).$($sCountry.ToLower())"

        
    if ($sUser.'Pers.Nr.' -in $global:SyncHash.Config.SageGF.Keys) {
        $SageADGroup = 'Sage_GF'
    }
    else {
        $SageADGroup = $sUser.SageADGroup
    }
    
    if ($sUser.AUSTRITT -ne '') {
        $Austritt = Get-Date -Date $sUser.AUSTRITT
    }
    else {
        $Austritt = ''
    }
        
    $UserData = New-Object PSObject -Property ([ordered]@{
            ID                  = $sUser.ID
            PersNr              = $sUser.'Pers.Nr.'
            SamAccountName      = ($sUser.WINDOWS).ToLower().Trim()
            UserPrincipalName   = $UserPrincipalName
            GeneratedSAMAccount = $sUser.GenSamAcc
            Name                = $sUser.NAME
            Nachname            = $sUser.Nachname #$TextInfo.ToTitleCase($Nachname)
            Vorname             = $sUser.Vorname #$TextInfo.ToTitleCase($Vorname)
            preferredLanguage   = $preferredLanguage
            #Leiharbeiter        = $Leiharbeiter
            Leihfirma           = $sUser.Leihfirma
            eMail               = $sUser.EMAIL
            Mobil               = $sUser.MOBIL
            Kostenstelle        = $sUser.Kostenstelle
            #Fotoname       = $sFotoFile
            FotoUri             = $sUser.FOTO
            Firma               = $sFirma
            Abteilung           = $sUser.Abteilung
            Standort            = $sUser.Standort
            Stelle              = $sUser.STELLE
            Tätigkeit           = $sUser.Tätigkeit
            StreetAddress       = $sStreetAddress
            City                = $sCity
            PostalCode          = $sPostalCode
            State               = $sState
            Country             = $sCountry
            Staat               = $sStaat
            Eintritt            = $sUser.EINTRITT
            Austritt            = $sUser.AUSTRITT
            #PortraitFile   = $PortraitFile
            VorgesetzterID      = $sUser.'Vorgesetzter ID'
            Vorgesetzter        = $sUser.Vorgesetzter
            ADSageGroup         = $SageADGroup
            ADCountry           = $ADCountry
        })
        
    return $UserData
}

function Start-SageDataProcess {
    [CmdletBinding()]
    param (
        [Parameter()]
        [datetime] $Austrittsgrenze
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Processing Sage UserData and find AD Account"
    #Invoke-Timer -FunctionName $FunctionName -Description $Description
    [Timer]::GetTimer($FunctionName, $Description)
    
    $CleanData = $global:SyncHash.Sage.CleanData | Where-Object { $_.Standort -ne 'Italien' } | Where-Object { $_.Kostenstelle -notin @('10099', '10098') -and $_."Pers.Nr." -ne '6100' } | Where-Object { -not [string]::IsNullOrEmpty($_.Vorname) -and $_.Nachname -notmatch 'Reinigung|Betriebsarzt' }
    
    try {

        if ($CleanData) {

            $ScriptBlock = {
                param (
                    $SyncHash,
                    $Data,
                    $sUser,
                    $Austrittsgrenze
                )

                $UserData = New-SageObject -sUser $sUser
            
                if ($UserData.Austritt -eq '' -or $UserData.Austritt -ge $Austrittsgrenze) {
                
                    $Employee = Update-Employee -SageUser $UserData
                    $global:SyncHash.Employees.Add($UserData.PersNr, $Employee)

                    $global:Data.Employees[$UserData.PersNr] = $Employee
                }

            }

            foreach ($sUser in $CleanData) {
                $Params = @{
                    SyncHash        = $SyncHash
                    Data            = $Data
                    sUser           = $sUser
                    Austrittsgrenze = $Austrittsgrenze
                }

                $JobName = $sUser."Pers.Nr."
                New-RunspaceJob -JobName $JobName -ScriptBlock $ScriptBlock -RunspacePool $Global:SyncHash.Runspace.RunspacePool -Parameters $Params

                $Global:SyncHash.Runspace.Jobs += [PSCustomObject]@{
                    "$($JobName)" = $global:runspaces.Clone() | Where-Object { $_.JobName -eq $JobName }
                }
            }

        }
        
    }
    catch {
        $ErrorInfo = $_
        $ErrorMessage = $_.Exception.Message
        Write-Log -Level ERROR -Message "[$($sUser.Name)] Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
    }
    
    Receive-RunspaceJob -Wait

    if ($SyncHash.Errors) {
        Write-Log -Level ERROR -Message 'Error: ' -ExceptionInfo $SyncHash.Errors
    }

    $global:SyncHash.Sage.ADGroupNames = $CleanData.SageADGroup | Sort-Object -Unique | Sort-Object
    
    Get-SageGroups

    $global:SyncHash.Sage.NotInCleanData = $global:SyncHash.Sage.DataRaw | Where-Object { $_.'Pers.Nr.' -notin $CleanData.'Pers.Nr.' }
    $global:SyncHash.Sage.LeavingEmployees = $CleanData | Where-Object { $_.'Pers.Nr.' -notin $global:Data.Employees.Values.employeeID }
    $global:SyncHash.Sage.NotInAD = $global:Data.Employees.Values | Where-Object { $null -eq $_.AD }

    $Employees = $global:Data.Employees.Values | Sort-Object -Property Name

    #Invoke-Timer -FunctionName $FunctionName
    [Timer]::GetTimer($FunctionName, $Description)
    
    return $Employees
    
}

function Show-Employees {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $Employees
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Show Employees"
    Invoke-Timer -FunctionName $FunctionName -Description $Description

    #TODO: Austesten abschließen und fertig codieren
    #$Employees | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, @{Name = "MailAD"; Expression = { $_.AD.mail } }, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } } | Out-HtmlView
    $Employees | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } } | Out-HtmlView -Title 'All Employees' -FixedHeader -DisablePaging

    $InactiveMailbox = $Employees | Where-Object { $_.Mailbox -eq 'Inactive' }
    If ($InactiveMailbox.Count -gt 0) {
        $InactiveMailbox | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } } | Out-HtmlView -Title 'Mailbox Inactive' -FixedHeader -DisablePaging
    }

    $MissingInAD = $Employees | Where-Object { $_.ADFoundWith -eq 'Missing' }
    If ($MissingInAD.Count -gt 0) {
        $MissingInAD | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } } | Out-HtmlView -Title 'Missing in AD' -FixedHeader -DisablePaging
    }
    
    $MailMissingSage = $Employees | Where-Object { $_.Sage.eMail -eq '' -and $null -ne $_.AD.mail }
    if ($MailMissingSage.Count -gt 0) {
        $MailMissingSage | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, @{Name = "MailAD"; Expression = { $_.AD.mail } }, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } } | Out-HtmlView -Title 'Mail Missing in Sage' -FixedHeader -DisablePaging
    }

    $MailMissingAD = $Employees  | Where-Object { $_.Sage.eMail -ne '' -and $null -eq $_.AD.mail }
    if ($MailMissingAD.Count -gt 0) {
        $MailMissingAD | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, @{Name = "MailAD"; Expression = { $_.AD.mail } }, Mailbox | Out-HtmlView -Title 'Mail Missing In AD' -FixedHeader -DisablePaging
    }

    #$ADUsersPager = $ADUsers | Where-Object { $_.pager -eq 'P' -and $_ -notin $Employees.AD -and $_.Name -notmatch 'Adm_|Test|6' -and $_.Enabled -eq $True }
    #$ADUsersPager | Select-Object -Property Name, Enabled, pager, SamAccountName, @{Name = "LastLogon"; Expression = { (Get-Date -Date $_.LastLogonDate).Date.ToShortDateString() } } | Out-HtmlView -Title 'P in Pager' -FixedHeader -DisablePaging

    $Found = [System.Collections.ArrayList]::new()
    $AllAD = Get-ADUser -Filter * -Properties SamAccountName, GivenName, SurName
    foreach ($Missing in $MissingInAD) {
        $Account = $AllAD | Where-Object { $_.SurName -eq $Missing.Sage.Nachname -and $_.GivenName -eq $Missing.Sage.Vorname }
        if ($Account) {
            $Found.Add($Account)
        }
    }

    Invoke-Timer -FunctionName $FunctionName
}
#endregion Sage Functions
################################################################################################
#region    AD Functions
function Get-ADData {
    [CmdletBinding()]
    param (
        #[Parameter()]
        #[Object] $SyncHash,
        [Parameter()]
        [switch] $ADUsers = $false,
        [Parameter()]
        [switch] $ADGroups = $false
    )
    
    if ($ADUsers) {
        $Properties = @("SamAccountName", "pager", "Personalnummer", "Company", "Country", "co", "State", "Department", "departmentNumber", "language", "preferredLanguage", "jpegPhoto", "photo", "employeeType", "Office", "StreetAddress", "Created", "Description", "EmailAddress", "mail", 'ProxyAddresses', "HomeMDB", "msExchMailboxGuid", "Enabled", "EmployeeID", "Manager", "Title", "GivenName", "Surname", "Name", "LastLogonDate", "LockedOut", "logonCount", "LogonWorkstations", "MobilePhone", "mobile", "MemberOf", "pager", "Modified", "whenChanged", "whenCreated")
        Get-ADUser -Filter '*' -Properties $Properties | ForEach-Object {
            $SyncHash.ObjectsCache.Users.Add("$($_.SamAccountName.ToLower())", $_)
        }

        $SyncHash.ObjectsCache.Users.Values | Where-Object { 
            $_.Name -notmatch '(^(Adm_|SVC_|DMC|MNC|EROWA|guest|6|Monitoring|Video|Toolset)|(t|T)est)|((M|m)essraum)' -and 
            $null -ne $_.SurName -and $null -ne $_.GivenName -and 
            $_.Description -notmatch 'Dienstkonto|[Ss]ervice' -and 
            $_.DistinguishedName -notmatch '(?:OU|CN)\=(?:Allgemein|Service|IUSR_|Ressource)' 
        } | ForEach-Object { $SyncHash.ObjectsCache.ADUsers["$($_.SamAccountName.ToLower())"] = $_ }
    }
    

    if ($ADGroups) {
        Get-ADGroup -Filter '*' | ForEach-Object {
            $SyncHash.ObjectsCache.Groups["$($_.Name)"] = $_
            #$SyncHash.ObjectsCache.Groups.Add("$($_.Name.ToLower())", $_)
        }

        $SyncHash.ObjectsCache.Groups.Values | Where-Object {
            $_.DistinguishedName -match "$($SyncHash.Config.ADGroups.SageGroups.Path)"
        } | ForEach-Object { $SyncHash.ObjectsCache.SageGroups["$($_.Name)"] = $_ }
        
    }

    
}

function Get-AllADUsersOld {
    [CmdletBinding()]
    param (
        [Parameter()]
        $ParameterName
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Get All AD Accounts"
    
    Invoke-Timer -FunctionName $FunctionName -Description $Description

    $ADUsersParams = @{
        Filter     = '*'
        SearchBase = "DC=kostweingroup,DC=intern"
        Properties = @("SamAccountName", "pager", "Personalnummer", "Company", "Country", "co", "State", "Department", "departmentNumber", "language", "preferredLanguage", "jpegPhoto", "photo", "employeeType", "Office", "StreetAddress", "Created", "Description", "EmailAddress", "mail", 'ProxyAddresses', "HomeMDB", "msExchMailboxGuid", "Enabled", "EmployeeID", "Manager", "Title", "GivenName", "Surname", "Name", "LastLogonDate", "LockedOut", "logonCount", "LogonWorkstations", "MobilePhone", "mobile", "MemberOf", "pager", "Modified", "whenChanged", "whenCreated")
    }

    $AllADUsers = Get-ADUser @ADUsersParams

    #$Script:OooVertrieb = (Get-ADGroup -Identity 'OutOfOffice_VERTRIEB').DistinguishedName
    #$Script:OooKostweinS = (Get-ADGroup -Identity 'OutOfOffice_KostweinS').DistinguishedName
    
    Invoke-Timer -FunctionName $FunctionName

    $ADUsers = $AllADUsers | Where-Object { 
        $_.Enabled -eq $True -and
        $_.Name -notmatch '(^(Adm_|SVC_|DMC|MNC|EROWA|guest|6|Monitoring|Video|Toolset)|(t|T)est)|((M|m)essraum)' -and
        $null -ne $_.SurName -and $null -ne $_.GivenName -and
        $_.Description -notmatch 'Dienstkonto|[Ss]ervice' -and
        $_.DistinguishedName -notmatch '(?:OU|CN)\=(?:Allgemein|Service|IUSR_|Ressource)'
    }


    return $ADUsers
}

function Find-ADUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [PSCustomObject] $UserData,
        
        [Parameter()]
        [Object] $Changes = [Ordered]@{},

        [Switch] $GetADUsers,
        $ExchangeGroup
    )

    if ($GetADUsers -or [string]::IsNullOrEmpty($global:SyncHash.ObjectsCache.ADUsers)) {
        $global:SyncHash.ObjectsCache.GetADUsers()
    }
    
    $ADUsers = $global:SyncHash.ObjectsCache.ADUsers.Values

    <#
    if ($GetADUsers -or $null -eq $Script:ADUsers) {
        $Script:ADUsers = Get-AllADUsers
        $global:SyncHash.AD.AllADUsers = $Script:ADUsers
    }
    
    $ADUsers = $Script:ADUsers
    #>

    # Initialize variables
    $ADUser = $null
    $ADFoundWith = $null

    $Employee = [PSCustomObject]@{
        employeeID     = $UserData.PersNr
        Name           = "$($UserData.Nachname) $($UserData.Vorname)"
        SamAccountName = $UserData.SamAccountName
        GenSamAccName  = $UserData.GeneratedSAMAccount
        eMailSage      = $UserData.eMail
        #eMailAD           = $ADUser.eMailAD
        eMailAD        = ''
        #UserPrincipalName = $ADUserAcc.UserPrincipalName
        ADFoundWith    = 'Missing' #$ADUserAcc.FoundWith
        Vorgesetzter   = $UserData.Vorgesetzter
        Sage           = $UserData
        AD             = $null #$ADUserAcc.AD
        ADGroups       = @{
            ExchangeGroup = $ExchangeGroup
            #MailArchiv    = "MailArchiv_$($UserData.Country)"
            OutOfOffice   = "OutOfOffice_$($UserData.Country)"
            SageGroup     = $UserData.ADSageGroup
        }
        Mailbox        = 'Missing'
        Changes        = [Ordered]@{}
    }

    # Define matching logic
    $matchingLogic = [ordered]@{
        SamAcc         = { 
            if ($UserData.SamAccountName -ne '') {
                $ADUsers | Where-Object { 
                    $_.SamAccountName -eq $UserData.SamAccountName
                }
                #Get-ADUser -Identity $UserData.SamAccountName
            }
        }
        GenSamAcc      = {
            if ($UserData.GeneratedSAMAccount -ne '') {
                $GenSamAcc = $UserData.GeneratedSAMAccount -replace 'ö', 'oe'

                $ADUsers | Where-Object { 
                    ($_.SamAccountName -eq $UserData.GeneratedSAMAccount -or
                    $_.SamAccountName -eq $GenSamAcc) -and
                    $_.Surname -eq $UserData.Nachname -and
                    $_.GivenName -eq $UserData.Vorname
                }
            }
        }
        #SamAccUmlaute  = {
        #    $SamAcc = $UserData.SamAccountName -replace 'ö', 'oe'
        #    
        #    $ADUsers | Where-Object { 
        #        ($_.SamAccountName -eq $SamAcc -and $SamAcc -ne '')
        #    }
        #}
        SamAccFromName = { 
            $ADUsers | Where-Object { 
                $_.SamAccountName -match $UserData.Nachname -and
                $_.Surname -eq $UserData.Nachname -and
                $_.GivenName -eq $UserData.Vorname 
            }
        }
        UserPrincipal  = { 
            $ADUsers | Where-Object { 
                $_.UserPrincipalName -match "$($UserData.Vorname).$($UserData.Nachname)" 
            }
        }
        VorNachname    = { 
            $ADUsers | Where-Object { 
                $_.Surname -eq $UserData.Nachname -and
                $_.GivenName -eq $UserData.Vorname 
            }
        }
        eMail          = {
            if ($UserData.eMail -ne '') {
                $ADUsers | Where-Object { $_.EmailAddress -eq $UserData.eMail }
            }
        
        }
    }

    # Execute matching logic in order
    foreach ($key in $matchingLogic.Keys) {
        $ADUser = &($matchingLogic[$key])

        if ($ADUser.Count -gt 1) {
            Write-Host "$($UserData.Name) ADResults: $($ADUser.Count)"
        }

        if ($ADUser) {
            $ADFoundWith = $key
            #$Email = $ADUser.EmailAddress

            $Employee.AD = $ADUser
            $Employee.eMailAD = $ADUser.EmailAddress
            $Employee.ADFoundWith = $ADFoundWith

            if ($null -eq $ADUser.msExchMailboxGuid) {
                #if ($Employee.AD.HomeMDB -match "KOWEX") {
                $Employee.Mailbox = 'Inactive'
            }
            else {
                $Employee.Mailbox = 'Active'
            }

            $DistinguishedName = "CN=$($Employee.ADGroups.SageGroup),$($global:SyncHash.Config.ADGroups.SageGroups.Path)"
            $SageGroupsMemberOf = $Employee.AD.MemberOf | Where-Object { $_ -match "$($global:SyncHash.Config.ADGroups.SageGroups.Path)$" }
            $SageGroupToAdd = $DistinguishedName | Where-Object { $_ -notin $SageGroupsMemberOf }
            #TODO: Prüfen welche Gruppen entfernt werden
            $SageGroupsToRemove = $SageGroupsMemberOf | Where-Object { $_ -notin $DistinguishedName }

            $SageGroups = [Ordered]@{
                SageGroups        = $SageGroupsMemberOf
                DistinguishedName = $DistinguishedName
                Add               = $SageGroupToAdd
                Remove            = $SageGroupsToRemove
            }

            $Employee | Add-Member -MemberType NoteProperty -Name 'SageGroups' -Value $SageGroups -Force

            break
        }
    }
    
    return $Employee
}

function Update-Employee {
    [CmdletBinding()]
    param (
        [Parameter()]
        [PSCustomObject] $SageUser,
        [switch] $GetADUsers
    )

    $Params = @{
        UserData = $SageUser
    }

    if ($GetADUsers) {
        $Params.GetADUsers = $true
    }

    $Employee = Find-ADUser @Params

    if ($Employee.AD) {
        $Employee.eMailAD = $Employee.AD.mail

        if ($Employee.AD.mail -ne $Employee.eMailSage) {
            if ($Employee.AD.ProxyAddresses -ccontains "smtp:$($Employee.eMailSage)") {
                $Employee.eMailAD = $Employee.eMailSage
            }
            else {
                $Employee.eMailAD = $Employee.AD.mail
            }
        }
        
    }

    return $Employee
}

function Set-Company {
    [CmdletBinding()]
    param (
        [Parameter()]
        [PSCustomObject] $Employee
    )

    $UserCompany = $Employee.AD.Company

    if ($UserCompany -ne $Employee.Sage.Firma) {
        Set-ADUser -Identity $Employee.AD.SamAccountName -Company $Employee.Sage.Firma
        
        Write-Log -Level INFO -Message "[$($Employee.Name)] Firma '$UserCompany' wurde auf '$($Employee.Sage.Firma)' geändert."

        return #Get-ADUser -Identity $Employee.AD.SamAccountName -Properties EmailAddress, ProxyAddresses, DistinguishedName, Company, City, Country, State, PostalCode, StreetAddress, UserPrincipalName, mail, pager, msExchMailboxGuid, HomeMDB, WhenCreated, WhenChanged, LastLogonDate, Enabled
    }

}

function Get-ADGroupMembership {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter()]
        [PSCustomObject] $ADEmployee
    )

    $ADGroupsToRemove = [System.Collections.ArrayList]::new()
    $GroupChanged = $false
    
    foreach ($Group in $ADEmployee.ADGroups.Keys) {

        $GroupName = $ADEmployee.ADGroups.$Group
        $ADGroup = (Get-ADGroup -Identity $GroupName).DistinguishedName

        if ($Group -eq 'OutOfOffice') {
            $OooGroup = $ADEmployee.AD.MemberOf | Where-Object { $_ -match 'OutOfOffice' }
            if ($OooGroup) {
                $ADGroup = $OooGroup | Select-Object -First 1
            }
        }
        
        try {
            if ($ADEmployee.AD.MemberOf -notcontains $ADGroup) {
                
                # Use ShouldProcess to respect -WhatIf and -Confirm
                if ($PSCmdlet.ShouldProcess("Adding [$($ADEmployee.Name)] to group '$GroupName'", "Add to AD group")) {
                    Add-ADGroupMember -Identity $GroupName -Members $ADEmployee.AD.SamAccountName

                    $GroupChanged = $True
                    Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully added to '$($GroupName)'."
                }
                
            }
            else {
                Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] is already a member of '$($GroupName)'."
            }

        }
        catch {
            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not add user to '$($GroupName)'."
        }

        $GroupCN = ($ADGroup -split ',')[0]
        $GroupOU = $ADGroup.Split("$GroupCN,")[-1]
        $EmployeeGroupNames = $ADEmployee.AD.MemberOf | Where-Object { $_ -match $GroupOU -and $_ -ne $ADGroup -and $_ -notmatch 'OutOfOffice' -and $_ -notmatch 'Sage__99' }
        foreach ($Group in $EmployeeGroupNames) {
            $ADGroupsToRemove += $Group.Split(',')[0].Replace('CN=', '')
        }
        
    }

    if ($null -ne $ADGroupsToRemove) {

        foreach ($ADGroupToRemove in $ADGroupsToRemove) {
            try {
                
                # Use ShouldProcess to respect -WhatIf and -Confirm
                if ($PSCmdlet.ShouldProcess("Removing [$($ADEmployee.Name)] from group '$ADGroupToRemove'", "Remove from AD group")) {
                    Remove-ADGroupMember -Identity $ADGroupToRemove -Members $ADEmployee.AD.SamAccountName -Confirm:$false

                    $GroupChanged = $True
                    Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully removed from '$($ADGroupToRemove)'."
                }
                    
            }
            catch {
                Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not remove user from '$($ADGroupToRemove)'."
            }
        }
    }

    return $GroupChanged

}

function Sync-SageADGroups {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )
    
    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Checking/Creating Sage AD Groups"
    Invoke-Timer -FunctionName $FunctionName -Description $Description

    $NewSageADGroups = [System.Collections.ArrayList]::new()
    $AllSageGroups = Get-SageADGroups
    
    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = $Script:Config.ADGroups.SageGroups.Path
    }
    #$DistinguishedGroupName = "CN=$($SageGroupName),$($Script:Config.ADGroups.SageGroups.Path)"
    #$AllSageGroups = Get-ADGroup -SearchBase $ADGroupParams.Path -Filter '*'
    
    
    $SageADGroupNames | ForEach-Object -Parallel {
        param($GroupName)
        try {
            if ($AllSageGroups.Name -notcontains $GroupName) {
                if ($PSCmdlet.ShouldProcess("AD Group $GroupName", "Create")) {
                    $ADGroupParams.Name = $GroupName
                    New-ADGroup @ADGroupParams

                    Write-Log -Level WARNING -Message "Successfully created AD Group: $GroupName"
                    $NewSageADGroups.Add($GroupName)
                }
                
            }
        }
        catch {
            Write-Log -Level 'ERROR' -Message "Error creating group: $GroupName"
        }
    } -ThrottleLimit 5

    Invoke-Timer -FunctionName $FunctionName

    $Message = "Neu angelegte Sage AD Gruppen: $($NewSageADGroups -join ', ')"

    if ($NewSageADGroups.Count -gt 0) {
        $Message = "`nNeu angelegte Sage AD Gruppen: `n`t $($NewSageADGroups -join `",`n`t `")"
        $Body = Build-MailBody -NewSageADGroups $NewSageADGroups

        Send-Mail -Subject "Sage AD Groups" -Body $Body
        Write-Log -Level DEBUG -Message $Message
    }
    
    Wait-Logging
}

function New-SageADGroups {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $NewSageADGroupNames
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Creating Sage AD Groups"
    Invoke-Timer -FunctionName $FunctionName -Description $Description
    
    $CreatedSuccess = [System.Collections.ArrayList]::new()
    $CreatedFailed = [System.Collections.ArrayList]::new()

    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = $Script:Config.ADGroups.SageGroups.Path
        ErrorAction   = 'SilentlyContinue'
    }

    try {
        $NewSageADGroupNames | ForEach-Object {
            $ADGroupParams.Name = $_

            try {
                New-ADGroup @ADGroupParams
                $CreatedSuccess.Add($_)
                Write-Log -Level DEBUG -Message "[$($_)] Successfully created AD Group."
            }
            catch {
                $ErrorInfo = $_
                $ErrorMessage = $_.Exception.Message
                $CreatedFailed.Add($_)
                Write-Log -Level ERROR -Message "[$($_)] Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
            }
            
        }
    }
    catch {
        $ErrorInfo = $_
        $ErrorMessage = $_.Exception.Message
        Write-Log -Level ERROR -Message "Error creating ADGroups: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
    }
    
    if ($CreatedSuccess.Count -gt 0) {
        #$CreatedMessage = $CreatedSuccess -join ",`r`n`t"
        #$Message = "Neu angelegte Sage AD Gruppen: `r`n`t$CreatedMessage"
        #Send-Mail -Subject "Sage AD Gruppen Neu" -Body $Message -Ticket
        #Write-Log -Level DEBUG -Message $Message

        $Message = "`nNeu angelegte Sage AD Gruppen: `n`t $($CreatedSuccess -join `",`n`t `")"
        $Body = Build-MailBody -NewSageADGroups $CreatedSuccess

        Send-Mail -Subject "New Sage AD Groups Created" -Body $Body
        Write-Log -Level DEBUG -Message $Message
    }

    if ($CreatedFailed.Count -gt 0) {
        #$FailedMessage = $CreatedFailed -join ",`r`n`t"
        #$Message = "Fehler bei der Erstellung der Sage AD Gruppen: `r`n`t$FailedMessage"
        #Send-Mail -Subject "Sage AD Gruppen Fehlgeschlagen" -Body $Message
        #Write-Log -Level ERROR -Message $Message

        $Message = "`nFehler bei der Erstellung der Sage AD Gruppen: `n`t $($CreatedFailed -join `",`n`t `")"
        $Body = Build-MailBody -NewSageADGroups $CreatedFailed

        Send-Mail -Subject "Create Sage AD Groups Failed" -Body $Body
        Write-Log -Level DEBUG -Message $Message
    }
    
    $global:SyncHash.AD.SageGroups.Created = [PSCustomObject]@{
        Success = $CreatedSuccess
        Failed  = $CreatedFailed
    }

    Wait-Logging

    Invoke-Timer -FunctionName $FunctionName
    
}

function Sync-ADUsers {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $Employees
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = 'Syncing SageData to AD User'
    Invoke-Timer -FunctionName $FunctionName -Description $Description
    
    $AccessDenied = [System.Collections.ArrayList]::new()
    $Updated = [System.Collections.ArrayList]::new()

    <#
    $KeinVorgesetzter = @{
        8901 = 'Kostwein Hans'
        8902 = 'Kostwein Heinz'
        8904 = 'Schrott-Kostwein Ulrike'
        1561 = 'Kostwein Stefan'
        1597 = 'Schlagbauer Peter'
        8905 = 'Schumy Oliver'
    }

    $NoAccessUser = @{
        1603 = 'Schrott-Kostwein Philipp'
        9633 = 'Kurtak Dario'
        1501 = 'Dolzer Paul'
        1644 = 'Sibitz Dietmar'
        1594 = 'Robl Thomas'
        1650 = 'Begusch Stefan'
        1663 = 'Hafner Georg'
    }
    #>

    $ADEmployees = $Employees | Where-Object { $null -ne $_.AD } | Where-Object { <# $_.AD.Enabled -eq $True -and #> $_.employeeID -ne '6100' }

    foreach ($ADEmployee in $ADEmployees) {
        
        if ($ADEmployee.Sage.PersNr -notin $Script:Config.NoAccessUser.Keys) {

            try {
                switch ($ADEmployee) {
                    { $_.Sage.PersNr -ne '' -and $_.AD.EmployeeID -ne $_.Sage.PersNr } {
                
                        $Changed = $True

                        #TODO: EmployeeID mit Sage ID vergleichen und ändern
                        switch ($ADEmployee) {
                            { $_.AD.EmployeeID -ne $_.Sage.PersNr } {
                                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] EmployeeID: '$($ADEmployee.AD.EmployeeID)' to '$($ADEmployee.Sage.PersNr)'"
                                $ADEmployee.AD.EmployeeID = $ADEmployee.Sage.PersNr
                            }
                            { $_.AD.Personalnummer -ne $_.Sage.PersNr } {
                                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] Personalnummer: '$($ADEmployee.AD.Personalnummer)' to '$($ADEmployee.Sage.PersNr)'"
                                $ADEmployee.AD.Personalnummer = $ADEmployee.Sage.PersNr
                            }
                            default {
                                $Changed = $False
                            }
                        }
                
                    }
                    { <#$_.Sage.eMail -ne '' -and#> $null -eq $_.AD.msExchMailboxGuid } {
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] No Mailbox found. Creating new with: '$($ADEmployee.Sage.eMail)'"

                        #TODO: WhatIf nach erfolgreichem Test entfernen
                        $NewMail = New-ExchangeMailbox -User $ADEmployee #-WhatIf
                        
                        #$Changed = $True

                    }
                    { $_.Sage.Mobil -ne '' -and $_.AD.MobilePhone -ne $_.Sage.Mobil } {
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] MobilePhone: '$($ADEmployee.AD.MobilePhone)' to '$($ADEmployee.Sage.Mobil)'"
                        
                        $ADEmployee.AD.MobilePhone = $ADEmployee.Sage.Mobil
                        $Changed = $True
                    }
                    { $_.Sage.preferredLanguage -ne $_.AD.preferredLanguage } {
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] Language: '$($ADEmployee.AD.preferredLanguage)' to '$($ADEmployee.Sage.preferredLanguage)'"

                        try {
                            $ADEmployee.AD | Set-ADUser -Replace @{preferredLanguage = $($ADEmployee.Sage.preferredLanguage) }
                        }
                        catch [Microsoft.ActiveDirectory.Management.ADException] {
                            Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] NoAccess"

                            $AccessDenied += $ADEmployee
                            $NoAccess = $True
                            break
                        }
                        catch {
                            $ErrorInfo = $_
                            $ErrorMessage = $_.Exception.Message
                            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not set language AD - $($ErrorMessage)" -ExceptionInfo $ErrorInfo
                        }
                
                    }
                    { $_.Sage.Country -ne '' -and $_.AD.Country -ne $_.Sage.Country } {
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] Country: '$($ADEmployee.AD.Country)' to '$($ADEmployee.Sage.Country)'"
                    
                        $ADEmployee.AD.Country = $ADEmployee.Sage.Country
                        $Changed = $True
                    }
                    <#
                    { $_.ADGroups.ExchangeGroup -ne '' } {

                        try {
                            # Check if the user is already a member of the group
                            $isMember = '' -ne ($ADEmployee.AD.MemberOf -eq $ADEmployee.ADGroups.ExchangeGroup)
                            
                            if ($isMember -eq '') {
                                # Add the user to the group
                                Add-ADGroupMember -Identity $ADEmployee.ADGroups.ExchangeGroup -Members $ADEmployee.AD.SamAccountName
                                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully added to '$($ADEmployee.ADGroups.ExchangeGroup)'."

                                $ADGroupOnly = $True
                            }
                            else {
                                Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] is already a member of '$($ADEmployee.ADGroups.ExchangeGroup)'."
                            }
                        }
                        catch {
                            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not add user to '$($ADEmployee.ExchangeGroup)'."
                        }

                        $EmployeeExchangeGroupNames = $ADEmployee.AD.MemberOf | Where-Object { $_ -match 'OU=MFA' } | ForEach-Object {
                            $_.Split(',OU=MFA,')[0].Replace('CN=', '')
                        }
                        
                        $ExchangeADGroupsToRemove = $EmployeeExchangeGroupNames | Where-Object { $_ -ne $ADEmployee.ADGroups.ExchangeGroup }

                        if ($null -ne $ExchangeADGroupsToRemove) {

                            foreach ($ExchangeADGroupToRemove in $ExchangeADGroupsToRemove) {
                                try {
                                    Remove-ADGroupMember -Identity $ExchangeADGroupToRemove -Members $ADEmployee.AD.SamAccountName -Confirm:$false
                                    Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully removed from '$($ExchangeADGroupToRemove)'."

                                    $ADGroupOnly = $True
                                }
                                catch {
                                    Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not remove user from '$($ExchangeADGroupToRemove)'."
                                }
                            }
                        }
                        
                    }
                    { $_.Sage.ADSageGroup -ne '' } {

                        try {
                            # Check if the user is already a member of the group
                            $isMember = '' -ne ($ADEmployee.AD.MemberOf -match $ADEmployee.Sage.ADSageGroup)
                            
                            if ($isMember -eq '') {
                                # Add the user to the group
                                Add-ADGroupMember -Identity $ADEmployee.Sage.ADSageGroup -Members $ADEmployee.AD.SamAccountName
                                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully added to '$($ADEmployee.Sage.ADSageGroup)'."

                                $ADGroupOnly = $True
                            }
                            else {
                                Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] is already a member of '$($ADEmployee.Sage.ADSageGroup)'."
                            }
                        }
                        catch {
                            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not add user to '$($ADEmployee.Sage.ADSageGroup)'."
                        }

                        $EmployeeSageGroupNames = $ADEmployee.AD.MemberOf | Where-Object { $_ -match 'OU=Sage' } | ForEach-Object {
                            $_.Split(',OU=Sage,')[0].Replace('CN=', '')
                        }
                        #$EmployeeSageGroupNames = $EmployeeSageGroups.Split(',OU=Sage,')[0].Replace('CN=', '')
                        #$SageADGroupsToRemove = $Script:SageADGroupNames | Where-Object { $_ -in $EmployeeSageGroupNames -and $_ -ne $ADEmployee.Sage.ADSageGroup }
                        $SageADGroupsToRemove = $EmployeeSageGroupNames | Where-Object { $_ -in $Script:SageADGroupNames -and $_ -ne $ADEmployee.Sage.ADSageGroup }

                        if ($null -ne $SageADGroupsToRemove) {

                            foreach ($SageADGroupToRemove in $SageADGroupsToRemove) {
                                try {
                                    Remove-ADGroupMember -Identity $SageADGroupToRemove -Members $ADEmployee.AD.SamAccountName -Confirm:$false
                                    Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully removed from '$($SageADGroupToRemove)'."

                                    $ADGroupOnly = $True
                                }
                                catch {
                                    Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not remove user from '$($SageADGroupToRemove)'."
                                }
                            }
                        }
                        
                    }
                    #>
                    Default {
                        $Changed = $False
                    }
                }

                if (-not ($NoAccess)) {

                    try {
                        #TODO: WhatIf nach erfolgreichem Test entfernen
                        $GroupChanged = Get-ADGroupMembership -ADEmployee $ADEmployee #-WhatIf
                    }
                    catch {
                        $ErrorInfo = $_
                        $ErrorMessage = $_.Exception.Message
                        Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] Error: $($ErrorMessage)"
                    }

                    if ($ADEmployee.Sage.VorgesetzterID -ne '') {
                        $Vorgesetzter = $ADEmployees | Where-Object { $_.Sage.ID -eq $ADEmployee.Sage.VorgesetzterID -and $ADEmployee.Sage.PersNr -notin $Script:Config.KeinVorgesetzter.Keys }

                        if ($ADEmployee.AD.Manager -notmatch $Vorgesetzter.AD.Name) {
                            if ($Vorgesetzter) {
                                $ADEmployee.AD.Manager = $Vorgesetzter.AD.DistinguishedName
                            }
                            elseif ([System.String]::IsNullOrEmpty($Vorgesetzter)) {
                                $ADEmployee.AD.Manager = $null
                            }
                            else {
                                Write-Log -Level WARNING -Message "[$($ADEmployee.Name)] Manager: Not matching"
                            }

                            $Changed = $True
                        }
                        else {
                            Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] Manager: Correct"
                        }
                
                    }

                    if ($Changed) {

                        try {
                            Write-Log -Level INFO -Message "[$($ADEmployee.Name)] Updating AD User"

                            Set-ADUser -Instance $ADEmployee.AD
                            $Updated += $ADEmployee
                        }
                        catch [Microsoft.ActiveDirectory.Management.ADException] {
                            $ErrorInfo = $_
                            $ErrorMessage = $_.Exception.Message
                            Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] Error: $($ErrorMessage)" #-ExceptionInfo $ErrorInfo

                            $AccessDenied += $ADEmployee
                        }
                        catch {
                            $ErrorInfo = $_
                            $ErrorMessage = $_.Exception.Message
                            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not update AD User - $($ErrorMessage)" -ExceptionInfo $ErrorInfo
                        }
                        finally {
                            Write-Log -Level MESSAGE "-------------------------------------------------------------------------------------------------"
                        }

                    }
                    elseif ($GroupChanged -or $NewMail) {
                        $Updated += $ADEmployee
                        Write-Log -Level MESSAGE "-------------------------------------------------------------------------------------------------"
                    }

                }
        
            }
            catch {
                $ErrorInfo = $_
                $ErrorMessage = $_.Exception.Message
                Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
            }
            finally {
                if ($ADGroupOnly) {
                    $Updated += $ADEmployee
                    Write-Log -Level MESSAGE "-------------------------------------------------------------------------------------------------"
                }
                $ADGroupOnly = $False
                $Changed = $False
                $NoAccess = $False
                $GroupChanged = $False
                $NewMail = $False
            }

        }
        else {
            $AccessDenied += $ADEmployee
        }
    
    }
    
    Invoke-Timer -FunctionName $FunctionName

    return @{
        ChangedInAD  = $Updated
        AccessDenied = $AccessDenied
    }

}
#endregion AD Functions
################################################################################################
#region  Mail Functions
function Connect-ToExchange {
    PARAM (
        [Parameter(HelpMessage = 'http://<ServerFQDN>/powershell')]
        [system.string]$ConnectionUri = 'http://kowex01/powershell',

        [Alias('RunAs')]
        [pscredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )

    try {

        $Splatting = @{
            ConnectionUri     = $ConnectionUri
            ConfigurationName = 'microsoft.exchange'
            WarningAction     = 'SilentlyContinue'
        }

        IF ($PSBoundParameters['Credential']) { 
            $Splatting.Credential = $Credential 
        }

        # Load Exchange cmdlets (Implicit remoting)
        Import-PSSession -Session (New-PSSession @Splatting) -WarningAction SilentlyContinue -InformationAction SilentlyContinue | Out-Null

    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}

function New-ExchangeMailbox {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [PSCustomObject] $User
    )

    $SageUser = $User.Sage

    if (-not (Get-Module "tmp_*")) {
        #if (-not (Get-Command -Name Get-Mailbox -ErrorAction SilentlyContinue)) {
        Connect-ToExchange | Out-Null
    }

    $NewMail = $False

    #$OU = ($User.AD.DistinguishedName -split "$($SageUser.Vorname),")[1]
    $MailboxDB = "KOWEX_$($SageUser.Country)_DB"

    #$Mailbox = Get-Mailbox -Anr $User.Nachname
    #$Mailbox = Get-Mailbox -Identity $User.AD.DistinguishedName -ErrorAction SilentlyContinue
    $Mailbox = Get-Mailbox -Identity $User.AD.SamAccountName -ErrorAction SilentlyContinue

    if (-not($Mailbox)) {

        # Create a mailbox for the specified user
        try {
            <#
            $MailboxArgs = @{
                LinkedMasterAccount = $User.AD.DistinguishedName
                SamAccountName      = $User.AD.SamAccountName
                UserPrincipalName   = $SageUser.Email
                Alias               = $User.AD.SamAccountName #$SageUser.Email.Split('@')[0]
                Name                = $User.Name
                #DisplayName        = $User.Name
                PrimarySmtpAddress  = $SageUser.Email
                Database            = $MailboxDB
                WhatIf              = $true
            }

            New-Mailbox @MailboxArgs
            #>

            #Enable-Mailbox -Identity $User.AD.SamAccountName -Database $MailboxDB | Out-Null

            if ($PSCmdlet.ShouldProcess("Mailbox for [$($User.Name)]", "Create new mailbox")) {
                Enable-Mailbox -Identity $User.AD.SamAccountName -Database $MailboxDB | Out-Null
                #Enable-Mailbox -Identity $User.AD.SamAccountName -Database $MailboxDB -PrimarySmtpAddress $User.AD.UserPrincipalName | Out-Null
                $NewMail = $True
                $Script:NewMailbox += $User

                Write-Log -Level INFO -Message "[$($User.Name)] Mailbox created: $($SageUser.Email)."
            }
            
        }
        catch {
            Write-Log -Level ERROR -Message "[$($User.Name)] Failed to create a mailbox: $_"
        }

    }

    return #$NewMail

}

function Get-ADUserMailbox {
    [CmdletBinding()]
    param (
        [PSCustomObject] $User
    )

    if (-not (Get-Module "tmp_*")) {
        #if (-not (Get-Command -Name Get-Mailbox -ErrorAction SilentlyContinue)) {
        Connect-ToExchange
    }

    $SageUser = $User.Sage

    # Check if the user exists in AD by email and if they have a mailbox
    try {

        if ($null -ne $User.AD) {
            $ADUser = $User.AD
        }
        else {
            #$ADUser = Get-ADUser -Filter "Mail -eq '$($SageUser.Email)'" -Properties Mail, HomeMDB, msExchMailboxGuid
        }

        if ($ADUser) {
            if ($ADUser.msExchMailboxGuid) {
                #Write-Host "User $($SageUser.Name) already has a mailbox." -ForegroundColor Yellow

                try {
                    $Mailbox = Get-Mailbox -Identity $ADUser.SamAccountName -ErrorAction SilentlyContinue

                    if ($Mailbox) {
                        #Write-Host "Mailbox $($Mailbox.PrimarySmtpAddress) found." -ForegroundColor Yellow
                        return $Mailbox
                    }
                    else {
                        Write-Log -Level WARNING -Message "[$($ADUser.SamAccountName)] Mailbox not found."

                    }
                }
                catch {
                    Write-Log -Level ERROR -Message "[$($ADUser.SamAccountName)] Error checking mailbox: $_"
                }

                return $true
            }
            else {
                Write-Log -Level WARNING -Message "User $($SageUser.Name) exists but does not have a mailbox."
                return $false
            }
        }
        else {
            Write-Log -Level WARNING -Message "User $($SageUser.Name) not found in AD."
            return $null
        }
    }
    catch {
        Write-Log -Level ERROR -Message "Error checking AD user: $_"
        return $null
    }
}

function Update-MailAddressPolicy {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList] $Policies
    )

    if (-not (Get-Module "tmp_*")) {
        Connect-ToExchange | Out-Null
    }
    
    $AdressPolicies = Get-EmailAddressPolicy | Out-Null

    foreach ($Policy in $Policies) {
        $PolicyData = $AdressPolicies | Where-Object { $_.Name -match $Policy }
        if ($PolicyData) {
            Write-Log -Level INFO -Message "[$($PolicyData.Name)] Update Email Address Policy."
            Update-EmailAddressPolicy -Identity $PolicyData.Name | Out-Null
        }
    }

}

function Get-eMailStatus {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $Country,
        $AllEmployees
    )

    $InSageCountry = $AllEmployees | Where-Object { $null -ne $_.Sage -and $_.Sage.Country -eq $Country } | Sort-Object Name

    $InAD = $AllEmployees | Where-Object { $null -ne $_.AD } | Sort-Object Name
    $InADCountry = $InAD | Where-Object { $_.Sage.Country -eq $Country }

    $MissingInAD = $AllEmployees | Where-Object { $null -eq $_.AD } | Sort-Object Name
    $MissingInADCountry = $MissingInAD | Where-Object { $_.Sage.Country -eq $Country }

    $CountryEmployees = $AllEmployees | Where-Object { $_.Sage.Country -eq $Country } | Sort-Object Name
    $NoeMailAD = $InADCountry | Where-Object { $null -eq $_.AD.mail }

    $NoeMailorNotInAD = @()
    $NoeMailorNotInAD += $MissingInADCountry
    $NoeMailorNotInAD += $NoeMailAD
    
    $ADSageDiff = $InADCountry | ForEach-Object {
        if ($_.Sage.eMail -ne '' -and $null -ne $_.AD.mail) {
            if ($_.AD.mail.ToLower() -ne $_.Sage.eMail.ToLower()) {
                $_
            }
        }
    }

    [PSCustomObject]@{
        Employees        = [PSCustomObject]@{
            InSage      = $InSageCountry
            InAD        = $InADCountry
            MissingInAD = $MissingInADCountry
        }
        eMailSage        = $CountryEmployees | Where-Object { $_.Sage.eMail -ne '' }
        NoEmailSage      = $CountryEmployees | Where-Object { $_.Sage.eMail -eq '' }
        eMailAD          = $CountryEmployees | Where-Object { $null -ne $_.AD.mail }
        NoEmailAD        = $NoeMailAD #$CountryEmployees | Where-Object { $null -eq $_.AD.mail }
        NotInAD          = $MissingInADCountry
        NoeMailorNotInAD = $NoeMailorNotInAD
        ADSageDiff       = $ADSageDiff
    }
}

function Get-MailDifference {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList] $Employees
    )

    $ExchangePolicies = [System.Collections.ArrayList]::new()
    $MailDiff = $Employees | Where-Object { $_.eMailAD -notmatch $_.eMailSage -and $_.ADFoundWith -ne 'Missing' }

    if ($MailDiff.Count -gt 0) {
        Write-Log -Level INFO -Message "[$($MailDiff.Count)] Mail Unterschiede gefunden."
    
        $WrongCompany = $MailDiff | Where-Object { $_.AD.Company -ne $_.Sage.Firma }
        $OtherMismatch = $MailDiff | Where-Object { $_.AD.Company -eq $_.Sage.Firma }

        if ($WrongCompany.Count -gt 0) {
            Write-Log -Level INFO -Message "[$($WrongCompany.Count)] Firma Unterschiede gefunden."

            foreach ($User in $WrongCompany) {
                $User.AD = Set-Company -Employee $User

                if ($User.AD.Company -eq $User.Sage.Firma) {
                    $Policy = $User.Sage.Staat
                    if ($ExchangePolicies -notcontains $Policy) {
                        $ExchangePolicies += $Policy
                    }
                }
        
            }

        }

        if ($OtherMismatch.Count -gt 0) {
            Write-Log -Level INFO -Message "[$($OtherMismatch.Count)] Andere Unterschiede gefunden."
            #TODO: Unterschiede reparieren
        }

        #TODO: Fehlende Übereinstimmungs-Lösungen hinzufügen

        if ($ExchangePolicies.Count -gt 0) {
            Update-MailAddressPolicy -Policies $ExchangePolicies

            Start-Sleep -Seconds 5

            foreach ($User in $WrongCompany) {
                if ($User -eq $WrongCompany[0]) {
                    $GetADUsers = $true
                }
        
                $Mailbox = Get-ADUserMailbox -User $User
                $Employee = Update-Employee -Employee $User.Sage -GetADUsers $GetADUsers
                $Employee.Mailbox = $Mailbox | Select-Object -Property IsMailboxEnabled, EmailAdresses, PrimarySmtpAddress, WindowsEmailAddress, Database, ServerName, RecipientTypeDetails, RecipientType, WhenMailboxCreated, WhenCreated, whenChanged
            }
        }

    }
    
    
    #TODO: Employees mit geänderten Daten aktualisieren

    return

}
#endregion Mail Functions
################################################################################################
################################################################################################
#region    Other Functions
function Get-SageGroups {
    [CmdletBinding()]
    param (
        [Parameter()]
        $ParameterName
    )

    $UsedSageGroupNames = $global:SyncHash.Sage.ADGroupNames
    $ExistingSageGroups = $global:SyncHash.ObjectsCache.SageGroups.Values
    $NewSageADGroupNames = $UsedSageGroupNames | Where-Object { $ExistingSageGroups.Name -notcontains $_ }
    $NotUsedSageGroups = $ExistingSageGroups | Where-Object { $_.Name -notin $UsedSageGroupNames }

    $global:SyncHash.AD.SageGroups = [PSCustomObject]@{
        ExistingGroups   = $ExistingSageGroups
        NeededGroupNames = $UsedSageGroupNames
        ToCreate         = $NewSageADGroupNames
        Created          = @{}
        NotUsed          = $NotUsedSageGroups
    }

    return

}

function Get-SageADGroups {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )
    
    $UsedSageGroupNames = $global:SyncHash.Sage.ADGroupNames
    #$AllUsedSageGroupNames = $Employees.ADGroups.SageGroup | Sort-Object -Unique 

    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = $Script:Config.ADGroups.SageGroups.Path
    }
    
    $ExistingSageGroups = Get-ADGroup -SearchBase $ADGroupParams.Path -Filter '*'

    $NewSageADGroupNames = $UsedSageGroupNames | Where-Object { $ExistingSageGroups.Name -notcontains $_ }
    $NotUsedSageGroups = $ExistingSageGroups | Where-Object { $_.Name -notin $UsedSageGroupNames }

    $global:SyncHash.AD.SageGroups = [PSCustomObject]@{
        ExistingGroups   = $ExistingSageGroups
        NeededGroupNames = $UsedSageGroupNames
        ToCreate         = $NewSageADGroupNames
        Created          = @{}
        NotUsed          = $NotUsedSageGroups
    }

    return $ExistingSageGroups


    
    foreach ($Group in $NotUsedSageGroups) {
        $Group.Member = Get-ADGroupMember -Identity $Group.Name -ErrorAction SilentlyContinue
        #Write-Log -Level INFO -Message "Group not used: $($Group.Name)"
    }

    $EmptyNotUsedSageGroups = $NotUsedSageGroups | Where-Object { $_.Member.Count -eq 0 }


}
#endregion Other Functions

function Get-ADChanges {
    [CmdletBinding()]
    param (
        [Parameter()]
        [PSCustomObject] $Employees
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Find Differences and missing Data"
    Invoke-Timer -FunctionName $FunctionName -Description $Description

    ####################################################################################################################
    #TODO: Verwendung prüfen
    $Employees | Where-Object { $null -ne $_.AD -and $_.Sage.Nachname -ne $_.AD.Surname }

    $NameDiff = $Employees | Where-Object { $null -ne $_.AD -and $_.Sage.Vorname -ne $_.AD.GivenName }
    $NameDiff | Select-Object -Property Name, SamAccountName, GenSamAccName, @{Name = 'Vorname'; Expression = { $_.Sage.Vorname } }, @{Name = 'GivenName'; Expression = { $_.AD.GivenName } } | Out-HtmlView

    # Use SamAccountName if present, otherwise use GeneratedSamAccountName
    $AllAccountNames = $Employees | ForEach-Object { $_.SamAccountName ?? $_.GenSamAccName } | Where-Object { -not [string]::IsNullOrEmpty($_) }

    # Check for duplicates
    $Duplicates = $AllAccountNames | Group-Object | Where-Object { $_.Count -gt 1 }

    if ($Duplicates) {
        $Message = "❌ Duplicate SamAccountNames found:"
        $Duplicates | ForEach-Object { $Message = "$Message`n`t - $($_.Name) (Count: $($_.Count))" }

        Write-Log -Level WARNING -Message $Message
        #Write-Log -Level WARNING -Message "❌ Duplicate SamAccountNames found:"
        #$Duplicates | ForEach-Object { Write-Host " - $($_.Name) (Count: $($_.Count))" }
    }
    else {
        $Message = "✅ All SamAccountNames are unique."
        Write-Log -Level DEBUG -Message $Message
    }
    ####################################################################################################################

    #TODO: Einbauen
    $Employees = $global:Data.Employees.Values | Sort-Object -Property Name
    $ADEmployees = $Employees | Where-Object { $null -ne $_.AD -and $_.employeeID -notin $global:SyncHash.Config.NoAccessUser.Keys }
    $global:Data.ADEmployees = $ADEmployees
    
    $PersNr = $ADEmployees | Where-Object { $_.Sage.PersNr -ne '' -and $_.AD.Personalnummer -ne $_.Sage.PersNr }
    $ID = $ADEmployees | Where-Object { $_.Sage.ID -ne '' -and $_.AD.EmployeeID -ne $_.Sage.ID }
    $ActivateMailbox = $ADEmployees | Where-Object { $null -eq $_.AD.msExchMailboxGuid }

    $Mobile = $ADEmployees | Where-Object { $_.Sage.Mobil -ne '' -and $_.AD.MobilePhone -ne $_.Sage.Mobil }
    $Language = $ADEmployees | Where-Object { $_.Sage.preferredLanguage -ne $_.AD.preferredLanguage }
    $Country = $ADEmployees | Where-Object { $_.Sage.Country -ne '' -and $_.AD.Country -ne $_.Sage.Country }

    $VorgesetzterInSage = $ADEmployees | Where-Object { $_.Sage.VorgesetzterID -ne '' -and $_.Sage.PersNr -notin $Script:Config.KeinVorgesetzter.Keys }
    $DifferentVorgesetzter = $VorgesetzterInSage | Where-Object {
        $VorgesetzterID = $_.Sage.VorgesetzterID
        $Vorgesetzter = $Employees | Where-Object { $_.Sage.ID -eq $VorgesetzterID }
        $_.AD.Manager -ne $Vorgesetzter.AD.DistinguishedName
    }
    
    $AddMemberToSageGroup = $ADEmployees | Where-Object { -not [string]::IsNullOrEmpty($_.SageGroups.Add) }
    $RemoveMemberFromSageGroup = $ADEmployees | Where-Object { -not [string]::IsNullOrEmpty($_.SageGroups.Remove) }
    $SageMembership = $ADEmployees | Where-Object { $_ -in $AddMemberToSageGroup -or $_ -in $RemoveMemberFromSageGroup }

    $ADChanges = @{
        ADEmployees               = $ADEmployees
        PersNr                    = $PersNr
        ID                        = $ID
        ActivateMailbox           = $ActivateMailbox
        Mobile                    = $Mobile
        Language                  = $Language
        Country                   = $Country
        DifferentVorgesetzter     = $DifferentVorgesetzter
        NewSageADGroups           = $global:SyncHash.AD.SageGroups.ToCreate
        AddMemberToSageGroup      = $AddMemberToSageGroup
        RemoveMemberFromSageGroup = $RemoveMemberFromSageGroup
        SageMembership            = $SageMembership
    }

    $global:SyncHash.ADChanges = $ADChanges

    #TODO: ADChangeManagement per Employee

    Invoke-Timer -FunctionName $FunctionName

    return
}

function Set-ADChanges {
    [CmdletBinding()]
    param (
        
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Set/Create needed data in AD"
    Invoke-Timer -FunctionName $FunctionName -Description $Description

    #region    Create Sage ADGroups
    $NewSageADGroups = $global:SyncHash.ADChanges.NewSageADGroups

    if ($NewSageADGroups.Count -gt 0) {
        #Write-Log -Level INFO -Message "[$($NewSageADGroups.Count)] Neue Sage AD Gruppen gefunden."
        New-SageADGroups -NewSageADGroupNames $NewSageADGroups
    }
    #endregion Create Sage ADGroups

    #region    Activate Exchange Mailbox
    $ActivateMailbox = $global:SyncHash.ADChanges.ActivateMailbox

    if ($ActivateMailbox.Count -gt 0) {
        $ActivateMailbox | ForEach-Object {
            New-ExchangeMailbox -User $_ | Out-Null
            $_.Changes.ActivateMailbox = $true
        }
        #$NewMail = New-ExchangeMailbox -User $ADEmployee
    }
    #region    Activate Exchange Mailbox

    #region    Process Sage ADGroupMemberships
    Sync-ADGroupMembership

    #TODO: ChangeManagement testen und verbessern/erweitern
    <#
    $SageMembership = $global:SyncHash.ADChanges.SageMembership

    $AddMemberToSageGroup = $global:SyncHash.ADChanges.AddMemberToSageGroup
    if ($AddMemberToSageGroup.Count -gt 0) {
        #Write-Log -Level INFO -Message "[$($AddMemberToSageGroup.Count)] Sage Gruppen Mitgliedschaften hinzufügen."
        $EmployeesAddedToSageGroup = Sync-ADGroupMembership -Employees $AddMemberToSageGroup -Attribute 'AddToGroup'
    }

    $RemoveMemberFromSageGroup = $global:SyncHash.ADChanges.RemoveMemberFromSageGroup
    if ($RemoveMemberFromSageGroup.Count -gt 0) {
        $EmployeesRemovedFromSageGroups = Sync-ADGroupMembership -Employees $RemoveMemberFromSageGroup -Attribute 'RemoveFromGroup'
    }
    #>
    #endregion Process Sage ADGroupMemberships

    Invoke-Timer -FunctionName $FunctionName

    Start-Sleep -Seconds 1
}

function Set-ChangesStatus {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $Attribute,
        [Parameter()]
        [string] $Action,
        [Parameter()]
        [string] $OldValue,
        [Parameter()]
        [string] $NewValue,
        [Parameter()]
        [string] $Status
    )

    $Change = [PSCustomObject]@{
        Attribute = $Attribute
        Action    = $Action
        OldValue  = $OldValue
        NewValue  = $NewValue
        Status    = $Status
    }

    return $Change
}

function Sync-ADGroupMembership {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [System.Collections.ArrayList] $Employees,
        [Parameter(Mandatory)]
        [string] $Attribute
    )

    $ActionParams = @{
        Attribute = $Attribute
        Action    = 'SageGroup'
        OldValue  = ''
        NewValue  = ''
        Status    = 'failed'
    }

    $ActionParams.Attribute = 'AddToGroup'
    foreach ($Employee in $global:SyncHash.Employees.Values | Where-Object { -not [string]::IsNullOrEmpty($_.SageGroups.Add) }) {
        $SageGroup = $Employee.SageGroups.Add.Split(',')[0].Replace('CN=', '')
        $ActionParams.NewValue = $SageGroup
        
        try {
            if ($PSCmdlet.ShouldProcess("Adding [$($ADEmployee.Name)] to group '$SageGroup'", "Adding to AD group")) {
                Add-ADGroupMember -Identity $SageGroup -Members $Employee.AD.SamAccountName
            }
                    
            $ActionParams.Status = 'Success'
        }
        catch {
            $ErrorMessage = $_.Exception.Message
            Write-Log -Level ERROR -Message "[$($Employee.Name)] Error: Could not add user to '$($SageGroup)'."
            $ActionParams.Status = "Error: $ErrorMessage"
        }
        finally {
            $Employee.Changes.Add($ActionParams.Action, (Set-ChangesStatus @ActionParams))
        }
        
    }

    $ActionParams.Attribute = 'RemoveFromGroup'
    foreach ($Employee in $global:SyncHash.Employees.Values | Where-Object { -not [string]::IsNullOrEmpty($_.SageGroups.Remove) }) {
        foreach ($SageGroup in $Employee.SageGroups.Remove) {
            $GroupName = $SageGroup.Split(',')[0].Replace('CN=', '')
            $ActionParams.OldValue = $GroupName

            try {
                if ($PSCmdlet.ShouldProcess("Removing [$($Employee.Name)] from group '$GroupName'", "Remove from AD group")) {
                    Remove-ADGroupMember -Identity $GroupName -Members $Employee.AD.SamAccountName -Confirm:$false
                }
            
                $ActionParams.Status = 'Success'
            }
            catch {
                $ErrorMessage = $_.Exception.Message
                Write-Log -Level ERROR -Message "[$($Employee.Name)] Error: Could not remove user from '$($SageGroup)'. $ErrorMessage"
                $ActionParams.Status = "Error: $ErrorMessage"
            }
            finally {
                #TODO: Changes für mehrere entfernte Gruppen erstellen
                #$Employee.Changes.Add($ActionParams.Action, (Set-ChangesStatus @ActionParams))
            }

        }
        
        $Employee.Changes.Add($ActionParams.Action, (Set-ChangesStatus @ActionParams))
    }
    
    #return $Employees
}

#endregion Functions


#region    Main
function Export-SageADData {
    [CmdletBinding()]
    param (
        [Parameter()]
        [switch] $EmployeeData = $false
    )

    $ExportFile = Join-Path -Path $Script:ExportsPath -ChildPath 'Employees.csv'
    $ExportCSV = $global:SyncHash.Employees.Values | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, @{Name = "ADGroup"; Expression = { $_.ADGroups.SageGroup } }, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } }
    $ExportCSV | Export-Csv -Path $ExportFile -NoTypeInformation -Encoding utf8 -Delimiter ';'

}

function Start-RunspaceTask {
    [CmdletBinding()]
    param (
        [string] $RunspaceName,
        [string] $FunctionName,
        [string] $Message,
        [scriptblock] $ScriptBlock
    )

    if (-not $global:SyncHash) {
        Write-Error "Global SyncHash is not initialized."
        return
    }

    # Create a new PowerShell instance
    $PowerShellInstance = [PowerShell]::Create()
    #$PowerShellInstance.AddScript($ScriptBlock).AddArgument($global:SyncHash).AddArgument($RunspaceName).AddArgument($FunctionName)
    $PowerShellInstance.AddScript($ScriptBlock).AddArgument($RunspaceName).AddArgument($FunctionName).AddArgument($Message)
    
    # Assign to the shared RunspacePool
    $PowerShellInstance.RunspacePool = $global:SyncHash.Runspace.RunspacePool

    # Create a temporary object to track jobs
    $Temp = [PSCustomObject]@{
        Name         = $RunspaceName
        FunctionName = $FunctionName
        Message      = $Message
        PowerShell   = $PowerShellInstance
        Runspace     = $PowerShellInstance.BeginInvoke()
        Errors       = $PowerShellInstance.Streams.Error
        LogBody      = @{}
    }
    
    # Store the job in the SyncHash
    $global:SyncHash.Runspace.Jobs.Add($Temp) | Out-Null
    
    $Message = "Runspace Task '$RunspaceName' started successfully."
    Write-Log -Level DEBUG -Message $Message
}

function Get-AllADUsers {
    [CmdletBinding()]
    param (
        [Parameter()]
        $SyncHash
    )
    
    $TaskArgs = @{
        FunctionName = $MyInvocation.MyCommand.Name
        RunspaceName = 'GetAllADUsers'
        Message      = "Get User Accounts from AD"
        ScriptBlock  = {
            param (
                $RunspaceName,
                $FunctionName,
                $Message
            )
        
            $SyncHash.Timer::GetTimer($FunctionName, $Message)
        
            Get-ADData -ADUsers
        
            $SyncHash.Timer::GetTimer($FunctionName, $Message)
        
        }
    }
    
    Start-RunspaceTask @TaskArgs
}

function Get-AllADGroups {
    [CmdletBinding()]
    param (
        [Parameter()]
        $SyncHash
    )
    
    $TaskArgs = @{
        FunctionName = $MyInvocation.MyCommand.Name
        RunspaceName = 'GetAllADGroups'
        Message      = "Get Groups from AD"
        ScriptBlock  = {
            param (
                $RunspaceName,
                $FunctionName,
                $Message
            )
        
            $SyncHash.Timer::GetTimer($FunctionName, $Message)
        
            Get-ADData -ADGroups
        
            $SyncHash.Timer::GetTimer($FunctionName, $Message)
        
        }
    }

    Start-RunspaceTask @TaskArgs
}

function Import-SageData {
    [CmdletBinding()]
    param (
        [Parameter()]
        $SyncHash
    )

    $TaskArgs = @{
        FunctionName = $MyInvocation.MyCommand.Name
        RunspaceName = "ImportSageData"
        Message      = "Import Employees from Sage"

        ScriptBlock  = {
            param (
                #$SyncHash,
                $RunspaceName,
                $FunctionName,
                $Message
            )
        
            $SyncHash.Timer::GetTimer($FunctionName, $Message)
    
            $SyncHash.Sage.DataRaw = Get-Content -Path $SyncHash.Config.Paths.SageCSVFile -Raw -Encoding ansi | ConvertFrom-Csv -Delimiter ';'
            Get-NameExtraction -csvData $SyncHash.Sage.DataRaw | Where-Object { $_.Kostenstelle -notin @('10099', '10098') -and $_.'Pers.Nr.' -ne '6100' }
    
            $SyncHash.Timer::GetTimer($FunctionName, $Message)
        }
    }

    Start-RunspaceTask @TaskArgs
}

function Wait-Runspace {
    param (
        [Parameter(Mandatory)]
        [System.Collections.ArrayList]$Runspaces
    )
    foreach ($Runspace in $Runspaces) {
        while (-not $Runspace.Runspace.IsCompleted) {
            Start-Sleep -Milliseconds 200
        }
    }
}

function Get-BaseData {
    [CmdletBinding()]
    param (
        [Parameter()]
        $ParameterName
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Message = "Getting BaseData in parallel"
    #[Timer]::GetTimer($FunctionName, $Message)
    $SyncHash.Timer::GetTimer($FunctionName, $Message)
    
    try {
        #TODO: Logging in Runspace und Error Handling
        Get-AllADUsers
        Import-SageData
        Get-AllADGroups

        # Erstelle eine Liste für die WaitHandles
        #$WaitHandles = @()
        $Jobs = $global:SyncHash.Runspace.Jobs
        Wait-Runspace -Runspaces $Jobs
        #foreach ($Job in $Jobs) {
        #$WaitHandles += $Job.Runspace.AsyncWaitHandle
        #    $Job.Runspace.AsyncWaitHandle.WaitOne()
        #}

        # Warte, bis alle Runspaces abgeschlossen sind
        #[System.Threading.WaitHandle]::WaitAll($WaitHandles)

        # Überprüfe jeden Job auf Errors
        foreach ($Job in $Jobs) {
            # Beende die Ausführung des Runspaces
            $Job.PowerShell.EndInvoke($Job.Runspace)

            # Prüfe, ob Fehler aufgetreten sind
            if ($Job.Errors.Count -gt 0) {
                Write-Log -Level ERROR -Message "[$($Job.Errors.Count)] Fehler im Task '$($Job.Name)':"

                foreach ($Err in $Job.Errors) {
                    #Write-Host $Error.ToString() -ForegroundColor Yellow
                    $ErrorMessage = "[$($Job.Name)] Error: $($Err.Exception.Message)"
                    Write-Log -Level WARNING -Message $ErrorMessage -ExceptionInfo $Err
                }
            }
            else {
                $SyncHash.Timer::GetTimer($Job.FunctionName, $Job.Message)
                #$SyncHash.Timer::GetTimer($Job.FunctionName, $Job.Message, $Job.LogBody)
                #Write-Log -Level INFO -Message "Task '$($Job.Name)' erfolgreich abgeschlossen." -LogBody $Job.LogBody
            }
    
            # Bereinige den PowerShell-Runspace
            $Job.PowerShell.Dispose()
        }
        
    }
    catch {
        $Err = $_
        $ErrorMessage = $Err.Exception.Message
        $ErrorType = ($Err.GetType().FullName -Split ('.'))[-1]
        #$SyncHash.Logger.Log('ERROR', "Error in $FunctionName")
        Write-Log -Level ERROR -Message "[$ErrorType] $ErrorMessage"
    }
    
    #[Timer]::GetTimer($FunctionName, $Message)
    $SyncHash.Timer::GetTimer($FunctionName, $Message)
}

function Sync-Sage {
    [CmdletBinding()]
    param (
        [Parameter()]
        [switch] $GetMailDifferences = $false,
        [switch] $ShowEmployees = $false
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Sage to AD Sync"
    #Invoke-Timer -FunctionName $FunctionName -Description $Description
    #[Timer]::GetTimer($FunctionName, $Description)
    $SyncHash.Timer::GetTimer($FunctionName, $Description)

    $Austrittsgrenze = Get-Date -Date '01.03.2025'

    try {
        
        Get-BaseData
        $Employees = Start-SageDataProcess -Austrittsgrenze $Austrittsgrenze

        Export-SageADData -EmployeeData

        if ($ShowEmployees) {
            Show-Employees -Employees $Employees
        }

        if ($GetMailDifferences) {
            Get-MailDifference -Employees $Employees
        }
        
        $EmployeesToSync = $Employees #| Where-Object { $_.Sage.Country -eq 'HR' }

        Get-ADChanges -Employees $EmployeesToSync
        Set-ADChanges
        
        $global:SyncHash | Export-Clixml -Path ([System.IO.Path]::Combine([PathsManager]::GetScriptPath('Export'), 'SyncHash.xml'))
        $global:Data | Export-Clixml -Path ([System.IO.Path]::Combine([PathsManager]::GetScriptPath('Export'), 'Data.xml'))
        
    }
    catch {
        $ErrorInfo = $_
        $ErrorMessage = $_.Exception.Message
        Write-Log -Level ERROR -Message "Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
    }
    
    #Invoke-Timer -FunctionName $FunctionName
    #[Timer]::GetTimer($FunctionName, $Description)
    $SyncHash.Timer::GetTimer($FunctionName, $Description)

    return $ADSync
}

function Set-Runspace {

    #region    Sync - Runspace
    $global:SyncHash.Runspace = [hashtable]::Synchronized(@{})
    $global:SyncHash.Runspace.ThreadId = [System.Threading.Thread]::CurrentThread.ManagedThreadId
    $Global:SyncHash.Runspace.Jobs = [System.Collections.ArrayList]::Synchronized([Collections.ArrayList]::new())

    $global:SyncHash.Runspace | Add-Member -MemberType ScriptMethod -Name GetFunctions -Value { 
        $Global:SyncHash.Runspace.Functions = $global:SyncHash.Config.Imports.Functions | ForEach-Object { 
            Get-FunctionsFromScript $_
        }
    }

    $global:SyncHash.Runspace | Add-Member -MemberType ScriptMethod -Name NewPool -Value {
        $this.Modules = $global:SyncHash.Config.Imports.Names.Modules
        $global:SyncHash.Runspace.GetFunctions()
        $this.Pool = New-RunspacePool -Functions $this.Functions -Modules $this.Modules -Variables "SyncHash" -MTA
        #$this.Add('Runspaces', $Global:Runspaces)
    }

    $global:SyncHash.Runspace.NewPool()
    $global:SyncHash.Runspace.Runspaces = $Global:Runspaces
    $global:SyncHash.Errors = $global:SyncHash.Runspace.Runspaces.Runspace.Streams.Error

    $ISS = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
    $ISS.Variables.Add(
        ([System.Management.Automation.Runspaces.SessionStateVariableEntry]::new('SyncHash', $global:SyncHash, $null))
    )
    $ISS.Variables.Add(
        ([System.Management.Automation.Runspaces.SessionStateVariableEntry]::new('Data', $global:Data, $null))
    )
    
    foreach ($Module in $global:SyncHash.Runspace.Modules) {

        try {
            $ISS.ImportPSModule($Module) | Out-Null
            Write-Verbose "Imported $Module to Initial Session State"
        }
        catch {
            Write-Warning $_.Exception.Message
        }
    }
    
    foreach ($Script in $global:SyncHash.Config.Imports.Classes) {
        try {
            $ISS.ImportPSModulesFromPath($Script) | Out-Null
            Write-Verbose "Imported $Script to Initial Session State"
        }
        catch {
            Write-Warning $_.Exception.Message
        }
    }
    
    foreach ($Func in $global:SyncHash.Runspace.Functions) {

        try {
            $thisFunction = Get-Item -LiteralPath "function:$func"
            [String]$functionName = $thisFunction.Name
            [ScriptBlock]$functionCode = $thisFunction.ScriptBlock

            $ISS.Commands.Add([System.Management.Automation.Runspaces.SessionStateFunctionEntry]::new($FunctionName, $FunctionCode))
            
            Write-Verbose "Imported $func to Initial Session State"
            Remove-Variable thisFunction, functionName, functionCode
        }
        catch {
            Write-Warning $_.Exception.Message
        }
    }

    $RunspacePool = [System.Management.Automation.Runspaces.RunspaceFactory]::CreateRunspacePool(1, 10, $ISS, $Host)
    $RunspacePool.ApartmentState = 'MTA'
    $RunspacePool.ThreadOptions = 'ReuseThread'
    $RunspacePool.Open()

    $global:SyncHash.Runspace.RunspacePool = $RunspacePool
}


$global:SyncHash.Logger = [Logger]::GetInstance()
$global:SyncHash.Timer = [Timer]::GetInstance()

$Description = 'Main Script'
#[Timer]::GetTimer($ScriptName, $Description)
$SyncHash.Timer::GetTimer($ScriptName, $Description)
#$global:SyncHash.Timer = [Timer]::new()

#$global:SyncHash.TimerCollection = $global:MyTimerCollection

#TODO: Nur physische Mitarbeiter haben den Pager: P
#TODO: ADM User bekommen Pager: R

try {
    Set-Runspace
    Sync-Sage -GetMailDifferences
}
catch {
    $ErrorInfo = $_
    $ErrorMessage = $_.Exception.Message
    $ErrorType = ($ErrorInfo.Exception.GetType().FullName -split ('.'))[-1]
    Write-Log -Level ERROR -Message "[$ErrorType] Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
}

#Invoke-Timer -FunctionName $ScriptName
#[Timer]::GetTimer($ScriptName, $Description)
$SyncHash.Timer::GetTimer($ScriptName, $Description)
