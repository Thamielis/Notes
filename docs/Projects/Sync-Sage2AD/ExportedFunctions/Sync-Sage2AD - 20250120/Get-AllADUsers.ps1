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
