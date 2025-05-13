$Script:ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
[string]$ScriptName = [System.IO.Path]::GetFileName($MyInvocation.MyCommand.Definition)
[string]$ScriptFullName = Join-Path -Path $ScriptPath -ChildPath $ScriptName

$Script:LogsPath = Join-Path -Path $Script:ScriptPath -ChildPath '.logs'
$Script:ExportsPath = Join-Path -Path $Script:ScriptPath -ChildPath 'exports'

$SageCSVPath = "\\atklprint\sageimport$"
$SageCSVFilePath = Join-Path -Path $SageCSVPath -ChildPath 'canon.csv'

$Script:TextInfo = (Get-Culture).TextInfo

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

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
        $Script:LogPattern = '[%{pid}] [%{level:-7}] [%{lineno:3}] [%{caller}] %{message}'
    }
    else {
        $Script:LogPattern = '[%{level:-7}] [%{lineno:3}] %{message}'
    }

    $Script:LogConsolePattern = '[%{timestamp:+%T:12}] ' + $Script:LogPattern
    $Script:LogFilePattern = '[%{timestamp}] ' + $Script:LogPattern
    $Script:ResultLogFormat = '[%{timestamp:+%T:12}] [%{level:-7}] %{message}'

    Add-LoggingLevel -LevelName 'RESULT' -Level 60
<#
    Add-LoggingTarget -Name Console -Configuration @{
        Format         = $Global:LogConsolePattern          # <Not required> Sets the logging format for this target
        PrintException = $true                              # <Not required> Prints stacktrace
        ColorMapping   = @{
            RESULT  = 'Cyan'
            DEBUG   = 'Blue'
            INFO    = 'Green'
            WARNING = 'Yellow'
            ERROR   = 'Red'
        }
    }
#>
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
}

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

function Sync-SageADGroupsOld {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )

    Write-Log -Level INFO -Message "Checking/Creating Sage AD Groups"

    $NewSageADGroups = [System.Collections.ArrayList]::new()

    $MissingSageADGroups = $SageADGroupNames | Where-Object { 
        !(Get-ADGroup -Filter { Name -eq $_ } -ErrorAction SilentlyContinue) 
    }

    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = 'OU=Sage,OU=Gruppen,OU=Allgemein,OU=Kostwein Gruppe,DC=kostweingroup,DC=intern'
    }

    foreach ($MissingGroup in $MissingSageADGroups) {
        if ($PSCmdlet.ShouldProcess("AD Group $MissingGroup", "Create")) {
            try {
                $ADGroupParams.Name = $MissingGroup
                New-ADGroup @ADGroupParams

                Write-Log -Level INFO -Message "Successfully created AD Group: $MissingGroup"
                $NewSageADGroups.Add($MissingGroup)
            }
            catch {
                Write-Log -Level ERROR -Message "Failed to create AD Group: $MissingGroup" -ExceptionInfo $_
            }
        }
    }

    return $NewSageADGroups
}

