function Invoke-Timer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $FunctionName,
        [Parameter()]
        [string] $Description
    )

    if (-not ($Script:Runtimes[$FunctionName])) {
        $Script:Runtimes[$FunctionName] = Start-MyTimer -Name $FunctionName -Description $Description
        Write-Log -Level TIME -Message "[$FunctionName] $Description"
    }
    elseif ($Script:Runtimes[$FunctionName].Status -eq 'Running') {
        Stop-MyTimer -Name $FunctionName
        $Duration = "{0:D2}:{1:D2} min" -f $Script:Runtimes.$FunctionName.Duration.Minutes, $Script:Runtimes.$FunctionName.Duration.Seconds
        Write-Log -Level TIME -Message "[$FunctionName] Runtime: $Duration"
    }

    #$FunctionName = $MyInvocation.MyCommand.Name
    #$Description = "Processing Sage UserData and find AD Account [$($SageData.Count)]"
    #$Script:Runtimes[$FunctionName] = Start-MyTimer -Name $FunctionName -Description $Description
    #Write-Log -Level INFO -Message $Description

    #Stop-MyTimer -Name $FunctionName
    #$Duration = "{0:D2}:{1:D2} min" -f $Script:Runtimes.$FunctionName.Duration.Minutes, $Script:Runtimes.$FunctionName.Duration.Seconds
    #Write-Log -Level INFO -Message "[$FunctionName] Runtime: $Duration"
}
