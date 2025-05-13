function Get-ExchangeData {

    $EmailAdressPolicies = [System.Collections.ArrayList]::new()

    $AdressPolicies = Get-EmailAddressPolicy

    foreach ($Policy in $AdressPolicies) {
        $PolicyData = [PSCustomObject]@{
            Name            = $Policy.Name
            RecipientFilter = $Policy.RecipientFilter
            Recipients      = Get-Recipient -RecipientPreviewFilter $Policy.RecipientFilter | Where-Object { $_.Name -in $Employees.Name }
        }

        $EmailAdressPolicies.Add($PolicyData)
    }


    #$Policy = Get-EmailAddressPolicy -Identity "Kroatien hr" | Format-List

    #$Recipients = Get-Recipient -RecipientPreviewFilter (Get-EmailAddressPolicy -Identity "Kroatien hr").RecipientFilter


    $RecipientFilter = (Get-EmailAddressPolicy -Identity "Kroatien hr").RecipientFilter
    $ReplaceFilter = "(Company -eq 'Proizvodnja Strojeva d.o.o.')"
    $NewFilter = "((Company -eq 'Proizvodnja Strojeva d.o.o.') -or (Company -eq 'Kostwein Proizvodnja Strojeva d.o.o.'))"
    $UpdatedFilter = $RecipientFilter -replace $ReplaceFilter, $NewFilter

    #TODO: Testen
    New-EmailAddressPolicy -Identity "Kroatien hr neu" -RecipientFilter { $UpdatedFilter }

    $NewRecipients = Get-Recipient -RecipientPreviewFilter $UpdatedFilter | Where-Object { $_.Name -in $Employees.Name }

    #((Company -eq 'Proizvodnja Strojeva d.o.o.') -and (((RecipientType -eq 'UserMailbox') -or (((RecipientType -eq 'MailUniversalDistributionGroup') -or (RecipientType -eq 'MailUniversalSecurityGroup') -or (RecipientType -eq 'MailNonUniversalGroup') -or (RecipientType -eq 'DynamicDistributionGroup'))))))
}
