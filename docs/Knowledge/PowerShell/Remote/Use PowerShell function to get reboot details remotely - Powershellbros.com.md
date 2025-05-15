`Function` `Get-RebootDetails` `{`

    `[``CmdletBinding``()]`

    `param`

    `(`

        `[``Parameter``(``Position``=0,` `Mandatory` `=` `$false``,` `HelpMessage``=``"Provide server names"``,` `ValueFromPipeline` `=` `$true``)]`

        `$Computername` `=` `$env:computername``,`

        `[``Parameter``(``Position``=1,` `Mandatory` `=` `$false``,` `HelpMessage``=``"How many events?"``,` `ValueFromPipeline` `=` `$true``)]`

        `$First` `=` `"1"`

    `)`

        `$SystemArray` `= @()`

        `ForEach` `(``$Server` `in` `$Computername` `)`

        `{`

            `$Events` `=` `$null`

            `$OS` `=` `$null`

            `$Check` `=` `$null`

            `Write-Host` `"Processing $Server"` `-ForegroundColor` `Green`

            `Try`

            `{`

                `$Check` `=` `[System.Net.Dns]``::GetHostAddresses(``$Server``)`

                `$OS` `=` `Get-WmiObject` `win32_operatingsystem` `-ComputerName` `$Server` `|` `Select-Object` `LastBootUpTime,LocalDateTime,organization,Caption,OSArchitecture`

            `}`

            `Catch`

            `{`

                `$TryError1` `=` `$_``.Exception.Message`

                `Write-Warning` `"$Server - $TryError1"`

                `Continue`

            `}`

            `If``(``$OS``)`

            `{`

                `$LastBootUpTime` `=` `[Management.ManagementDateTimeConverter]``::ToDateTime((``$OS``).LastBootUpTime)`

                `$LocalDateTime` `=` `[Management.ManagementDateTimeConverter]``::ToDateTime((``$OS``).LocalDateTime)`

                `$Up` `=` `$LocalDateTime` `-` `$LastBootUpTime`

                `$Uptime` `=` `"$($Up.Days) days, $($Up.Hours)h, $($Up.Minutes)mins"`

                `Write-Host` `"Uptime     : $Uptime"`

                `Write-Host` ``"BootUpTime : $LastBootUpTime`n"``

                `Try`

                `{`

                    `$Events` `=` `Get-WinEvent` `-ComputerName` `$Server` `-FilterHashtable` `@{logname=``'System'``; id=1074} |` `Select-Object` `timecreated,properties` `-First` `$First`

                `}`

                `Catch`

                `{`

                    `$TryError2` `=` `$_``.Exception.Message`

                    `Write-Warning` `"$Server - $TryError2"`

                    `Continue`

                `}`

                `If` `(``$Events``)`

                `{`

                    `ForEach``(``$item` `in` `$Events``)`

                    `{`

                        `$Object` `=` `New-Object` `PSObject` `-Property` `(``[ordered]``@{`

                            `Server            =` `$Server`

                            `RebootDate        =` `$Item``.timecreated`

                            `UserName          =` `$Item``.Properties[6].Value`

                            `Action            =` `$Item``.Properties[4].Value`

                            `Process`           `=` `$Item``.Properties[0].Value`

                            `Reason            =` `$Item``.Properties[2].Value`

                        `})`

                        `$SystemArray` `+=` `$Object`

                    `}`

                `}`

            `}`

        `}`

        `If``(``$SystemArray``)`

        `{`

            `Return` `$SystemArray`

        `}`

`}`