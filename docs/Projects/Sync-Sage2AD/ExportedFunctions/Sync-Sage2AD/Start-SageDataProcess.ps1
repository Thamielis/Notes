function Start-SageDataProcess {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $SageData,
        [Parameter()]
        [Object] $ADUsers
    )

    #$UsersData = [System.Collections.ArrayList]::new()
    $Script:SageADGroupNames = [System.Collections.Generic.HashSet[string]]::new()
    $Employees = [System.Collections.ArrayList]::new()
    #$MissingInAD = [System.Collections.ArrayList]::new()
    #$MissingInSage = [System.Collections.ArrayList]::new()
    
    foreach ($sUser in $SageData) {

        $sVorgesetzterNachname, $sVorgesetzterVorname = $sUser.'Vorgesetzter Name'.Split(', ').ToLower()
        $sNachname, $sVorname = $sUser.NAME.Split(', ').ToLower().Trim()
        
        switch ($sUser) {
            { $sUser.NAME -match 'HECTAS' } {
                $sLeihfirma, $sName = $sUser.NAME.Split(', ')
                $Nachname, $Vorname = $sName.Split(' ').ToLower().Trim()
                $Leiharbeiter = "Yes"
                break
            }
            { $sNachname -match '/' } {
                $Nachname, $sLeihfirma = $sNachname.Split('/').Trim()
                $Vorname = $sVorname
                $Leiharbeiter = "Yes"
            }
            { $sVorname -match '/' } {
                $Vorname, $sLeihfirma = $sVorname.Split('/').Trim()
                $Nachname = $sNachname
                $Leiharbeiter = "Yes"
            }
            Default {
                $Vorname = $sVorname
                $Nachname = $sNachname
                $sLeihfirma = ""
                $Leiharbeiter = ""
            }
        }
        
        #$sFotoname = $sUser.FOTO.Split('/')
        #$index = $sFotoname.count - 1
        #$sFotoFile = $sFotoname.GetValue($index)

        $sKostenstelle = $sUser.Kostenstelle
        $sAbteilung = $sUser.Abteilung
        $sStandort = $sUser.Standort
        $sStelle = $sUser.STELLE

        #$PortraitFile = Get-PortraitFile $sUser.'Pers.Nr.'

        if (-not([string]::IsNullOrWhiteSpace($sKostenstelle) -and [string]::IsNullOrWhiteSpace($sAbteilung))) {
            
            $SageGroupAbteilung = $sAbteilung -replace '[- ]+', '_' -replace '\.|\(|\)', ''

            $GroupName = "Sage_{0}_{1}" -f $SageGroupAbteilung, $sKostenstelle

            $SageADGroupNames.Add($GroupName) | Out-Null
        }
        else {
            $GroupName = ''
        }

        switch ($sStandort) {
            { $_ -match 'Klgft.|Ratzendorf|Zentrallager|Völkermarkt|Unterbergen|St.Veit' } {
                $sFirma = 'Kostwein Maschinenbau GmbH'
                $sCountry = 'AT'
                $sStaat = 'Österreich'
                $sCity = 'Klagenfurt'
                $sState = 'Kärnten'
                $sPostalCode = '9020'
                $sStreetAddress = 'Berthold-Schwarz-Straße 51'
                $preferredLanguage = 'de-AT'
            }
            { $_ -eq 'Ratzendorf' } {
                $sCity = 'Maria Saal'
                $sPostalCode = '9063'
                $sStreetAddress = 'Ratzendorf 2A'
            }
            { $_ -eq 'Zentrallager' } {
                $sStreetAddress = 'Fallegasse 3'
            }
            { $_ -eq 'Völkermarkt' } {
                $sCity = 'Völkermarkt'
                $sPostalCode = '9100'
                $sStreetAddress = 'Petzenweg 7'
            }
            { $_ -eq 'Unterbergen' } {
                $sCity = 'Unterbergen'
                $sPostalCode = '9163'
                $sStreetAddress = 'Unterbergen 24'
            }
            { $_ -eq 'St.Veit' } {
                $sCity = 'Sankt Veit/Glan'
                $sPostalCode = '9300'
                $sStreetAddress = 'Industrieparkstraße 1'
            }
            { $_ -match 'Kroatien|SDK' } {
                $sFirma = 'Kostwein Proizvodnja Strojeva d.o.o.'
                $sCountry = 'HR'
                $sStaat = 'Kroatien'
                $sCity = 'Varazdin'
                $sState = ''
                $sPostalCode = '42000'
                $sStreetAddress = 'Podravska ulica 37'
                $preferredLanguage = 'hr-HR'
            }
            { $_ -match 'Trnovec' } {
                $sCity = 'Trnovec Bartolovecki'
                $sPostalCode = '42202'
                $sStreetAddress = 'Gospodarska 11'
            }
            { $_ -match 'Italien' } {
                $sFirma = 'Kostwein Metalinox S.r.l.'
                $sCountry = 'IT'
                $sStaat = 'Italien'
                $sCity = 'Fiumicello Villa Vicentina'
                $sState = ''
                $sPostalCode = '33059'
                $sStreetAddress = 'Via Cortona, 13'
                $preferredLanguage = 'it-IT'
            }
            { $_ -match 'Indien' } {
                $sFirma = 'Kostwein India Company Private Ltd'
                $sCountry = 'IN'
                $sStaat = 'Indien'
                $sCity = 'Ahmedabad'
                $sState = ''
                $sPostalCode = '382405'
                $sStreetAddress = 'Plot N0. 170, N.I D.C. Industrial Estate'
                $preferredLanguage = 'hi-IN'
            }
            { $_ -match 'USA' } {
                $sFirma = 'Kostwein Corporation'
                $sCountry = 'US'
                $sStaat = 'Amerika'
                $sCity = 'Greenville'
                $sState = ''
                $sPostalCode = ''
                $sStreetAddress = ''
                $preferredLanguage = 'en-US'
            }
            DEFAULT {
                Write-Log WARNING "[$sStandort] Fehlender Standort"
            }
        }

        if ($Nachname -and $Vorname) {
            $GeneratedSAMAccount = ($Nachname.Trim() + $Vorname.Substring(0, 1).Trim()).ToLower() -replace ' ', ''
        }

        if ($sVorgesetzterNachname -and $sVorgesetzterVorname) {
            $Vorgesetzter = -join ($TextInfo.ToTitleCase($sVorgesetzterNachname), ' ', $TextInfo.ToTitleCase($sVorgesetzterVorname))
        }
        else {
            $Vorgesetzter = ''
        }
        
        
        $UserData = New-Object PSObject -Property ([ordered]@{
                ID                  = $sUser.ID
                PersNr              = $sUser.'Pers.Nr.'
                SamAccountName      = $sUser.WINDOWS
                GeneratedSAMAccount = $GeneratedSAMAccount
                Name                = $sUser.NAME
                Nachname            = $TextInfo.ToTitleCase($Nachname)
                Vorname             = $TextInfo.ToTitleCase($Vorname)
                preferredLanguage   = $preferredLanguage
                Leiharbeiter        = $Leiharbeiter
                Leihfirma           = $sLeihfirma
                eMail               = $sUser.EMAIL
                Mobil               = $sUser.MOBIL
                Kostenstelle        = $sKostenstelle
                #Fotoname       = $sFotoFile
                FotoUri             = $sUser.FOTO
                Firma               = $sFirma
                Abteilung           = $sAbteilung
                Standort            = $sStandort
                Stelle              = $sStelle
                Tätigkeit           = $sUser.Tätigkeit
                StreetAddress       = $sStreetAddress
                City                = $sCity
                PostalCode          = $sPostalCode
                State               = $sState
                Country             = $sCountry
                Staat               = $sStaat
                Eintritt            = $sUser.EINTRITT
                #PortraitFile   = $PortraitFile
                VorgesetzterID      = $sUser.'Vorgesetzter ID'
                Vorgesetzter        = $Vorgesetzter
                ADSageGroup         = $GroupName
            })

        #$UsersData += $UserData
        
        #$ADUser = $ADUsers | Where-Object { $_.SamAccountName -eq $UserData.SamAccountName }
        #if (-not($ADUser)) {
        #    $ADUser = $ADUsers | Where-Object { $_.SamAccountName -eq $UserData.GeneratedSAMAccount -and $_.Surname -eq $UserData.Sage.Nachname -and $_.GivenName -eq $UserData.Sage.Vorname }
        #}
        <#
        if (-not [string]::IsNullOrEmpty($UserData.SamAccountName)) {
            $SamAccName = $UserData.SamAccountName
        }
        elseif (-not [string]::IsNullOrEmpty($UserData.GeneratedSAMAccount)) {
            $SamAccName = $UserData.GeneratedSAMAccount
        }

        $ADUser = $ADUsers | Where-Object { $_.SamAccountName -eq $SamAccName }
        #>

        if ([string]::IsNullOrEmpty($UserData.SamAccountName)) {
            if (-not [string]::IsNullOrEmpty($UserData.GeneratedSAMAccount)) {

                $SamAccountName = $UserData.GeneratedSAMAccount
            
                if ($ADUsers.SamAccountName -contains $SamAccountName) {
                    $ExistingADUser = $ADUsers | Where-Object { $_.SamAccountName -eq $SamAccountName }
                    if ($ExistingADUser.GivenName -notmatch $UserData.Vorname) {
                        $SamAccountName = ($UserData.Nachname.Trim() + $UserData.Vorname.Substring(0, 2).Trim()).ToLower() -replace ' ', ''
                        $UserData.SamAccountName = $SamAccountName
                    }
                }
            }
        }
        else {
            $SamAccountName = $UserData.SamAccountName
        }

        $ADUser = $ADUsers | Where-Object { $_.SamAccountName -eq $SamAccountName }


        if ($ADUser.Count -gt 1) {
            Start-Sleep -Seconds 1
        }

        $Employees += [PSCustomObject]@{
            employeeID     = $UserData.PersNr
            Name           = "$($UserData.Nachname) $($UserData.Vorname)"
            SamAccountName = $UserData.SamAccountName
            GenSamAccName  = $UserData.GeneratedSAMAccount
            Vorgesetzter   = $Vorgesetzter
            Sage           = $UserData
            AD             = $ADUser
        }
    }

    $Script:SageADGroupNames = $SageADGroupNames | Sort-Object -Unique
    
    return $Employees | Sort-Object Name
}
