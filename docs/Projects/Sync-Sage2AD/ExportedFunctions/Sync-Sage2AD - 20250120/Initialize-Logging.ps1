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

    $LogName = $(($Script:ScriptName -split '\.')[0])
    $LogFileName = "$($LogName)_$((Get-Date -Format 'yyyy.MM.dd').ToString()).log"
    $FullLogFilePath = Join-Path -Path $Script:LogsPath -ChildPath $LogFileName

    
    if ($DefaultLogLevel -eq 'DEBUG') {
        $Script:LogPattern = '[%{pid}] [%{lineno:-4}] [%{level:-7}] [%{caller}] %{message}'
    }
    else {
        $Script:LogPattern = '[%{lineno:-4}] [%{level:-7}] %{message}'
    }

    $Script:LogConsolePattern = '[%{timestamp:+%T:8}] ' + $Script:LogPattern
    $Script:LogFilePattern = '[%{timestamp}] ' + $Script:LogPattern
    $Script:ResultLogFormat = '[%{timestamp:+%T:8}] [%{level:-7}] %{message}'

    Add-LoggingLevel -LevelName 'RUNNING' -Level 50
    Add-LoggingLevel -LevelName 'RESULT' -Level 60
    Add-LoggingLevel -LevelName 'TIME' -Level 70
    Add-LoggingLevel -LevelName 'MESSAGE' -Level 80
    Add-LoggingLevel -LevelName 'GF' -Level 85

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

    Add-LoggingTarget -Name File -Configuration @{
        Path           = $FullLogFilePath    # <Required> Sets the file destination (eg. 'C:\Temp\%{+%Y%m%d}.log')
        PrintBody      = $false              # <Not required> Prints body message too
        PrintException = $true               # <Not required> Prints stacktrace
        Append         = $true               # <Not required> Append to log file
        Format         = $Script:LogFilePattern            # <Not required> Sets the logging format for this target
    }
    
    Write-Log -Level DEBUG -Message 'Logging Module configured'
}
