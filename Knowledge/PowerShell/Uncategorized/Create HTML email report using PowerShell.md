`Import-Module` `ActiveDirectory`

`Function` `Create-HTMLTable{`

    `param``(``[array]``$Array``)`      

    `$arrHTML` `=` `$Array` `|` `ConvertTo-Html`

    `$arrHTML``[-1] =` `$arrHTML``[-1].ToString().Replace(``'</body></html>'``,``" "``)`    

    `Return` `$arrHTML``[5..2000]`

`}`

`$Report` `= @()`

`$DCs` `= (``Get-ADDomainController` `-Filter` `*).name |` `Sort-Object`

`Try{`

    `$Report` `=` `Invoke-Command` `-cn` `$DCs` `{`

                    `$Object` `= @{} | select` `"BootUpTime"``,`

                                           `"UpTime"``,`

                                           `"C: Free space %"``,`

                                           `"PhysicalRAM"``,`

                                           `"Memory %"``,`

                                           `"CPU %"`

                    `$System` `=` `Get-WmiObject` `win32_operatingsystem |` `Select-Object` `LastBootUpTime,LocalDateTime,TotalVisibleMemorySize,FreePhysicalMemory`

                    `$LastBootUpTime` `=` `[Management.ManagementDateTimeConverter]``::ToDateTime((``$System``).LastBootUpTime)`

                    `$LocalDateTime`  `=` `[Management.ManagementDateTimeConverter]``::ToDateTime((``$System``).LocalDateTime)`

                    `$up` `=` `$LocalDateTime` `-` `$LastBootUpTime`

                    `$uptime` `=` `"$($up.Days) days, $($up.Hours)h, $($up.Minutes)mins"`

                    `$Object``.BootUpTime        =` `$LastBootUpTime`

                    `$Object``.UpTime            =` `$uptime`

                    `$Object``.``'C: Free space %'` `= (``Get-WmiObject` `-Class` `Win32_Volume` `-Filter` `"DriveLetter = 'C:'"` `|` `Select-object` `@{Name =` `"C PercentFree"``; Expression = {“{0:N2}”` `-f`  `((``$_``.FreeSpace /` `$_``.Capacity)*100) } }).``'C PercentFree'`

                    `$Object``.``"PhysicalRAM"`     `= (``Get-WMIObject` `-class` `Win32_PhysicalMemory |` `Measure-Object` `-Property` `capacity` `-Sum` `| % {``[Math]``::Round((``$_``.sum / 1GB),2)})`

                    `$Object``.``"Memory %"`        `= (``$System` `|` `Select-Object` `@{Name =` `"MemoryUsage"``; Expression = { “{0:N2}”` `-f` `(((``$_``.TotalVisibleMemorySize -` `$_``.FreePhysicalMemory)*100)/` `$_``.TotalVisibleMemorySize)}}).MemoryUsage`

                    `$Object``.``"CPU %"`           `= (``Get-WmiObject` `Win32_processor |`  `Measure-Object` `-property` `LoadPercentage` `-Average` `| Select Average).Average` 

                    `$Object`

    `}`  `-ErrorAction` `Stop |` `Select-Object` `@{n=``'ServerName'``;e={``$_``.pscomputername}},``"BootUpTime"``,` `"UpTime"``,` `"C: Free space %"``,` `"PhysicalRAM"``,` `"Memory %"``,` `"CPU %"`

`}`

`Catch` `[System.Exception]``{`

    `Write-host` `"Error"` `-backgroundcolor` `red` `-foregroundcolor` `yellow`

    `$_``.Exception.Message`

`}`

`$Report` `|` `Format-Table` `-AutoSize` `-Wrap`

`$Style` `=` `@"`

    `<style>`

      `body {`

        `font-family: "Arial";`

        `font-size: 8pt;`

        `color: #4C607B;`

        `}`

      `th, td {`

        `border: 1px solid #e57300;`

        `border-collapse: collapse;`

        `padding: 5px;`

        `}`

      `th {`

        `font-size: 1.2em;`

        `text-align: left;`

        `background-color: #003366;`

        `color: #ffffff;`

        `}`

      `td {`

        `color: #000000;`

        `}`

      `.even { background-color: #ffffff; }`

      `.odd { background-color: #bfbfbf; }`

    `</style>`

`"@`

`$output` `=` `$null`

`$output` `= @()`

`$output` `+=` `'<html><head></head><body>'`

`$output` `+=`

`$Style`

`$output` `+=` `"<h3 style='color: #0B2161'>Performance report</h3>"`

`$output` `+=` `'<strong><font color="red">WARNING: </font></strong>'`

`$output` `+=` `"Please review attached report.</br>"`

`$output` `+=` `'</br>'`

`$output` `+=` `'<hr>'`

`$output` `+=` `'<p>'`

`$output` `+=` `"<h4>Report for $(($DCs | Measure-Object).count) domain controllers:</h4>"`

`$output` `+=` `'<p>'`

`$output` `+= Create-HTMLTable` `$Report`

`$output` `+=` `'</p>'`

`$output` `+=` `'</body></html>'`

`$output` `=`  `$output` `|` `Out-String`

`$Email` `= (``Get-ADUser` `-Identity` `$ENV:Username` `-Properties` `mail).mail`

`$Parameters` `= @{`

    `From        =` `"reports@powershellbros.com"`

    `To          =` `$Email`

    `Subject     =` `"[Report] Performance $(Get-Date -Format "``yyyy-MM-dd``")"`

    `Body        =` `$Output`

    `BodyAsHTML  =` `$True`

    `CC          =` `$Email`

    `Port        =` `'25'`

    `Priority    =` `"Normal"`

    `SmtpServer  =` `"SMTP.PowerShellBros.com"`

`}`

`Send-MailMessage` `@Parameters`