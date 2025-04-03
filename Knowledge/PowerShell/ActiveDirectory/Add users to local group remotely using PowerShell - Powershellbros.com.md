# Add users to local group remotely

How to add users to local group on remote servers? The easiest way for me was to create simple PowerShell script 🙂 Some time ago we posted article about adding group – [link](http://www.powershellbros.com/add-ad-group-to-local-administrators/). In this article I want to show you how to add mutliple users to some specific group.

##### Get Members

First you should know how to verify who is currently added to group.  
To get members from remote machines I used `net localgroup` command inside the scriptblock:

```powershell
$GroupName = "Event Log Readers"
$Computername = "PC01"
Invoke-Command $ComputerName -scriptblock{ param($GroupName) net localgroup $GroupName } -arg $GroupName |
    Where-Object {$_ -AND $_ -notmatch "command completed successfully"} | Select-Object -skip 4
```

Abfrage mit Invoke-Command:
```powershell
Invoke-Command -ComputerName $ComputerName -ScriptBlock {Get-LocalGroupMember -Name 'Administratoren'}
```

##### Add single user to local group

Adding single user is pretty simple when you know what is Windows provider “WinNT”:

_The Microsoft ADSI provider implements a set of ADSI objects to support various ADSI interfaces. The namespace name for the Windows provider is “WinNT” and this provider is commonly referred to as the WinNT provider._

```powershell
$Computername = "PC01"
$Username = "Account1"
$GroupName = "Event Log Readers"
$DomainName = $env:USERDOMAIN
$Group = [ADSI]"WinNT://$ComputerName/$GroupName,group"
$User = [ADSI]"WinNT://$DomainName/$Username,user"
$Group.Add($User.Path)
```

##### Add multiple users to local group

Below you can find script that will add two users (Account1, Account2) to **Event Log Readers** group on remote machines `$Servers`:

```powershell
$Servers = Get-Content "C:\Users\$env:username\desktop\servers.txt"
$Users = "Account1","Account2"
$GroupName = "Event Log Readers"
$DomainName = $env:USERDOMAIN
$ErrorActionPreference = "Stop"

Foreach($Server in $Servers) {
    $Server = $Server.trim()
    $ComputerName = $Server
    Write-Host "Processing $ComputerName" -ForegroundColor Green

    Foreach($Username in $Users) {
        Try {
            $Group = [ADSI]"WinNT://$ComputerName/$GroupName,group"
            $User = [ADSI]"WinNT://$DomainName/$Username,user"
            $Group.Add($User.Path)
        }
        Catch {
            $_.Exception.innerexception
            Continue
        }
    }
}
```

I hope that this was informative for you 🙂