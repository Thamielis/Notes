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
