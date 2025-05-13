$Script:ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
[string]$ScriptName = [System.IO.Path]::GetFileName($MyInvocation.MyCommand.Definition)
[string]$ScriptFullName = Join-Path -Path $ScriptPath -ChildPath $ScriptName

$Script:LogsPath = Join-Path -Path $Script:ScriptPath -ChildPath '.logs'
$Script:ExportsPath = Join-Path -Path $Script:ScriptPath -ChildPath 'exports'

$SageCSVPath = "\\atklprint\sageimport$"
$SageCSVFilePath = Join-Path -Path $SageCSVPath -ChildPath 'canon.csv'

$Script:TextInfo = (Get-Culture).TextInfo
$Script:NewMailbox = [System.Collections.ArrayList]::new()
$Script:Runtimes = @{}

$Script:Config = @{
    KeinVorgesetzter = @{
        8901 = 'Kostwein Hans'
        8902 = 'Kostwein Heinz'
        8904 = 'Schrott-Kostwein Ulrike'
        1561 = 'Kostwein Stefan'
        1597 = 'Schlagbauer Peter'
        8905 = 'Schumy Oliver'
    }
    NoAccessUser     = @{
        1603 = 'Schrott-Kostwein Philipp'
        9633 = 'Kurtak Dario'
        1501 = 'Dolzer Paul'
        1644 = 'Sibitz Dietmar'
        1594 = 'Robl Thomas'
        1650 = 'Begusch Stefan'
        1663 = 'Hafner Georg'
    }
    MFAGroupMembers  = @{

    }
    SageGF           = @{
        8901 = 'Kostwein Hans'
        8902 = 'Kostwein Heinz'
        8904 = 'Schrott-Kostwein Ulrike'
        # 1561 = 'Kostwein Stefan'
    }
}


if (!(Get-Module -Name PSTimers -ListAvailable -ErrorAction SilentlyContinue)) {
    Install-Module -Name PSTimers -Scope CurrentUser
}
Import-Module -Name PSTimers




#region Functions
function Initialize-Logging {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $DefaultLogLevel = 'INFO'
    )

    if (!(Get-Module -Name Logging -ListAvailable -ErrorAction SilentlyContinue)) {
        Install-Module -Name Logging -Scope CurrentUser
    }

    Import-Module Logging

    Set-LoggingDefaultLevel -Level $DefaultLogLevel

    $LogName = $(($Script:ScriptName -split '\.')[0])
    $LogFileName = "$($LogName)_$((Get-Date -Format 'yyyy.MM.dd').ToString()).log"
    $FullLogFilePath = Join-Path -Path $Script:LogsPath -ChildPath $LogFileName

    
    if ($DefaultLogLevel -eq 'DEBUG') {
        $Script:LogPattern = '[%{pid}] [%{lineno:-4}] [%{level:-7}] [%{caller}] %{message}'
    }
    else {
        $Script:LogPattern = '[%{lineno:-4}] [%{level:-7}] %{message}'
    }

    $Script:LogConsolePattern = '[%{timestamp:+%T:8}] ' + $Script:LogPattern
    $Script:LogFilePattern = '[%{timestamp}] ' + $Script:LogPattern
    $Script:ResultLogFormat = '[%{timestamp:+%T:8}] [%{level:-7}] %{message}'

    Add-LoggingLevel -LevelName 'RUNNING' -Level 50
    Add-LoggingLevel -LevelName 'RESULT' -Level 60
    Add-LoggingLevel -LevelName 'TIME' -Level 70
    Add-LoggingLevel -LevelName 'MESSAGE' -Level 80
    Add-LoggingLevel -LevelName 'GF' -Level 85

    Add-LoggingTarget -Name Console -Configuration @{
        Format         = $Global:LogConsolePattern          # <Not required> Sets the logging format for this target
        PrintException = $true                              # <Not required> Prints stacktrace
        ColorMapping   = @{
            GF      = 'Blue'
            MESSAGE = 'White'
            TIME    = 'DarkCyan' #'Magenta'
            RUNNING = 'DarkYellow'
            RESULT  = 'Cyan'
            DEBUG   = 'Blue'
            INFO    = 'Green'
            WARNING = 'Yellow'
            ERROR   = 'Red'
        }
    }

    Add-LoggingTarget -Name File -Configuration @{
        Path           = $FullLogFilePath    # <Required> Sets the file destination (eg. 'C:\Temp\%{+%Y%m%d}.log')
        PrintBody      = $false              # <Not required> Prints body message too
        PrintException = $true               # <Not required> Prints stacktrace
        Append         = $true               # <Not required> Append to log file
        Format         = $Script:LogFilePattern            # <Not required> Sets the logging format for this target
    }
    
    Write-Log -Level DEBUG -Message 'Logging Module configured'
}

# Initialize logging at the start
Initialize-Logging

function Invoke-Timer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $FunctionName,
        [Parameter()]
        [string] $Description
    )

    if (-not ($Script:Runtimes[$FunctionName])) {
        $Script:Runtimes[$FunctionName] = Start-MyTimer -Name $FunctionName -Description $Description
        Write-Log -Level TIME -Message "[$FunctionName] $Description"
    }
    elseif ($Script:Runtimes[$FunctionName].Status -eq 'Running') {
        Stop-MyTimer -Name $FunctionName
        $Duration = "{0:D2}:{1:D2} min" -f $Script:Runtimes.$FunctionName.Duration.Minutes, $Script:Runtimes.$FunctionName.Duration.Seconds
        Write-Log -Level TIME -Message "[$FunctionName] Runtime: $Duration"
    }

    #$FunctionName = $MyInvocation.MyCommand.Name
    #$Description = "Processing Sage UserData and find AD Account [$($SageData.Count)]"
    #$Script:Runtimes[$FunctionName] = Start-MyTimer -Name $FunctionName -Description $Description
    #Write-Log -Level INFO -Message $Description

    #Stop-MyTimer -Name $FunctionName
    #$Duration = "{0:D2}:{1:D2} min" -f $Script:Runtimes.$FunctionName.Duration.Minutes, $Script:Runtimes.$FunctionName.Duration.Seconds
    #Write-Log -Level INFO -Message "[$FunctionName] Runtime: $Duration"
}

# Function to import Sage data
function Import-SageData {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$SageCSVFilePath
    )

    Write-Log -Level INFO -Message "Importing Sage Data from $SageCSVFilePath"

    try {
        $SageData = Get-Content -Path $SageCSVFilePath -Raw -Encoding ansi | ConvertFrom-Csv -Delimiter ';'
        Write-Log -Level INFO -Message "Sage Data successfully imported."
        return $SageData
    }
    catch {
        Write-Log -Level ERROR -Message "Failed to import Sage data from $SageCSVFilePath." -ExceptionInfo $_
        throw "Error reading Sage CSV file."
    }

    Wait-Logging
}

function ConvertTo-CamelCase {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $Name
    )

    $TextInfo = (Get-Culture).TextInfo

    $TextInfo.ToTitleCase($Name)
}

