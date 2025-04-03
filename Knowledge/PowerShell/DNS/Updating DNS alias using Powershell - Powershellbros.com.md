`function` `Update-DNSAliasRecord` `{`

    `[``CmdletBinding``()]`

    `param``(`

    `[``Parameter``(Postion=0,``HelpMessage``=``"New DNS alias"``,``Mandatory``=``$true``,``ValueFromPipeline``=``$true``)]`

    `[string]`

    `$NewDNS``,`

    `[``Parameter``(Postion=1,``HelpMessage``=``"Old DNS alias"``,``Mandatory``=``$true``,``ValueFromPipeline``=``$true``)]`

    `[string]`

    `$OldDNS``,`

    `[``Parameter``(Postion=2,``HelpMessage``=``"Zone name of the alias"``,``Mandatory``=``$true``,``ValueFromPipeline``=``$true``)]`

    `[string]`

    `$ZoneName`

    `)`

    `$ZoneNameLength` `= (``$ZoneName``.Length+1)`

    `$OldDNSShort` `=` `$OldDNS``.Substring(0,``$OldDNS``.Length-``$ZoneNameLength``)`

    `$NewDNSShort` `=` `$NewDNS``.Substring(0,``$NewDNS``.Length-``$ZoneNameLength``)`

    `Try`

    `{`

        `Write-Host` `Curent DNS record:`

        `Get-DnsServerResourceRecord` `-Name` `$OldDNSShort` `-ZoneName` `$ZoneName`

    `}`

    `Catch`

    `{`

        `$Exception` `=` `$_``.exception.Message`

        `Write-Warning` `"Current DNS alias record can not be found. Following error occured: $Exception"`  

    `}`

    `$DNSRecordAlias` `= (``Get-DnsServerResourceRecord` `-Name` `$OldDNSShort` `-ZoneName` `$ZoneName``).RecordData.HostNameAlias`

    `$HostName` `=` `$DNSRecordAlias``.Substring(0,``$Computer``.Length-1)`

    `Try`

    `{`

        `Remove-DnsServerResourceRecord` `-Name` `$OldDNSShort` `-ZoneName` `$ZoneName` `-RRType` `CName` `-Force`

        `Write-Host` `Old` `alias` `$OldDNS` `has been removed`

    `}`

    `Catch`

    `{`

        `$Exception` `=` `$_``.exception.Message`

        `Write-Warning` `"Change of DNS Alias failed. Following error occured: $Exception"`

    `}`

    `Try`

    `{`

        `Add-DnsServerResourceRecord` `-ZoneName` `$ZoneName` `-HostNameAlias` `$HostName` `-CName` `-Name` `$NewDNS`

        `Write-Host` `New` `alias` `$NewDNS` `has been created`

    `}`

    `Catch`

    `{`

        `$Exception` `=` `$_``.exception.Message`

        `Write-Warning` `"Change of DNS Alias failed. Following error occured: $Exception"`

    `}`

    `Try`

    `{`

        `Get-DnsServerResourceRecord` `-Name` `$NewDNSShort` `-ZoneName` `$ZoneName`

        `Write-Host` `"Alias has been updated sucessfully!"`

    `}`

    `Catch`

    `{`

        `$Exception` `=` `$_``.exception.Message`

        `Write-Warning` `"Change of DNS Alias failed. Following error occured: $Exception"`

    `}`

`}`