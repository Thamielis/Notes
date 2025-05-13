function New-ExchangeMailbox {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [PSCustomObject] $User
    )

    $SageUser = $User.Sage

    if (-not (Get-Module "tmp_*")) {
        #if (-not (Get-Command -Name Get-Mailbox -ErrorAction SilentlyContinue)) {
        Connect-ToExchange | Out-Null
    }

    $NewMail = $False

    #$OU = ($User.AD.DistinguishedName -split "$($SageUser.Vorname),")[1]
    $MailboxDB = "KOWEX_$($SageUser.Country)_DB"

    #$Mailbox = Get-Mailbox -Anr $User.Nachname
    #$Mailbox = Get-Mailbox -Identity $User.AD.DistinguishedName -ErrorAction SilentlyContinue
    $Mailbox = Get-Mailbox -Identity $User.AD.SamAccountName -ErrorAction SilentlyContinue

    if (-not($Mailbox)) {

        # Create a mailbox for the specified user
        try {
            <#
            $MailboxArgs = @{
                LinkedMasterAccount = $User.AD.DistinguishedName
                SamAccountName      = $User.AD.SamAccountName
                UserPrincipalName   = $SageUser.Email
                Alias               = $User.AD.SamAccountName #$SageUser.Email.Split('@')[0]
                Name                = $User.Name
                #DisplayName        = $User.Name
                PrimarySmtpAddress  = $SageUser.Email
                Database            = $MailboxDB
                WhatIf              = $true
            }

            New-Mailbox @MailboxArgs
            #>

            #Enable-Mailbox -Identity $User.AD.SamAccountName -Database $MailboxDB | Out-Null

            if ($PSCmdlet.ShouldProcess("Mailbox for [$($User.Name)]", "Create new mailbox")) {
                Enable-Mailbox -Identity $User.AD.SamAccountName -Database $MailboxDB | Out-Null
                #Enable-Mailbox -Identity $User.AD.SamAccountName -Database $MailboxDB -PrimarySmtpAddress $User.AD.UserPrincipalName | Out-Null
                $NewMail = $True
                $Script:NewMailbox += $User

                Write-Log -Level INFO -Message "[$($User.Name)] Mailbox created: $($SageUser.Email)."
            }
            
        }
        catch {
            Write-Log -Level ERROR -Message "[$($User.Name)] Failed to create a mailbox: $_"
        }

    }

    return #$NewMail

}
