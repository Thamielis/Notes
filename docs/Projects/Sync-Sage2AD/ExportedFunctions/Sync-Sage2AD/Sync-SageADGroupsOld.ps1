function Sync-SageADGroupsOld {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )

    Write-Log -Level INFO -Message "Checking/Creating Sage AD Groups"

    $NewSageADGroups = [System.Collections.ArrayList]::new()

    $MissingSageADGroups = $SageADGroupNames | Where-Object { 
        !(Get-ADGroup -Filter { Name -eq $_ } -ErrorAction SilentlyContinue) 
    }

    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = 'OU=Sage,OU=Gruppen,OU=Allgemein,OU=Kostwein Gruppe,DC=kostweingroup,DC=intern'
    }

    foreach ($MissingGroup in $MissingSageADGroups) {
        if ($PSCmdlet.ShouldProcess("AD Group $MissingGroup", "Create")) {
            try {
                $ADGroupParams.Name = $MissingGroup
                New-ADGroup @ADGroupParams

                Write-Log -Level INFO -Message "Successfully created AD Group: $MissingGroup"
                $NewSageADGroups.Add($MissingGroup)
            }
            catch {
                Write-Log -Level ERROR -Message "Failed to create AD Group: $MissingGroup" -ExceptionInfo $_
            }
        }
    }

    return $NewSageADGroups
}