function Find-ADUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [PSCustomObject] $UserData,
        
        [Parameter()]
        [Object] $Changes = [Ordered]@{},

        [Switch] $GetADUsers,
        $ExchangeGroup
    )

    if ($GetADUsers -or $null -eq $Script:ADUsers) {
        [System.Collections.ArrayList]$Script:ADUsers = Get-AllADUsers
        $Script:AllADUsers = $Script:ADUsers.Clone()
    }
    
    $ADUsers = $Script:ADUsers
    
    # Initialize variables
    $ADUser = $null
    $ADFoundWith = $null

    if ([string]::IsNullOrEmpty($UserData.SamAccountName)) {
        if (-not [string]::IsNullOrEmpty($UserData.GeneratedSAMAccount)) {

            $SamAccountName = $UserData.GeneratedSAMAccount
            
            if ($Script:AllADUsers.SamAccountName -contains $SamAccountName) {
                $ExistingADUser = $Script:AllADUsers | Where-Object { $_.SamAccountName -eq $SamAccountName }
                if ($ExistingADUser.GivenName -notmatch $UserData.Vorname) {
                    $SamAccountName = ($UserData.Nachname.Trim() + $UserData.Vorname.Substring(0, 2).Trim()).ToLower() -replace ' ', ''
                    $UserData.SamAccountName = $SamAccountName
                }
            }
            
            $key = 'GenSamAcc'
        }
    }
    else {
        $SamAccountName = $UserData.SamAccountName
        $key = 'SamAcc'
    }

    #$ADUser = $Script:ADUsers | Where-Object { $_.SamAccountName -eq $SamAccountName }

    $Employee = [PSCustomObject]@{
        employeeID     = $UserData.PersNr
        Name           = "$($UserData.Nachname) $($UserData.Vorname)"
        SamAccountName = $UserData.SamAccountName
        GenSamAccName  = $UserData.GeneratedSAMAccount
        eMailSage      = $UserData.eMail
        #eMailAD           = $ADUser.eMailAD
        eMailAD        = ''
        #UserPrincipalName = $ADUserAcc.UserPrincipalName
        ADFoundWith    = 'Missing' #$ADUserAcc.FoundWith
        Vorgesetzter   = $UserData.Vorgesetzter
        Sage           = $UserData
        AD             = $null #$ADUserAcc.AD
        ADGroups       = @{
            MitarbeiterGroup = "Mitarbeiter_Employee $($UserData.Country)"
            ExchangeGroup    = 'KOW_MFA_Skip_Exchange' #$ExchangeGroup
            MailArchiv       = "MailArchiv_$($UserData.Country)"
            OutOfOffice      = "OutOfOffice_$($UserData.Country)"
            SageGroup        = $UserData.ADSageGroup
        }
        #ADCountry      = $UserData.ADCountry
        Mailbox        = 'Missing'
        Changes        = $Changes
    }
    
    #if (-not $ADUser) {
    # Define matching logic
    $matchingLogic = [ordered]@{
        SamAcc2 = {
            if ($SamAccountName -ne '') {
                $Script:ADUsers | Where-Object { $_.SamAccountName -eq $SamAccountName }
            }
        }
        SamAcc         = { 
            if ($UserData.SamAccountName -ne '') {
                $ADUsers | Where-Object { 
                    #$_.SamAccountName -eq $SamAccountName -or 
                    $_.SamAccountName -eq $UserData.SamAccountName
                }
                #Get-ADUser -Identity $UserData.SamAccountName
            }
        }
        GenSamAcc      = {
            if ($UserData.GeneratedSAMAccount -ne '') {
                $GenSamAcc = $UserData.GeneratedSAMAccount -replace 'ö', 'oe'

                $ADUsers | Where-Object { 
                    ($_.SamAccountName -eq $UserData.GeneratedSAMAccount -or
                    $_.SamAccountName -eq $GenSamAcc) -and
                    $_.Surname -eq $UserData.Nachname -and
                    $_.GivenName -eq $UserData.Vorname
                }
            }
        }
        #SamAccUmlaute  = {
        #    $SamAcc = $UserData.SamAccountName -replace 'ö', 'oe'
        #    
        #    $ADUsers | Where-Object { 
        #        ($_.SamAccountName -eq $SamAcc -and $SamAcc -ne '')
        #    }
        #}
        SamAccFromName = { 
            $ADUsers | Where-Object { 
                $_.SamAccountName -match $UserData.Nachname -and
                $_.Surname -eq $UserData.Nachname -and
                $_.GivenName -eq $UserData.Vorname 
            }
        }
        UserPrincipal  = { 
            $ADUsers | Where-Object { 
                $_.UserPrincipalName -match "$($UserData.Vorname).$($UserData.Nachname)" 
            }
        }
        VorNachname    = { 
            $ADUsers | Where-Object { 
                $_.Surname -eq $UserData.Nachname -and
                $_.GivenName -eq $UserData.Vorname 
            }
        }
        eMail          = {
            if ($UserData.eMail -ne '') {
                $ADUsers | Where-Object { $_.EmailAddress -eq $UserData.eMail }
            }
        
        }
    }

    foreach ($key in $matchingLogic.Keys) {
        $ADUser = &($matchingLogic[$key])

        if ($ADUser.Count -gt 1) {
            Write-Host "$($UserData.Name) ADResults: $($ADUser.Count)"
        }

        if ($ADUser) {
            $Script:ADUsers.Remove($ADUser)
        
            $ADFoundWith = $key
            #$Email = $ADUser.EmailAddress
            $Employee.AD = $ADUser
            $Employee.eMailAD = $ADUser.EmailAddress
            $Employee.ADFoundWith = $ADFoundWith

            if ($null -eq $ADUser.msExchMailboxGuid) {
                #if ($Employee.AD.HomeMDB -match "KOWEX") {
                $Employee.Mailbox = 'Inactive'
            }
            else {
                $Employee.Mailbox = 'Active'
            }
        
            $SageGroupsPath = 'OU=Sage,OU=Gruppen,OU=Allgemein,OU=Kostwein Gruppe,DC=kostweingroup,DC=intern'
            $DistinguishedName = "CN=$($Employee.ADGroups.SageGroup),$($SageGroupsPath)"
            $SageGroupsMemberOf = $Employee.AD.MemberOf | Where-Object { $_ -match "$($SageGroupsPath)$" }
            $SageGroupToAdd = $DistinguishedName | Where-Object { $_ -notin $SageGroupsMemberOf }
            #TODO: Prüfen welche Gruppen entfernt werden
            $SageGroupsToRemove = $SageGroupsMemberOf | Where-Object { $_ -notin $DistinguishedName }

            $SageGroups = [Ordered]@{
                SageGroups        = $SageGroupsMemberOf
                DistinguishedName = $DistinguishedName
                Add               = $SageGroupToAdd
                Remove            = $SageGroupsToRemove
            }
                
            $Employee | Add-Member -MemberType NoteProperty -Name 'SageGroups' -Value $SageGroups -Force

            $ADGroupsAdd = @()
            foreach ($Group in $Employee.ADGroups.Keys) {
                $GroupName = $Employee.AD.MemberOf | Where-Object { $_ -match "CN=$($Employee.ADGroups.$Group)" }
                if ($GroupName) {
                    $ADGroupsAdd += $GroupName
                }
                    
            }

            #TODO: Vergleichen und wenn unterschiedlich dann den Wert setzen
            <#
                $ADChanges = @{
                    DisplayName = (if ($Employee.Sage.Name -ne $Employee.AD.DisplayName) { $Employee.Sage.Name })
                    Groups      = @{
                        Add  = $ADGroupsAdd
                        Sage = $SageGroups
                    }
                    Location    = @{
                        Company       = (if ($Employee.Sage.Firma -ne $Employee.AD.Company) { $Employee.Sage.Firma })
                        StreetAddress = (if ($Employee.Sage.StreetAddress -ne $Employee.AD.StreetAddress) { $Employee.Sage.StreetAddress })
                        City          = (if ($Employee.Sage.City -ne $Employee.AD.City) { $Employee.Sage.City })
                        PostalCode    = (if ($Employee.Sage.PostalCode -ne $Employee.AD.PostalCode) { $Employee.Sage.PostalCode })
                        Country       = (if ($Employee.Sage.Country -ne $Employee.AD.Country) { $Employee.Sage.Country })
                        c             = (if ($Employee.Sage.ADCountry.c -ne $Employee.AD.c) { $Employee.Sage.ADCountry.c })
                        co            = (if ($Employee.Sage.ADCountry.co -ne $Employee.AD.Country) { $Employee.Sage.ADCountry.co })
                        countryCode   = (if ($Employee.Sage.ADCountry.countrycode -ne $Employee.AD.countrycode) { $Employee.Sage.ADCountry.countrycode })
                    }
                }
            #>

            $ADChanges = @{
                DisplayName = if ($Employee.Sage.Name -ne $Employee.AD.DisplayName) { $Employee.Sage.Name } else { $null }
                Groups      = @{
                    Add  = $ADGroupsAdd
                    Sage = $SageGroups
                }
                Location    = @{
                    Company       = if ($Employee.Sage.Firma -ne $Employee.AD.Company) { $Employee.Sage.Firma } else { $null }
                    StreetAddress = if ($Employee.Sage.StreetAddress -ne $Employee.AD.StreetAddress) { $Employee.Sage.StreetAddress } else { $null }
                    City          = if ($Employee.Sage.City -ne $Employee.AD.City) { $Employee.Sage.City } else { $null }
                    PostalCode    = if ($Employee.Sage.PostalCode -ne $Employee.AD.PostalCode) { $Employee.Sage.PostalCode } else { $null }
                    Country       = if ($Employee.Sage.Country -ne $Employee.AD.Country) { $Employee.Sage.Country } else { $null }
                    c             = if ($Employee.Sage.ADCountry.c -ne $Employee.AD.c) { $Employee.Sage.ADCountry.c } else { $null }
                    co            = if ($Employee.Sage.ADCountry.co -ne $Employee.AD.Country) { $Employee.Sage.ADCountry.co } else { $null }
                    countryCode   = if ($Employee.Sage.ADCountry.countrycode -ne $Employee.AD.countrycode) { $Employee.Sage.ADCountry.countrycode } else { $null }
                }
            }


            $Employee | Add-Member -MemberType NoteProperty -Name 'ADChanges' -Value $ADChanges -Force

            break
        }
        
    }

    if ($null -eq $Employee.AD) {
        #$ADUser = Get-ADUser -Identity $UserData.SamAccountName -ErrorAction SilentlyContinue
        Start-Sleep -Milliseconds 1
    }

    #}
    
    <#
    # Execute matching logic in order
    foreach ($key in $matchingLogic.Keys) {
        $ADUser = &($matchingLogic[$key])

        if ($ADUser.Count -gt 1) {
            Write-Host "$($UserData.Name) ADResults: $($ADUser.Count)"
        }

        if ($ADUser) {
            $ADFoundWith = $key
            #$Email = $ADUser.EmailAddress

            $Employee.AD = $ADUser
            $Employee.eMailAD = $ADUser.EmailAddress
            $Employee.ADFoundWith = $ADFoundWith

            if ($null -eq $ADUser.msExchMailboxGuid) {
                #if ($Employee.AD.HomeMDB -match "KOWEX") {
                $Employee.Mailbox = 'Inactive'
            }
            else {
                $Employee.Mailbox = 'Active'
            }

            break
        }
    }
    #>
    
    <#
    if ($ADUser) {
        $Employee.AD = $ADUser
        $Employee.eMailAD = $Employee.AD.EmailAddress
        $Employee.ADFoundWith = $ADFoundWith

        if ($null -ne $Employee.AD.HomeMDB) {
        #if ($Employee.AD.HomeMDB -match "KOWEX") {
            $Mailbox = 'Active'
        }
        else {
            $Mailbox = 'Inactive'
        }
    }
    else {
        $Mailbox = 'Missing'
    }

    $Employee | Add-Member -MemberType NoteProperty -Name 'Mailbox' -Value $Mailbox -Force
    #>
    
    return $Employee
}


