function Get-ADUserMailbox {
    [CmdletBinding()]
    param (
        [PSCustomObject] $User
    )

    if (-not (Get-Module "tmp_*")) {
        #if (-not (Get-Command -Name Get-Mailbox -ErrorAction SilentlyContinue)) {
        Connect-ToExchange
    }

    $SageUser = $User.Sage

    # Check if the user exists in AD by email and if they have a mailbox
    try {

        if ($null -ne $User.AD) {
            $ADUser = $User.AD
        }
        else {
            #$ADUser = Get-ADUser -Filter "Mail -eq '$($SageUser.Email)'" -Properties Mail, HomeMDB, msExchMailboxGuid
        }

        if ($ADUser) {
            if ($ADUser.msExchMailboxGuid) {
                #Write-Host "User $($SageUser.Name) already has a mailbox." -ForegroundColor Yellow

                try {
                    $Mailbox = Get-Mailbox -Identity $ADUser.SamAccountName -ErrorAction SilentlyContinue

                    if ($Mailbox) {
                        #Write-Host "Mailbox $($Mailbox.PrimarySmtpAddress) found." -ForegroundColor Yellow
                        return $Mailbox
                    }
                    else {
                        Write-Log -Level WARNING -Message "[$($ADUser.SamAccountName)] Mailbox not found."

                    }
                }
                catch {
                    Write-Log -Level ERROR -Message "[$($ADUser.SamAccountName)] Error checking mailbox: $_"
                }

                return $true
            }
            else {
                Write-Log -Level WARNING -Message "User $($SageUser.Name) exists but does not have a mailbox."
                return $false
            }
        }
        else {
            Write-Log -Level WARNING -Message "User $($SageUser.Name) not found in AD."
            return $null
        }
    }
    catch {
        Write-Log -Level ERROR -Message "Error checking AD user: $_"
        return $null
    }
}
