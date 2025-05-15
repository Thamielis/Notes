`$ZoneName` `=` `"Reverse lookup zone name"`

`$RecordsPTR` `=` `Get-DnsServerResourceRecord` `-ZoneName` `$ZoneName` `-RRType` `Ptr`

`$PTRRecordsToRemove` `= @()`

`$PTRRecordsOK` `= @()`

`$PTRCounter` `=` `$RecordsPTR``.Count`

`$a``,``$c` `= 0`

`$ZoneFirstOctet` `=` `$ZoneName``.Split(``"."``)[0]`

`$PTRCounter`

`foreach``(``$record` `in` `$RecordsPTR``)`

`{`

        `$PTRIP` `=` `$ZoneFirstOctet``+``"."`

        `$SPlit` `=` `$record``.HostName.Split(``"."``)`

        `for``(``$i``=1;``$i` `-le` `3;``$i``++)`

        `{`

            `$PTRIP` `+=``$SPlit``[-``$i``]+``"."`

        `}`

        `$PTRIP` `=` `$PTRIP``.Substring(0,``$PTRIP``.Length-1)`

        `Write-Progress` `-Activity` `"Processing PTR records"` `-Status` `"Percent complete.."` `-PercentComplete` `((``$a``/``$PTRCounter``) *100)`

        `$DNSName` `=` `$record``.RecordData.PtrDomainName`

        `$DNSName` `=` `$DNSName``.substring(0,``$DNSName``.length-1)`

        `Try`

        `{`

           `$lookup` `=` `$null`

           `$lookup` `=` `[System.Net.Dns]``::GetHostAddresses(``$DNSName``)`

           `if``(``$lookup``.Count` `-gt` `1)`

           `{`

                `$lookup` `=` `$lookup``[1].IPAddressToString`

           `}`

           `else`

           `{`

                `$lookup` `=` `$lookup``.IPAddressToString`

           `}`

        `}`

        `Catch`

        `{`

           `$PTRRecordsToRemove` `+=` `$record`

        `}`

        `if``(!``[string]``::IsNullOrEmpty(``$lookup``))`

        `{`

            `if``(``$lookup` `-eq` `$PTRCounter``)`

            `{`

                `$PTRRecordsOK` `+=` `$record`

            `}`

            `else`

            `{`

                `$PTRRecordsToRemove` `+=` `$record`

            `}`

        `}`

    `$a``++`

`}`

`$PTRRecordsToRemoveCounter` `=` `$PTRRecordsToRemove``.Count`

`foreach``(``$PTRRemove` `in` `$PTRRecordsToRemove``)`

`{`

    `$c``++`

    `Write-Progress` `-Activity` `"Removing incorrect PTR records"` `-Status` `"Percent complete"` `-PercentComplete` `((``$c``/``$PTRRecordsToRemoveCounter``)*100)`

    `Try`

    `{`

        `Remove-DnsServerResourceRecord` `-InputObject` `$PTRRemove` `-ZoneName` `$ZoneName` `-Force` `-ErrorAction` `Stop`

    `}`

    `Catch`

    `{`

        `Write-Host` `Record` `for` `PTR` `$PTRRemove``.HostName -` `$PTRRemove``.RecordData.PtrDomainName already removed` `-ForegroundColor` `Yellow`

    `}`

`}`

`$PTRRecordsOK` `|` `Export-Csv` `-Path` `$env:TEMP``\$(``Get-Date` `-Format` `dd_MM_yyyy)_PTRRecordsOK.csv` `-NoTypeInformation`

`$PTRRecordsToRemove` `|` `Export-Csv` `-Path` `$env:TEMP``\$(``Get-Date` `-Format` `dd_MM_yyyy)_PTRRecordsRemoved.csv` `-NoTypeInformation`

`Write-Host` `"----------------------"`

`Write-Host` `Report:`

`Write-Host` `PTR records OK: (``$PTRRecordsOK` `|` `Sort-Object` `-Unique` `-Property` `HostName).Count`

`Write-Host` `PTR records to Remove:` `$PTRRecordsToRemove``.Count`

`Write-Host` `"Report files can be found under $env:TEMP"`

`Write-Host` `"----------------------"`