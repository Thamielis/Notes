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
