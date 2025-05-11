Remove-RDMUser
--------------

### Synopsis
Delete an existing user.

---

### Description

You will be prompted to confirm the delete.

---

### Related Links
* [Get-RDMUser](Get-RDMUser)

* [New-RDMUser](New-RDMUser)

* [New-RDMUser](New-RDMUser)

* [Remove-RDMUser](Remove-RDMUser)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-User; Remove-RDMUser $list[1]
Retrieves the list of available users, deletes user at index 0 and from 1 from a list.
```
> EXAMPLE 2

PS C:\> $list = Get-User; $users = @($list[0], $list[1]); $Remove-RDMUser $users
Retrieves the list of available users, deletes user at index 1.
> EXAMPLE 3

```PowerShell
PS C:\> Remove-RDMUser "{00000000-0000-0000-0000-000000000000}"
Delete security group with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 4

```PowerShell
PS C:\> Remove-RDMUser -ID "{00000000-0000-0000-0000-000000000000}" -Force
Force delete of the user with ID = "{00000000-0000-0000-0000-000000000000}".
```

---

### Parameters
#### **DeleteSQLLogin**
Forces removal of the SQL Login without confirmation by the user. Optional.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
Forces removal of the user without confirmation by the user. Optional.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

#### **ID**
Specifies the GUID of the user to be deleted from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **User**
Specifies the array of users to be deleted.
Users must be retrieved by Get-RDMUser

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSUserInfo[]]`|true    |1       |true (ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-RDMUser -detailed". For technical information, type "Get-Help Remove-RDMUser -full".

---

### Syntax
```PowerShell
Remove-RDMUser [-ID] <Guid> [-DeleteSQLLogin] [-Force] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMUser [-User] <PSUserInfo[]> [-DeleteSQLLogin] [-Force] [-ForcePromptAnswer <Cancel | No | Yes>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
