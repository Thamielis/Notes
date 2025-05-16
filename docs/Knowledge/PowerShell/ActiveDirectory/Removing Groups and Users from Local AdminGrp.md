# Removing Groups and Users from Local Administrators Group in PowerShell

[July 20, 2021July 20, 2021](https://www.kjctech.net/removing-groups-and-users-from-local-administrators-group-in-powershell/) [Kent Chen](https://www.kjctech.net/author/admin/)[Microsoft](https://www.kjctech.net/category/information-technology/)

Users are evils, the weakest link in the whole security defense system, myself included. So the best way to stop them from making stupid mistakes is to take away their ability to do so. That means, no more local admin rights, which has been the best practice for quite some time.

To check what are the members in my Local Administrators group,
```powershell
Get-LocalGroupMember -Group 'Administrators'
```

Then to remove all users from the Local Administrators group,

```powershell
Get-LocalGroupMember -Group 'Administrators' | Where {$_.objectclass -like 'user'} | Remove-LocalGroupMember Administrators
```

To remove a specific group, such as Domain Users,

```powershell
Get-LocalGroupMember -Group 'Administrators' | Where {$_.Name -like 'domain\domain users'} | Remove-LocalGroupMember Administrators
```

All these don’t make much sense if you can’t use them on remote computers on the same network.

And that’s where the cmdlet Invoke-Command shines.

```powershell
Invoke-Command -ComputerName $comp -ScriptBlock {
  Get-LocalGroupMember -Group 'Administrators' | Where {$_.objectclass -like 'user'} | Remove-LocalGroupMember Administrators
  Get-LocalGroupMember -Group 'Administrators' | Where {$_.name -like 'domain\domain users'} | Remove-LocalGroupMember Administrators
```

Run the codes through a list of computers you need to take care of, and you will have a clean setup within a couple of minutes.

## [KC's Blog](https://www.kjctech.net/)