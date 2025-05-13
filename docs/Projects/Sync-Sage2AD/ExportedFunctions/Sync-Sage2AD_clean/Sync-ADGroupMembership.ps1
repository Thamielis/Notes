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