function Get-NameExtraction {
    [CmdletBinding()]
    param (
        [Parameter()]
        $csvData
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Cleaning Sage Data"
    Invoke-Timer -FunctionName $FunctionName -Description $Description
    
    foreach ($row in $csvData) {
        $nameField = $row.NAME -replace '\s+', ' ' # Normalize whitespace
        
        if ($nameField -match 'HECTAS') {
            $leihFirma, $sName = $nameField.Split(', ')
            $lastName, $firstName = $sName.Split(' ').ToLower().Trim()
        }
        # Improved Regex pattern for handling new cases
        elseif ($nameField -match '^([^/]+)\s*/\s*([^,]+),\s*(.+)$') {
            # Case with Leihfirma
            $lastName = $matches[1].ToLower().Trim()
            $leihFirma = $matches[2].ToLower().Trim()
            $firstName = $matches[3].ToLower().Trim()
        }
        elseif ($nameField -match '^([^,]+),\s*(.+)$') {
            # Case without Leihfirma
            $lastName = $matches[1].ToLower().Trim()
            $firstName = $matches[2].ToLower().Trim()
            $leihFirma = $null
        }
        else {
            # Default case if no match
            $lastName = ''
            $firstName = ''
            $leihFirma = ''
        }

        # Convert extracted data to CamelCase
        $lastName = ConvertTo-CamelCase -Name $lastName
        $firstName = ConvertTo-CamelCase -Name $firstName
        if ($leihFirma) {
            $leihFirma = ConvertTo-CamelCase -Name $leihFirma
        }

        # Add properties to the row
        $row | Add-Member -MemberType NoteProperty -Name 'Nachname' -Value $lastName -Force
        $row | Add-Member -MemberType NoteProperty -Name 'Vorname' -Value $firstName -Force
        $row | Add-Member -MemberType NoteProperty -Name 'Leihfirma' -Value $leihFirma -Force

        if ($lastName -and $firstName) {
            $GeneratedSAMAccount = ($lastName.Trim() + $firstname.Substring(0, 1).Trim()).ToLower() -replace ' ', ''
            
        }
        else {
            $GeneratedSAMAccount = ''
        }

        $row | Add-Member -MemberType NoteProperty -Name 'GenSamAcc' -Value $GeneratedSAMAccount -Force

        if (-not([string]::IsNullOrWhiteSpace($row.Kostenstelle) -and [string]::IsNullOrWhiteSpace($row.Abteilung))) {
            
            $SageGroupAbteilung = $row.Abteilung -replace '[- ]+', '_' -replace '\.|\(|\)', ''
            $GroupName = "Sage_{0}_{1}" -f $SageGroupAbteilung, $row.Kostenstelle
            
        }
        else {
            $GroupName = ''
        }

        $row | Add-Member -MemberType NoteProperty -Name 'SageADGroup' -Value $GroupName -Force


        $sVorgesetzterNachname, $sVorgesetzterVorname = $row.'Vorgesetzter Name'.Split(', ').ToLower()
        if ($sVorgesetzterNachname -and $sVorgesetzterVorname) {
            $Vorgesetzter = -join ($TextInfo.ToTitleCase($sVorgesetzterNachname), ' ', $TextInfo.ToTitleCase($sVorgesetzterVorname))
        }
        else {
            $Vorgesetzter = ''
        }

        $row | Add-Member -MemberType NoteProperty -Name 'Vorgesetzter' -Value $Vorgesetzter -Force
        

    }

    $csvData | Export-Csv -Path "clean_canon.csv" -NoTypeInformation

    Invoke-Timer -FunctionName $FunctionName

    return $csvData
    
}

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

function Get-MissingADUser {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList] $Employees
    )

    try {
        $MissingInAD = $Employees | Where-Object { $_.ADFoundWith -eq 'Missing' }
        $MissingInAD | ForEach-Object {
            $Status = New-ADUserAccount -NewUser $_
            if ($null -eq $_.Changes) {
                $_.Changes = [Ordered]@{}
            }
            $_.Changes.Add('NewADAccount', $Status)
        }

        if ($MissingInAD.Count -gt 0) {
            Write-Log -Level INFO -Message "Missing AD Accounts to create $($MissingInAD.Count)"

            foreach ($Employee in $MissingInAD) {
            
                if ($MissingInAD.IndexOf($Employee) -eq 0) {
                    $Employee = Update-Employee -SageUser $Employee.Sage -Changes $Employee.Changes -GetADUsers
                }
                else {
                    $Employee = Update-Employee -SageUser $Employee.Sage -Changes $Employee.Changes
                }
            
                $Employees.Remove($Employee)
                $Employees += $Employee
            }

            #$Employees = Get-MissingADUser -Employees $Employees

        }
        else {
            return $Employees
        }

    }
    catch {
        Write-Log -Level ERROR -Message "Error: " -ExceptionInfo $_
    }
    
}

function New-ADUserAccount {
    [CmdletBinding()]
    param (
        [Parameter()]
        $NewUser
    )

    #$ADUser = $null

    if ([string]::IsNullOrEmpty($NewUser.SamAccountName)) {
        if (-not [string]::IsNullOrEmpty($NewUser.GenSamAccName)) {
            $SamAccountName = $NewUser.GenSamAccName
        }
    }
    else {
        $SamAccountName = $NewUser.SamAccountName
    }

    if ($SamAccountName) {
        
        try {
            $ExistingSamAcc = Get-ADUser -Identity $SamAccountName -ErrorAction SilentlyContinue
            if ($ExistingSamAcc) {
                Write-Log -Level WARNING -Message "$SamAccountName exists for $($ExistingSamAcc.Name)"
                $SamAccNN, $SamAccVN = $NewUser.Name.split(' ')
                $SamAcc = "${SamAccNN}$($SamAccVN.Substring(0,2))"
                $NewUser.SamAccountName = $SamAcc

                return (New-ADUserAccount -NewUser $NewUser)
            }
        }
        catch {
            
            $OUPath = "OU=$($NewUser.Sage.Country)_Mitarbeiter,OU=$($NewUser.Sage.Country),OU=Benutzer,OU=Kostwein Gruppe,DC=kostweingroup,DC=intern"

            if (-not [string]::IsNullOrEmpty($NewUser.Sage.VorgesetzerID)) {
                $Vorgesetzter = $Employees | Where-Object { $_.Sage.ID -eq $Employee.Sage.VorgesetzterID -and $Employee.Sage.PersNr -notin $KeinVorgesetzter.Keys }
                if ($Vorgesetzter) {
                    $Manager = $Vorgesetzter.AD.DistinguishedName
                }
                elseif ([System.String]::IsNullOrEmpty($Vorgesetzter)) {
                    $Manager = $null
                }
            }

            try {
                #$UserPrincipalName = "$($NewUser.Sage.Vorname).$($NewUser.Sage.Nachname)@kostwein.$($NewUser.Sage.Country.ToLower())"
                $Credentials = New-Credentials -UserName $SamAccountName

                $ADParams = @{
                    EmployeeID            = $NewUser.Sage.ID
                    EmployeeNumber        = $NewUser.employeeID
                    Name                  = $NewUser.Name
                    SamAccountName        = $SamAccountName
                    GivenName             = $NewUser.Sage.Vorname
                    Surname               = $NewUser.Sage.Nachname
                    DisplayName           = $NewUser.Name
                    MobilePhone           = $NewUser.Sage.Mobil
                    Company               = $NewUser.Sage.Firma
                    Country               = $NewUser.Sage.Country
                    Manager               = $Manager
                    Path                  = $OUPath
                    UserPrincipalName     = $NewUser.Sage.UserPrincipalName
                    AccountPassword       = $Credentials.Password
                    Enabled               = $true
                    ChangePasswordAtLogon = $true
                    OtherAttributes       = @{
                        Personalnummer    = $NewUser.employeeID
                        pager             = "P"
                        preferredLanguage = $NewUser.Sage.preferredLanguage
                    }
                }

                New-ADUser @ADParams
                Write-Log -Level INFO -Message "[$($NewUser.Name)] AD Account created"
                return 'Success'
            }
            catch {
                Write-Log -Level ERROR -Message "[$($NewUser.Name)] Failed to create ADAccount"
                return 'Failed'
            }
            
        }
        
    }
    
}

function New-Credentials {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $UserName
    )

    $Pass = 'Kostwein2025!'
    $Password = $Pass | ConvertTo-SecureString -AsPlainText -Force
    
    return [System.Management.Automation.PSCredential]::new($UserName, $Password)
}

function Update-Employee {
    [CmdletBinding()]
    param (
        [Parameter()]
        [PSCustomObject] $SageUser,
        [Object] $Changes,
        [switch] $GetADUsers
    )

    $Params = @{
        UserData = $SageUser
    }

    if ($GetADUsers) {
        $Params.GetADUsers = $true
    }

    $Employee = Find-ADUser @Params

    if ($Employee.AD) {
        $Employee.eMailAD = $Employee.AD.mail
    }

    $Employee.Changes = $Changes

    return $Employee
}

