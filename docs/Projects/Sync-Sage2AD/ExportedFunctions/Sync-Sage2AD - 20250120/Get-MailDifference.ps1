function Get-MailDifference {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList]$Employees
    )

    $MailDiff = $Employees | Where-Object { $_.eMailAD -notmatch $_.eMailSage -and $_.ADFoundWith -ne 'Missing' }
    Write-Log -Level INFO -Message "[$($MailDiff.Count)] Mail Unterschiede gefunden."
    
    $ExchangePolicies = [System.Collections.ArrayList]::new()

    $WrongCompany = $MailDiff | Where-Object { $_.AD.Company -ne $_.Sage.Firma }
    Write-Log -Level INFO -Message "[$($WrongCompany.Count)] Firma Unterschiede gefunden."
    $OtherMismatch = $MailDiff | Where-Object { $_.AD.Company -eq $_.Sage.Firma }
    Write-Log -Level INFO -Message "[$($OtherMismatch.Count)] Andere Unterschiede gefunden."

    foreach ($User in $WrongCompany) {
        $User.AD = Set-Company -Employee $User

        if ($User.AD.Company -eq $User.Sage.Firma) {
            $Policy = $User.Sage.Staat
            if ($ExchangePolicies -notcontains $Policy) {
                $ExchangePolicies += $Policy
            }
        }
        
    }

    
    if ($ExchangePolicies.Count -gt 0) {
        Update-MailAddressPolicy -Policies $ExchangePolicies        
    }

    foreach ($User in $WrongCompany) {
        if ($User -eq $WrongCompany[0]) {
            $GetADUsers = $true
        }

        $Employee = Update-Employee -Employee $User.Sage -GetADUsers $GetADUsers

        $Mailbox = Get-ADUserMailbox -User $User
        $Employee.Mailbox = $Mailbox | Select-Object -Property IsMailboxEnabled, EmailAdresses, PrimarySmtpAddress, WindowsEmailAddress, Database, ServerName, RecipientTypeDetails, RecipientType, WhenMailboxCreated, WhenCreated, whenChanged
        #$User.AD = Get-ADUser -Identity $User.AD.SamAccountName -Properties EmailAddress, ProxyAddresses, DistinguishedName, Company, City, Country, State, PostalCode, StreetAddress, UserPrincipalName, mail, pager, msExchMailboxGuid, HomeMDB, WhenCreated, WhenChanged, LastLogonDate, Enabled
    }

    return

}
