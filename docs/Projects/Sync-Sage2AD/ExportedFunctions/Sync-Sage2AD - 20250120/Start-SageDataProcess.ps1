function Start-SageDataProcess {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $SageData,
        [Parameter()]
        [Object] $ADUsers
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Processing Sage UserData and find AD Account [$($SageData.Count)]"
    Invoke-Timer -FunctionName $FunctionName -Description $Description
    
    $Script:SageADGroupNames = [System.Collections.Generic.HashSet[string]]::new()
    $Employees = [System.Collections.ArrayList]::new()
    
    $MFAExchangeGroup = 'KOW_MFA_Exchange'
    $MFASkipExchangeGroup = 'KOW_MFA_Skip_Exchange'

    $MFAGroupMembers = @{

    }

    $SageGF = @{
        8901 = 'Kostwein Hans'
        8902 = 'Kostwein Heinz'
        8904 = 'Schrott-Kostwein Ulrike'
        # 1561 = 'Kostwein Stefan'
        
    }
    
    $CleanData = Get-NameExtraction -csvData $SageData |
        Where-Object { $_.Kostenstelle -notin @('10099', '10098') -and $_.'Pers.Nr.' -ne '6100' } |
            Where-Object { -not [string]::IsNullOrEmpty($_.Vorname) -and $_.Nachname -notmatch 'Reinigung|Betriebsarzt' }

    try {
        foreach ($sUser in $CleanData) {
        
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

            if ($sUser.'Pers.Nr.' -in $SageGF.Keys) {
                $SageADGroup = 'Sage_GF'
            }
            else {
                $SageADGroup = $sUser.SageADGroup
            }

            if ($UserData.SamAccountName -notin $MFAGroupMembers) {
                $ExchangeGroup = $MFASkipExchangeGroup
            }
            else {
                $ExchangeGroup = $MFAExchangeGroup
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
        
            $Austrittsgrenze = Get-Date -Date '01.03.2025'

            if ($Austritt -eq '' -or $Austritt -ge $Austrittsgrenze) {
                
                $Employee = Update-Employee -SageUser $UserData
                $Employees += $Employee

            }
        
        }
    }
    catch {
        $ErrorInfo = $_
        $ErrorMessage = $_.Exception.Message
        Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
    }

    
    $Script:SageADGroupNames = $SageData.SageADGroup | Sort-Object -Unique
    $Script:NotInCleanData = $SageData | Where-Object { $_.'Pers.Nr.' -notin $CleanData.'Pers.Nr.' }
    $Script:NotProcessed = $CleanData | Where-Object { $_.'Pers.Nr.' -notin $Employees.employeeID }
    
    Invoke-Timer -FunctionName $FunctionName
    
    #Get-MailDifference -Employees $Employees | Where-Object { $_.Sage.Country -ne 'IT' }
    #$UpdatedEmployees = Get-MissingADUser -Employees $Employees
    
    
    #TODO: Austesten abschließen und fertig codieren
    #$Employees | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, @{Name = "MailAD"; Expression = { $_.AD.mail } }, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } } | Out-HtmlView
    #$Employees | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, @{Name = "ADGroup"; Expression = { $_.ADGroups.SageGroup } }, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } } | Out-HtmlView

    $InactiveMailbox = $Employees | Where-Object { $_.Mailbox -eq 'Inactive' }
    #$InactiveMailbox | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } } | Out-HtmlView

    #$MissingInAD = $Employees | Where-Object { $_.ADFoundWith -eq 'Missing' }
    #$MissingInAD | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } } | Out-HtmlView

    $NotEnabledAD = $Employees | Where-Object { $null -ne $_.AD -and $_.AD.Enabled -eq $false }

    $MailMissingSage = $Employees | Where-Object { $_.Sage.eMail -eq '' -and $null -ne $_.AD.mail }
    #$MailMissingSage | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, @{Name = "MailAD"; Expression = { $_.AD.mail } }, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } } | Out-HtmlView

    $MailMissingAD = $Employees  | Where-Object { $_.Sage.eMail -ne '' -and $null -eq $_.AD.mail }
    #$MailMissingAD | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, @{Name = "MailAD"; Expression = { $_.AD.mail } }, Mailbox | Out-HtmlView

    return $Employees | Sort-Object Name

    $Script:ADUsers | Sort-Object -Property Name | Select-Object -Property Name, SamAccountName, Mail | Where-Object { $_.Name -notmatch '^(EXT|IWAM|QM|Maschinenbau|Liefer|Laser|Invoic|Versand|Verbrauch|Werkzeug|Waren|zentral)' }

    #$ADUsersPager = $ADUsers | Where-Object { $_.pager -eq 'P' -and $_ -notin $Employees.AD -and $_.Name -notmatch 'Adm_|Test|6' -and $_.Enabled -eq $True }
    #$ADUsersPager | Select-Object -Property Name, Enabled, pager, SamAccountName, @{Name = "LastLogon"; Expression = { (Get-Date -Date $_.LastLogonDate).Date.ToShortDateString() } } | Out-HtmlView
    
    
}