function Sync-SageADGroups {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [System.Collections.Generic.HashSet[string]]$SageADGroupNames
    )
    
    #$FunctionName = $MyInvocation.MyCommand.Name
    #$Description = "Checking/Creating Sage AD Groups"
    #Invoke-Timer -FunctionName $FunctionName -Description $Description

    $NewSageADGroups = [System.Collections.ArrayList]::new()
    
    $ADGroupParams = @{
        Name          = ''
        GroupScope    = 'Global'
        GroupCategory = 'Security'
        Path          = 'OU=Sage,OU=Gruppen,OU=Allgemein,OU=Kostwein Gruppe,DC=kostweingroup,DC=intern'
    }
    
    $AllSageGroups = Get-ADGroup -SearchBase $ADGroupParams.Path -Filter '*'

    $SageADGroupNames | ForEach-Object {
        $GroupName = $_
        try {
            if ($AllSageGroups.Name -notcontains $GroupName) {
                if ($PSCmdlet.ShouldProcess("AD Group $GroupName", "Create")) {
                    $ADGroupParams.Name = $GroupName
                    New-ADGroup @ADGroupParams

                    $NewSageADGroups += $GroupName
                    Write-Log -Level INFO -Message "Successfully created AD Group: $GroupName"
                }
                
                Wait-Logging
            }
        }
        catch {
            Write-Log -Level 'ERROR' -Message "Error creating group: $GroupName"
        }
    }
    
    if ($NewSageADGroups.Count -gt 0) {
        $Message = "`nNeu angelegte Sage AD Gruppen: `n`t $($NewSageADGroups -join `",`n`t `")"
        $Body = Build-MailBody -NewSageADGroups $NewSageADGroups

        Send-Mail -Subject "Sage AD Groups" -Body $Body
        Write-Log -Level DEBUG -Message $Message
    }
    
    Wait-Logging
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
        Properties = @("SamAccountName", "Personalnummer", "Company", "Country", "co", "State", "Department", "departmentNumber", "language", "preferredLanguage", "jpegPhoto", "photo", "employeeType", "Office", "StreetAddress", "Created", "Description", "EmailAddress", "mail", "Enabled", "EmployeeID", "Manager", "Title", "GivenName", "Surname", "Name", "LastLogonDate", "LockedOut", "logonCount", "LogonWorkstations", "MobilePhone", "mobile", "MemberOf", "pager", "Modified", "whenChanged", "whenCreated")
    }

    $ADUsers = Get-ADUser @ADUsersParams | Where-Object { $_.Enabled -eq $True -and $null -ne $_.GivenName -and $null -ne $_.Surname }

    return $ADUsers
}

function Sync-ADUsers {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $Employees
    )

    Write-Log -Level INFO -Message 'Syncing SageData to AD User'
    $AccessDenied = [System.Collections.ArrayList]::new()
    $Updated = [System.Collections.ArrayList]::new()

    $ADEmployees = $Employees | Where-Object { $null -ne $_.AD } | Where-Object { $_.AD.Enabled -eq $True -and $_.employeeID -ne '6100' }

    foreach ($ADEmployee in $ADEmployees) {
    
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
    
        if ($ADEmployee.Sage.PersNr -notin $NoAccessUser.Keys) {

            try {
                switch ($ADEmployee) {
                    { [string]::IsNullOrEmpty($_.AD.UserPrincipalName) } {
                        $UserPrincipalName = "$($ADEmployee.Sage.Vorname.split(' ')[0]).$($ADEmployee.Sage.Nachname)@kostwein.$($ADEmployee.Sage.Country.ToLower())"
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] UserPrincipalName: '$($ADEmployee.AD.UserPrincipalName)' to '$($UserPrincipalName)'"

                        $_.AD.UserPrincipalName = $UserPrincipalName

                        $Changed = $true
                    }
                    { $_.Sage.PersNr -ne '' -and $_.AD.EmployeeID -ne $_.Sage.PersNr } {
                
                        $Changed = $True

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
                    { $_.Sage.ADSageGroup -ne '' } {

                        try {
                            # Check if the user is already a member of the group
                            $isMember = '' -ne ($ADEmployee.AD.MemberOf -match $ADEmployee.Sage.ADSageGroup)
                            
                            if ($isMember -eq '') {
                                # Add the user to the group
                                Add-ADGroupMember -Identity $ADEmployee.Sage.ADSageGroup -Members $ADEmployee.AD.SamAccountName
                                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully added to '$($ADEmployee.Sage.ADSageGroup)'."

                                $ADGroupOnly = $True
                            }
                            else {
                                Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] is already a member of '$($ADEmployee.Sage.ADSageGroup)'."
                            }
                        }
                        catch {
                            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not add user to '$($ADEmployee.Sage.ADSageGroup)'."
                        }

                        $EmployeeSageGroupNames = $ADEmployee.AD.MemberOf | Where-Object { $_ -match 'OU=Sage' } | ForEach-Object {
                            $_.Split(',OU=Sage,')[0].Replace('CN=', '')
                        }
                        #$EmployeeSageGroupNames = $EmployeeSageGroups.Split(',OU=Sage,')[0].Replace('CN=', '')
                        #$SageADGroupsToRemove = $Script:SageADGroupNames | Where-Object { $_ -in $EmployeeSageGroupNames -and $_ -ne $ADEmployee.Sage.ADSageGroup }
                        $SageADGroupsToRemove = $EmployeeSageGroupNames | Where-Object { $_ -in $Script:SageADGroupNames -and $_ -ne $ADEmployee.Sage.ADSageGroup }

                        if ($null -ne $SageADGroupsToRemove) {

                            foreach ($SageADGroupToRemove in $SageADGroupsToRemove) {
                                try {
                                    Remove-ADGroupMember -Identity $SageADGroupToRemove -Members $ADEmployee.AD.SamAccountName -Confirm:$false
                                    Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully removed from '$($SageADGroupToRemove)'."

                                    $ADGroupOnly = $True
                                }
                                catch {
                                    Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not remove user from '$($SageADGroupToRemove)'."
                                }
                            }
                        }
                        
                    }
                    Default {
                        $Changed = $False
                    }
                }

                if (-not ($NoAccess)) {

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
                            Write-Log -Level WARNING "-------------------------------------------------------------------------------------------------"
                        }

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
                    Write-Log -Level WARNING "-------------------------------------------------------------------------------------------------"
                }
                $ADGroupOnly = $False
                $Changed = $False
                $NoAccess = $False
            }

        }
        else {
            $AccessDenied += $ADEmployee
        }
    
    }

    return @{
        ChangedInAD  = $Updated
        AccessDenied = $AccessDenied
    }

}
#endregion Functions

#region    Main
Write-Log -Level INFO -Message " "
Write-Log -Level INFO -Message "#################### Sync-Sage2AD ##########################"

$ADUsers = Get-ADUsers
$SageData = Import-SageData -SageCSVFile $SageCSVFilePath | Where-Object { $_.Standort -ne 'Italien' }
$Employees = Start-SageDataProcess -SageData $SageData -ADUsers $ADUsers

Sync-SageADGroups -SageADGroupNames $Script:SageADGroupNames
$ADSync = Sync-ADUsers -Employees $Employees

$MissingInAD = $Employees | Where-Object { $null -eq $_.AD } | Sort-Object Name
$MissingInADItaly = $MissingInAD | Where-Object { $_.Sage.Country -eq 'IT' }
$MissingInADOther = $MissingInAD | Where-Object { $_ -notin $MissingInADItaly } | Sort-Object Name
$MissingInSage = $ADUsers | Where-Object { $_ -notin $Employees.AD } | Sort-Object Name
$ChangedInAD = $ADSync.ChangedInAD
$AccessDenied = $ADSync.AccessDenied

$Today = Get-Date -Format "yyyyMMdd_HHmm"

#$AccessDenied | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesAccessDenied.xml" -Force
#$ChangedInAD | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesUpdated_$($Today).xml" -Force
#$MissingInAD | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesMissingInAD.xml" -Force
#$MissingInADItaly | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesMissingInADItaly.xml" -Force
#$MissingInADOther | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesMissingInADOther.xml" -Force
#$MissingInSage | Sort-Object -Property Name | Export-Clixml -Path "$ExportsPath\EmployeesMissingInSage.xml" -Force
<#
Add-LoggingTarget -Name Console -Configuration @{
    Format = $ResultLogFormat
    ColorMapping   = @{
            RESULT  = 'Cyan'
        }
}
#>
Write-Log -Level RESULT -Message "---------------------------------------------"
Write-Log -Level RESULT -Message "Changed in AD        : $($ChangedInAD.Count)"
Write-Log -Level RESULT -Message "Missing in AD (Italy): $($MissingInADItaly.Count)"
Write-Log -Level RESULT -Message "Missing in AD (Other): $($MissingInADOther.Count)"
Write-Log -Level RESULT -Message "Access Denied        : $($AccessDenied.Count)"
Write-Log -Level RESULT -Message "---------------------------------------------"
Write-Log -Level RESULT -Message "#################### Finished ##########################"
Wait-Logging
#endregion Main

Start-Sleep -Seconds 1

