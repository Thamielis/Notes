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
