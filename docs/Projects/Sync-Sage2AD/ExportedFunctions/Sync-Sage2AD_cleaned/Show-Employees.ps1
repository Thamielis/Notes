function Show-Employees {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Object] $Employees
    )

    $FunctionName = $MyInvocation.MyCommand.Name
    $Description = "Show Employees"
    Invoke-Timer -FunctionName $FunctionName -Description $Description

    #TODO: Austesten abschließen und fertig codieren
    #$Employees | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, @{Name = "MailAD"; Expression = { $_.AD.mail } }, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } } | Out-HtmlView
    $Employees | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } } | Out-HtmlView -Title 'All Employees' -FixedHeader -DisablePaging

    $InactiveMailbox = $Employees | Where-Object { $_.Mailbox -eq 'Inactive' }
    If ($InactiveMailbox.Count -gt 0) {
        $InactiveMailbox | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } } | Out-HtmlView -Title 'Mailbox Inactive' -FixedHeader -DisablePaging
    }

    $MissingInAD = $Employees | Where-Object { $_.ADFoundWith -eq 'Missing' }
    If ($MissingInAD.Count -gt 0) {
        $MissingInAD | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, eMailAD, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } }, @{Name = 'Pager'; Expression = { $_.AD.pager } } | Out-HtmlView -Title 'Missing in AD' -FixedHeader -DisablePaging
    }
    
    $MailMissingSage = $Employees | Where-Object { $_.Sage.eMail -eq '' -and $null -ne $_.AD.mail }
    if ($MailMissingSage.Count -gt 0) {
        $MailMissingSage | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, @{Name = "MailAD"; Expression = { $_.AD.mail } }, Mailbox, @{Name = 'Austritt'; Expression = { $_.Sage.Austritt } } | Out-HtmlView -Title 'Mail Missing in Sage' -FixedHeader -DisablePaging
    }

    $MailMissingAD = $Employees  | Where-Object { $_.Sage.eMail -ne '' -and $null -eq $_.AD.mail }
    if ($MailMissingAD.Count -gt 0) {
        $MailMissingAD | Select-Object -Property @{Name = "Staat"; Expression = { $_.Sage.Staat } }, employeeID, Name, SamAccountName, GenSamAccName, ADFoundWith, eMailSage, @{Name = "MailAD"; Expression = { $_.AD.mail } }, Mailbox | Out-HtmlView -Title 'Mail Missing In AD' -FixedHeader -DisablePaging
    }

    #$ADUsersPager = $ADUsers | Where-Object { $_.pager -eq 'P' -and $_ -notin $Employees.AD -and $_.Name -notmatch 'Adm_|Test|6' -and $_.Enabled -eq $True }
    #$ADUsersPager | Select-Object -Property Name, Enabled, pager, SamAccountName, @{Name = "LastLogon"; Expression = { (Get-Date -Date $_.LastLogonDate).Date.ToShortDateString() } } | Out-HtmlView -Title 'P in Pager' -FixedHeader -DisablePaging

    $Found = [System.Collections.ArrayList]::new()
    $AllAD = Get-ADUser -Filter * -Properties SamAccountName, GivenName, SurName
    foreach ($Missing in $MissingInAD) {
        $Account = $AllAD | Where-Object { $_.SurName -eq $Missing.Sage.Nachname -and $_.GivenName -eq $Missing.Sage.Vorname }
        if ($Account) {
            $Found.Add($Account)
        }
    }

    Invoke-Timer -FunctionName $FunctionName
}
