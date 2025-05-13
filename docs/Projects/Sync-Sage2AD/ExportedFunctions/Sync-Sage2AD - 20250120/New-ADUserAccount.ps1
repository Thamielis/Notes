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
