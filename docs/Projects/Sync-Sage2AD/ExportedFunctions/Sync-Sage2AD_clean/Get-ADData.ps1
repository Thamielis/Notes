function Get-ADData {
    [CmdletBinding()]
    param (
        #[Parameter()]
        #[Object] $SyncHash,
        [Parameter()]
        [switch] $ADUsers = $false,
        [Parameter()]
        [switch] $ADGroups = $false
    )
    
    if ($ADUsers) {
        $Properties = @("SamAccountName", "pager", "Personalnummer", "Company", "Country", "co", "State", "Department", "departmentNumber", "language", "preferredLanguage", "jpegPhoto", "photo", "employeeType", "Office", "StreetAddress", "Created", "Description", "EmailAddress", "mail", 'ProxyAddresses', "HomeMDB", "msExchMailboxGuid", "Enabled", "EmployeeID", "Manager", "Title", "GivenName", "Surname", "Name", "LastLogonDate", "LockedOut", "logonCount", "LogonWorkstations", "MobilePhone", "mobile", "MemberOf", "pager", "Modified", "whenChanged", "whenCreated")
        Get-ADUser -Filter '*' -Properties $Properties | ForEach-Object {
            $SyncHash.ObjectsCache.Users.Add("$($_.SamAccountName.ToLower())", $_)
        }

        $SyncHash.ObjectsCache.Users.Values | Where-Object { 
            $_.Name -notmatch '(^(Adm_|SVC_|DMC|MNC|EROWA|guest|6|Monitoring|Video|Toolset)|(t|T)est)|((M|m)essraum)' -and 
            $null -ne $_.SurName -and $null -ne $_.GivenName -and 
            $_.Description -notmatch 'Dienstkonto|[Ss]ervice' -and 
            $_.DistinguishedName -notmatch '(?:OU|CN)\=(?:Allgemein|Service|IUSR_|Ressource)' 
        } | ForEach-Object { $SyncHash.ObjectsCache.ADUsers["$($_.SamAccountName.ToLower())"] = $_ }
    }
    

    if ($ADGroups) {
        Get-ADGroup -Filter '*' | ForEach-Object {
            $SyncHash.ObjectsCache.Groups["$($_.Name)"] = $_
            #$SyncHash.ObjectsCache.Groups.Add("$($_.Name.ToLower())", $_)
        }

        $SyncHash.ObjectsCache.Groups.Values | Where-Object {
            $_.DistinguishedName -match "$($SyncHash.Config.ADGroups.SageGroups.Path)"
        } | ForEach-Object { $SyncHash.ObjectsCache.SageGroups["$($_.Name)"] = $_ }
        
    }

    
}
