Add-VBRUserRoleAssignment
-------------------------

### Synopsis
Adds a role to a user or a user group.
Note: If the four-eyes authorization is enabled, you cannot run this cmdlet. For more information, see the Four-Eyes Authorization section in the User Guide for VMware vSphere.

---

### Description

This cmdlet adds a role to a user or a user group.
For more information on types of roles, see the Roles and Users section of User Guide for VMware vSphere.

---

### Examples
> Example 1. Assigning Veeam Backup Operator Role to User

Add-VBRUserRoleAssignment -Name Tech\BackupAdmin -Role "BackupOperator"
       Role  Type Name           Id
       ----  ---- ----           --
BackupAdmin Group Administrators c5d266c7-8e2b-43f9-92c6-fffc4297074d
This command assigns a Veeam Backup Operator role to the Tech\BackupAdmin user.
The cmdlet output will contain the following details Role, Type, Name and Id.
> Example 2. Assigning Veeam Tape Operator Role to User

Add-VBRUserRoleAssignment -Name Tech\TapeAdmin -Role TapeOperator
       Role  Type Name           Id
       ----  ---- ----           --
BackupAdmin Group Administrators c5d266c7-8e2b-43f9-92c6-fffc4297074d
This command assigns a Veeam Tape Operator role to the Tech\TapeAdmin user.
The cmdlet output will contain the following details Role, Type, Name and Id.

---

### Parameters
#### **Name**
Specifies a name of a user or a user group. The cmdlet will assign a role for this user or user group.
Note: You must specify the name of a user or a user group in the DOMAIN\Username format.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Role**
Specifies a role that you want to assign to a user. You can assign one of the following roles:
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
|`[VBRRole]`|true    |named   |False        |

---

### Inputs
System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRUserRoleAssignment -Name <String> -Role {BackupOperator | RestoreOperator | BackupAdmin | TapeOperator | BackupViewer} [<CommonParameters>]
```
