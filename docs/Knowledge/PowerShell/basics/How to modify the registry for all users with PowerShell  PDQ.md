---
created: 2022-05-05T15:53:08 (UTC +02:00)
tags: []
source: https://www.pdq.com/blog/modifying-the-registry-users-powershell/
author: Kris Powell
---

# How to modify the registry for all users with PowerShell | PDQ

> ## Excerpt
> Modifying the registry for all users with PowerShell is easy enough. With a little prep work you can modify the the registry at will logged on user or not.

---
We’re going to look at modifying the registry for all users whether or not a user is logged into a machine. This is a continuation of my last blog post on [how to modify the registry of another user](https://www.pdq.com/blog/modify-the-registry-of-another-user/).

As a quick refresher, we learned how to modify a user’s registry (HKEY\_CURRENT USER or HKEY\_USERS) without having that user logged onto a machine. We had to load and unload their NTUSER.DAT file separately in the HKEY\_USERS registry hive.

It was pretty exciting.

Now, we’re going to add to that excitement by learning how to do it for all users instead of only specific users.

## How to modify the registry for all users

Before we can modify the registry for all users, we need to be able to go out and grab all the ntuser.dat files so that we can load them as we did in the last blog post.

I know what you’re thinking. You’re thinking that’s easy! We know that the ntuser.dat file is in the _C:\\Users\\<Username>\\_ directory, so that should be as simple as searching through _C:\\Users_ for any ntuser.dat file, _right_?!

This will only work if nobody is logged into a machine. We have to take into consideration any currently-logged on users. Any currently-logged on users will already have their ntuser.dat files loaded into the registry. This includes users who forget to log off. Even though their session is disconnected and somebody else has logged on, their registry is still loaded in the registry.

Here’s an example of this. I’m currently logged into my test machine. There is also a disconnected user Reg who forgot to log off:

![PS-Blog-Registry-HKU-example](https://images.ctfassets.net/xwxknivhjv1b/5gojZdqNNiXp5IGS9ehbld/f9640834435cd9d4e2c9b53dd0a62281/PS-Blog-Registry-HKU-example.png)

If I try loading Reg’s ntuser.dat, I encounter an error telling me that ntuser.dat is already being used by something else.

![PS-Blog-Registry-Cannot-load-ntuser.dat](https://images.ctfassets.net/xwxknivhjv1b/2KSLbUFmmJdge1w6VyidJh/3a5a99acd7486205a2c5035258e4e182/PS-Blog-Registry-Cannot-load-ntuser.dat_.png)

So, what do we do?

We need to find all users on a machine and compare it with all currently-logged on user security identifiers (SIDs).

## Find all users and their SIDs

Fortunately for us, there is a convenient location in the registry that stores the users on a machine and their SIDs.

`HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*`

This location will have a list of all the SIDs for a machine as well as some other properties. We’re interested in the SIDs that start with S-1-5-21. Notice that you see the two SIDs from an earlier screenshot:

![PS-Blog-Registry-ProfileList-example](https://images.ctfassets.net/xwxknivhjv1b/xp9MyYV8VH8PWq3gXQGoe/81d2a0664f21491a16a389051321e4de/PS-Blog-Registry-ProfileList-example.png)

From this, we are able to use regular expressions and some calculated properties to select some great information with PowerShell. We’ll use the [Get-ItemProperty](https://www.pdq.com/powershell/get-itemproperty/) cmdlet to get that information from the registry.

`$PatternSID = 'S-1-5-21-\d+-\d+\-\d+\-\d+$' Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*' | Where-Object {$_.PSChildName -match $PatternSID} | select @{name="SID";expression={$_.PSChildName}}, @{name="UserHive";expression={"$($_.ProfileImagePath)\ntuser.dat"}}, @{name="Username";expression={$_.ProfileImagePath -replace '^(.*[\\\/])', ''}}`

Now we have a list of the usernames and their associated SIDs.

## Getting SID of users in HKEY\_USERS

Next, we’ll need to compare those SIDs with the SIDs of the users that are currently logged on and have their registry’s loaded to HKEY\_USERS (see [Get-ChildItem](https://www.pdq.com/powershell/get-childitem/)) :

`Get-ChildItem Registry::HKEY_USERS | Where-Object {$_.PSChildName -match $PatternSID} | select PSChildName`

## Putting it all together

Now, we just need to compare the two lists of SIDs and we’ll be able to modify the registry at will. I’ve compiled it all into a template that somebody could use to read or modify the registry of each user on a machine. In my example, I load each registry (if not loaded) and attempt to read the Uninstall key at HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\\*

This will show me which users have per-user installs of software as well as the software name:

`# Regex pattern for SIDs $PatternSID = 'S-1-5-21-\d+-\d+\-\d+\-\d+$' # Get Username, SID, and location of ntuser.dat for all users $ProfileList = gp 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*' | Where-Object {$_.PSChildName -match $PatternSID} | Select @{name="SID";expression={$_.PSChildName}}, @{name="UserHive";expression={"$($_.ProfileImagePath)\ntuser.dat"}}, @{name="Username";expression={$_.ProfileImagePath -replace '^(.*[\\\/])', ''}} # Get all user SIDs found in HKEY_USERS (ntuder.dat files that are loaded) $LoadedHives = gci Registry::HKEY_USERS | ? {$_.PSChildname -match $PatternSID} | Select @{name="SID";expression={$_.PSChildName}} # Get all users that are not currently logged $UnloadedHives = Compare-Object $ProfileList.SID $LoadedHives.SID | Select @{name="SID";expression={$_.InputObject}}, UserHive, Username # Loop through each profile on the machine Foreach ($item in $ProfileList) { # Load User ntuser.dat if it's not already loaded IF ($item.SID -in $UnloadedHives.SID) { reg load HKU\$($Item.SID) $($Item.UserHive) | Out-Null } ##################################################################### # This is where you can read/modify a users portion of the registry # This example lists the Uninstall keys for each user registry hive "{0}" -f $($item.Username) | Write-Output Get-ItemProperty registry::HKEY_USERS\$($Item.SID)\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Foreach {"{0} {1}" -f " Program:", $($_.DisplayName) | Write-Output} Get-ItemProperty registry::HKEY_USERS\$($Item.SID)\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Foreach {"{0} {1}" -f " Program:", $($_.DisplayName) | Write-Output} ##################################################################### # Unload ntuser.dat IF ($item.SID -in $UnloadedHives.SID) { ### Garbage collection and closing of ntuser.dat ### [gc]::Collect() reg unload HKU\$($Item.SID) | Out-Null } }`

### Final notes

Use this information with a healthy dose of caution. It is never wise to modify the registry without a good reason, and even some good reasons aren’t always great justification. In other words, be responsible and test your scripts before using on production systems. We cannot be held responsible for any issues that you may encounter.

___

![Black and White PDQ logo](https://images.ctfassets.net/xwxknivhjv1b/6kl4sYvGd7LX2RcMqMiQjY/a653260ebff002be6f0a81bd4a9258b7/Frame_58.png)

Kris Powell

Kris was an employee at PDQ.
