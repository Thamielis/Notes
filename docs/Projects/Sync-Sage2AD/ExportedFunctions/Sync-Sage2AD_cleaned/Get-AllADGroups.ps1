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
