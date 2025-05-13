function Get-SageGroups {
    [CmdletBinding()]
    param (
        [Parameter()]
        $ParameterName
    )

    $UsedSageGroupNames = $global:SyncHash.Sage.ADGroupNames
    $ExistingSageGroups = $global:SyncHash.ObjectsCache.SageGroups.Values
    $NewSageADGroupNames = $UsedSageGroupNames | Where-Object { $ExistingSageGroups.Name -notcontains $_ }
    $NotUsedSageGroups = $ExistingSageGroups | Where-Object { $_.Name -notin $UsedSageGroupNames }

    $global:SyncHash.AD.SageGroups = [PSCustomObject]@{
        ExistingGroups   = $ExistingSageGroups
        NeededGroupNames = $UsedSageGroupNames
        ToCreate         = $NewSageADGroupNames
        Created          = @{}
        NotUsed          = $NotUsedSageGroups
    }

    return

}
