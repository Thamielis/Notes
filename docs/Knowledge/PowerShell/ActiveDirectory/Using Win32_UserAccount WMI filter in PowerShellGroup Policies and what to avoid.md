[Home][1] [Active Directory][2] Using Win32\_UserAccount WMI filter in PowerShell/Group Policies and what to avoid

![img_5ed5f518efd15](Using%20Win32_UserAccount%20WMI%20filter%20in%20PowerShellGroup%20Policies%20and%20what%20to%20avoid/img_5ed5f518efd15.png)

Some months ago, I created **PowerShell Script** to **create local administrative users** on workstations – [Create a local user or administrator account in Windows using PowerShell][3]. It's a bit overcomplicated, but the goal was it should work for Windows 7 and up, and that means supporting PowerShell 2.0. As part of that exercise, I've been using **Win32\_UserAccount** WMI based query to find local users and manage them to an extent. While **Get-LocalUser** exists, it's not suitable for the **PowerShell 2.0** scenario. I also use the same query in **GPO for WMI filtering**. You can say it's been a good friend of mine – until today! Let's take a look at this basic WMI query:

1.  Get-WmiObject -Query "SELECT \* FROM Win32\_UserAccount WHERE LocalAccount=true" | Format-Table

[![](Using%20Win32_UserAccount%20WMI%20filter%20in%20PowerShellGroup%20Policies%20and%20what%20to%20avoid/img_5ed5f518efd15.png)][4]

It can also give more relevant data, such as if the account is **enabled** or **disabled**.

1.  Get-WmiObject -Query "SELECT \* FROM Win32\_UserAccount Where LocalAccount = true" | Format-Table Caption, Domain, Name, PasswordChangeable, PasswordRequired, Disabled

I've been using this **WMI** query both in PowerShell scripts that need to support **PowerShell 2.0 (Windows 7)** and in **GPO WMI** filtering when I apply GPO that only should execute if a given user exists.

[![](Using%20Win32_UserAccount%20WMI%20filter%20in%20PowerShellGroup%20Policies%20and%20what%20to%20avoid/img_5ed5f4fd3e1d2.png)][5]

_WMI Win32\_UserAccount - Why even mention it?_

Now you may be wondering why I even mention this? I was checking for the existence of a single local user on a workstation rather than asking for multiple users. So by merely adding **Name = ‘Administrator'** I'm making sure my query outputs only a single user.

1.  Get-WmiObject -Query "SELECT \* FROM Win32\_UserAccount Where LocalAccount = true AND Name = 'Administrator'" | ft

Except now, instead of **1 second**, it takes **2 minutes**.

_WMI Win32\_UserAccount - Why that happens?_

To understand why would there be a difference between those two queries

1.  Get-WmiObject -Query 'Select \* FROM Win32\_UserAccount WHERE LocalAccount = true' | ft
2.  Get-WmiObject -Query "SELECT \* FROM Win32\_UserAccount Where LocalAccount = true AND Name = 'Administrator'" | ft

I've run those, but without any **WHERE** filtering.

1.  Get-WmiObject -Query 'Select \* FROM Win32\_UserAccount' | ft

And suddenly, everything made sense. Without **WHERE** filtering, it queries not only local users but **Active Directory** users as well. This explains why a simple query would t**ake 2 minutes – I have over 50000 users** in my **AD**. Well, it only sort of makes sense because we're using an almost same query, which has a very subtle difference that shouldn't impact query in that way. If anything, it should be faster because we added condition limiting our output.

[![](Using%20Win32_UserAccount%20WMI%20filter%20in%20PowerShellGroup%20Policies%20and%20what%20to%20avoid/img_5ed55d4591bab.png)][6]

So, while I could probably find some way to work around this issue in **PowerShell**, it doesn't solve my problem when using the very same query in **WMI filtering for Group Policies**. It means that each time the GPO gets executed, it takes **2 minutes+** to do an assessment, whether it's valid for the current workstation or not. Not to mention, it impacts the performance of an AD.

_WMI Win32\_UserAccount - Workaround_

What's the fix? Changing **equal (**\=**)** to **LIKE**. Consider those two queries:

1.  Get-WmiObject -Query "SELECT \* FROM Win32\_UserAccount Where LocalAccount = true AND Name Like 'Administrator'" | ft
2.  Get-WmiObject -Query "SELECT \* FROM Win32\_UserAccount Where LocalAccount = true AND Name = 'Administrator'" | ft

Almost the same, but the first one takes **1 second**, the second one **2 minutes**. So for some weird reason, the equal sign is causing **WMI provider** to go nuts, and changing it to **LIKE** resolves the issue. While I don't know why that happens, I'm pretty happy with this solution. I'm pretty sure I will forget about it in a few days so that this blog post will be my reminder to not take things for granted and that even subtle difference requires extensive testing.

Przemyslaw Klys / About Author

System Architect with over 14 years of experience in the IT field. Skilled, among others, in Active Directory, Microsoft Exchange and Office 365. Profoundly interested in PowerShell. Software geek.

## Related Posts

[1]: https://evotec.xyz/
[2]: https://evotec.xyz/category/active-directory/
[3]: https://evotec.xyz/create-a-local-user-or-administrator-account-in-windows-using-powershell/
[4]: https://evotec.xyz/wp-content/uploads/2020/06/img_5ed5f518efd15.png
[5]: https://evotec.xyz/wp-content/uploads/2020/06/img_5ed5f4fd3e1d2.png
[6]: https://evotec.xyz/wp-content/uploads/2020/06/img_5ed55d4591bab.png