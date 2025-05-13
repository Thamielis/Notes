function Get-SageADGroups {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )

    $AllUsedSageGroupNames = $Employees.ADGroups.SageGroup | Sort-Object -Unique 

    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = 'OU=Sage,OU=Gruppen,OU=Allgemein,OU=Kostwein Gruppe,DC=kostweingroup,DC=intern'
    }
    
    $AllSageGroups = Get-ADGroup -SearchBase $ADGroupParams.Path -Filter '*'

    $NotUsedSageGroups = $AllSageGroups | Where-Object { $_.Name -notin $AllUsedSageGroupNames }
    foreach ($Group in $NotUsedSageGroups) {
        $Group.Member = Get-ADGroupMember -Identity $Group.Name -ErrorAction SilentlyContinue
        #Write-Log -Level INFO -Message "Group not used: $($Group.Name)"
    }

    $EmptyNotUsedSageGroups = $NotUsedSageGroups | Where-Object { $_.Member.Count -eq 0 }


}
