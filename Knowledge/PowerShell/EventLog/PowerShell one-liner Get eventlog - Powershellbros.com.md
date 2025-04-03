Use PowerShell one-liner to get eventlog details quickly and easily. In this article you will find several useful examples which will help you in daily operational tasks.

##### Get-Eventlog

The **Get-EventLog** cmdlet actually serves two purposes: it enables you to manage your event logs, and it also enables you to get at the events contained within those event logs.

To get lognames list we just have to use parameter `-list` :

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p></td><td><div><p><code>Get-Eventlog</code> <code>-List</code></p><p><code>Get-EventLog</code> <code>-List</code> <code>| </code><code>Where-Object</code> <code>{</code><code>$_</code><code>.logdisplayname </code><code>-eq</code> <code>"System"</code><code>}</code></p></div></td></tr></tbody></table>

[![Get-EventLog](PowerShell%20one-liner%20Get%20eventlog%20-%20Powershellbros.com/Get-EventLog-1.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2017/10/Get-EventLog-1.png)

Get-EventLog

Now when we know our **lognames** we can scan them using command parameters:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p></td><td><div><p><code>Get-EventLog</code> <code>-LogName</code> <code>System</code></p><p><code>Get-EventLog</code> <code>-LogName</code> <code>Application</code> <code>-Newest</code> <code>3</code></p><p><code>Get-EventLog</code> <code>-LogName</code> <code>System</code> <code>-Newest</code> <code>3 | </code><code>Format-List</code></p><p><code>Get-EventLog</code> <code>-LogName</code> <code>System</code> <code>-Newest</code> <code>3 | </code><code>Select-Object</code> <code>*</code></p><p><code>Get-EventLog</code> <code>-LogName</code> <code>System</code> <code>-Source</code> <code>Disk</code></p><p><code>Get-EventLog</code> <code>-LogName</code> <code>System</code> <code>-Source</code> <code>NetLogon</code> <code>-Newest</code> <code>3 | </code><code>Out-GridView</code></p></div></td></tr></tbody></table>

During daily tasks we often need to specify time frames to search for specific log entry. To do this we can use the following examples:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p></td><td><div><p><code>Get-EventLog</code> <code>-LogName</code> <code>System</code> <code>-After</code> <code>"09/28/2017"</code> <code>-Before</code> <code>"10/28/2017"</code></p><p><code>Get-EventLog</code> <code>-LogName</code> <code>System</code> <code>-After</code> <code>"09/28/2017"</code> <code>-Before</code> <code>"10/28/2017"</code> <code>-EntryType</code> <code>Error</code></p><p><code>Get-EventLog</code> <code>-LogName</code> <code>System</code> <code>-After</code> <code>"09/28/2017"</code> <code>-Before</code> <code>"10/28/2017"</code> <code>| </code><code>Where-Object</code> <code>{</code><code>$_</code><code>.EntryType </code><code>-like</code> <code>'Error'</code> <code>-or</code> <code>$_</code><code>.EntryType </code><code>-like</code> <code>'Warning'</code><code>}</code></p><p><code>Get-EventLog</code> <code>-LogName</code> <code>Application | </code><code>Where-Object</code> <code>{ </code><code>$_</code><code>.TimeGenerated </code><code>-gt</code> <code>((</code><code>Get-Date</code><code>).AddHours(-1)) }</code></p></div></td></tr></tbody></table>

Using `Where-Object` you can search for specific event id:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p></td><td><div><p><code>Get-EventLog</code> <code>-LogName</code> <code>"Windows PowerShell"</code> <code>| </code><code>Where-Object</code> <code>{</code><code>$_</code><code>.EventID </code><code>-eq</code> <code>403}</code></p><p><code>Get-EventLog</code> <code>-LogName</code> <code>Application</code> <code>-Source</code> <code>MSIInstaller | </code><code>Where-Object</code> <code>{</code><code>$_</code><code>.EventID </code><code>-eq</code> <code>'1034'</code><code>}</code></p><p><code>Get-EventLog</code> <code>-LogName</code> <code>System</code> <code>-Newest</code> <code>100 | </code><code>Where-Object</code> <code>{</code><code>$_</code><code>.EventId </code><code>-eq</code> <code>6006} | </code><code>Select-Object</code> <code>-first</code> <code>5</code></p></div></td></tr></tbody></table>

[![Get-EventLog](PowerShell%20one-liner%20Get%20eventlog%20-%20Powershellbros.com/Get-EventLog.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2017/10/Get-EventLog.png)

Get-EventLog

Great thing about Get-EventLog command is that we can also scan remote machines:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p></td><td><div><p><code>Get-EventLog</code> <code>-ComputerName</code> <code>DC01</code> <code>-LogName</code> <code>System</code> <code>-Source</code> <code>Disk</code></p><p><code>Get-EventLog</code> <code>-ComputerName</code> <code>DC01,DC02,DC03</code> <code>-LogName</code> <code>System</code> <code>-Source</code> <code>Disk | </code><code>Format-Table</code> <code>-Wrap</code> <code>-AutoSize</code></p><p><code>Get-EventLog</code> <code>-ComputerName</code> <code>(</code><code>Get-Content</code> <code>-path</code> <code>"c:\temp\servers.txt"</code><code>)</code> <code>-LogName</code> <code>System</code> <code>-Source</code> <code>Disk | </code><code>select-object</code> <code>-first</code> <code>1 | </code><code>Out-GridView</code> <code>-Title</code> <code>"Scan results"</code></p></div></td></tr></tbody></table>

##### Get-WinEvent

Apart from `Get-EventLog` command you can also use `Get-WinEvent` .

The **Get-WinEvent** cmdlet gets events from event logs, including classic logs, such as the System and Application logs, and the event logs that are generated by the Windows Event Log technology introduced in Windows Vista. It also gets events in log files generated by Event Tracing for Windows (ETW).

You can get all the providers for some logname on your local computer:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p></td><td><div><p><code>(</code><code>Get-WinEvent</code> <code>-ListLog</code> <code>Application).providernames</code></p><p><code>(</code><code>Get-WinEvent</code> <code>-ListLog</code> <code>Application).providernames | </code><code>Where-Object</code> <code>{</code><code>$_</code> <code>-like</code> <code>"*WMI*"</code><code>}</code></p><p><code>(</code><code>Get-WinEvent</code> <code>-ListProvider</code> <code>"Microsoft-Windows-WMI"</code><code>).events | </code><code>Format-Table</code> <code>id, description</code> <code>-auto</code></p></div></td></tr></tbody></table>

Below you can find another great example how to find first 5 events about reboot information. This time `FilterHashtable` has been used to provide logname and id:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Get-WinEvent</code> <code>-FilterHashtable</code> <code>@{logname=</code><code>'System'</code><code>; id=1074} | </code><code>Select-Object</code> <code>timecreated,message</code> <code>-First</code> <code>5 | </code><code>Out-GridView</code></p></div></td></tr></tbody></table>

You can also use `invoke-command` to scan remote servers for some specific event id. In this example we will check failed logon attempts logs for user pawel.janowicz and we will scan events only from last 24hours – `(Get-Date).AddDays(-1)`.

**EventID 4625:** An account failed to log on.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p></td><td><div><p><code>Get-WinEvent</code> <code>-ComputerName</code> <code>DC01</code> <code>-FilterHashTable</code> <code>@{ LogName = ”Security”; ID = </code><code>"4625"</code><code>; StartTime = (</code><code>Get-Date</code><code>).AddDays(-1) } | </code><code>Where-Object</code> <code>{ (</code><code>$_</code><code>.Message </code><code>-like</code> <code>"*pawel.janowicz*"</code><code>) }</code></p><p><code>Invoke-Command</code> <code>-ComputerName</code> <code>DC01</code> <code>-ScriptBlock</code><code>{</code><code>Get-WinEvent</code> <code>-FilterHashTable</code> <code>@{ LogName = ”Security”; ID = </code><code>"4625"</code><code>; StartTime = (</code><code>Get-Date</code><code>).AddDays(-1) } | </code><code>Where-Object</code> <code>{ (</code><code>$_</code><code>.Message </code><code>-like</code> <code>"*pawel.janowicz*"</code><code>) } }</code></p></div></td></tr></tbody></table>

There is a possibility to scan also custom event log like in this case – ADFS. In `Where-Object` you can specify multiple event ids and time frame for scanning:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p></td><td><div><p><code>Get-WinEvent</code> <code>-ProviderName</code> <code>'ADFS'</code> <code>-MaxEvents</code> <code>10000 | </code><code>Where-Object</code> <code>{ </code><code>$_</code><code>.ID </code><code>-eq</code> <code>'247'</code> <code>}</code></p><p><code>Get-WinEvent</code> <code>-ProviderName</code> <code>'ADFS'</code> <code>| </code><code>Where-Object</code> <code>{ </code><code>$_</code><code>.ID </code><code>-eq</code> <code>'247'</code> <code>-or</code> <code>$_</code><code>.ID </code><code>-eq</code> <code>'305'</code> <code>-or</code> <code>$_</code><code>.ID </code><code>-eq</code> <code>'306'</code> <code>-or</code> <code>$_</code><code>.ID </code><code>-eq</code> <code>'246'</code> <code>-and</code> <code>$_</code><code>.TimeCreated </code><code>-gt</code> <code>((</code><code>Get-Date</code><code>).AddHours(-</code><code>"8"</code><code>)) }</code></p></div></td></tr></tbody></table>

I hope that this was informative for you 🙂 See you in next articles.