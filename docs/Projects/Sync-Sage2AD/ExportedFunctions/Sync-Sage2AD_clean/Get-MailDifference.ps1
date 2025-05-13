function Get-MailDifference {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList] $Employees
    )

    $ExchangePolicies = [System.Collections.ArrayList]::new()
    $MailDiff = $Employees | Where-Object { $_.eMailAD -notmatch $_.eMailSage -and $_.ADFoundWith -ne 'Missing' }

    if ($MailDiff.Count -gt 0) {
        Write-Log -Level INFO -Message "[$($MailDiff.Count)] Mail Unterschiede gefunden."
    
        $WrongCompany = $MailDiff | Where-Object { $_.AD.Company -ne $_.Sage.Firma }
        $OtherMismatch = $MailDiff | Where-Object { $_.AD.Company -eq $_.Sage.Firma }

        if ($WrongCompany.Count -gt 0) {
            Write-Log -Level INFO -Message "[$($WrongCompany.Count)] Firma Unterschiede gefunden."

            foreach ($User in $WrongCompany) {
                $User.AD = Set-Company -Employee $User

                if ($User.AD.Company -eq $User.Sage.Firma) {
                    $Policy = $User.Sage.Staat
                    if ($ExchangePolicies -notcontains $Policy) {
                        $ExchangePolicies += $Policy
                    }
                }
        
            }

        }

        if ($OtherMismatch.Count -gt 0) {
            Write-Log -Level INFO -Message "[$($OtherMismatch.Count)] Andere Unterschiede gefunden."
            #TODO: Unterschiede reparieren
        }

        #TODO: Fehlende Übereinstimmungs-Lösungen hinzufügen

        if ($ExchangePolicies.Count -gt 0) {
            Update-MailAddressPolicy -Policies $ExchangePolicies

            Start-Sleep -Seconds 5

            foreach ($User in $WrongCompany) {
                if ($User -eq $WrongCompany[0]) {
                    $GetADUsers = $true
                }
        
                $Mailbox = Get-ADUserMailbox -User $User
                $Employee = Update-Employee -Employee $User.Sage -GetADUsers $GetADUsers
                $Employee.Mailbox = $Mailbox | Select-Object -Property IsMailboxEnabled, EmailAdresses, PrimarySmtpAddress, WindowsEmailAddress, Database, ServerName, RecipientTypeDetails, RecipientType, WhenMailboxCreated, WhenCreated, whenChanged
            }
        }

    }
    
    
    #TODO: Employees mit geänderten Daten aktualisieren

    return

}
