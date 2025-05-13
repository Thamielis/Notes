function Invoke-MailAddressChange {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [PSCustomObject]$Employee,

        [Parameter()]
        [string]$NewPrimarySmtpAddress
    )

    # Hole den Benutzer
    #$User = Get-ADUser -Filter { UserPrincipalName -eq $UserPrincipalName } -Properties EmailAddress, ProxyAddresses
    $User = $Employee.AD

    if ($null -eq $User) {
        Write-Log -Level ERROR -Message "Benutzer mit UserPrincipalName '$UserPrincipalName' wurde nicht gefunden."
        return
    }

    if ([string]::IsNullOrEmpty($NewPrimarySmtpAddress)) {
        $NewPrimarySmtpAddress = $Employee.eMailSage
    }
    
    # smtp:%m@kostwein.hr
    # smtp:%m@kostwein.at
    # smtp:%g.%s@kostwein.at
    # SMTP:%g.%s@kostwein.hr
    $Suffix = $Employee.Sage.Country.ToLower()
    $Vorname = $Employee.Sage.Vorname
    $Nachname = $Employee.Sage.Nachname
    $IstAdressen = Get-ADUserMailbox -User $Employee | Select-Object -ExpandProperty EmailAddresses #$Employee.Mailbox.EmailAddresses

    $SollAdressen = @(
        "smtp:$($User.SamAccountName)@kostwein.at",
        "smtp:$($User.SamAccountName)@kostwein.$Suffix",
        "smtp:$($User.SamAccountName)@kostweinat.mail.onmicrosoft.com",
        "smtp:$Vorname.$Nachname@kostweinat.mail.onmicrosoft.com",
        "smtp:$Vorname.$Nachname@kostwein.at",
        "SMTP:$Vorname.$Nachname@kostwein.$Suffix"  # Großes SMTP = Primary Address
    )

    $PrimaryAdresse = ($IstAdressen | Where-Object { $_ -cmatch "^SMTP:" })
    $SollPrimaryAdresse = ($SollAdressen | Where-Object { $_ -cmatch "^SMTP:" })

    foreach ($Adresse in $SollAdressen | Where-Object { $_ -cnotmatch "^SMTP:" }) {
        if (-not ($IstAdressen -contains $Adresse)) {
            #Write-Output "Adresse fehlt und wird hinzugefügt: $Adresse"
            $IstAdressen += $Adresse
        }
    }
    
    if ($PrimaryAdresse -ne $SollPrimaryAdresse) {
        Write-Output "Primary SMTP-Adresse wird angepasst: $SollPrimaryAdresse"

        # Alte Primary-Adresse zu sekundärer Adresse machen (klein schreiben)
        $IstAdressen = $IstAdressen | ForEach-Object {
            if ($_ -cmatch "^SMTP:") {
                "smtp:" + $_.Substring(5)  # "SMTP:" zu "smtp:" ändern
            }
            else {
                $_
            }
        }

        # Korrekte Primary-Adresse hinzufügen
        $IstAdressen += $SollPrimaryAdresse
    }
    #TODO: Adresse entfernen, welche gleich wie die Primary ist und mit smtp: beginnt


    $EmailAdressen = $Employee.Mailbox.EmailAddresses
    $EmailAdressen = $EmailAdressen -replace "SMTP:$($User.EmailAddress)", "smtp:$($User.EmailAddress)"
    $EmailAdressen += "SMTP:$NewPrimarySmtpAddress"
    #$EmailAdressen += "smtp:" + $User.Mailbox.PrimarySmtpAddress
    #$EmailAdressen = $EmailAdressen | Where-Object { $_ -notlike "SMTP:*" }
    #$EmailAdressen += "SMTP:" + $NeueAdresse  # Großes SMTP = Primary

    # Änderungen übernehmen
    Set-Mailbox -Identity $User.SamAccountName -EmailAddresses $EmailAdressen -EmailAddressPolicyEnabled $false

    Write-Log -Level INFO -Message "PrimarySmtpAddress für Benutzer '$($User.SamAccountName)' wurde erfolgreich auf '$NewPrimarySmtpAddress' geändert."

    #$Kurtak = $Employees | Where-Object { $_.AD.SamAccountName -eq 'kurtakd' }
    #$KurtakMailbox = Get-ADUserMailbox -User $Kurtak


}
