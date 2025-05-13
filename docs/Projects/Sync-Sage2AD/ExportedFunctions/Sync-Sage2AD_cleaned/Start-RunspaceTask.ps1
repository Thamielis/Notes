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
