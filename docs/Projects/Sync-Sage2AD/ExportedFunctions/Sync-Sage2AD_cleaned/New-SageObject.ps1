function New-SageObject {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $sUser
    )

    if ([string]::IsNullOrEmpty($sUser.WINDOWS)) {
        
        if ([string]::IsNullOrEmpty($sUser.GenSamAcc)) {
            $SamAccount = $null
        }
        else {
            $SamAccount = ($sUser.GenSamAcc).ToLower()
        }
    }
    else {
        $SamAccount = ($sUser.WINDOWS).ToLower().Trim()
    }

    if ($null -ne $SamAccount) {
        $MFAExchangeGroup = 'KOW_MFA_Exchange'
        $MFASkipExchangeGroup = 'KOW_MFA_Skip_Exchange'

        $MFAGroupMembers = @{

        }

        if ($SamAccount -notin $MFAGroupMembers) {
            $ExchangeGroup = $MFASkipExchangeGroup
        }
        else {
            $ExchangeGroup = $MFAExchangeGroup
        }
    }
    
    $sStandort = $sUser.Standort
        
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
            $ADCountry = @{
                c           = 'AT'
                co          = 'Österreich'
                countrycode = 40
            }
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
            $sFirma = 'Proizvodnja Strojeva d.o.o.'
            $sCountry = 'HR'
            $sStaat = 'Kroatien'
            $sCity = 'Varazdin'
            $sState = ''
            $sPostalCode = '42000'
            $sStreetAddress = 'Podravska ulica 37'
            $preferredLanguage = 'hr-HR'
            $ADCountry = @{
                c           = 'HR'
                co          = 'Kroatien'
                countrycode = 191
            }
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
            $ADCountry = @{
                c           = 'IT'
                co          = 'Italien'
                countrycode = 380
            }
        }
        { $_ -match 'Indien' } {
            $sFirma = 'India Company Private Ltd'
            $sCountry = 'IN'
            $sStaat = 'Indien'
            $sCity = 'Ahmedabad'
            $sState = ''
            $sPostalCode = '382405'
            $sStreetAddress = 'Plot N0. 170, N.I D.C. Industrial Estate'
            $preferredLanguage = 'hi-IN'
            $ADCountry = @{
                c           = 'IN'
                co          = 'Indien'
                countrycode = 356
            }
        }
        { $_ -match 'USA' } {
            $sFirma = 'Kostwein Corporation'
            $sCountry = 'US'
            $sStaat = 'Amerika'
            $sCity = 'Greenville'
            $sState = ''
            $sPostalCode = 'SC29615'
            $sStreetAddress = '500 Hartness Dr'
            $preferredLanguage = 'en-US'
            $ADCountry = @{
                c           = 'US'
                co          = 'USA'
                countrycode = 840
            }
        }
        DEFAULT {
            Write-Log WARNING "[$sStandort] Fehlender Standort"
        }
    }
        
    $PrinzipalDomain = if ($sCountry -ne 'IT') { 
        'kostwein' 
    }
    else { 
        'kostwein-metalinox' 
    }
    $UserPrincipalName = "$($sUser.Vorname).$($sUser.Nachname)@$($PrinzipalDomain).$($sCountry.ToLower())"

        
    if ($sUser.'Pers.Nr.' -in $global:SyncHash.Config.SageGF.Keys) {
        $SageADGroup = 'Sage_GF'
    }
    else {
        $SageADGroup = $sUser.SageADGroup
    }
    
    if ($sUser.AUSTRITT -ne '') {
        $Austritt = Get-Date -Date $sUser.AUSTRITT
    }
    else {
        $Austritt = ''
    }
        
    $UserData = New-Object PSObject -Property ([ordered]@{
            ID                  = $sUser.ID
            PersNr              = $sUser.'Pers.Nr.'
            SamAccountName      = ($sUser.WINDOWS).ToLower().Trim()
            UserPrincipalName   = $UserPrincipalName
            GeneratedSAMAccount = $sUser.GenSamAcc
            Name                = $sUser.NAME
            Nachname            = $sUser.Nachname #$TextInfo.ToTitleCase($Nachname)
            Vorname             = $sUser.Vorname #$TextInfo.ToTitleCase($Vorname)
            preferredLanguage   = $preferredLanguage
            #Leiharbeiter        = $Leiharbeiter
            Leihfirma           = $sUser.Leihfirma
            eMail               = $sUser.EMAIL
            Mobil               = $sUser.MOBIL
            Kostenstelle        = $sUser.Kostenstelle
            #Fotoname       = $sFotoFile
            FotoUri             = $sUser.FOTO
            Firma               = $sFirma
            Abteilung           = $sUser.Abteilung
            Standort            = $sUser.Standort
            Stelle              = $sUser.STELLE
            Tätigkeit           = $sUser.Tätigkeit
            StreetAddress       = $sStreetAddress
            City                = $sCity
            PostalCode          = $sPostalCode
            State               = $sState
            Country             = $sCountry
            Staat               = $sStaat
            Eintritt            = $sUser.EINTRITT
            Austritt            = $sUser.AUSTRITT
            #PortraitFile   = $PortraitFile
            VorgesetzterID      = $sUser.'Vorgesetzter ID'
            Vorgesetzter        = $sUser.Vorgesetzter
            ADSageGroup         = $SageADGroup
            ADCountry           = $ADCountry
        })
        
    return $UserData
}
