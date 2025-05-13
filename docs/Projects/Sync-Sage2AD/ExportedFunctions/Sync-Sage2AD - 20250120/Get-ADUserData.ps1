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
