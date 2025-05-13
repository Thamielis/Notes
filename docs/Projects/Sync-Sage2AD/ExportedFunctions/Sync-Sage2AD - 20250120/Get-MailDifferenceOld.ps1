function Get-MailDifferenceOld {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList]$Employees
    )

    $MailDiff = $Employees | Where-Object { $_.eMailAD -notmatch $_.eMailSage -and $_.ADFoundWith -ne 'Missing' }
    Write-Log -Level INFO -Message "[$($MailDiff.Count)] Mail Unterschiede gefunden."

    $DifferentMail = [System.Collections.ArrayList]::new()
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

    #$dn = (Get-ADDomain).DistinguishedName
    $IgnoredOUs = @('Kostwein Gruppe', 'Benutzer', 'Postfach')
    $NotMatchedOUs = 'Mitarbeiter|test|RDBroker|RemoteApp|PushCiscoAMP'
    $CityOUs = @('Klagenfurt', 'Maria Saal', 'Voelkermarkt', 'Unterbergen', 'Sankt Veit', 'Varazdin', 'Trnovec', 'Zentrallager', 'Ahmedabad', 'Greenville')
    $TypeOUs = @('Montage', 'Produktion', 'Headquarters_Produktion')
    $StrangeOUs = @('Computer', 'Workstation')

    [regex]$OUsRegex = "OU=(?<OU>[^,]+)"
    
    $OUMatches = $OUsRegex.Matches($Employees.AD.DistinguishedName)
    $OUGroups = $OUMatches.Groups | Where-Object { $_.Name -eq 'OU' }
    $OUNames = $OUGroups.Value | Sort-Object -Unique | Where-Object { $_ -notin $IgnoredOUs -and $_ -notmatch $NotMatchedOUs }
    $Countries = $OUNames | Where-Object { $_.Length -eq 2 }
    $Cities = $OUNames | Where-Object { $_ -in $CityOUs }
    $Types = $OUNames | Where-Object { $_ -in $TypeOUs }
    $Strange = $OUNames | Where-Object { $_ -in $StrangeOUs }

    $OUs = $OUNames | Where-Object { $_ -notin $Countries -and $_ -notin $Cities -and $_ -notin $Types -and $_ -notin $Strange }


    foreach ($User in $MailDiff) {
        
        $Mailbox = Get-ADUserMailbox -User $User
        $User.Mailbox = $Mailbox | Select-Object -Property IsMailboxEnabled, EmailAdresses, PrimarySmtpAddress, WindowsEmailAddress, Database, ServerName, RecipientTypeDetails, RecipientType, WhenMailboxCreated, WhenCreated, whenChanged

        $DistinguishedName = $Mailbox.DistinguishedName
        $Distinguished = @{}
        
        $UserOUs = ($OUsRegex.Matches($DistinguishedName)).Groups | Where-Object { $_.Name -eq 'OU' } | Select-Object -ExpandProperty Value 
        
        foreach ($OU in $UserOUs) {
            switch ($OU) {
                { $_ -in $OUs } {
                    $Distinguished.Company = $_
                }
                { $_ -in $Countries } {
                    $Distinguished.Country = $_
                }
                { $_ -in $Cities } {
                    $Distinguished.City = $_
                }
                { $_ -in $Types } {
                    $Distinguished.Type = $_
                }
                { $_ -in $Strange } {
                    $Distinguished.Strange = $_
                }
                DEFAULT {
                    $Distinguished.Other = $_
                }
            }
        }
        
        $User | Add-Member -MemberType NoteProperty -Name 'Distinguished' -Value $Distinguished -Force
        $DifferentMail.Add($User)
    }


    #$DifferentMail | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, Name, @{Name = "UPN"; Expression = { $_.AD.UserPrincipalName } }, eMailSage, eMailAD, @{Name = "PrimarySmtp"; Expression = { $_.Mailbox.PrimarySmtpAddress } }, @{Name = "WhenMailboxCreated"; Expression = { $_.Mailbox.WhenMailboxCreated } }, @{Name = "WhenCreated"; Expression = { $_.Mailbox.WhenCreated } }, @{Name = "WhenChanged"; Expression = { $_.Mailbox.WhenChanged } }, @{Name = "Database"; Expression = { $_.Mailbox.Database } } | Sort-Object -Property WhenMailboxCreated -Descending | Out-HtmlView
    #$DifferentMail | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, @{Name = "MailAD"; Expression = { $_.AD.mail } } | Out-HtmlView

    foreach ($User in $DifferentMail | Where-Object { $_.Mailbox.PrimarySmtpAddress -ne $_.eMailSage }) {
        Invoke-MailAddressChange -Employee $User
    }
}
