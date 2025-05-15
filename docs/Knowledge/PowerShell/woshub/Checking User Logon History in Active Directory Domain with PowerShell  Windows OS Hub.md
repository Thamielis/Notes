There are several different tools to get information about the time of a user logon to an Active Directory domain. The time of the last successful user authentication in an AD domain may be obtained from the user **lastLogon** attribute it is only updated on the domain controller on which the user is authenticated) or **lastLogonTimpestamp** attribute (it is replicated between the DCs in a domain, but only in 14 days by default). You can check the value of the user attribute using the [AD attribute editor](https://woshub.com/active-directory-attribute-editor/) or with the [Get-ADUser](https://woshub.com/get-aduser-getting-active-directory-users-data-via-powershell/) PowerShell cmdlet. However, sometimes you may want to **view the history of user activity (logons) in a domain** for a long period of time.

You can get information about successful user logon (authentication) events from the domain controller logs. In this article we will show how to track user logon history in the domain using PowerShell. This way you can get a complete history of user activity in the domain, the time when a user starts working and logon computers.

Contents:

*   [Active Directory User Logon Audit Policy](https://woshub.com/check-user-logon-history-active-directory-domain-powershell/#h2_1)
*   [Getting User Last Logon History with PowerShell](https://woshub.com/check-user-logon-history-active-directory-domain-powershell/#h2_2)
*   [Get Domain User Logon History Based on Kerberos Events](https://woshub.com/check-user-logon-history-active-directory-domain-powershell/#h2_3)

Active Directory User Logon Audit Policy
----------------------------------------

In order the information about successful/failed logon to be collected in the domain controller logs, enable the audit policy of user logon events.

1.  Open the [domain GPO management console](https://woshub.com/group-policy-active-directory/) (`GPMC.msc`);
2.  Open the **Default Domain Policy** GPO settings and go to Computer Configuration -> Policies -> Windows Settings -> Security Settings –> Advanced Audit Policy Configuration -> Audit Policies -> Logon/Logoff;  
    ![[images/active-directory-audit-policy-user-logon-logoff.png.webp]]
3.  Enable two audit policies (**Audit Logon** and **Audit Other Logon/Logoff Events**). Select **Success** and **Failure** options in the audit policy settings to register both successful and failed logons in the Security log on the DCs and computers;  
    ![[images/enable-user-logon-audit-policy-in-active-directory.png.webp]]
4.  Save the changes in GPO and update the policy settings on your domain controllers using the following command: [gpupdate /force](https://woshub.com/update-group-policy-settings-windows) (or wait for 90 minutes, DC replication time is not taken into account).

When a user logons to any computer in Active Directory domain, an event with the Event ID **4624** (**An account was successfully logged on**) appears in the log of the domain controller that has authenticated the user (Logon Server). A successfully authenticated account (Account name), a computer name (Workstation name) or an IP address (Source Network Address) of a computer used to logon are shown in the event description.

Also, you need to check the value of the **Logon Type** field. We are interested in the following codes:

*   **Logon Type 10** – Remote Interactive logon – a logon using RDP, [shadow connection](https://woshub.com/rds-shadow-how-to-connect-to-a-user-session-in-windows-server-2012-r2/) or Remote Assistance (this event may appear on a domain controller if an administrator or non-admin user having [RDP access permission on DC](https://woshub.com/allow-non-administrators-rdp-access-to-domain-controller/) logs on). This event is used to [monitor and analyze the activity of Remote Desktop Services users](https://woshub.com/rdp-connection-logs-forensics-windows/).
*   **Logon Type 3** –  Network logon (used when a user is authenticated on a DC and connects to a [shared folder, printer](https://woshub.com/sharing-files-printers-without-homegroup-windows-10/) or IIS service)

![[images/filter-dc-security-log-by-the-eventid-4624-an-acc.png.webp]]

Also you can track a Kerberos ticket issue event when authenticating a user. The Event ID **4768** is **A Kerberos authentication ticket (TGT) was requested**. To do it, enable the event audit in the policy Account Logon –> Audit Kerberos Authentication Service -> Success and Failure.

![[images/audit-kerberos-authentication-service-policy.png.webp]]

The event 4768 also contains a name (IP address) of a computer and a user account (Account Name or User ID) that received a Kerberos ticket (has been authenticated).

![[images/windows-event-id-4768-a-kerberos-authentication.png.webp]]

Getting User Last Logon History with PowerShell
-----------------------------------------------

You can use the **Get-Eventlog** PowerShell cmdlet to get all events from the domain controller’s event logs, filter them by the EventID you want, and display information about the time when a user authenticated in the domain and a computer used to logon. Since there may be multiple domain controllers in your domain and you may want to get a user logon history from each of them, use the [Get-ADDomainController](https://woshub.com/get-addomaincontroller-dc-info-powershell/) cmdlet (from the [AD module for Windows PowerShell](https://woshub.com/powershell-active-directory-module/)). The cmdlet allows to get the list of all DCs in your domain.

The following PowerShell script allows you to get all logon events for a user to an AD domain from all domain controllers. As a result, you will get a table with the user logon history and computers a user authenticated from.

``# a username, whose logon history you want to view   $checkuser='*jbrown*'   # getting information about the user logon history for the last 2 days (you can change this value)   $startDate = (get-date).AddDays(-2)   $DCs = Get-ADDomainController -Filter *   foreach ($DC in $DCs){   $logonevents = Get-Eventlog -LogName Security -InstanceID 4624 -after $startDate -ComputerName $dc.HostName   foreach ($event in $logonevents){   if (($event.ReplacementStrings[5] -notlike '*$') -and ($event.ReplacementStrings[5] -like $checkuser)) {   # Remote (Logon Type 10)   if ($event.ReplacementStrings[8] -eq 10){   write-host "Type 10: Remote Logon`tDate: "$event.TimeGenerated "`tStatus: Success`tUser: "$event.ReplacementStrings[5] "`tWorkstation: "$event.ReplacementStrings[11] "`tIP Address: "$event.ReplacementStrings[18] "`tDC Name: " $dc.Name   }   # Network(Logon Type 3)   if ($event.ReplacementStrings[8] -eq 3){   write-host "Type 3: Network Logon`tDate: "$event.TimeGenerated "`tStatus: Success`tUser: "$event.ReplacementStrings[5] "`tWorkstation: "$event.ReplacementStrings[11] "`tIP Address: "$event.ReplacementStrings[18] "`tDC Name: " $dc.Name   }   }   }   }``

![[images/powershell-script-get-ad-users-logon-history-with.png.webp]]

Get Domain User Logon History Based on Kerberos Events
------------------------------------------------------

You can also get a user authentication history in the domain based on the event of a Kerberos ticket issue (TGT Request — EventID 4768). In this case, less events will be displayed in the output (network logons are excluded, as well as access events to the DC folders during getting GPO files or running logon scripts). The following PowerShell script will display the information about all user logons for the last 24 hours:  
`   $alluserhistory = @()   $startDate = (get-date).AddDays(-1)   $DCs = Get-ADDomainController -Filter *   foreach ($DC in $DCs){   $logonevents = Get-Eventlog -LogName Security -InstanceID 4768 -after $startDate -ComputerName $dc.HostName   foreach ($event in $logonevents){   if ($event.ReplacementStrings[0] -notlike '*$') {   $userhistory = New-Object PSObject -Property @{   UserName = $event.ReplacementStrings[0]   IPAddress = $event.ReplacementStrings[9]   Date = $event.TimeGenerated   DC = $dc.Name   }   $alluserhistory += $userhistory   }   }   }   $alluserhistory`

![[images/get-all-users-logon-history-based-on-kerberos-tick.png.webp]]

Note that in this case you won’t see any logon events of the users authenticated from clients or apps that [use NTLM instead of Kerberos](https://woshub.com/disable-ntlm-authentication-windows/).