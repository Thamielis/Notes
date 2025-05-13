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
