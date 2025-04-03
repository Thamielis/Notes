`function` `Copy-GroupMembership`

`{`

    `param`

    `(`

            `[``Parameter``(``Position``=0,` `Mandatory``=``$true``,` `HelpMessage``=``"SAN of reference account"``,` `ValueFromPipeline` `=` `$true``)]` `$ReferenceAccount``,`

            `[``Parameter``(``Position``=1,` `Mandatory``=``$true``,` `HelpMessage``=``"Domain or server of reference accont"``,` `ValueFromPipeline` `=` `$true``)]` `$ReferenceAccountServer``,`

            `[``Parameter``(``Position``=2,` `Mandatory``=``$true``,` `HelpMessage``=``"SAN of account"``,` `ValueFromPipeline` `=` `$true``)]` `$AccountToChange``,`

            `[``Parameter``(``Position``=3,` `Mandatory``=``$true``,` `HelpMessage``=``"Domain of account"``,` `ValueFromPipeline` `=` `$true``)]` `$DomainAccountToChange`

    `)`

    `Try`

    `{`

        `Import-Module` `ActiveDirectory`

    `}`

    `Catch`

    `{`

        `$Exc` `=` `$_``.exception.Message`

        `Write-Output` `"AD module not installed on server!"`

        `exit`

    `}`

    `$ReferenceAccountUser` `=` `Get-ADUser` `-Identity` `$ReferenceAccount` `-Server` `$ReferenceAccountServer` `-Properties` `MemberOf`

    `$ReferenceAccountGroups` `=` `$ReferenceAccountUser``.memberOf`

    `$ReferenceAccountDN` `= (``Get-ADUser` `-Identity` `$AccountToChange` `-Server` `$DomainAccountToChange``).distinguishedName`

    `$GroupCounter` `=` `$ReferenceAccountGroups``.Count`

    `Write-host` `"----------------------------------------"`

    `Write-Host` `User` `$ReferenceAccountDN` `will be added to` `$GroupCounter` `groups`

    `Write-host` `"----------------------------------------"`

    `Start-Sleep` `2`

    `Foreach``(``$group` `in` `$ReferenceAccountGroups``)`

    `{`

        `Try`

        `{`

            `Add-ADGroupMember` `-Identity` `$group` `-Members` `$ReferenceAccountDN`

            `Write-Host` `User` `$ReferenceAccountDN` `added to group` `$group` `-ForegroundColor` `Green`

        `}`

        `Catch`

        `{`

            `Write-Host` `Unexpected error occured, user` `$ReferenceAccountDN` `was not added to group` `$group` `-ForegroundColor` `Red`

        `}`

    `}`

`}`