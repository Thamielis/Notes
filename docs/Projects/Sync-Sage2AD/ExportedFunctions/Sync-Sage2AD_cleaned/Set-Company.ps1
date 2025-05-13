function Set-Company {
    [CmdletBinding()]
    param (
        [Parameter()]
        [PSCustomObject] $Employee
    )

    $UserCompany = $Employee.AD.Company

    if ($UserCompany -ne $Employee.Sage.Firma) {
        Set-ADUser -Identity $Employee.AD.SamAccountName -Company $Employee.Sage.Firma
        
        Write-Log -Level INFO -Message "[$($Employee.Name)] Firma '$UserCompany' wurde auf '$($Employee.Sage.Firma)' geändert."

        return #Get-ADUser -Identity $Employee.AD.SamAccountName -Properties EmailAddress, ProxyAddresses, DistinguishedName, Company, City, Country, State, PostalCode, StreetAddress, UserPrincipalName, mail, pager, msExchMailboxGuid, HomeMDB, WhenCreated, WhenChanged, LastLogonDate, Enabled
    }

}
