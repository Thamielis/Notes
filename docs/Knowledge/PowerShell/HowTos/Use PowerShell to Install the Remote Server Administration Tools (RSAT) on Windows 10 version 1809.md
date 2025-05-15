My computer recently updated to Windows 10 version 1809 and as with all previous major updates of Windows 10, this wipes out the Remote Server Administration Tools (RSAT).

![win10-1809.jpg](https://mikefrobbins.com/2018/10/03/use-powershell-to-install-the-remote-server-administration-tools-rsat-on-windows-10-version-1809/win10-1809.jpg)

However, unlike previous versions, Microsoft has now made RSAT available via Features on Demand and while you’re supposed to be able to install them from the GUI, they never showed up as being an option for me.

![1809rsat1a.jpg](https://mikefrobbins.com/2018/10/03/use-powershell-to-install-the-remote-server-administration-tools-rsat-on-windows-10-version-1809/1809rsat1a.jpg)

That’s not really a problem though since they can now be installed via PowerShell. Who needs a GUI anyway?

The computer used in this blog article runs Windows 10 Enterprise Edition version 1809 with Windows PowerShell version 5.1 which is the default version of PowerShell that ships with that operating system. The execution policy has been set to Remote Signed (the default is Restricted), although it may not matter for this installation.

The commands used in this blog article are part of the _Deployment Image Servicing and Management_ (DISM) PowerShell module that’s installed by default on Windows 10.

```
Get-Command -Noun WindowsCapability
```

![1809rsat2a.jpg](https://mikefrobbins.com/2018/10/03/use-powershell-to-install-the-remote-server-administration-tools-rsat-on-windows-10-version-1809/1809rsat2a.jpg)

Determine which individual tools are available.

Notice that I specified the `Name` parameter with RSAT and a wildcard at the end of it as the value instead of piping to [Where-Object][1]. This is called filtering left (it’s more efficient than piping to `Where-Object`).

```
Get-WindowsCapability -Name RSAT* -Online
```

![1809rsat3a.jpg](https://mikefrobbins.com/2018/10/03/use-powershell-to-install-the-remote-server-administration-tools-rsat-on-windows-10-version-1809/1809rsat3a.jpg)

It’s easier to see what’s available by piping to [Select-Object][2] or [Format-Table][3] and only selecting a couple of the properties.

While it didn’t matter in this scenario, I generally pipe to `Select-Object` if I have four or fewer properties and want the output in a table. Why? Because `Select-Object` returns objects that are usable by other commands in case I wanted to pipe the results to something else. Unless custom formatting has been applied, five properties would result in a list by default in which case I’d have to pipe to `Format-Table` to return the results in a table.

```
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State
```

![1809rsat4a.jpg](https://mikefrobbins.com/2018/10/03/use-powershell-to-install-the-remote-server-administration-tools-rsat-on-windows-10-version-1809/1809rsat4a.jpg)

I want to install them all. The simplest way is to pipe the results from the [Get-WindowsCapability][4] command to the [Add-WindowsCapability][5] command. How did I know I could pipe one to the other? I read the help. You could specify the name of individual features on demand if you wanted to be more selective on which tools to install.

```
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online
```

![1809rsat5a.jpg](https://mikefrobbins.com/2018/10/03/use-powershell-to-install-the-remote-server-administration-tools-rsat-on-windows-10-version-1809/1809rsat5a.jpg)

If the `Add-WindowsCapacity` command was written using best practices, you could have specified the `Confirm` parameter and walked through each Feature on Demand selecting whether or not to install it, but unfortunately support for `WhatIf` and `Confirm` wasn’t added to it. All PowerShell commands that make changes should support `WhatIf` and `Confirm` otherwise the changes could result in a Resume generating event.

Confirm that the tools were indeed installed successfully.

```
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State
```

![1809rsat6a.jpg](https://mikefrobbins.com/2018/10/03/use-powershell-to-install-the-remote-server-administration-tools-rsat-on-windows-10-version-1809/1809rsat6a.jpg)

Once installed, they also showed up as being installed in the GUI.

![1809rsat7a.jpg](https://mikefrobbins.com/2018/10/03/use-powershell-to-install-the-remote-server-administration-tools-rsat-on-windows-10-version-1809/1809rsat7a.jpg)

Don’t forget to update the help.

![1809rsat8a.jpg](https://mikefrobbins.com/2018/10/03/use-powershell-to-install-the-remote-server-administration-tools-rsat-on-windows-10-version-1809/1809rsat8a.jpg)

Notice that I didn’t use aliases or positional parameters in this blog article. Anytime you’re sharing or saving code, full command and parameter names should be used as it’s easier to follow and more self-documenting. Think about the next guy, it could be you.

___

Update - October 4th, 2018 If you happen to receive error 0x800f0954, [see the comments in this Reddit post][6].

___

Update - November 16, 2018 Be sure to view [my TechSnips video][7] on the same subject. It contains some additional information.

µ

[1]: https://docs.microsoft.com/powershell/module/microsoft.powershell.core/where-object
[2]: https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/select-object
[3]: https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/format-table
[4]: https://docs.microsoft.com/powershell/module/dism/get-windowscapability
[5]: https://docs.microsoft.com/powershell/module/dism/add-windowscapability
[6]: https://www.reddit.com/r/PowerShell/comments/9l33mr/use_powershell_to_install_the_remote_server/
[7]: https://www.techsnips.io/snips/using-powershell-to-install-the-remote-server-administration-tools-on-windows-10-version-1809/