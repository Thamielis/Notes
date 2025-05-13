function Get-SageADGroups {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )
    
    $UsedSageGroupNames = $global:SyncHash.Sage.ADGroupNames
    #$AllUsedSageGroupNames = $Employees.ADGroups.SageGroup | Sort-Object -Unique 

    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = $Script:Config.ADGroups.SageGroups.Path
    }
    
    $ExistingSageGroups = Get-ADGroup -SearchBase $ADGroupParams.Path -Filter '*'

    $NewSageADGroupNames = $UsedSageGroupNames | Where-Object { $ExistingSageGroups.Name -notcontains $_ }
    $NotUsedSageGroups = $ExistingSageGroups | Where-Object { $_.Name -notin $UsedSageGroupNames }

    $global:SyncHash.AD.SageGroups = [PSCustomObject]@{
        ExistingGroups   = $ExistingSageGroups
        NeededGroupNames = $UsedSageGroupNames
        ToCreate         = $NewSageADGroupNames
        Created          = @{}
        NotUsed          = $NotUsedSageGroups
    }

    return $ExistingSageGroups


    
    foreach ($Group in $NotUsedSageGroups) {
        $Group.Member = Get-ADGroupMember -Identity $Group.Name -ErrorAction SilentlyContinue
        #Write-Log -Level INFO -Message "Group not used: $($Group.Name)"
    }

    $EmptyNotUsedSageGroups = $NotUsedSageGroups | Where-Object { $_.Member.Count -eq 0 }


}
