Get-VBRUserRoleAssignment
-------------------------

### Synopsis
Returns a role that is assigned to a user or a user group.

---

### Description

This cmdlet returns a role that is assigned to a user or a user group.

---

### Examples
> Example 1. Getting Role of Specific User

Get-VBRUserRoleAssignment -Name Tech\BackupAdmin
       Role  Type Name           Id
       ----  ---- ----           --
BackupAdmin Group Administrators c5d266c7-8e2b-43f9-92c6-fffc4297074d
This command returns a role that is assigned to the Tech\BackupAdmin user.
The cmdlet output will contain the following details Role, Type, Name and Id.
> Example 2. Getting All Users and User Groups with Specific Role

Get-VBRUserRoleAssignment -Role RestoreOperator
       Role  Type Name           Id
       ----  ---- ----           --
BackupAdmin Group Administrators c5d266c7-8e2b-43f9-92c6-fffc4297074d
This command returns all users and user groups that have the Veeam Restore Operator role.
The cmdlet output will contain the following details Role, Type, Name and Id.

---

### Parameters
#### **Name**
Specifies an array of names of users or user groups. The cmdlet will get roles that are assigned to these users or user groups.
Note: You must specify the name of a user or a user group in the DOMAIN\Username format.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Role**
Specifies a role that you want to get. You can assign one of the following roles:
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

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VBRRole[]]`|false   |named   |False        |

#### **Type**
Specifies a type of the user which role you want to get. You can specify one of the following type of a user:
* User
* Group
Valid Values:

* User
* Group

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRRoleType[]]`|false   |named   |False        |

---

### Inputs
System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRUserRoleAssignment [-Name <String[]>] [-Role {BackupOperator | RestoreOperator | BackupAdmin | TapeOperator | BackupViewer}] [-Type {User | Group}] [<CommonParameters>]
```
