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
    
    $ADEmployees = $Employees | Where-Object { $null -ne $_.AD } | Where-Object { <# $_.AD.Enabled -eq $True -and #> $_.employeeID -ne '6100' }

    foreach ($ADEmployee in $ADEmployees) {
        
        if ($ADEmployee.Sage.PersNr -notin $Script:Config.NoAccessUser.Keys) {

            try {
                switch ($ADEmployee) {
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
                    { <#$_.Sage.eMail -ne '' -and#> $null -eq $_.AD.msExchMailboxGuid } {
                        Write-Log -Level INFO -Message "[$($ADEmployee.Name)] No Mailbox found. Creating new with: '$($ADEmployee.Sage.eMail)'"

                        #TODO: WhatIf nach erfolgreichem Test entfernen
                        
                        #$NewMail = New-ExchangeMailbox -User $ADEmployee #-WhatIf
                        
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
                    <#
                    { $_.ADGroups.ExchangeGroup -ne '' } {

                        try {
                            # Check if the user is already a member of the group
                            $isMember = '' -ne ($ADEmployee.AD.MemberOf -eq $ADEmployee.ADGroups.ExchangeGroup)
                            
                            if ($isMember -eq '') {
                                # Add the user to the group
                                Add-ADGroupMember -Identity $ADEmployee.ADGroups.ExchangeGroup -Members $ADEmployee.AD.SamAccountName
                                Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully added to '$($ADEmployee.ADGroups.ExchangeGroup)'."

                                $ADGroupOnly = $True
                            }
                            else {
                                Write-Log -Level DEBUG -Message "[$($ADEmployee.Name)] is already a member of '$($ADEmployee.ADGroups.ExchangeGroup)'."
                            }
                        }
                        catch {
                            Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not add user to '$($ADEmployee.ExchangeGroup)'."
                        }

                        $EmployeeExchangeGroupNames = $ADEmployee.AD.MemberOf | Where-Object { $_ -match 'OU=MFA' } | ForEach-Object {
                            $_.Split(',OU=MFA,')[0].Replace('CN=', '')
                        }
                        
                        $ExchangeADGroupsToRemove = $EmployeeExchangeGroupNames | Where-Object { $_ -ne $ADEmployee.ADGroups.ExchangeGroup }

                        if ($null -ne $ExchangeADGroupsToRemove) {

                            foreach ($ExchangeADGroupToRemove in $ExchangeADGroupsToRemove) {
                                try {
                                    Remove-ADGroupMember -Identity $ExchangeADGroupToRemove -Members $ADEmployee.AD.SamAccountName -Confirm:$false
                                    Write-Log -Level INFO -Message "[$($ADEmployee.Name)] successfully removed from '$($ExchangeADGroupToRemove)'."

                                    $ADGroupOnly = $True
                                }
                                catch {
                                    Write-Log -Level ERROR -Message "[$($ADEmployee.Name)] Error: Could not remove user from '$($ExchangeADGroupToRemove)'."
                                }
                            }
                        }
                        
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
                    #>
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
                        $Vorgesetzter = $ADEmployees | Where-Object { $_.Sage.ID -eq $ADEmployee.Sage.VorgesetzterID -and $ADEmployee.Sage.PersNr -notin $Script:Config.KeinVorgesetzter.Keys }

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
