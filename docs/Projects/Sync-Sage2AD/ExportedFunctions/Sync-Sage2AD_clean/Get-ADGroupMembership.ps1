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
