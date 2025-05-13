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

    if ($GetADUsers -or [string]::IsNullOrEmpty($global:SyncHash.ObjectsCache.ADUsers)) {
        $global:SyncHash.ObjectsCache.GetADUsers()
    }
    
    $ADUsers = $global:SyncHash.ObjectsCache.ADUsers.Values

    <#
    if ($GetADUsers -or $null -eq $Script:ADUsers) {
        $Script:ADUsers = Get-AllADUsers
        $global:SyncHash.AD.AllADUsers = $Script:ADUsers
    }
    
    $ADUsers = $Script:ADUsers
    #>

    # Initialize variables
    $ADUser = $null
    $ADFoundWith = $null

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
            ExchangeGroup = $ExchangeGroup
            #MailArchiv    = "MailArchiv_$($UserData.Country)"
            OutOfOffice   = "OutOfOffice_$($UserData.Country)"
            SageGroup     = $UserData.ADSageGroup
        }
        Mailbox        = 'Missing'
        Changes        = [Ordered]@{}
    }

    # Define matching logic
    $matchingLogic = [ordered]@{
        SamAcc         = { 
            if ($UserData.SamAccountName -ne '') {
                $ADUsers | Where-Object { 
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

            $DistinguishedName = "CN=$($Employee.ADGroups.SageGroup),$($global:SyncHash.Config.ADGroups.SageGroups.Path)"
            $SageGroupsMemberOf = $Employee.AD.MemberOf | Where-Object { $_ -match "$($global:SyncHash.Config.ADGroups.SageGroups.Path)$" }
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

            break
        }
    }
    
    return $Employee
}
