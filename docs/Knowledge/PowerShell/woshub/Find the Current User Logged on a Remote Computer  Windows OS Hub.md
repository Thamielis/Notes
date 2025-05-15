Quite often an administrator needs to quickly find out the username logged on a remote Windows computer. In this article, we’ll show some tools and PowerShell scripts that can help you to get the names of users logged on the remote computer.

Contents:

*   [Check Logged in Users with PSLoggedOn and Qwinsta](https://woshub.com/find-current-user-logged-remote-computer/#h2_1)
*   [How to Get the Current User on a Remote Computer Using PowerShell?](https://woshub.com/find-current-user-logged-remote-computer/#h2_2)
*   [PowerShell Script to Find Logged On Users on Remote Computers](https://woshub.com/find-current-user-logged-remote-computer/#h2_3)

Check Logged in Users with PSLoggedOn and Qwinsta
-------------------------------------------------

Microsoft’s SysInternals PSTools includes a console utility called **PSLoggedOn.exe** that can be used to get the name of the user who is logged into a remote computer, as well as a list of [SMB sessions](https://woshub.com/managing-open-files-windows-server-share/) connected to it.

Download the tool and run it:

`psloggedon \\RemoteCompName`

![[images/psloggedon-view-whom-is-logged-on-remote-computer.png.webp]]

As you can see, the tool returned the name of the logged-on user (_Users logged on locally_) and a list of users who access this computer’s SMB resources over the network (_Users logged on via resource shares_).

If you want to get only the name of the user logged on locally, use the **\-l** option:

`Psloggedon.exe \\pc1215wks1 –l`

PSLoggedOn connects to the registry and checks the name of the user logged on locally. To do it, the **RemoteRegistry** service must be running. You can run and [configure automatic service startup using PowerShell](https://woshub.com/manage-windows-services-powershell/)**:**

`Set-Service RemoteRegistry –startuptype automatic –passthru   Start-Service RemoteRegistry`

You can also get a list of sessions on a remote computer using the built-in `qwinsta` tool. This tool should be familiar to any administrator managing Remote Desktop Services (RDS) terminal environment. To get a list of logged user sessions from a remote computer, run the command:

`qwinsta /server:be-rdsh01`

![[images/qwinsta-find-a-logged-on-user-remotely.png.webp]]

The tool returns a list of all sessions (active and disconnected [by an RDP timeout](https://woshub.com/remote-desktop-session-time-limit/)) on an RDS server or in a desktop Windows 10 (11) edition (even if [you allowed multiple RDP connections to it](https://woshub.com/how-to-allow-multiple-rdp-sessions-in-windows-10/)).

If you get the _Error 5 Access Denied_ when trying to connect to a remote server using qwinsta, make sure that the remoter host is allowed to remotely manage users via RPC. If needed, enable it in the registry using the following command or [using GPO](https://woshub.com/how-to-create-modify-and-delete-registry-keys-using-gpo/):

`reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "AllowRemoteRPC" /t "REG_DWORD" /d "1" /f`

How to Get the Current User on a Remote Computer Using PowerShell?
------------------------------------------------------------------

You can get the name of the user logged on to the computer using the **Win32\_ComputerSystem** WMI class. Open the PowerShell console and run the command:

`Get-WmiObject -class Win32_ComputerSystem | Format-List Username`

The command returns the name of the user logged on to the computer.

![[images/get-wmiobject-win32_computersystem-username.png.webp]]

The Get-WmiObject cmdlet has the **–ComputerName** option you can use to access WMI objects on a remote computer. The following command will return the logged-in username from the remote computer:

`(Get-WmiObject -class Win32_ComputerSystem –ComputerName pc1215wks1).Username`

![[images/get-remote-logged-on-user-with-powershell.png.webp]]

The command shows only the user logged on to the console (not through the RDP).

YOu can get only the username on the remote computer (without a domain), use these commands:

`$userinfo = Get-WmiObject -ComputerName pc1215wks1 -Class Win32_ComputerSystem   $user = $userinfo.UserName -split '\\'   $user[1]`

In modern PowerShell Core (pwsh.exe) [versions](https://woshub.com/check-powershell-version-installed/), you need to use the **Get-CimInstance** cmdlet instead of **Get-WmiObject**:

`Get-CimInstance –ComputerName pc1215wks1 –ClassName Win32_ComputerSystem | Select-Object UserName`

Or:

`(Get-CimInstance -ComputerName pc1215wks1 -ClassName Win32_ComputerSystem).CimInstanceProperties | where{$_.Name -like "UserName"}| select value`

![[images/get-ciminstance-see-currently-logged-in-users.png.webp]]

GetCiminstance uses WinRM to connect to remote computers so you have to enable and configure WinRM on them using GPO or the following command:

`WinRM quickconfig`

PowerShell Script to Find Logged On Users on Remote Computers
-------------------------------------------------------------

If you want to collect information about logged-in users from multiple computers, you can use the following PowerShell function to get usernames.

```
function Get-LoggedUser
{
    [CmdletBinding()]
    param
    (
        [string[]]$ComputerName 
    )
    foreach ($comp in $ComputerName)
    {
        $output = @{'Computer' = $comp }
        $output.UserName = (Get-WmiObject -Class win32_computersystem -ComputerName $comp).UserName
        [PSCustomObject]$output
    }
}

```

Specify the names of computers you want to check usernames on with Get-LoggedUser:

`Get-LoggedUser pc1215wks1,pc1215wks2,mun-dc01`

![[images/powershell-script-to-view-logged-on-users-on-multi.png.webp]]

If the function returns an empty username for a computer, it means that nobody is logged on.

You can get the names of users logged on the computers in an Active Directory domain. Use the [Get-ADComputer cmdlet](https://woshub.com/get-adcomputer-getting-active-directory-computers-info-via-powershell/) to get the list of computers in the domain. In the example below, we will get the usernames logged on [active](https://woshub.com/how-to-find-blocked-disabled-or-inactive-objects-in-ad-using-search-adaccount/) computers in the specific domain OU. In order to make the script work faster prior to accessing a remote computer, I added a check of its availability using ICMP ping and [the Test-NetConnection cmdlet](https://woshub.com/checking-tcp-port-response-using-powershell/):

```
function Get-LoggedUser
{
    [CmdletBinding()]
    param
    (
        [string[]]$ComputerName 
    )
    foreach ($comp in $ComputerName)
    {
        if ((Test-NetConnection $comp -WarningAction SilentlyContinue).PingSucceeded -eq $true) 
            {  
                $output = @{'Computer' = $comp }
                $output.UserName = (Get-WmiObject -Class win32_computersystem -ComputerName $comp).UserName
            }
            else
            {
                $output = @{'Computer' = $comp }
                         $output.UserName = "offline"
            }
         [PSCustomObject]$output 
    }
}
$computers = (Get-AdComputer -Filter {enabled -eq "true"} -SearchBase 'OU=Berlin,DC=woshub,DC=com').Name
Get-LoggedUser $computers |ft -AutoSize

```

![[images/get-logged-in-users-with-powershell-script.png.webp]]

Also, note that you can store the name of the logged-on user in the computer properties in AD. To do it, you can use a logon script described in the article “[Set-ADComputer: How to Add User Information to AD Computer Properties](https://woshub.com/set-adcomputer-change-ad-computer-properties/)”.

After that, you don’t need to scan all computers to find where a specific user is logged on. You can find a user computer using a simple query to Active Directory:

`$user='m.smith'   $user_cn=(Get-ADuser $user -properties *).DistinguishedName   Get-ADComputer -Filter "ManagedBy -eq '$user_cn'" -properties *|select name,description,managedBy|ft`