In this article, we will show how to enable the process tracking audit policy in Windows in order to find out what programs were running on a computer. Quite often, the administrator is asked to provide information about what apps the user runs, when they last ran the specific program, etc. Also, this feature can be useful then you tracing malware and threat activity. You can get this information from the Windows Event Log and make a convenient report using PowerShell.

You can trace start/stop events for Windows application processes using the process tracking audit policy.

1.  Open the [Local Group Policy Editor](https://woshub.com/group-policy-editor-gpedit-msc-for-windows-10-home/) (`gpedit.msc`);
2.  Go to the following GPO section: Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Audit Policy;
3.  Enable the **Audit process tracking** policy and select the **Success** checkbox; ![[images/enable-audit-process-tracking-policy.png.webp]]
4.  Save the changes and [update the local GPO settings on your computer](https://woshub.com/update-group-policy-settings-windows/) using this command: `gpupdate /force`

Open the Event Viewer (`eventvwr.msc`) and expand Windows Logs -> Security. Now, when any application (process) starts, the Process Creation event with the EventID **4688** appears in the log.

```
A new process has been created.
```

The event information contains the username who has run the program (`Creator Subject`), the name of a process executable (`New Process Name`), and a parent process the app was run from (`Creator Process Name`).

![[images/eventid-4688-a-new-process-has-been-created-.png.webp]]

Note that when you enable the **Audit process tracking** policy described above, all events related to processes are saved to the Security log. If you want to reduce the number of events in the Event Viewer and save only the information about process creation events, you may disable this policy and enable the advanced audit policy item only: **Audit Process Creation** (Windows Settings -> Security Settings -> Advanced Audit Policy Configurations -> System Audit Policy -> Detailed Tracking).

![[images/enable-gpo-the-option-audit-process-creation.png.webp]]

To include information about process creation options (arguments the apps are run with), enable the **Include command line in process creation events** option under Computer Configuration -> Administrative Templates -> System -> Audit Process Creation.

![[images/include-command-line-in-process-creation-events.png.webp]]

After you enable the policy, you will see what argument was used to start a program in the **Process Command Line**.

![[images/process-command-line-arguments-in-event-descriptio.png.webp]]

Be sure to increase the max size of your Security log file (the default size is 20MB). This allows to store the process history in Windows for a longer period of time. To do it, open the Security log properties and increase the **Maximum log size (KB)** value.  
**![[images/increase-security-log-max-size-in-event-viewer.png.webp]]**

You can use the Event Viewer filters to analyze apps run by a user. However, it is not very convenient. Below, I’ll show some PowerShell scripts that allow you to get handy reports with the history of running apps by users. In this case, I use the [**Get-WinEvent** command](https://woshub.com/search-windows-event-logs-powershell/) to get events from the Event Viewer log:

`$processhistory = @()   $today = get-date -DisplayHint date -UFormat %Y-%m-%d   $events=Get-WinEvent -FilterHashtable @{   LogName = 'Security'   starttime="$today"   ID = 4688   }   foreach ($event in $events){   $proc = New-Object PSObject -Property @{   ProcessName=$event.Properties[5].Value   Time=$event.TimeCreated   CommandLine=$event.Properties[8].Value   User=$event.Properties[1].Value   ParentProcess=$event.Properties[13].Value   }   $processhistory += $proc   }   $processhistory| Out-GridView`

This PowerShell script selects all process startup events for today and displays a list of processes, their startup times, and usernames in an [Out-GridView table](https://woshub.com/using-out-gridview-table-powershell/).

![[images/powershell-get-running-process-history.png.webp]]

You may use the object array you have got to execute different audit queries.

For example:

*   To find all users who have run a specific app:`$proc_name="notepad++.exe"   $processhistory | where-object {$_.ProcessName –like “*$proc_name*”}|out-gridview`![[images/get-a-list-of-users-who-run-a-specific-application.png.webp]]
*   To display a list of apps that a specific user has run today:  
    `$username="aberg"   $processhistory | where-object {$_.User –like “*$username*”}|out-gridview`

We often use such scripts to analyze apps run by users on the [RDS farm hosts](https://woshub.com/deploy-remote-desktop-services-rds-farm-windows-server/).

In Windows, you can also find the history of running programs in %SystemRoot%\\AppCompat\\Programs\\**Amcache.hve** file. The [file is locked in Windows](https://woshub.com/unlock-file-locked-windows-system-process/) and you may view it only if you boot a computer from a LiveCD or a boot/installation media. The file contains startup and install/uninstall tags, as well as executable checksums (SHA1). You can convert this file from binary to a text format using third-party tools (for example, _regripper_).