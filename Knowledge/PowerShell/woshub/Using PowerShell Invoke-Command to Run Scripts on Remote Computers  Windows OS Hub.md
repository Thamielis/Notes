In this article we will learn how to use the **Invoke-Command** cmdlet to run PowerShell commands or scripts remotely. You can use PowerShell to run commands remotely on one or more computers in your network. The Invoke-Command cmdlet is using remote management features from **PowerShell Remoting**. PowerShell Remoting allows you to remotely connect to PowerShell sessions on computers via **WinRM** (Windows Remote Management) service and **Web Services for Management** (WS-Management) protocol. This service provides the ability to establish remote PowerShell sessions and run your code.

Contents:

*   [Configuring WinRM for PowerShell Remoting](https://woshub.com/invoke-command-run-powershell-scripts-remotely/#h2_1)
*   [How to Run PowerShell Commands Remotely Using Invoke-Command?](https://woshub.com/invoke-command-run-powershell-scripts-remotely/#h2_2)
*   [How to Use Invoke-Command to Run Commands on Multiple Computers Simultaneously?](https://woshub.com/invoke-command-run-powershell-scripts-remotely/#h2_3)

Configuring WinRM for PowerShell Remoting
-----------------------------------------

PowerShell Remoting uses HTTP (Port TCP/5985) or HTTPS (Port TCP/5986) to communicate between computers. By default, the HTTP protocol is used, but even this traffic is encrypted using the AES-56 (however, there is a threat of man-in-the middle types of attacks). Kerberos or NTLM authentication may also be used.

WinRM must be running on the remote computers you are going to connect to. Check the WinRM service status:

`[Get-Service](https://woshub.com/manage-windows-services-powershell/) -Name "*WinRM*" | fl`

If the service is not running, start it:

`Enable-PSRemoting`

```
WinRM has been updated to receive requests.
WinRM service started.
WinRM is already set up for remote management on this computer.
```

![[images/enable-psremoting.png.webp]]

This command will start the WinRM service (and set it to start automatically), set the default winrm settings, and add exception rules to Windows Firewall. The `Enable-PSRemoting –Force` command enables WinRM without prompting a user.

Then you can connect to the computer remotely using PowerShell Remoting.

Note that PowerShell Remoting won’t work by default if your network type is set to **Public**. Then the command returns the following error:

```
Set-WSManQuickConfig : ... WinRM firewall exception will not work since one of the network connection types on this machine is set to Public. Change the network connection type to either Domain or Private and try again.
```

You must [change the network location to Private](https://woshub.com/how-to-change-a-network-type-from-public-to-private-in-windows/) or use this command:

`Enable-PSRemoting –SkipNetworkProfileCheck.`

Also enable the Windows Defender Firewall rule that allows access to WinRM in public networks. You can enable the firewall rule using [GPO](https://woshub.com/windows-firewall-settings-group-policy/) or [PowerShell](https://woshub.com/manage-windows-firewall-powershell/):

`Set-NetFirewallRule -Name 'WINRM-HTTP-In-TCP' -RemoteAddress Any`

In order to test the connection to a remote computer via PowerShell Remoting, run the following command:

`Test-WsMan compname1`

![[images/test-wsman-testing-wirm-connectivity-using-power.png.webp]]

If you don’t have an Active Directory domain or you access computers via PowerShell Remoting by IP addresses, in this case the NTLM protocol is used for authentication. When using NTLM, the following error appears if you try to run Invoke-Command:

```
[192.168.1.201] Connecting to remote server 192.168.1.102 failed with the following error message: The WinRM client cannot process the request. Default authentication may be used with an IP address under the following conditions: thetransport is HTTPS or the destination is in the TrustedHosts list, and explicit credentials are provided. Use winrm.cmd to configure TrustedHosts. Note that computers in the TrustedHosts list might not be authenticated. + FullyQualifiedErrorId: CannotUseIPAddress,PSSessionStateBroken
```

![[images/invoke-command-error-the-winrm-client-cannot-proc.png.webp]]

To make NTLM authentication work correctly on a computer you are using to connect, do some more things: [issue an SSL certificate for WinRM](https://woshub.com/powershell-remoting-over-https/) or add the host name/IP address to the trusted hosts list:

`Set-Item wsman:\localhost\Client\TrustedHosts -value 192.168.1.201`

![[images/winrm-wsman-add-trusted-hosts.png.webp]]

Or you can allow connection to all computers (it is not recommended, because it is one of the [disadvantages of NTLM](https://woshub.com/disable-ntlm-authentication-windows/) — it doesn’t support mutual authentication).

`Set-Item wsman:\localhost\Client\TrustedHosts -value *`

The same settings must be applied on remote hosts.

To display the list of trusted hosts, run the command:

`Get-Item WSMan:\localhost\Client\TrustedHosts`

To apply the changes, restart WinRM:

`Restart-Service WinRM`

How to Run PowerShell Commands Remotely Using Invoke-Command?
-------------------------------------------------------------

The Invoke-Command cmdlet allows running a command on one or more remote computers.

For example, to run a single command on a remote computer, use the following:

`Invoke-Command -ComputerName dc01 -ScriptBlock {$PSVersionTable.PSVersion}`

![[images/how-to-run-commands-on-remote-computers-with-power.png.webp]]

This command will display the [PowerShell version](https://woshub.com/check-powershell-version-installed/) installed on the remote computer, which name is specified in the `-ComputerName` parameter. Enter the command to be run on a remote computer in the `-ScriptBlock {[cmdlet]}` block.

By default, a command sent via Invoke-Command is executed as the current user on a remote computer. If you want to [run it as another user](https://woshub.com/run-program-as-different-user-windows/), request the user credentials and save them to a variable:

`$cred = Get-Credential   Invoke-Command -ComputerName dc01 -Credential $cred -ScriptBlock {Get-NetAdapter}`

This [PowerShell command displays the list of network interfaces](https://woshub.com/powershell-configure-windows-networking/) on a remote computer:

![[images/run-powershell-command-get-netadapter-remotely.png.webp]]

You can enter more than one command in the ScriptBlock, separated by semicolons. For example, the following command will [display the current time zone](https://woshub.com/how-to-set-timezone-from-command-prompt-in-windows/) and change it to another one:

`Invoke-Command -Computername dc01 -ScriptBlock {Get-TimeZone| select DisplayName;Set-TimeZone -Name "Central Europe Standard Time”}`

![[images/invoke-commapn-multiple-lines-in-script-block.png.webp]]

Invoke-Command allows you to run not only individual commands, but also run PowerShell scripts. To do it, the -FilePath argument (instead of –ScriptBlock) is used. In this case, you specify the path to the local PS1 script file on your computer (you don’t need to copy the script file to the target remote computer):

`Invoke-Command -ComputerName DC01 -FilePath C:\PS\Scripts\CheckSMBversion.ps1`

How to Use Invoke-Command to Run Commands on Multiple Computers Simultaneously?
-------------------------------------------------------------------------------

You can use the Invoke-Command to run commands on multiple remote computers in parallel (simultaneously).

In the simplest case, the names of the computers to run PowerShell commands on are separated with commas:

`Invoke-Command server1, server2, server3 -ScriptBlock {get-date}`

![[images/invoke-command-running-commands-on-multiple-remo.png.webp]]

You can place the list of computers into a variable (array):

`$servers = @("server1","server2","server3")   Invoke-Command -ScriptBlock { get-date} -ComputerName $servers`

Or get from a text file:

`Invoke-Command -ScriptBlock {Restart-Service spooler} -ComputerName(Get-Content c:\ps\servers.txt)`

You can also get a list of computers in AD using [Get-ADComputer](https://woshub.com/get-adcomputer-getting-active-directory-computers-info-via-powershell/) cmdlet from the [AD for PowerShell](https://woshub.com/powershell-active-directory-module/) module:

To run a command in all Windows Server hosts in the domain, use the following PowerShell code:

`$computers = (Get-ADComputer -Filter 'OperatingSystem -like "*Windows server*" -and Enabled -eq "true"').Name   Invoke-Command -ComputerName $computers -ScriptBlock {Get-Date} -ErrorAction SilentlyContinue`

If a computer is turned off or unavailable, the script won’t stop due to the SilentlyContinue parameter and will continue to run on other computers.

To understand what computer a result came from, use the PSComputerNamee environment variable.

`$results = Invoke-Command server1, server2, server3 -ScriptBlock {get-date}   $results | Select-Object PSComputerName, DateTime`

![[images/powershell-invoke-command-return-pscomputername.png.webp]]

When running a command using Invoke-Command on multiple computers, it is run simultaneously. Invoke-Command has a restriction on the maximum number of computers to be managed at the same time (a limited number of simultaneous PSSessions). This restriction is set in the **ThrottleLimit** parameter (the default value is 32). If you want to run a command on more than 32 computers (128, for example), use `–ThrottleLimit 128` (however, your computer will have a higher load to establish a large number of PSSessions).

To run commands on remote computers via Invoke-Command in the background, a special attribute `–AsJob` is used. Then the result of the command is not returned to the console. To get the results, use a the **Receive-Job** cmdlet.