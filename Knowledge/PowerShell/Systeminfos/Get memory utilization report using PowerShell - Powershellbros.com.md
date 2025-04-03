    `$Servers` `=` `Get-Content` `-Path` `"C:\users\$env:username\desktop\servers.txt"`

    `$Array` `= @()`

    `Write-Host` ``"`n------------------------------------------------------"`` `-ForegroundColor` `Green`

    `Write-Host` `"                Checking 'Memory usage'"`

    `Write-Host` ``"------------------------------------------------------`n"`` `-ForegroundColor` `Green`

    `ForEach``(``$Server` `in` `$Servers``)`

    `{`

        `$Server` `=` `$Server``.trim()`

        `Write-Host` `"$Server - "` `-ForegroundColor` `Green` `-NoNewline`

        `$TopMem` `=` `$null`

        `$Object` `=` `$null`

        `$Status` `=` `$null`

        `$ComputerMemory` `=` `$null`

        `$RoundMemory` `=` `$null`

        `$TestPath` `=` `Test-Path` `"\\$Server\c$"`

        `If``(``$TestPath` `-match` `"False"``)`

        `{`

            `Write-Host` `"ERROR:   Failed to connect"`

            `$Status` `=` `"Offline"`

            `$ProcessName` `=` `"(Null)"`

            `$ProcessMem` `=` `"(Null)"`

            `$ProcessUser` `=` `"(Null)"`

            `$RoundMemory` `=` `"(Null)"`

        `}`

        `Else`

        `{`

            `Write-Host` `"SUCCESS: Server is up"`

            `$Status` `=` `"Online"`

            `$ComputerMemory` `=`  `Get-WmiObject` `-Class` `WIN32_OperatingSystem` `-ComputerName` `$Server`

            `$Memory` `= (((``$ComputerMemory``.TotalVisibleMemorySize -` `$ComputerMemory``.FreePhysicalMemory)*100)/` `$ComputerMemory``.TotalVisibleMemorySize)`

            `$TopMem` `=` `Get-WmiObject` `WIN32_PROCESS` `-ComputerName` `$Server` `|` `Sort-Object` `-Property` `ws` `-Descending` `|` `Select-Object` `-first` `1 processname, @{Name=``"Mem Usage(MB)"``;Expression={``[math]``::round(``$_``.ws / 1mb)}},@{Name=``"UserID"``;Expression={``$_``.getowner().user}}`

            `If``(``$TopMem` `-and` `$ComputerMemory``)`

            `{`

                `$ProcessName` `=` `$TopMem``.ProcessName`

                `$ProcessMem`  `=` `$TopMem``.``'Mem Usage(MB)'`

                `$ProcessUser` `=` `$TopMem``.UserID`

                `$RoundMemory` `=` `[math]``::Round(``$Memory``, 2)`

            `}`

            `Else`

            `{`

                `$ProcessName` `=` `"(Null)"`

                `$ProcessMem` `=` `"(Null)"`

                `$ProcessUser` `=` `"(Null)"`

                `$RoundMemory` `=` `"(Null)"`

            `}`

        `}`

            `$Object` `=` `New-Object` `PSObject` `-Property` `(``[ordered]``@{`

                            `"Server name"`             `=` `$Server`

                            `"Status"`                  `=` `$Status`

                            `"Total usage %"`           `=` `$RoundMemory`

                            `"Top process"`             `=` `$ProcessName`

                            `"Top process usage (MB)"`  `=` `$ProcessMem`

                            `"Top process user"`        `=` `$ProcessUser`

            `})`

            `$Array` `+=` `$Object`  

    `}`

`If``(``$Array``)`

`{`

    `Write-Host` ``"`nResults"`` `-ForegroundColor` `Yellow`

    `$Array` `|` `Sort-Object` `status |` `Format-Table` `-AutoSize` `-Wrap`

    `$Array` `|` `Out-GridView`

    `$Array` `|` `Export-Csv` `-Path` `C:\temp\results.csv` `-NoTypeInformation`

`}`