function Get-MissingManager {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList] $Employees
    )

    $NoManager = $Employees | Where-Object { $_.Vorgesetzter -eq '' }

    $ManagerNotInSage = $Employees | Where-Object { $_.Sage.Vorgesetzter -eq '' }
    $ManagerInSage = $Employees | Where-Object { $_.Sage.Vorgesetzter -ne '' }

    $NotInAD = $Employees | Where-Object { $null -eq $_.AD }
    $ManagerNotInAD = $ManagerInSage | Where-Object { $_ -notin $NotInAD -and $null -eq $_.AD.Manager }

    $ManagerInSageNotInAD = $ManagerInSage | Where-Object { $_ -in $ManagerNotInAD }

    Write-Host "[$($NoManager.Count)] Mitarbeiter ohne Vorgesetzten."
    Write-Host "[$($ManagerNotInSage.Count)] Mitarbeiter ohne Vorgesetzten in Sage."
    #Write-Host "[$($ManagerInSage.Count)] Mitarbeiter mit Vorgesetzten in Sage."
    Write-Host "[$($NotInAD.Count)] Mitarbeiter ohne AD Account."
    Write-Host "[$($ManagerNotInAD.Count)] Mitarbeiter ohne Vorgesetzten in AD."
    Write-Host "[$($ManagerInSageNotInAD.Count)] Mitarbeiter mit Vorgesetzten in Sage aber ohne Vorgesetzten in AD."
    
}

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

        return
    }

}

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

