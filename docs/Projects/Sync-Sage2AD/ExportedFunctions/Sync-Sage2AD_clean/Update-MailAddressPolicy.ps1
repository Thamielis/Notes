function Update-MailAddressPolicy {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList] $Policies
    )

    if (-not (Get-Module "tmp_*")) {
        Connect-ToExchange | Out-Null
    }
    
    $AdressPolicies = Get-EmailAddressPolicy | Out-Null

    foreach ($Policy in $Policies) {
        $PolicyData = $AdressPolicies | Where-Object { $_.Name -match $Policy }
        if ($PolicyData) {
            Write-Log -Level INFO -Message "[$($PolicyData.Name)] Update Email Address Policy."
            Update-EmailAddressPolicy -Identity $PolicyData.Name | Out-Null
        }
    }

}
