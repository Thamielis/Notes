Remove-RDMRole
--------------

### Synopsis
Delete an existing role.

---

### Description

You will be prompted to confirm the delete.

---

### Related Links
* [Get-RDMRole](Get-RDMRole)

* [New-RDMRole](New-RDMRole)

* [Set-RDMRoleProperty](Set-RDMRoleProperty)

* [Set-RDMRole](Set-RDMRole)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-RDMRole; Remove-RDMRole $list[1].ID
Retrieves the list of available sessions, deletes role at index 1.
```
> EXAMPLE 2

```PowerShell
PS C:\> Remove-RDMRole "{00000000-0000-0000-0000-000000000000}"
Delete session with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 3

```PowerShell
PS C:\> Remove-RDMRole -ID "{00000000-0000-0000-0000-000000000000}" -Force
Force delete of the role with ID = "{00000000-0000-0000-0000-000000000000}".
```

---

### Parameters
#### **Force**
Forces removal of the role without confirmation by the user. Optional.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **ID**
Specifies the GUID of the role to be deleted from.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

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
For more information, type "Get-Help Remove-RDMRole -detailed". For technical information, type "Get-Help Remove-RDMRole -full".

---

### Syntax
```PowerShell
Remove-RDMRole [-ID] <Guid> [[-Force]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
