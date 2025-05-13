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
