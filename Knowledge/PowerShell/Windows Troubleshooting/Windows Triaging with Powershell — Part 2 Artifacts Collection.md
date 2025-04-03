# Windows Triaging with Powershell - Part 2 - Artifacts Collection

<!-- vscode-markdown-toc -->
- [Windows Triaging with Powershell - Part 2 - Artifacts Collection](#windows-triaging-with-powershell---part-2---artifacts-collection)
  - [1. What is Windows Management Instrumentation (WMI)?](#1-what-is-windows-management-instrumentation-wmi)
  - [2. What is RFC 3227?](#2-what-is-rfc-3227)
  - [3. What are the important Artifacts that we'll be focusing in the Windows OS?](#3-what-are-the-important-artifacts-that-well-be-focusing-in-the-windows-os)
  - [4. Getting started with Collection](#4-getting-started-with-collection)
  - [5. Running Processes and Services](#5-running-processes-and-services)
  - [6. Network Parameters](#6-network-parameters)
  - [7. Users \& Groups Info](#7-users--groups-info)
  - [8. Autostart Modules](#8-autostart-modules)
  - [9. Thumbnails \& IconCache Database](#9-thumbnails--iconcache-database)
  - [10. Hotfix or Updates Information](#10-hotfix-or-updates-information)
  - [11. Connected USB Information](#11-connected-usb-information)
  - [12. Collecting the Temporary Files](#12-collecting-the-temporary-files)
  - [13. Collecting Prefetch Files](#13-collecting-prefetch-files)
  - [14. Collecting Jump List \& LNK Files](#14-collecting-jump-list--lnk-files)
  - [15. Collecting ShellBags](#15-collecting-shellbags)
  - [16. SMB Info](#16-smb-info)
  - [17. List of Installed Applications](#17-list-of-installed-applications)
  - [18. Windows Defender Logs](#18-windows-defender-logs)
  - [19. Notification Database](#19-notification-database)
  - [20. Cortana Database Info](#20-cortana-database-info)
  - [21. Conclusion](#21-conclusion)

<!-- vscode-markdown-toc-config
    numbering=true
    autoSave=true
    /vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

The current blog is in continuation of Part 1 of Windows Triaging with Powershell. Part 1 described how the Powershell functions can be used to parse the Windows Event Logs. As part of this blog post, we will explore the important artifacts present in the Windows OS, where they can be found, and how we can collect them all using Powershell.

Forensic and Incident Response teams would benefit greatly from this approach to gather artifacts as quickly as possible. "_The tasks performed are based on the fact that the team found particular Windows machine in Power-On state and are able to run and perform some scripting functions on Powershell."_

For the analysis of collected artifacts, I'll also point out some open-source tools that are easy to use and can help with the analysis of all those files.

> **Note:** Not only Powershell, some of the CMD commands will also be used for the collection procedure. CMD commands will be called within Powershell itself.

Let's get started.

## 1. <a name='WhatisWindowsManagementInstrumentationWMI'></a>What is Windows Management Instrumentation (WMI)?

WMI is infrastructure for Management data and operations on Windows-based OS. We can write WMI scripts or application to automate administrative tasks on remote computers as well.

We can check all the available WMI classes with Powershell using command:

> Get-WmiObject -List \*

![](https://miro.medium.com/v2/resize:fit:700/1*vRsQTcolbVtwnh0nLWNstg.png)

List of WMI Classes Available

We'll be using a number of WMI classes within our script. Along with WMI classes, we'll be discussing about several built-in commands of Powershell which will help in Information gathering process.

## 2. <a name='WhatisRFC3227'></a>What is RFC 3227?

In the collection procedure, I'll be referring to **RFC 3227** that defines _the principles during capturing Volatile Information and in what order, the volatile information is to be captured._

You can check out the Guidelines for Evidence Collection and Archiving here:

Based on RFC 3227, the artifacts that we'll be focusing on to collect:

- Registers, Cache
- Routing Table, Arp Cache, Process Table, Kernel Statistics, Memory
- Temporary File Systems
- Disk
- Remote Logging and Monitoring data that is relevant to system in question
- Physical Configuration, Network Topology
- Archival Media

Apart from this, what all other information that is available in system for e.g. Browser History, Jump Lists, Connected USB Info, Logs etc. we'll be looking to those artifacts as well.

## 3. <a name='WhataretheimportantArtifactsthatwellbefocusingintheWindowsOS'></a>What are the important Artifacts that we'll be focusing in the Windows OS?

In this blog, tested operating system is Windows 11. With release of Windows 11, it is not much different from Windows 10 in terms of where the artifacts are located. Some of the important artifacts that this blog focus on:

- _Running Processes & Services_
- _Network Related Information_
- _Autostart Items_
- _Thumbnails & IconCache Database_
- _Hotfix or Updates Information_
- _USB Logs_
- _Users and groups_
- _Collecting Temporary, Prefetch data_
- _Jump Lists & Lnk Files_
- _ShellBags Info_
- _SMB Info_
- _List of Installed Applications_
- _Windows Defender Logs_
- _Windows Notification Database_
- _Windows Cortana Database_

Not to worry, I'll mention the location path for some of the above mentioned artifacts which any reader can manually check.

## 4. <a name='GettingstartedwithCollection'></a>Getting started with Collection

> **Note:** Advised to run the commands with Administrative privileges if possible, as that would provide more information as compared to User privileges

## 5. <a name='RunningProcessesandServices'></a>Running Processes and Services

Whether be Incident Response, Forensics or even Malware analysis, running Processes and Services are one of the important artifacts that any investigator would first grab the information about. Run the following command in your Powershell window:

> Get-Process

![](https://miro.medium.com/v2/resize:fit:700/1*NI0hU7bu7XxIGN0bhxLNAw.png)

Output for GetProcess

Get-Process comes with some flags as well to filter out the output based on requirement. Let's say, if I want to look over all the processes associated with firefox, then the command would be

> Get-Process -Name firefox

![](https://miro.medium.com/v2/resize:fit:700/1*TJ0hyDv41XZtT2O6N2cSEg.png)

Output for Get-Process -Name firefox

One of the important feature that I noticed in Powershell is display of attributes. As of now, we are able to see "Handles, NPM, PM, WS, CPU, Id, ProcessName". But there are other attributes as well that can be of use in terms of investigation and analysis. Type the following command in Powershell window and let's look at the output

> Get-Process | Select-Object \* | Format-Table -AutoSize -Wrap

![](https://miro.medium.com/v2/resize:fit:700/1*AG8XLvQD06xQXgPZsJpDqw.png)

Output for the above command

From the output, some of the important attributes to look at would be "_Priority, PagedMemorySize, PrivateMemorySize, VirtualMemorySize and TotalProcessorTime_". To make the task more easy, we can save the output in CSV with the help of the below command

> Get-Process | Select-Object \* | Export-Csv E:\\Get-Process.csv -NoTypeInformation -Encoding UTF8 -Force

![](https://miro.medium.com/v2/resize:fit:700/1*Tltd0zAlNv0JUAVN06q8-Q.png)

CSV file for Get-Process

The CSV can be of great use, as this provides you with list of columns for e.g., Path of the executable as well as **_StartTime_** are mentioned that are helpful in Incident Response and Malware investigation as well. Also CSV file provides you with filtering feature that would help in analysis as well.

Similarly, to get the all the information about the services, type the following command in Powershell window

> Get-Service

![](https://miro.medium.com/v2/resize:fit:692/1*cy7tIRqjbW5RoaXH7By1NQ.png)

Output for command Get-Service

We can do more filtering based on the status. Let's say, if we want the services for which the status is Running, then our command would be:

> Get-Service | Where-Object {$\_.Status -eq 'Running'}

![](https://miro.medium.com/v2/resize:fit:700/1*3h4oiNYWyy1-0E8NNjD1Jg.png)

Output for Get-Service | Where-Object {$\_.Status -eq 'Running'}

As we saved the output for Get-Process, similarly we can save the output for Get-Service in CSV format that will provide us with some more attributes related to each service

> Get-Service | Select-Object \* | Export-Csv E:\\Medium\_Part-2\\Get-Service.csv -NoTypeInformation -Encoding UTF8 -Force

![](https://miro.medium.com/v2/resize:fit:700/1*gEbwvV5_91FGTzTHGiRgjQ.png)

CSV Output for Get-Service | Select-Object \*

## 6. <a name='NetworkParameters'></a>Network Parameters

A number of modules are present within powershell for capturing different Network information.

First, I would like to mention about the all-in one tool that is **Get-NetView.** Th**e** tool collects a in-depth information about the system and network related information. Data that is collected via Get-NetView:

- Environment (OS, Hardware, Domain, Hostname etc.)
- Physical, Virtual, Container, NICs
- Network Configuration, IP Addresses, MAC Addresses, Neighbors, Routes
- Physical Switch Configuration, QOS policies
- Virtual Machine Configuration
- Virtual Switches, Bridges, NATs
- Device Drivers
- Performance Counters
- Logs, Traces, etc.
- System and Application Events

For further information about the tool, you can check out from the below provided link:

After you have installed the tool in Powershell, run the following command in Powershell window

> Get-NetView -OutputDirectory

After you run the command, this would take some time to gather all the information but absolutely a worth tool for collecting information. The output you will get would be like this after the execution of the tool is completed

![](https://miro.medium.com/v2/resize:fit:700/1*X0nFjj9PkQALhvr-s606fg.png)

Powershell Output for Get-NetView

![](https://miro.medium.com/v2/resize:fit:700/1*PGQEZXtW1vpkJXHwXRA0hg.png)

Collected artifacts inside the Output Directory by Get-NetView

Coming back to basics, there are certain commands that you may find useful for collection of network related information.

**_Get-NetAdapter_** gets the basic network adapter properties. By default only visible adapters are returned. We can pass the command with -IncludeHidden flag to display all the available Network Adapters of the system

![](https://miro.medium.com/v2/resize:fit:700/1*ONsek0XCAkuqAsAzR1P41g.png)

Get-NetAdapter Output

**_Get-NetConnectionProfile_** gets connection profile associated with one or more physical network adapters. A connection profile represents a network connection.

![](https://miro.medium.com/v2/resize:fit:448/1*vVG0ONmm9xA6XIAk2unEjA.png)

Get-NetConnectionProfile Output

**_Netsh_** is most used command in network configuration as it display the network configuration of the system and also allows to modify the same. While netsh can also be used to display **"Wi-Fi"** related information from the system.

> (netsh wlan show profiles) | Select-String "\\:(.+)$" | %{$name=$\_.Matches.Groups\[1\].Value.Trim(); $\_} | % {(netsh wlan show profile name="$name" key=clear)} | Select-String "Key Content\\W+\\:(.+)$" | %{$pass=$\_.Matches.Groups\[1\].Value.Trim(); $\_} | %{\[PSCustomObject\]@{ SSID=$name;PASSWORD=$pass }} | Format-Table -AutoSize

The above command will allow to display all the connected Wi-Fi and their passwords as well.

![](https://miro.medium.com/v2/resize:fit:700/1*thUx_m6EiZ-KakeoaizRLg.png)

**_ipconfig_** command which is generally used for displaying the IP address can also be used for displaying DNS information about the system with /displaydns flag.

> ipconfig /displaydns

![](https://miro.medium.com/v2/resize:fit:529/1*qUDoBJfxLuF6lbLGpqhBDw.png)

ipconfig /displaydns output in Powershell

## 7. <a name='UsersGroupsInfo'></a>Users & Groups Info

Get-WmiObject command is used to invoke WMI classes.

**_Win32\_UserAccount_** class contains information about user account on computer system running Windows.

> Get-WmiObject -Class Win32\_UserAccount

![](https://miro.medium.com/v2/resize:fit:519/1*YsVJnFSGoHCWF2l085W63w.png)

Win32\_UserAccount output

Other than Win32\_UserAccount, **Get-LocalUser** & **Get-LocalGroup** can also be used to get the information about the active users and groups on the system.

> Get-LocalUser | Select Description, Enabled, FullName, UserMayChangePassword, PasswordRequired,LastLogon,Name,SID

![](https://miro.medium.com/v2/resize:fit:700/1*LAuvHCSy6LFUbDIzQKD8gQ.png)

Output for Get-LocalUser

> Get-LocalGroup | Select-Object \*

![](https://miro.medium.com/v2/resize:fit:700/1*zFclWYml7EKF9IfV3oyFBw.png)

Output for Get-LocalGroup

## 8. <a name='AutostartModules'></a>Autostart Modules

**Win32\_StartupCommand** is a class defined in Get-WmiObject module that provides us with the information on startup applications. Write the following command in Powershell window to display the startup items

> Get-WmiObject -Class Win32\_StartupCommand

![](https://miro.medium.com/v2/resize:fit:700/1*JLBDCJHN1IKTPTApYHDQcg.png)

Output for Get-WmiObject -Class Win32\_StartupCommand

With use of Select-Object piped with the above command, let's save the output in CSV and get some more information on the startup items

> Get-WmiObject -Class Win32\_StartupCommand | Select-Object PSComputerName,User,\_\_RELPATH,Command,Name | Export-Csv <Path for Csv file> -NoTypeInformation -Force -Encoding UTF8

![](https://miro.medium.com/v2/resize:fit:700/1*I81z8jx3wN8O2bS4nLZjzA.png)

With CMD also, we can get the autostart items by the use of following command:

> wmic startup get caption,command

## 9. <a name='ThumbnailsIconCacheDatabase'></a>Thumbnails & IconCache Database

Thumbnails and IconCache store the icons that are displayed when we set the layout of the explorer to medium, large icons (Thumbnails view). Let's look at the below screenshot of the content view inside the Explorer

![](https://miro.medium.com/v2/resize:fit:700/1*URFL1ZgbOTmUJP1YNdF0aw.png)

Large Icons view inside Explorer Window

All the files and directories have some kind of icon related to each one of them. These are stored inside the Thumbnails & IconCache database. Likewise, if we have set this type of setting inside the Pictures folder, then content of each picture is displayed without even opening it. All this data is stored inside that database.

Default location where the Thumbnails and Iconcache database is stored inside Windows

> \\Users\\%USERNAME%\\AppData\\Local\\Microsoft\\Windows\\Explorer

![](https://miro.medium.com/v2/resize:fit:559/1*5qzm-sYK8ttp3QyhEy2zbA.png)

You can use **ThumbsViewer** to view the collected files. Link for the same is provided below:

As an investigator, we can copy all these files in a forensic manner. First create the hash for all these .db files and then recursively copy to our specified folder. The process to create hash before copying the files is provided in Part1 of the Windows Triaging with Powershell, for which the link is provided below:

After creating the hash, the output hash file would look like this:

![](https://miro.medium.com/v2/resize:fit:700/1*HJHt1spV21sfnrH9ankSNg.png)

Hash created for Thumbnails and Iconcache files

With Powershell, now we can recursively copy all the available files inside the \\AppData\\Local\\Microsoft\\Explorer folder

> Get-ChildItem C:\\Users\\$env:USERNAME\\AppData\\Local\\Microsoft\\Windows\\Explorer\\ -Recurse | Copy-Item -Destination <Destination Path>

## 10. <a name='HotfixorUpdatesInformation'></a>Hotfix or Updates Information

In case of Malware Analysis or Incident Response, updates information plays a key role to identify the updatedclear features if they are genuine, latest versions or any malicious update file was uploaded inside the system. To view the Hotfix information, write the following command in Powershell window

> Get-HotFix

![](https://miro.medium.com/v2/resize:fit:700/1*_H3sqIdZaabc8ffs73gtUA.png)

Another command to get the Windows Updates log is **Get-WindowsUpdateLog**. The Get-WindowsUpdateLog cmdlet merges and converts Windows Update .etl files into a single readable WindowsUpdate.log file. Write the following command the get the updates log to use desired directory

> Get-WindowsUpdateLog -LogPath directory\_path\\Updates.log

![](https://miro.medium.com/v2/resize:fit:700/1*CDTZkMfNibyozjvGlAwtJA.png)

Windows Update Log

## 11. <a name='ConnectedUSBInformation'></a>Connected USB Information

USB logs are an important artifact as to know if any malicious incident has been performed via external device or to get a kind of sense that any sensitive file is copied to any external drive.

USB logs are maintained at Registry Location:

> HKLM:\\SYSTEM\\CurrentControlSet\\Enum\\USBSTOR

To get the list of connected USB devices, write the following command in the Powershell Window:

> Get-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Enum\\USBSTOR\\\*\\\*' | Select-Object FriendlyName,PSPath

![](https://miro.medium.com/v2/resize:fit:700/1*9nQAhH5TZTnpOwdFIeHC_g.png)

As the timestamps are not provided with this command cause the timestamps are provided inside Windows Event Logs for each connected USB device. But after some searching I found one Powershell program that is able to do it. I'll not be able to display the whole program, but you can check out the program from the below link:

Now, if you copy this program inside Powershell ISE and run the same, we can retrieve the timestamps of each connected USB device as displayed in the below screenshot

![](https://miro.medium.com/v2/resize:fit:321/1*EavG0cEgsehJXRXcCzxxug.png)

## 12. <a name='CollectingtheTemporaryFiles'></a>Collecting the Temporary Files

Temporary File is created to temporarily store information in order to free memory for other purposes. For e.g. whenever we are downloading a file from Internet, there are two options for downloading, Open As or Save As. The "Open As" downloaded files are stored in Temp folder of the system.

Following are the locations of Temp folder:

> _C:\\Users\\%USERPROFILE%\\AppData\\Local\\Temp_
>
> _C:\\Windows\\Temp_
>
> _C:\\Windows\\SystemTemp_

Similar to collection of Thumbnails, we can create hash of all the files present in the aforementioned directories and copy these items recursively to our specified folder. Command to perform the same is mentioned below:

> Get-ChildItem -Path C:\\Windows\\Temp -Recurse | Copy-Item -Destination Destination\_Path
>
> Get-ChildItem -Path C:\\Windows\\SystemTemp -Recurse | Copy-Item -Destination Destination\_Path
>
> Get-ChildItem -Path C:\\Users\\$env:USERNAME\\AppData\\Local\\Temp -Recurse | Copy-Item -Destination Destination\_Path

## 13. <a name='CollectingPrefetchFiles'></a>Collecting Prefetch Files

In Forensic aspect, Prefetch files can reveal when applications were last accessed and how many times the application was run. These files can be used to extract timestamp and other resources consumed when the file executes.

Default location for the Prefetch files:

> _C:\\Windows\\Prefetch_

Similar command can be used to copy all the prefetch files after hash for all the files is generated

> Get-ChildItem -Path C:\\Windows\\Prefetch -Recurse | Copy-Item -Destination Destination\_Path

To examine the files, we can use Prefetch Viewer, an open-source tool by nirsoft. Link for the same is provided below

## 14. <a name='CollectingJumpListLNKFiles'></a>Collecting Jump List & LNK Files

Jump Lists are simply lists of recent used files associated with program that is pinned in the taskbar or Start Menu. Often, users pin files to the taskbar for which an entry is created inside the Windows system.

Shortcut files that we seen on our Desktop, those files are often referred as Link files. In addition to these LNK files, the OS automatically creates LNK file when user open non-executable file or document. Information gathered from the LNK file:

- Original file system path where target file is stored
- Timestamps for both target file and LNK file
- Size of target file
- System Name, Volume Name, Volume Serial Number and sometimes the MAC address

Jump Lists and Lnk files can be used to analyse the recent activity of the user.

> _C:\\Users\\%USERNAME%\\AppData\\Roaming\\Microsoft\\Windows\\Recent\\AutomaticDestinations_
>
> _C:\\Users\\%USERNAME%\\AppData\\Roaming\\Microsoft\\Windows\\Recent\\CustomDestinations_

We can recursively copy the items from the above mentioned location with Powershell and open the files in open-source tool "JumpListsView". Link for the tool is provided below:

To get the .lnk files, write the below command in Powershell window

> Get-WmiObject -Class Win32\_ShortcutFile | Select-Object PSComputerName,Name,CreationDate,Encrypted,InstallDate,LastAccessed,Target | Format-List

![](https://miro.medium.com/v2/resize:fit:700/1*2-wS3LcrmYsvdcZ-q1ZVlA.png)

## 15. <a name='CollectingShellBags'></a>Collecting ShellBags

Shellbags store user preference for GUI folder within the explorer. If ever made change to folder and returned to that folder to find new preferences intact, then Shellbags were in action.

These are can be used to reconstruct user activities, but information is available only for folders that have been opened and closed in Windows Explorer at once. We can also identify when folder was last visited or last updated.

Shellbags locations in Windows Registry:

> _HKEY\_CURRENT\_USER\\SOFTWARE\\Classes\\Local Settings\\Software\\Microsoft\\Windows\\Shell\\BagMRU_
>
> _HKEY\_CURRENT\_USER\\SOFTWARE\\Classes\\Local Settings\\Software\\Microsoft\\Windows\\Shell\\Bags_
>
> _HKEY\_CURRENT\_USER\\SOFTWARE\\Classes\\Local Settings\\Software\\Microsoft\\Windows\\Shell\\MuiCache_

To get the values from the above mentioned Registry paths, type the following commands in the Powershell window

> Get-ChildItem 'Registry::HKEY\_CURRENT\_USER\\SOFTWARE\\Classes\\Local Settings\\Software\\Microsoft\\Windows\\Shell\\' -Recurse > Path\_for\_txt.txt

For further information on Shellbags, you can check out this SANS blog:

## 16. <a name='SMBInfo'></a>SMB Info

Server Message Block (SMB) allows devices to perform number of functions for each other via local network. For e.g., Network can be used as a File sharing service between computers connected on a Local network.

To get the SMB Session info, write the following command in Powershell window

```powershell
Get-SmbSession
```

To know the information on the content sharing, write any of the following command in the powershell window

```powershell
Get-SmbShare
Get-WmiObject -Class Win32\_ShareToDirectory
```

![Output](https://miro.medium.com/v2/resize:fit:700/1*xUk3SN6aVmdNu-Ar31i50g.png)

**Win32_ShareToDirectory** class relates a shared resource on the computer system and the directory to which it is mapped.

## 17. <a name='ListofInstalledApplications'></a>List of Installed Applications

To gather the list of Installed applications, there are a number of commands. But why not one command only? Everytime we install an application, that application has an entry with it's Uninstaller that we see while removing it from the Control Panel.

But that is not the case with every application we are running inside the Windows system. Now with trend of portable applications, that do not require any installer, just plug-run terminology, those applications will not be listed inside the Control Panel.

Within the Registry, installed applications are found under the hive location

```shell
HKLM:\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\
HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\
```

Get Installed applications from the entries within Registry

```powershell
Get-ItemProperty "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate

Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object DisplayVersion,InstallDate,InstallLocation,InstallSource,Publisher,Version,DisplayName
```

Powershell provides 2 functions to get Installed application. **Get-AppxPackage** provides list of the app packages that are installed in a user profile.

```powershell
Get-AppxPackage -AllUsers | Select-Object Name,PackageFamilyName
```

![Output](https://miro.medium.com/v2/resize:fit:700/1*pnwQsp-JIYrJtpnJ7i_jhg.png)

Similarly, Get-CimInstance query "**Win32_Product**" provides list of installed applications.

```powershell
Get-CimInstance -Query "SELECT * FROM Win32_Product" | Select-Object Name,Caption,Version | Format-List
```

![Output](https://miro.medium.com/v2/resize:fit:660/1*sQsm35pmH6jlQqlgn9x5oQ.png)

## 18. <a name='WindowsDefenderLogs'></a>Windows Defender Logs

I suppose that every reader must be knowing the importance of Defender logs. Any malicious file introduced in the system, is detected by Defender and the antivirus creates a log for the same. Even for Incident Response team or Forensic team, this if of great interest.

Powershell provides a number of commands if your search in the powershell window

![Commands related to Defender Module](https://miro.medium.com/v2/resize:fit:700/1*1RiODp6Bl2hYI9vT5qzBMQ.png)

Get-MpComputerStatus gets the status of antimalware software installed on the computer.

![Output for Get-MpComputerStatus](https://miro.medium.com/v2/resize:fit:700/1*5G01u50TnAkU8lWUMoEvcQ.png)

But there is one Windows Event named "Microsoft-Windows-Windows Defender/Operational" which gathers the logs of all the WinDefender events. We'll try to parse the same and see the output using the following command

```powershell
Get-WinEvent -LogName "Microsoft-Windows-Windows Defender/Operational"
```

![](https://miro.medium.com/v2/resize:fit:700/1*ZAjPU_6FzAOyq64e6GDExg.png)

Let's try to save the logs into CSV with more attributes with the following command and observe the output

```powershell
Get-WinEvent -LogName "Microsoft-Windows-Windows Defender/Operational" | Select-Object ID,Level,Task,ProviderID,ProcessId,ThreadId,MachineName,UserId,TimeCreated,ActivityId,LevelDisplayName,Message | Export-Csv $PathtoCsv -NoTypeInformation -Force -Encoding UTF8
```

![](https://miro.medium.com/v2/resize:fit:700/1*UU-nT-I5NrGTMbkvDp1bzg.png)

Within the CSV file, I applied the filter on LevelDisplayName for Warnings and that provided the list of threats defender has detected on the system.

## 19. <a name='NotificationDatabase'></a>Notification Database

Notifications on Windows can hold useful data. Through these notifications we can retrieve valuable details such as the text or content of the notification that was displayed to the user, the date and time when the notification was received, notification expiration date, and other details. This feature enables investigators to track and recover events on the user device even if the source has been deleted.

Default location for the notification database file on the Windows system:

```shell
C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Notifications
```

![](https://miro.medium.com/v2/resize:fit:573/1*dP954ob4C-jIZAoHgLy3kA.png)

Notifications Database

First, copy the Notifications folder forensically to the desired location after creation of hashes of all the files. We can use SQLite DB Browser to view the .db file. Link for SQLite DB Browser:

Under the "Notification" table, you'll find the Notifications as shown in the below screenshot

![](https://miro.medium.com/v2/resize:fit:700/1*loHgciOS4gLhsDtSBBBiCw.png)

## 20. <a name='CortanaDatabaseInfo'></a>Cortana Database Info

If any reader is using Cortana to perform some operations, than there must some database created inside your Windows system. The deafult location for Cortana Database is

```shell
C:\Users\%USERNAME%\AppData\Local\Packages\Microsoft.Windows.Cortana.XXXXXXXX\
```

The contents of the database are stored in .edb extension database file. We can copy the contents forensically to our desired location and view the contents using tool _ESEDatabase Viewer by Nirsoft._

## 21. <a name='Conclusion'></a>Conclusion

Collection of Window artifacts is crucial and also important if found the system in Power-On state. Due to the volatile nature of the artifacts, it is necessary to collect as much information as possible according to their volatility described by the RFC-3227.

With the advanced functions of Powershell and scripting feature, the artifacts collection task can be done in minimal time allowing the investigator to do analysis procedure at ease. Further, the use of Open-Source tools for analysis can also be done to analyse the system from different angles as well.

Last & the major part of Windows system that remains is Registry. In the next part, I'll mention about Windows Registry, what are the important Hive locations where an investigator can find important clues, and how Powershell can be used to extract those clues.

Until then, any comments or suggestions on this would be greatly appreciated to create some new content for the readers.
