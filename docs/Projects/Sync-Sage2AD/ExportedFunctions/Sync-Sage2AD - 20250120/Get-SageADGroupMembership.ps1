function Get-SageADGroupMembership {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter()]
        [PSCustomObject] $Employee
    )
    
    if (-not [string]::IsNullOrEmpty($Employee.SageGroups.Add)) {
        $SageGroup = $Employee.SageGroups.Add.Split(',')[0].Replace('CN=', '')
        
        try {
            if ($PSCmdlet.ShouldProcess("Adding [$($ADEmployee.Name)] to group '$SageGroup'", "Adding to AD group")) {
                Add-ADGroupMember -Identity $SageGroup -Members $Employee.AD.SamAccountName
            }
            
        }
        catch {
            $ErrorMessage = $_.Exception.Message
            Write-Log -Level ERROR -Message "[$($Employee.Name)] Error: Could not add user to '$($SageGroup)'."
        }
    }

    if (-not [string]::IsNullOrEmpty($Employee.SageGroups.Remove)) {
        foreach ($SageGroup in $Employee.SageGroups.Remove) {
            $GroupName = $SageGroup.Split(',')[0].Replace('CN=', '')
            
            try {
                if ($PSCmdlet.ShouldProcess("Removing [$($Employee.Name)] from group '$GroupName'", "Remove from AD group")) {
                    Remove-ADGroupMember -Identity $GroupName -Members $Employee.AD.SamAccountName -Confirm:$false
                    Write-Log -Level INFO -Message "Removing [$($Employee.Name)] from group '$GroupName'"
                }
            }
            catch {
                $ErrorMessage = $_.Exception.Message
                Write-Log -Level ERROR -Message "[$($Employee.Name)] Error: Could not remove user from '$($SageGroup)'. $ErrorMessage"
            }
            
        }
    }
}