function Sync-SageADGroups {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )
    
    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Checking/Creating Sage AD Groups"
    Invoke-Timer -FunctionName $FunctionName -Description $Description
    
    $NewSageADGroups = [System.Collections.ArrayList]::new()
    
    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = 'OU=Sage,OU=Gruppen,OU=Allgemein,OU=Kostwein Gruppe,DC=kostweingroup,DC=intern'
    }
    
    $AllSageGroups = Get-ADGroup -SearchBase $ADGroupParams.Path -Filter '*'
    #$NewADGroups = $AllSageGroups | Where-Object { $_.Name -notin $SageADGroupNames }
    
    $MissingADGroups = $SageADGroupNames | Where-Object { $_ -notin $AllSageGroups.Name }
    #$MissingADGroups = $SageADGroupNames | Where-Object { $AllSageGroups.Name -notcontains $_ }

    $MissingADGroups | ForEach-Object {
        $GroupName = $_
        try {
            if ($AllSageGroups.Name -notcontains $GroupName) {
                if ($PSCmdlet.ShouldProcess("AD Group $GroupName", "Create")) {
                    $ADGroupParams.Name = $GroupName
                    New-ADGroup @ADGroupParams

                    $NewSageADGroups += $GroupName
                    Write-Log -Level WARNING -Message "Successfully created AD Group: $GroupName"
                }
                
            }
        }
        catch {
            Write-Log -Level 'ERROR' -Message "Error creating group: $GroupName"
        }
    } 
    
    Invoke-Timer -FunctionName $FunctionName

    if ($NewSageADGroups.Count -gt 0) {
        $Message = "`nNeu angelegte Sage AD Gruppen: `n`t $($NewSageADGroups -join `",`n`t `")"
        $Body = Build-MailBody -NewSageADGroups $NewSageADGroups

        Send-Mail -Subject "Sage AD Groups" -Body $Body
        Write-Log -Level DEBUG -Message $Message
    }
    
    Wait-Logging
}

function Get-SageADGroups {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )

    $AllUsedSageGroupNames = $Employees.ADGroups.SageGroup | Sort-Object -Unique 

    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = 'OU=Sage,OU=Gruppen,OU=Allgemein,OU=Kostwein Gruppe,DC=kostweingroup,DC=intern'
    }
    
    $AllSageGroups = Get-ADGroup -SearchBase $ADGroupParams.Path -Filter '*'

    $NotUsedSageGroups = $AllSageGroups | Where-Object { $_.Name -notin $AllUsedSageGroupNames }
    foreach ($Group in $NotUsedSageGroups) {
        $Group.Member = Get-ADGroupMember -Identity $Group.Name -ErrorAction SilentlyContinue
        #Write-Log -Level INFO -Message "Group not used: $($Group.Name)"
    }

    $EmptyNotUsedSageGroups = $NotUsedSageGroups | Where-Object { $_.Member.Count -eq 0 }


}

function Build-MailBody {
    [CmdletBinding()]
    param (
        [Parameter()]
        $NewSageADGroups
    )
    
    $HTMLContent = foreach ($GroupName in $NewSageADGroups) {
        @"
        <p class=MsoNormal style='text-indent:35.4pt'>
            <span>
                $GroupName
            </span>
            <o:p></o:p>
        </p>

"@
    }

    $Body = @"
<body lang=DE-AT link="#0563C1" vlink="#954F72">
    <div class=WordSection1>
        <p class=MsoNormal>
            <b>
                <span>
                    Neu angelegte Sage AD Gruppen: 
                    <o:p></o:p>
                </span>
            </b>
        </p>
$HTMLContent
        <p class=MsoNormal>
            <o:p>&nbsp;</o:p>
        </p>
    </div>
</body>
"@

    return $Body
}

function Send-Mail {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $SMTPServer = 'atklmail01.kostweingroup.intern',
        [Parameter()]
        [String] $From = 'SyncSage2AD@kostwein.at',
        [Parameter()]
        [String] $To = 'Administrator@kostwein.at',
        [Parameter()]
        [String] $Subject = 'Test',
        [Parameter()]
        [String] $Body = 'TestMail',
        [Parameter()]
        [String] $Attachment
    )

    $MellunigM = 'mario.mellunig@kostwein.at'
    $PetritschS = 'sabrina.petritsch@kostwein.at'

    # Erstelle das Mail-Objekt
    $MailMessage = [System.Net.Mail.MailMessage]::new()
    $MailMessage.from = $From
    $MailMessage.To.Add($To)
    $MailMessage.To.Add($MellunigM)
    $MailMessage.To.Add($PetritschS)
    $MailMessage.Subject = $Subject
    $MailMessage.BodyEncoding = [System.Text.Encoding]::UTF8
    $MailMessage.Body = $Body
    $MailMessage.IsBodyHtml = $true
    
    if ($Attachment) {
        $MailMessage.Attachments.Add($Attachment)
    }

    # Erstelle das SMTP-Client-Objekt
    $SmtpClient = [System.Net.Mail.SmtpClient]::new()
    $SmtpClient.Host = $SmtpServer
    $SmtpClient.UseDefaultCredentials = $true

    # Sende die E-Mail
    try {
        $SmtpClient.Send($MailMessage)
        Write-Log -Level INFO -Message "E-Mail erfolgreich gesendet an $To"
    }
    catch {
        Write-Host -Level ERROR -Message "Fehler beim Senden der E-Mail: $_"
    }

    Wait-Logging
}

function Get-AllADUsers {
    [CmdletBinding()]
    param (
        [Parameter()]
        $ParameterName
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Get All AD Accounts"
    
    Invoke-Timer -FunctionName $FunctionName -Description $Description

    $ADUsersParams = @{
        Filter     = '*'
        SearchBase = "DC=kostweingroup,DC=intern"
        Properties = @("SamAccountName", "pager", "Personalnummer", "DisplayName", "Company", "Country", "co", "c", "countryCode", "State", "Department", "departmentNumber", "language", "preferredLanguage", "jpegPhoto", "photo", "employeeType", "Office", "StreetAddress", "Created", "Description", "EmailAddress", "mail", "mailNickname", 'ProxyAddresses', "HomeMDB", "msExchMailboxGuid", "Enabled", "EmployeeID", "Manager", "Title", "GivenName", "Surname", "Name", "LastLogonDate", "LockedOut", "logonCount", "LogonWorkstations", "MobilePhone", "mobile", "MemberOf", "pwdLastSet", "lastLogon", "profilePath", "scriptPath", "homeDirectory", "homeDrive", "pager", "Modified", "whenChanged", "whenCreated")
    }

    $AllADUsers = Get-ADUser @ADUsersParams

    #$Script:OooVertrieb = (Get-ADGroup -Identity 'OutOfOffice_VERTRIEB').DistinguishedName
    #$Script:OooKostweinS = (Get-ADGroup -Identity 'OutOfOffice_KostweinS').DistinguishedName
    
    Invoke-Timer -FunctionName $FunctionName

    $ADUsers = $AllADUsers | Where-Object { 
        #$_.Enabled -eq $True -and
        $_.Name -notmatch '(^(Adm_|SVC_|DMC|MNC|EROWA|guest|6|Monitoring|Video|Toolset)|(t|T)est)|((M|m)essraum)' -and
        $null -ne $_.SurName -and $null -ne $_.GivenName -and
        $_.Description -notmatch 'Dienstkonto|[Ss]ervice' -and
        $_.DistinguishedName -notmatch '(?:OU|CN)\=(?:Allgemein|Service|IUSR_|Ressource)'
    }


    return [System.Collections.ArrayList]$ADUsers
}

function Get-ADUsers {
    
    Write-Log -Level INFO -Message "Get Users from AD"

    $ADUsersParams = @{
        Filter     = {
            (Name -notlike '*Service*') -and
            (Name -notlike '*Admin*') -and
            (Name -notlike '*Test*') -and
            (Name -notlike '*BPN*') -and
            (Name -notlike '*Linie*') -and
            (Name -notlike '*Instand*') -and
            (Name -notlike '*Produkt*') -and
            (Name -notlike '*Raum*') -and
            (Name -notlike '*60*') -and
            (Pager -notlike '*M*') -and
            (Pager -notlike '*S*') -and
            (Pager -notlike '*DA*') -and
            (Pager -notlike '*E*') -and
            (SamAccountName -notlike 'svc_*') -and
            (SamAccountName -notlike '*Service*') -and 
            (SamAccountName -notlike '*mgmt*') -and 
            (SamAccountName -notlike 'adm*') -and 
            (SamAccountName -notlike '*kiosk*') -and 
            (SamAccountName -notlike '*monitor*') -and 
            (SamAccountName -notlike 'EXT*') -and 
            (SamAccountName -notlike 'PC*')
        }
        SearchBase = "DC=kostweingroup,DC=intern"
        Properties = @("SamAccountName", "pager", "Personalnummer", "Company", "Country", "co", "State", "Department", "departmentNumber", "language", "preferredLanguage", "jpegPhoto", "photo", "employeeType", "Office", "StreetAddress", "Created", "Description", "EmailAddress", "mail", "HomeMDB", "msExchMailboxGuid", "Enabled", "EmployeeID", "Manager", "Title", "GivenName", "Surname", "Name", "LastLogonDate", "LockedOut", "logonCount", "LogonWorkstations", "MobilePhone", "mobile", "MemberOf", "pager", "Modified", "whenChanged", "whenCreated")
    }
    
    #$ADUsers = Get-ADUser @ADUsersParams | Where-Object { $_.Enabled -eq $True -and $null -ne $_.GivenName -and $null -ne $_.Surname }
    $ADUsers = Get-ADUser @ADUsersParams #| Where-Object { $null -ne $_.GivenName -and $null -ne $_.Surname }

    $ExcludedAD = @(
        'EROWA'
        'Photo Voltaic'
        'QlikView'
        'Jugendvertrauensrat'
        'Backup Topsolid'
        'Videobotschaft'
        'Toolset Haas'
        'DMC635I Macho'
        'Brandschutz MT1'
        'Brandschutz MT2'
        'guest user'
        'HR KOWEX'
        'Laser Cutting'
        'MNC 5'
        'SVHC'
        'Versand Klagenfurt'
    )

    return $ADUsers | Where-Object { $_.Name -notin $ExcludedAD }
}

function Get-ADGroupMembershipOld {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter()]
        [PSCustomObject] $ADEmployee
    )

    $ADGroupsToRemove = [System.Collections.ArrayList]::new()

    $ADGroupOUs = @{
        ExchangeGroup = 'MFA'
        MailArchiv    = "MailArchiv"
        OutOfOffice   = "OutOfOffice"
        SageGroup     = 'Sage'
    }
    
    foreach ($Group in $ADEmployee.ADGroups.Keys) {

        $GroupName = $ADEmployee.ADGroups.$Group
        $ADGroup = (Get-ADGroup -Identity $GroupName).DistinguishedName

        try {
            if ($ADEmployee.AD.MemberOf -notcontains $ADGroup) {
                
                Add-ADGroupMember -Identity $GroupName -Members $ADEmployee.AD.SamAccountName
                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully added to '$($GroupName)'."
            }
            else {
                Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] is already a member of '$($GroupName)'."
            }

        }
        catch {
            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not add user to '$($GroupName)'."
        }

        $GroupCN = ($ADGroup -split ',')[0]
        $GroupOU = $ADGroup.Split("$GroupCN,")[-1]
        $EmployeeGroupNames = $ADEmployee.AD.MemberOf | Where-Object { $_ -match $GroupOU -and $_ -ne $ADGroup }
        foreach ($Group in $EmployeeGroupNames) {
            $ADGroupsToRemove += $Group.Split(',')[0].Replace('CN=', '')
        }
        
        #TODO: Logic für Gruppenmitgliedschaft testen!

        <#
        try {
            # Check if the user is already a member of the group
            $isMember = '' -ne ($ADEmployee.AD.MemberOf -match $GroupName)
            
            if ($isMember -eq '') {
                # Add the user to the group
                #                Add-ADGroupMember -Identity $GroupName -Members $ADEmployee.AD.SamAccountName
                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully added to '$($GroupName)'."
                
            }
            else {
                Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] is already a member of '$($GroupName)'."
            }
        }
        catch {
            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not add user to '$($GroupName)'."
        }

        $GroupOU = "OU=$($ADGroupOUs.$Group)"
        $EmployeeGroupNames = $ADEmployee.AD.MemberOf | Where-Object { $_ -match $GroupOU } | ForEach-Object {
            $_.Split(",$GroupOU,")[0].Replace('CN=', '')
        }
        
        $ADGroupsToRemove += $EmployeeGroupNames | Where-Object { $_ -ne $GroupName }
        #>
    }

    if ($null -ne $ADGroupsToRemove) {

        foreach ($ADGroupToRemove in $ADGroupsToRemove) {
            try {
                Remove-ADGroupMember -Identity $ADGroupToRemove -Members $ADEmployee.AD.SamAccountName -Confirm:$false
                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully removed from '$($ADGroupToRemove)'."
                    
            }
            catch {
                Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not remove user from '$($ADGroupToRemove)'."
            }
        }
    }

}

function Get-ADGroupMembership {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter()]
        [PSCustomObject] $ADEmployee
    )

    #$ADGroupsToRemove = [System.Collections.ArrayList]::new()
    $GroupChanged = $false
    
    foreach ($Group in $ADEmployee.ADGroups.Keys) {
        if ($Group -eq 'SageGroup') {
            Get-SageADGroupMembership -Employee $ADEmployee
        }
        else {

            $GroupName = $ADEmployee.ADGroups.$Group
            $ADGroup = (Get-ADGroup -Identity $GroupName).DistinguishedName

            if ($Group -eq 'OutOfOffice') {
                $OooGroup = $ADEmployee.AD.MemberOf | Where-Object { $_ -match 'OutOfOffice' }
                if ($OooGroup) {
                    $ADGroup = $OooGroup | Select-Object -First 1
                }
            }
        
            try {
                if ($ADEmployee.AD.MemberOf -notcontains $ADGroup) {
                
                    # Use ShouldProcess to respect -WhatIf and -Confirm
                    if ($PSCmdlet.ShouldProcess("Adding [$($ADEmployee.Name)] to group '$GroupName'", "Add to AD group")) {
                        Add-ADGroupMember -Identity $GroupName -Members $ADEmployee.AD.SamAccountName

                        $GroupChanged = $True
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully added to '$($GroupName)'."
                    }
                
                }
                else {
                    Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] is already a member of '$($GroupName)'."
                }

            }
            catch {
                Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not add user to '$($GroupName)'."
            }
            <#
        $GroupCN = ($ADGroup -split ',')[0]
        $GroupOU = $ADGroup.Split("$GroupCN,")[-1]
        $EmployeeGroupNames = $ADEmployee.AD.MemberOf | Where-Object { $_ -match $GroupOU -and $_ -ne $ADGroup -and $_ -notmatch 'OutOfOffice' -and $_ -notmatch 'Sage__99' }
        foreach ($Group in $EmployeeGroupNames) {
            $ADGroupsToRemove += $Group.Split(',')[0].Replace('CN=', '')
        }
        #>

        }
        
    }
    <#
    if ($null -ne $ADGroupsToRemove) {

        foreach ($ADGroupToRemove in $ADGroupsToRemove) {
            try {
                
                # Use ShouldProcess to respect -WhatIf and -Confirm
                if ($PSCmdlet.ShouldProcess("Removing [$($ADEmployee.Name)] from group '$ADGroupToRemove'", "Remove from AD group")) {
                    Remove-ADGroupMember -Identity $ADGroupToRemove -Members $ADEmployee.AD.SamAccountName -Confirm:$false

                    $GroupChanged = $True
                    Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully removed from '$($ADGroupToRemove)'."
                }
                    
            }
            catch {
                Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not remove user from '$($ADGroupToRemove)'."
            }
        }
    }
    #>

    return $GroupChanged
}

function Get-SageADGroupMembership {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter()]
        [PSCustomObject] $Employee
    )
    
    if (-not [string]::IsNullOrEmpty($Employee.SageGroups.Add)) {
        $SageGroup = $Employee.SageGroups.Add.Split(',')[0].Replace('CN=', '')
        
        try {
            if ($PSCmdlet.ShouldProcess("Adding [$($ADEmployee.Name)] to group '$SageGroup'", "Adding to AD group")) {
                Add-ADGroupMember -Identity $SageGroup -Members $Employee.AD.SamAccountName
            }
            
        }
        catch {
            $ErrorMessage = $_.Exception.Message
            Write-Log -Level ERROR -Message "[$($Employee.Name)] Error: Could not add user to '$($SageGroup)'."
        }
    }

    if (-not [string]::IsNullOrEmpty($Employee.SageGroups.Remove)) {
        foreach ($SageGroup in $Employee.SageGroups.Remove) {
            $GroupName = $SageGroup.Split(',')[0].Replace('CN=', '')
            
            try {
                if ($PSCmdlet.ShouldProcess("Removing [$($Employee.Name)] from group '$GroupName'", "Remove from AD group")) {
                    Remove-ADGroupMember -Identity $GroupName -Members $Employee.AD.SamAccountName -Confirm:$false
                    Write-Log -Level INFO -Message "Removing [$($Employee.Name)] from group '$GroupName'"
                }
            }
            catch {
                $ErrorMessage = $_.Exception.Message
                Write-Log -Level ERROR -Message "[$($Employee.Name)] Error: Could not remove user from '$($SageGroup)'. $ErrorMessage"
            }
            
        }
    }
}

function Sync-ADUsers {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $Employees
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = 'Syncing SageData to AD User'
    Invoke-Timer -FunctionName $FunctionName -Description $Description
    
    $AccessDenied = [System.Collections.ArrayList]::new()
    $Updated = [System.Collections.ArrayList]::new()

    $KeinVorgesetzter = @{
        8901 = 'Kostwein Hans'
        8902 = 'Kostwein Heinz'
        8904 = 'Schrott-Kostwein Ulrike'
        1561 = 'Kostwein Stefan'
        1597 = 'Schlagbauer Peter'
        8905 = 'Schumy Oliver'
    }

    $NoAccessUser = @{
        1603 = 'Schrott-Kostwein Philipp'
        9633 = 'Kurtak Dario'
        1501 = 'Dolzer Paul'
        1644 = 'Sibitz Dietmar'
        1594 = 'Robl Thomas'
        1650 = 'Begusch Stefan'
        1663 = 'Hafner Georg'
    }

    $ADEmployees = $Employees | Where-Object { $null -ne $_.AD } | Where-Object { <# $_.AD.Enabled -eq $True -and #> $_.employeeID -ne '6100' }

    foreach ($ADEmployee in $ADEmployees) {
        
        if ($ADEmployee.Sage.PersNr -notin $NoAccessUser.Keys) {

            try {
                switch ($ADEmployee) {
                    { $_.Sage.UserPrincipalName -ne '' -and $_.AD.UserPrincipalName -ne $_.Sage.UserPrincipalName } {
                        $UserPrincipalName = $ADEmployee.Sage.UserPrincipalName
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] UserPrincipalName: '$($ADEmployee.AD.UserPrincipalName)' to '$($UserPrincipalName)'"

                        $ADEmployee.AD.UserPrincipalName = $UserPrincipalName
                        $Changed = $True
                    }
                    { $_.Sage.PersNr -ne '' -and $_.AD.EmployeeID -ne $_.Sage.PersNr } {
                
                        $Changed = $True

                        #TODO: EmployeeID mit Sage ID vergleichen und ändern
                        switch ($ADEmployee) {
                            { $_.AD.EmployeeID -ne $_.Sage.PersNr } {
                                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] EmployeeID: '$($ADEmployee.AD.EmployeeID)' to '$($ADEmployee.Sage.PersNr)'"
                                $ADEmployee.AD.EmployeeID = $ADEmployee.Sage.PersNr
                            }
                            { $_.AD.Personalnummer -ne $_.Sage.PersNr } {
                                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] Personalnummer: '$($ADEmployee.AD.Personalnummer)' to '$($ADEmployee.Sage.PersNr)'"
                                $ADEmployee.AD.Personalnummer = $ADEmployee.Sage.PersNr
                            }
                            default {
                                $Changed = $False
                            }
                        }
                
                    }
                    { $null -eq $_.AD.msExchMailboxGuid } {
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] No Mailbox found. Creating new with: '$($ADEmployee.Sage.eMail)'"

                        #TODO: WhatIf nach erfolgreichem Test entfernen
                        if ($ADEmployee.Sage.Country -ne 'IT') {
                            $NewMail = New-ExchangeMailbox -User $ADEmployee #-WhatIf
                        }
                        
                        #$Changed = $True

                    }
                    { $_.Sage.Mobil -ne '' -and $_.AD.MobilePhone -ne $_.Sage.Mobil } {
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] MobilePhone: '$($ADEmployee.AD.MobilePhone)' to '$($ADEmployee.Sage.Mobil)'"
                        
                        $ADEmployee.AD.MobilePhone = $ADEmployee.Sage.Mobil
                        $Changed = $True
                    }
                    { $_.Sage.preferredLanguage -ne $_.AD.preferredLanguage } {
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] Language: '$($ADEmployee.AD.preferredLanguage)' to '$($ADEmployee.Sage.preferredLanguage)'"

                        try {
                            $ADEmployee.AD | Set-ADUser -Replace @{preferredLanguage = $($ADEmployee.Sage.preferredLanguage) }
                        }
                        catch [Microsoft.ActiveDirectory.Management.ADException] {
                            Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] NoAccess"

                            $AccessDenied += $ADEmployee
                            $NoAccess = $True
                            break
                        }
                        catch {
                            $ErrorInfo = $_
                            $ErrorMessage = $_.Exception.Message
                            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not set language AD - $($ErrorMessage)" -ExceptionInfo $ErrorInfo
                        }
                
                    }
                    { $_.Sage.Country -ne '' -and $_.AD.Country -ne $_.Sage.Country } {
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] Country: '$($ADEmployee.AD.Country)' to '$($ADEmployee.Sage.Country)'"
                    
                        $ADEmployee.AD.Country = $ADEmployee.Sage.Country
                        $Changed = $True
                    }
                    Default {
                        $Changed = $False
                    }
                }

                if (-not ($NoAccess)) {

                    try {
                        #TODO: WhatIf nach erfolgreichem Test entfernen
                        $GroupChanged = Get-ADGroupMembership -ADEmployee $ADEmployee #-WhatIf
                    }
                    catch {
                        $ErrorInfo = $_
                        $ErrorMessage = $_.Exception.Message
                        Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] Error: $($ErrorMessage)"
                    }

                    if ($ADEmployee.Sage.VorgesetzterID -ne '') {
                        $Vorgesetzter = $ADEmployees | Where-Object { $_.Sage.ID -eq $ADEmployee.Sage.VorgesetzterID -and $ADEmployee.Sage.PersNr -notin $KeinVorgesetzter.Keys }

                        if ($ADEmployee.AD.Manager -notmatch $Vorgesetzter.AD.Name) {
                            if ($Vorgesetzter) {
                                $ADEmployee.AD.Manager = $Vorgesetzter.AD.DistinguishedName
                            }
                            elseif ([System.String]::IsNullOrEmpty($Vorgesetzter)) {
                                $ADEmployee.AD.Manager = $null
                            }
                            else {
                                Write-Log -Level WARNING -Message "[$($ADEmployee.Name)] Manager: Not matching"
                            }

                            $Changed = $True
                        }
                        else {
                            Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] Manager: Correct"
                        }
                
                    }

                    if ($Changed) {

                        try {
                            Write-Log -Level INFO -Message "[$($ADEmployee.Name)] Updating AD User"

                            Set-ADUser -Instance $ADEmployee.AD
                            $Updated += $ADEmployee
                        }
                        catch [Microsoft.ActiveDirectory.Management.ADException] {
                            $ErrorInfo = $_
                            $ErrorMessage = $_.Exception.Message
                            Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] Error: $($ErrorMessage)" #-ExceptionInfo $ErrorInfo

                            $AccessDenied += $ADEmployee
                        }
                        catch {
                            $ErrorInfo = $_
                            $ErrorMessage = $_.Exception.Message
                            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not update AD User - $($ErrorMessage)" -ExceptionInfo $ErrorInfo
                        }
                        finally {
                            Write-Log -Level MESSAGE "-------------------------------------------------------------------------------------------------"
                        }

                    }
                    elseif ($GroupChanged -or $NewMail) {
                        $Updated += $ADEmployee
                        Write-Log -Level MESSAGE "-------------------------------------------------------------------------------------------------"
                    }

                }
        
            }
            catch {
                $ErrorInfo = $_
                $ErrorMessage = $_.Exception.Message
                Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: $($ErrorMessage)." -ExceptionInfo $ErrorInfo
            }
            finally {
                if ($ADGroupOnly) {
                    $Updated += $ADEmployee
                    Write-Log -Level MESSAGE "-------------------------------------------------------------------------------------------------"
                }
                $ADGroupOnly = $False
                $Changed = $False
                $NoAccess = $False
                $GroupChanged = $False
                $NewMail = $False
            }

        }
        else {
            $AccessDenied += $ADEmployee
        }
    
    }
    
    Invoke-Timer -FunctionName $FunctionName

    return @{
        ChangedInAD  = $Updated
        AccessDenied = $AccessDenied
    }

}

function New-ExchangeMailbox {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [PSCustomObject] $User
    )

    $SageUser = $User.Sage

    if (-not (Get-Module "tmp_*")) {
        #if (-not (Get-Command -Name Get-Mailbox -ErrorAction SilentlyContinue)) {
        Connect-ToExchange | Out-Null
    }

    $NewMail = $False

    #$OU = ($User.AD.DistinguishedName -split "$($SageUser.Vorname),")[1]
    $MailboxDB = "KOWEX_$($SageUser.Country)_DB"

    #$Mailbox = Get-Mailbox -Anr $User.Nachname
    #$Mailbox = Get-Mailbox -Identity $User.AD.DistinguishedName -ErrorAction SilentlyContinue
    $Mailbox = Get-Mailbox -Identity $User.AD.SamAccountName -ErrorAction SilentlyContinue

    if (-not($Mailbox)) {

        # Create a mailbox for the specified user
        try {
            if ($PSCmdlet.ShouldProcess("Mailbox for [$($User.Name)]", "Create new mailbox")) {
                Enable-Mailbox -Identity $User.AD.SamAccountName -Database $MailboxDB | Out-Null
                #Enable-Mailbox -Identity $User.AD.SamAccountName -Database $MailboxDB -PrimarySmtpAddress $User.AD.UserPrincipalName | Out-Null
                $NewMail = $True
                $Script:NewMailbox += $User

                Write-Log -Level INFO -Message "[$($User.Name)] Mailbox created: $($SageUser.Email)."
            }
            
        }
        catch {
            Write-Log -Level ERROR -Message "[$($User.Name)] Failed to create a mailbox: $_"
        }

    }

    return $NewMail

}

function Get-ADUserMailbox {
    [CmdletBinding()]
    param (
        [PSCustomObject] $User
    )

    if (-not (Get-Module "tmp_*")) {
        #if (-not (Get-Command -Name Get-Mailbox -ErrorAction SilentlyContinue)) {
        Connect-ToExchange
    }

    $SageUser = $User.Sage

    # Check if the user exists in AD by email and if they have a mailbox
    try {

        if ($null -ne $User.AD) {
            $ADUser = $User.AD
        }
        else {
            #$ADUser = Get-ADUser -Filter "Mail -eq '$($SageUser.Email)'" -Properties Mail, HomeMDB, msExchMailboxGuid
        }

        if ($ADUser) {
            if ($ADUser.msExchMailboxGuid) {
                #Write-Host "User $($SageUser.Name) already has a mailbox." -ForegroundColor Yellow

                try {
                    $Mailbox = Get-Mailbox -Identity $ADUser.SamAccountName -ErrorAction SilentlyContinue

                    if ($Mailbox) {
                        #Write-Host "Mailbox $($Mailbox.PrimarySmtpAddress) found." -ForegroundColor Yellow
                        return $Mailbox
                    }
                    else {
                        Write-Log -Level WARNING -Message "[$($ADUser.SamAccountName)] Mailbox not found."

                    }
                }
                catch {
                    Write-Log -Level ERROR -Message "[$($ADUser.SamAccountName)] Error checking mailbox: $_"
                }

                return $true
            }
            else {
                Write-Log -Level WARNING -Message "User $($SageUser.Name) exists but does not have a mailbox."
                return $false
            }
        }
        else {
            Write-Log -Level WARNING -Message "User $($SageUser.Name) not found in AD."
            return $null
        }
    }
    catch {
        Write-Log -Level ERROR -Message "Error checking AD user: $_"
        return $null
    }
}

function Update-MailAddressPolicy {
    [CmdletBinding()]
    param (
        [Parameter()]
        [System.Collections.ArrayList] $Policies
    )

    if (-not (Get-Module "tmp_*")) {
        Connect-ToExchange
    }
    
    $AdressPolicies = Get-EmailAddressPolicy

    foreach ($Policy in $Policies) {
        $PolicyData = $AdressPolicies | Where-Object { $_.Name -match $Policy }
        if ($PolicyData) {
            Write-Log -Level INFO -Message "[$($PolicyData.Name)] Update Email Address Policy."
            Update-EmailAddressPolicy -Identity $PolicyData.Name | Out-Null
        }
    }

}

function Get-eMailStatus {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $Country,
        $AllEmployees
    )

    $InSageCountry = $AllEmployees | Where-Object { $null -ne $_.Sage -and $_.Sage.Country -eq $Country } | Sort-Object Name

    $InAD = $AllEmployees | Where-Object { $null -ne $_.AD } | Sort-Object Name
    $InADCountry = $InAD | Where-Object { $_.Sage.Country -eq $Country }

    $MissingInAD = $AllEmployees | Where-Object { $null -eq $_.AD } | Sort-Object Name
    $MissingInADCountry = $MissingInAD | Where-Object { $_.Sage.Country -eq $Country }

    $CountryEmployees = $AllEmployees | Where-Object { $_.Sage.Country -eq $Country } | Sort-Object Name
    $NoeMailAD = $InADCountry | Where-Object { $null -eq $_.AD.mail }

    $NoeMailorNotInAD = @()
    $NoeMailorNotInAD += $MissingInADCountry
    $NoeMailorNotInAD += $NoeMailAD
    
    $ADSageDiff = $InADCountry | ForEach-Object {
        if ($_.Sage.eMail -ne '' -and $null -ne $_.AD.mail) {
            if ($_.AD.mail.ToLower() -ne $_.Sage.eMail.ToLower()) {
                $_
            }
        }
    }

    [PSCustomObject]@{
        Employees        = [PSCustomObject]@{
            InSage      = $InSageCountry
            InAD        = $InADCountry
            MissingInAD = $MissingInADCountry
        }
        eMailSage        = $CountryEmployees | Where-Object { $_.Sage.eMail -ne '' }
        NoEmailSage      = $CountryEmployees | Where-Object { $_.Sage.eMail -eq '' }
        eMailAD          = $CountryEmployees | Where-Object { $null -ne $_.AD.mail }
        NoEmailAD        = $NoeMailAD #$CountryEmployees | Where-Object { $null -eq $_.AD.mail }
        NotInAD          = $MissingInADCountry
        NoeMailorNotInAD = $NoeMailorNotInAD
        ADSageDiff       = $ADSageDiff
    }
}

function Connect-ToExchange {
    PARAM (
        [Parameter(HelpMessage = 'http://<ServerFQDN>/powershell')]
        [system.string]$ConnectionUri = 'http://kowex01/powershell',

        [Alias('RunAs')]
        [pscredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )

    try {

        $Splatting = @{
            ConnectionUri     = $ConnectionUri
            ConfigurationName = 'microsoft.exchange'
        }

        IF ($PSBoundParameters['Credential']) { 
            $Splatting.Credential = $Credential 
        }

        # Load Exchange cmdlets (Implicit remoting)
        Import-PSSession -Session (New-PSSession @Splatting) -WarningAction SilentlyContinue | Out-Null

    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}

function Get-DynamicThrottleLimit {
    [CmdletBinding()]
    param (
        [int]$MaxLimit = 16
    )

    $ProcTime = '\Processor(_Total)\% Processor Time'     # enUS
    $ProcTime = '\prozessor(_total)\prozessorzeit (%)'    # deAT
    

    $CPUUsage = (Get-Counter $ProcTime).CounterSamples[0].CookedValue
    $CPUUsage = [math]::Round($CPUUsage, 2)

    $ThrottleLimit = if ($CPUUsage -lt 50) { 
        $MaxLimit 
    }
    else { 
        [math]::Max([math]::Floor($MaxLimit / 2), 1) 
    }
    
    Write-Log -Level INFO -Message "Throttle limit set to: $ThrottleLimit (CPU Usage: $CPUUsage%)"
    
    return $ThrottleLimit
}

function Get-GroupMembers {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $GroupName,
        [string] $GroupFilter,
        [string] $Country,
        [switch] $IsMember = $false
    )

    $AllAD = Get-AllADUsers
    if ($Country) {
        $AllAD = $AllAD | Where-Object { $_.Country -eq $Country }
    }

    if ($GroupName) {
        $ADGroup = Get-ADGroup -Identity $GroupName
    }
    elseif ($GroupFilter) {
        $ADGroup = Get-ADGroup -Filter { Name -like $GroupFilter }
    }
    else {
        Write-Log -Level WARNING -Message "No valid GroupName or GroupFilter provided."
    }
    
    $GroupMembers = $ADGroup | ForEach-Object {
        Get-ADGroupMember -Identity $_ -Recursive |
            Where-Object { $_.objectClass -eq 'user' }
        } | Select-Object -ExpandProperty SamAccountName -Unique

    if ($IsMember) {
        $GroupMembers = $AllAD | Where-Object { $GroupMembers -contains $_.SamAccountName }
    }
    else {
        $GroupMembers = $AllAD | Where-Object { $GroupMembers -notcontains $_.SamAccountName }
    }

    return $GroupMembers

    #$NoAtMailArchiv = Get-GroupMembers -GroupFilter 'MailArchiv*AT*' -Country 'AT'
}

function Get-ADUserData {

    #TODO: Dynamischere Function erstellen

    $AllAD = Get-AllADUsers
    $AllItaly = $AllAD | Where-Object { $_.Country -eq 'IT' }
    
    #$ItalyNoHomeDrive = $AllItaly | Where-Object { [string]::IsNullOrEmpty($_.homeDirectory) }
    
    $AllItaly | ForEach-Object {
        $Changed = $false
        $PasswordReset = $false

        switch ($_) {
            { $_.profilePath -eq 'UDIT.bat' } {
                $_.profilePath = ''
                $Changed = $true
            }
            { [string]::IsNullOrEmpty($_.scriptPath) } {
                Write-Log -Level WARNING -Message "[$($_.Name)] scriptPath from $($_.scriptPath) to UDIT.bat"
                $_.scriptPath = "UDIT.bat"

                $Changed = $true
            }
            { $_.UserPrincipalName -notmatch 'metalinox' } {
                $UserPrincipalName = "$($_.GivenName).$($_.SurName)@kostwein-metalinox.it"
                Write-Log -Level WARNING -Message "[$($_.Name)] UserPrincipalName from $($_.UserPrincipalName) to $UserPrincipalName"
                $_.UserPrincipalName = $UserPrincipalName

                $Changed = $true
            }
            { $null -eq $_.lastLogon } {
                $LastSet = [datetime]::FromFileTime($_.pwdLastSet).ToShortDateString()
                Write-Log -Level WARNING -Message "[$($_.Name)] to Standard Password logonCount: $($_.logonCount) LastSet: $($LastSet)"

                $Credentials = New-Credentials -UserName $_.SamAccountName
                Set-ADAccountPassword -Identity $_.SamAccountName -NewPassword $Credentials.Password -Reset
                $PasswordReset = $true
            }
            Default {
                #Write-Host "$($_.Name) - OK"
            }
        }

        if ($Changed) {
            
            if ($PasswordReset) {
                Set-ADUser -Instance $_ -PassThru | Set-ADUser ChangePasswordAtLogon $true
            }
            else {
                Set-ADUser -Instance $_
            }
            
        }

        Wait-Logging
    }

    return
}

#Get-ADUserData

#endregion Functions

#region    Main
#TODO: Alle Österr. welche kein MailArchiv zu MailArchiv_AT
#TODO: Nur physische Mitarbeiter haben den Pager: P
#TODO: ADM User bekommen Pager: R


$Description = "Processing Sage to AD Sync"
Invoke-Timer -FunctionName $ScriptName -Description $Description

#$ADUsers = Get-ADUsers
#$ADUsers = Get-AllADUsers

$SageData = Import-SageData -SageCSVFile $SageCSVFilePath #| Where-Object { $_.Standort -ne 'Italien' }
$Employees = Start-SageDataProcess -SageData $SageData #-ADUsers $ADUsers
#$EmployeesAT = $Employees | Where-Object { $_.Sage.Country -eq 'AT' }
$EmployeesToSync = $Employees | Where-Object { $_.Sage.Country -ne 'IT' }
#$ResetPass = $Employees | Where-Object { $_.AD.LastLogonDate -eq $null }
$MissSpelled = $Employees | Where-Object { $_.Sage.Nachname -match '_|[0-9]' }

$SageADGroupNames = $EmployeesToSync.ADGroups.SageGroup | Sort-Object -Unique
Sync-SageADGroups -SageADGroupNames $SageADGroupNames

$UpdatedEmployees = Get-MissingADUser -Employees $EmployeesToSync
Get-MailDifference -Employees $EmployeesToSync #| Where-Object { $_.Sage.Country -ne 'IT' }

#$ADSync = Sync-ADUsers -Employees $EmployeesAT
$ADSync = Sync-ADUsers -Employees $EmployeesToSync

Invoke-Timer -FunctionName $ScriptName

Start-Sleep -Seconds 1

<#
$eMailList = [PSCustomObject]@{
    AT = Get-eMailStatus -Country 'AT' -AllEmployees $Employees
    HR = Get-eMailStatus -Country 'HR' -AllEmployees $Employees
    IN = Get-eMailStatus -Country 'IN' -AllEmployees $Employees
    US = Get-eMailStatus -Country 'US' -AllEmployees $Employees
    IT = Get-eMailStatus -Country 'IT' -AllEmployees $Employees
}

$NoEmailAD = [PSCustomObject]@{
    AT = $eMailList.AT.NoeMailorNotInAD.Count
    HR = $eMailList.HR.NoeMailorNotInAD.Count
    IN = $eMailList.IN.NoeMailorNotInAD.Count
    US = $eMailList.US.NoeMailorNotInAD.Count
    IT = $eMailList.IT.NoeMailorNotInAD.Count
}
$TotalNoEmailAD = ($NoEmailAD.AT + $NoEmailAD.HR + $NoEmailAD.IN + $NoEmailAD.US + $NoEmailAD.IT)

$NotInAD = [PSCustomObject]@{
    AT = $eMailList.AT.NotInAD.Count
    HR = $eMailList.HR.NotInAD.Count
    IN = $eMailList.IN.NotInAD.Count
    US = $eMailList.US.NotInAD.Count
    IT = $eMailList.IT.NotInAD.Count
}
$TotalNotInAD = ($NotInAD.AT + $NotInAD.HR + $NotInAD.IN + $NotInAD.US + $NotInAD.IT)

$MissingInAD = $Employees | Where-Object { $null -eq $_.AD } | Sort-Object Name
$MissingInADItaly = $MissingInAD | Where-Object { $_.Sage.Country -eq 'IT' }
$MissingInADOther = $MissingInAD | Where-Object { $_ -notin $MissingInADItaly } | Sort-Object Name
$MissingInSage = $ADUsers | Where-Object { $_ -notin $Employees.AD } | Sort-Object Name

$NeverLoggedOn = $MissingInSage | Where-Object { $_.LastLogonDate -eq $null }
$MissingInSageLogon = $MissingInSage | Where-Object { $_.LastLogonDate -ne $null }

$ChangedInAD = $ADSync.ChangedInAD
$AccessDenied = $ADSync.AccessDenied


Add-LoggingTarget -Name Console -Configuration @{
    Format       = $ResultLogFormat
    ColorMapping = @{
        RESULT = 'Cyan'
    }
}

Write-Log -Level RESULT -Message "---------------------------------------------"
Write-Log -Level RESULT -Message "New AD Sage Groups     : $($CreatedADSageGroups.Count)"
Write-Log -Level RESULT -Message "New Mailbox created    : $($Script:NewMailbox.Count)"
Write-Log -Level RESULT -Message "Changed in AD          : $($ChangedInAD.Count)"
Write-Log -Level RESULT -Message "Missing in AD (Italy)  : $($MissingInADItaly.Count)"
Write-Log -Level RESULT -Message "Missing in AD (Other)  : $($MissingInADOther.Count)"
Write-Log -Level RESULT -Message "Access Denied          : $($AccessDenied.Count)"
Write-Log -Level RESULT -Message "---------------------------------------------"
Write-Log -Level RESULT -Message "No eMail in AD (AT)    : $($NoEmailAD.AT)"
Write-Log -Level RESULT -Message "No eMail in AD (HR)    : $($NoEmailAD.HR)"
Write-Log -Level RESULT -Message "No eMail in AD (IN)    : $($NoEmailAD.IN)"
Write-Log -Level RESULT -Message "No eMail in AD (US)    : $($NoEmailAD.US)"
Write-Log -Level RESULT -Message "No eMail in AD (IT)    : $($NoEmailAD.IT)"
Write-Log -Level RESULT -Message "No eMail in AD (Total) : $($TotalNoEmailAD)"
Write-Log -Level RESULT -Message "---------------------------------------------"
Write-Log -Level RESULT -Message "Not in AD (AT)    : $($NotInAD.AT)"
Write-Log -Level RESULT -Message "Not in AD (HR)    : $($NotInAD.HR)"
Write-Log -Level RESULT -Message "Not in AD (IN)    : $($NotInAD.IN)"
Write-Log -Level RESULT -Message "Not in AD (US)    : $($NotInAD.US)"
Write-Log -Level RESULT -Message "Not in AD (IT)    : $($NotInAD.IT)"
Write-Log -Level RESULT -Message "Not in AD (Total) : $($TotalNotInAD)"
Write-Log -Level RESULT -Message "---------------------------------------------"

Wait-Logging


try {
    foreach ($Country in $eMailList.PSObject.Properties) {
        $CountryName = $Country.Name
        foreach ($Status in $eMailList.$CountryName.PSObject.Properties) {
            $StatusName = $Status.Name
            $StatusResults = $eMailList.$CountryName.$StatusName

            if (-not ($StatusResults.Sage)) {
                foreach ($StatusResult in $StatusResults.PSObject.Properties) {
                    $ResultName = $StatusResult.Name
                    $Export = $StatusResults.$ResultName | Select-Object -ExcludeProperty Sage, AD, SamAccountName, GenSamAccName
                    $Export | Export-Csv -Path "$ExportsPath\$($CountryName)_$($StatusName)_$($ResultName).csv" -Delimiter ';' -NoTypeInformation
                }
            }
            else {
                $Export = $StatusResults | Select-Object -ExcludeProperty Sage, AD, SamAccountName, GenSamAccName
                $Export | Export-Csv -Path "$ExportsPath\$($CountryName)_$($StatusName).csv" -Delimiter ';' -NoTypeInformation
            }
        
        }
    }
}
catch {
    Write-Log -Level ERROR -Message "Failed to create CSV" -ExceptionInfo $_
}



#$ATEinAus = $eMailList.AT.NotInAD.Sage | Select-Object -Property Nachname, Vorname, Eintritt, Austritt, Tätigkeit, Standort | Format-Table -AutoSize
#$ATEinAus


$Today = Get-Date -Format "yyyyMMdd_HHmm"

$AccessDenied | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesAccessDenied.xml" -Force
$ChangedInAD | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesUpdated_$($Today).xml" -Force
$MissingInAD | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesMissingInAD.xml" -Force
$MissingInADItaly | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesMissingInADItaly.xml" -Force
$MissingInADOther | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesMissingInADOther.xml" -Force
$MissingInSage | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesMissingInSage.xml" -Force
$NeverLoggedOn  | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesNeverLoggedOn.xml" -Force

#endregion Main
#>
#Stop-MyTimer -Name $ScriptName -PassThru


