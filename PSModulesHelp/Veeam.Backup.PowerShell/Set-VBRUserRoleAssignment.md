Set-VBRUserRoleAssignment
-------------------------

### Synopsis
Modifies a role that is assigned to a user or a user group.
Note: If the four-eyes authorization is enabled, you cannot run this cmdlet. For more information, see the Four-Eyes Authorization section in the User Guide for VMware vSphere.

---

### Description

This cmdlet modifies a role that is assigned to a user or a user group.
To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRUserRoleAssignment](Get-VBRUserRoleAssignment)

---

### Examples
> Modifying User Role

$user = Get-VBRUserRoleAssignment -Name Tech\BackupAdmin
Set-VBRUserRoleAssignment -Assignment $user -Role RestoreOperator
           Role Type Name            Id
           ---- ---- ----            --
RestoreOperator Group Administrators c5d266c7-8e2b-43f9-92c6-fffc4297074d
This example shows how to modify a role that is assigned to the Tech\BackupAdmin user.
Perform the following steps:
1. Run the Get-VBRUserRoleAssignment cmdlet. Specify the Name parameter value. Save the result to the $user variable.
2. Run the Set-VBRUserRoleAssignment cmdlet. Set the $user variable as the Assignment parameter value. Set the RestoreOperator value as the Role parameter value.

---

### Parameters
#### **Assignment**
Specifies a user or a user group . The cmdlet will modify a role for this user or a user group.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRUserRoleAssignment]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Role**
Specifies a role that you want to assign to a user. The cmdlet will replace the current role with a new role. You can assign one of the following roles:
* BackupOperator
* RestoreOperator
* BackupAdmin
* TapeOperator
* BackupViewer
Valid Values:

* BackupOperator
* RestoreOperator
* BackupAdmin
* TapeOperator
* BackupViewer

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[VBRRole]`|false   |named   |False        |

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
Set-VBRUserRoleAssignment -Assignment <VBRUserRoleAssignment> [-Role {BackupOperator | RestoreOperator | BackupAdmin | TapeOperator | BackupViewer}] [<CommonParameters>]
```
