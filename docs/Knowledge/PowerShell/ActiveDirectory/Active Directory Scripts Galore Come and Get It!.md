---
created: 2022-03-10T18:02:41 (UTC +01:00)
tags: []
source: https://adamtheautomator.com/active-directory-scripts/
author: 
---

# Active Directory Scripts Galore: Come and Get It!

> ## Excerpt
> Need an Active Directory script to automate a process in AD? Look no further than this huge list of PowerShell scripts!

---
-   [Active Directory SPNs](https://adamtheautomator.com/active-directory-scripts/#Active_Directory_SPNs "Active Directory SPNs")
-   [User Accounts](https://adamtheautomator.com/active-directory-scripts/#User_Accounts "User Accounts")
-   [Active Directory Groups](https://adamtheautomator.com/active-directory-scripts/#Active_Directory_Groups "Active Directory Groups")
-   [GPOs](https://adamtheautomator.com/active-directory-scripts/#GPOs "GPOs")
-   [DNS](https://adamtheautomator.com/active-directory-scripts/#DNS "DNS")
-   [Active Directory Troubleshooting](https://adamtheautomator.com/active-directory-scripts/#Active_Directory_Troubleshooting "Active Directory Troubleshooting")
-   [Organizational Units](https://adamtheautomator.com/active-directory-scripts/#Organizational_Units "Organizational Units")
-   [Computer Accounts](https://adamtheautomator.com/active-directory-scripts/#Computer_Accounts "Computer Accounts")
-   [Summary](https://adamtheautomator.com/active-directory-scripts/#Summary "Summary")

Active Directory is one of the most common uses for PowerShell. I have personally been building Active Directory scripts using VBScript and PowerShell for over a decade. Here’s a big sample of Active Directory PowerShell scripts to do all kinds of stuff!

> _Discover, report and prevent insecure Active Directory account passwords in your environment with [Specops’ completely free Password Auditor Pro](https://specopssoft.com/product/specops-password-auditor/?utm_source=ATA&utm_medium=referral&utm_campaign=ATA%20promo%202021&utm_content=SPA%20in-article%20link). Download it today!_

All of the Active Directory scripts I’ll be listing here are in various stages of functionality. The point of this post isn’t to give you 100% tested, pristine scripts but rather give you a jumpstart on creating some of your own.

All of the scripts listed here are Active Directory [PowerShell](https://adamtheautomator.com/tag/powershell/) scripts. You _can_ script things in Active Directory but if you’ve noticed, PowerShell is sorta my thing. Enjoy!

-   [Active Directory SPNs](https://adamtheautomator.com/active-directory-scripts/#Active_Directory_SPNs "Active Directory SPNs")
-   [User Accounts](https://adamtheautomator.com/active-directory-scripts/#User_Accounts "User Accounts")
-   [Active Directory Groups](https://adamtheautomator.com/active-directory-scripts/#Active_Directory_Groups "Active Directory Groups")
-   [GPOs](https://adamtheautomator.com/active-directory-scripts/#GPOs "GPOs")
-   [DNS](https://adamtheautomator.com/active-directory-scripts/#DNS "DNS")
-   [Active Directory Troubleshooting](https://adamtheautomator.com/active-directory-scripts/#Active_Directory_Troubleshooting "Active Directory Troubleshooting")
-   [Organizational Units](https://adamtheautomator.com/active-directory-scripts/#Organizational_Units "Organizational Units")
-   [Computer Accounts](https://adamtheautomator.com/active-directory-scripts/#Computer_Accounts "Computer Accounts")
-   [Summary](https://adamtheautomator.com/active-directory-scripts/#Summary "Summary")

## Active Directory SPNs

-   [ActiveDirectorySPN PowerShell script](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/ActiveDirectorySPN.psm1)  
    This is a [PowerShell module](https://adamtheautomator.com/powershell-modules/ "PowerShell module") that allows you to create, change, and remove Active Directory SPNs using commands like `Get-AdUserSpn`, `Remove-AdComputerSpn` and so on. This module is handy so you don’t have to remember how to use `[Set-AdUser](https://adamtheautomator.com/set-aduser/ "Set-AdUser")` to change SPNs.

## User Accounts

-   [Bulk-AD-User-Creation.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Bulk-AD-User-Creation.ps1)  
    Here’s an example of how to create Active Directory users in bulk by reading from a text file.
-   [Copy-AD-User-Account.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Copy-AD-User-Account.ps1)  
    Do you use template user accounts that you need to build other accounts from? Look no further! This script copies attributes from a user account and also all group memberships to create a new AD user.
-   [FindUnusedUserAccounts.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/FindUnusedUserAccounts.ps1)  
    Use this script to find Active Directory user accounts that aren’t used anymore and remove them. This script also create a CSV log file.
-   [Get-ActiveDirectoryUserActivity.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-ActiveDirectoryUserActivity.ps1)  
    This script finds all logon and logoff times of all users on all computers in an Active Directory organizational unit. The appropriate audit policies must be enabled first because the appropriate event IDs will show up.
-   [Get-AdUserMatches.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-AdUserMatches.ps1)  
    You’ve got a CSV file full of employee names and need to find their AD user accounts, however, nothing ever matches up 100%. Use this script to find AD user accounts from a CSV file and also get an example of using “fuzzy” searching.
-   [Get-All-Docs-Password-Age.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-All-Docs-Password-Age.ps1)  
    Here’s a great example of how to pull the user account password age from lots of AD users at once.
-   [Get-Inactive-Ad-Users.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-Inactive-Ad-Users.ps1)  
    Another example of how to pull employee information from a CSV and find their AD user accounts. This script was used to find inactive accounts.
-   [Get-LoggedOnUser.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-LoggedOnUser.ps1)  
    Although not technically AD-related, the function in this script queries CIM on the local or a remote computer and returns the user (local or Active Directory) that is currently logged on.
-   [GetAdUsersWithPasswordLastSetOlderThan.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/GetAdUsersWithPasswordLastSetOlderThan.ps1)  
    Here’s another older script I built to find AD users that set their password a certain time ago.
-   [GetPasswordResetCountXDaysOld.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/GetPasswordResetCountXDaysOld.ps1)  
    Use the code in this script to find all AD users that have set their password. There’s some overlap between this one and GetAdUserWithPasswordLastSetOlderThan.ps1.
-   [JEA-PSWA-ActiveDirectory-User-Admin.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/JEA-PSWA-ActiveDirectory-User-Admin.ps1)  
    I remember this one! This was a script that took forever that allows you to delegate AD change responsibilities to other users. This was used to delegate HR access to create and change AD users.
-   [New-AdUserProvision.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/New-AdUserProvision.ps1)  
    This an example of a script that covers all the bases. This script does everything from create the user account, assign groups, add to the appropriate OU and even creates a home folder!
-   [Get-UserLogonSessionHistory.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-UserLogonSessionHistory.ps1)  
    This script finds all logon, logoff and total active session times of all users on all computers specified. For this script to function as expected, the advanced AD policies; Audit Logon, Audit Logoff and Audit Other Logon/Logoff Events must be enabled and targeted to the appropriate computers via GPO.

## Active Directory Groups

-   [Get-AdGroupMembershipChange.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-AdGroupMembershipChange.ps1)  
    This script queries multiple Active Directory groups for new members in a domain. It records group membership in a CSV file in the same location as the script is located. On the script’s initial run it will simply record all members of all groups into this CSV file. On subsequent runs it will query each group’s member list and compare that list to what’s in the CSV file. If any differences are found (added or removed) the script will update the CSV file to reflect current memberships and notify an administrator of which members were either added or removed.
-   [Get-EmptyGroup.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-EmptyGroup.ps1)  
    This function queries the Active Directory domain the initiating computer is in for all groups that have no members. This is common when attempting to find groups that can be removed. This does not include default AD groups like Domain Computers, Domain Users, etc.
-   [New-AdGroupMembershipMonitor.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/New-AdGroupMembershipMonitor.ps1)  
    I liked writing this script because it was a foray into security. This script actively monitors an Active Directory group for any membership changes. If any members are added or removed, it can notify you.

## GPOs

-   [CompareIEGPO.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/CompareIEGPO.ps1)  
    This is an old script but still useful I used to compare two GPOs. This script pulls registry information the GPOs set and compares them to see what the differences are.
-   [Get-DisabledGpo.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-DisabledGpo.ps1)  
    This function queries the Active Directory domain the initiating computer is in for all GPOs that either have their computer, user or both settings disabled. This is common when attempting to find GPOs that can be removed.
-   [Get-GPO-Reg-Settings.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-GPO-Reg-Settings.ps1)  
    Using `Get-GPRegistryValue` and some magic, this scripts pulls all of the registry settings one or more GPOs set when applied.
-   [Get-GPOs-Linked-To-Empty-OUs.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-GPOs-Linked-To-Empty-OUs.ps1)  
    This is another good example of a script you can use when cleaning up AD. This one was used to find GPOs that weren’t doing anything at all because they were linked to empty OUs.
-   [Get-Gpo-Setting.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-Gpo-Setting.ps1)  
    An OK example of finding GPO registry settings.
-   [Get-Inactive-GPO-Settings.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-Inactive-GPO-Settings.ps1)  
    This script finds all GPOs in the current domain which have either the user or computer configuration section enabled yet have no settings enabled in that section. Good script for AD cleanup work.
-   [Get-Inactive-GPOs.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-Inactive-GPOs.ps1)  
    Another example of how to pull GPOs that are not being used anymore.
-   [Get-UnlinkedGpo.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-UnlinkedGpo.ps1)  
    This function queries the Active Directory domain the initiating computer is in for all GPOs that do not have a link to an object. This is common when attempting to find GPOs that can be removed.

## DNS

-   [Get-AdDnsRecordAcl.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-AdDnsRecordAcl.ps1)  
    This script retrieves the ACL from an Active Directory-integrated [DNS record](https://adamtheautomator.com/powershell-dns/ "DNS record"). This is a good script to use when troubleshooting issues with dynamic DNS.

## Active Directory Troubleshooting

-   [Get-DcDiag.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-DcDiag.ps1)  
    I love the old school _dcdiag_ utility but it wasn’t properly PowerShellified. This is a script that parses dcdiag’s output and returns rich objects.
-   [TestSiteReplicationMod.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/TestSiteReplicationMod.ps1)  
    Use this script to test to ensure DCs are replicating. It makes a change on one DC and then polls all the other ones to see how long (if at all) that objects takes to replicate.

## Organizational Units

-   [Get-Empty-OUs.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-Empty-OUs.ps1)  
    Another cleanup script to find all organizational units that are empty. Might as well clean those up!

## Computer Accounts

-   [Get-Old-Computer-Accounts.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-Old-Computer-Accounts.ps1)  
    Need to cleanup old Active Directory computer accounts? Not problem. Take a look at some good examples of using text files and AD to make it happen.
-   [Get-ClientsUnderNoSite.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Get-ClientsUnderNoSite.ps1)  
    Sometimes AD clients find themselves not assigned to a site. This can lead to all kinds of problems. Use this script to find those AD computers that are no longer assigned to a site and are calling for help.
-   [Rejoin-Computer.ps1](https://github.com/adbertram/Random-PowerShell-Work/blob/master/ActiveDirectory/Rejoin-Computer.ps1)  
    This script disjoins a computer from an Active Directory domain, performs a reboot and upon coming back up joins it to the domain again and performs another reboot.

## Summary

That’s it! Those are a few of the Active Directory scripts I’ve built over the years. I sure wish I had been better at keeping track of all of them! I hope these scripts give you a jumpstart on creating some useful Active Directory scripts of your own.

Hate ads? Want to support the writer? Get many of our tutorials packaged as an ATA Guidebook.

[Explore ATA Guidebooks](https://adamtheautomator.com/ata-guidebooks/)
