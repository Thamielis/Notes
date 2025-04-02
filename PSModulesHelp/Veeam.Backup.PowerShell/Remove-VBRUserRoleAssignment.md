Remove-VBRUserRoleAssignment
----------------------------

### Synopsis
Removes a role from a user or a user group.
Note: If the four-eyes authorization is enabled, you cannot run this cmdlet. For more information, see the Four-Eyes Authorization section in the User Guide for VMware vSphere.

---

### Description

This cmdlet removes a role from a user or a user group.

---

### Related Links
* [Get-VBRUserRoleAssignment](Get-VBRUserRoleAssignment)

---

### Examples
> Removing Role from User

$role = Get-VBRUserRoleAssignment -Name Tech\BackupAdmin
Remove-VBRUserRoleAssignment -Assignment $role
This example shows how to remove a role that is assigned to the Tech\BackupAdmin user.
Perform the following steps:
1. Run the Get-VBRUserRoleAssignment cmdlet. Specify the Name parameter value. Save the result to the $role variable.
2. Run the Remove-VBRUserRoleAssignment cmdlet. Set the $role variable as the Assignment parameter value.

---

### Parameters
#### **Assignment**
Specifies a user or a user group from which you want to remove a role.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRUserRoleAssignment]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRUserRoleAssignment

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRUserRoleAssignment -Assignment <VBRUserRoleAssignment> [<CommonParameters>]
```
