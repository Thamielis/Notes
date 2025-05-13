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
