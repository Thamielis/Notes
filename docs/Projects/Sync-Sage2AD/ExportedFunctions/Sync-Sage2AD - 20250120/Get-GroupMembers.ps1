function Get-GroupMembers {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $GroupName,
        [string] $GroupFilter,
        [string] $Country,
        [switch] $IsMember = $false
    )

    $AllAD = Get-AllADUsers
    if ($Country) {
        $AllAD = $AllAD | Where-Object { $_.Country -eq $Country }
    }

    if ($GroupName) {
        $ADGroup = Get-ADGroup -Identity $GroupName
    }
    elseif ($GroupFilter) {
        $ADGroup = Get-ADGroup -Filter { Name -like $GroupFilter }
    }
    else {
        Write-Log -Level WARNING -Message "No valid GroupName or GroupFilter provided."
    }
    
    $GroupMembers = $ADGroup | ForEach-Object {
        Get-ADGroupMember -Identity $_ -Recursive |
            Where-Object { $_.objectClass -eq 'user' }
        } | Select-Object -ExpandProperty SamAccountName -Unique

    if ($IsMember) {
        $GroupMembers = $AllAD | Where-Object { $GroupMembers -contains $_.SamAccountName }
    }
    else {
        $GroupMembers = $AllAD | Where-Object { $GroupMembers -notcontains $_.SamAccountName }
    }

    return $GroupMembers

    #$NoAtMailArchiv = Get-GroupMembers -GroupFilter 'MailArchiv*AT*' -Country 'AT'
}
