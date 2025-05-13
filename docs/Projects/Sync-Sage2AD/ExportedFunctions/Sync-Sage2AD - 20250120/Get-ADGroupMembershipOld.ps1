function Get-ADGroupMembershipOld {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter()]
        [PSCustomObject] $ADEmployee
    )

    $ADGroupsToRemove = [System.Collections.ArrayList]::new()

    $ADGroupOUs = @{
        ExchangeGroup = 'MFA'
        MailArchiv    = "MailArchiv"
        OutOfOffice   = "OutOfOffice"
        SageGroup     = 'Sage'
    }
    
    foreach ($Group in $ADEmployee.ADGroups.Keys) {

        $GroupName = $ADEmployee.ADGroups.$Group
        $ADGroup = (Get-ADGroup -Identity $GroupName).DistinguishedName

        try {
            if ($ADEmployee.AD.MemberOf -notcontains $ADGroup) {
                
                Add-ADGroupMember -Identity $GroupName -Members $ADEmployee.AD.SamAccountName
                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully added to '$($GroupName)'."
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
        $EmployeeGroupNames = $ADEmployee.AD.MemberOf | Where-Object { $_ -match $GroupOU -and $_ -ne $ADGroup }
        foreach ($Group in $EmployeeGroupNames) {
            $ADGroupsToRemove += $Group.Split(',')[0].Replace('CN=', '')
        }
        
        #TODO: Logic für Gruppenmitgliedschaft testen!

        <#
        try {
            # Check if the user is already a member of the group
            $isMember = '' -ne ($ADEmployee.AD.MemberOf -match $GroupName)
            
            if ($isMember -eq '') {
                # Add the user to the group
                #                Add-ADGroupMember -Identity $GroupName -Members $ADEmployee.AD.SamAccountName
                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully added to '$($GroupName)'."
                
            }
            else {
                Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] is already a member of '$($GroupName)'."
            }
        }
        catch {
            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not add user to '$($GroupName)'."
        }

        $GroupOU = "OU=$($ADGroupOUs.$Group)"
        $EmployeeGroupNames = $ADEmployee.AD.MemberOf | Where-Object { $_ -match $GroupOU } | ForEach-Object {
            $_.Split(",$GroupOU,")[0].Replace('CN=', '')
        }
        
        $ADGroupsToRemove += $EmployeeGroupNames | Where-Object { $_ -ne $GroupName }
        #>
    }

    if ($null -ne $ADGroupsToRemove) {

        foreach ($ADGroupToRemove in $ADGroupsToRemove) {
            try {
                Remove-ADGroupMember -Identity $ADGroupToRemove -Members $ADEmployee.AD.SamAccountName -Confirm:$false
                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully removed from '$($ADGroupToRemove)'."
                    
            }
            catch {
                Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not remove user from '$($ADGroupToRemove)'."
            }
        }
    }

}
