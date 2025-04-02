Remove-RDMSecurityGroup
-----------------------

### Synopsis
Delete an existing security group.

---

### Description

You will be prompted to confirm the delete.

---

### Related Links
* [Get-RDMSecurityGroup](Get-RDMSecurityGroup)

* [Set-RDMSecurityGroup](Set-RDMSecurityGroup)

* [Set-RDMSecurityGroupProperty](Set-RDMSecurityGroupProperty)

* [New-RDMSecurityGroup](New-RDMSecurityGroup)

* [Remove-RDMSecurityGroup](Remove-RDMSecurityGroup)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-RDMSecurityGroup; Remove-RDMSecurityGroup $list[1].ID
Retrieves the list of available security groups, deletes security group at index 1.
```
> EXAMPLE 2

```PowerShell
PS C:\> Remove-RDMSecurityGroup "{00000000-0000-0000-0000-000000000000}"
Delete security group with ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 3

```PowerShell
PS C:\> Remove-RDMSecurityGroup -ID "{00000000-0000-0000-0000-000000000000}" -Force
Force delete of the security group with ID = "{00000000-0000-0000-0000-000000000000}".
```

---

### Parameters
#### **Force**
Forces removal of the security group without confirmation by the user. Optional.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

#### **ID**
Specifies the GUID of the security group to be deleted from.
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
For more information, type "Get-Help Remove-RDMSecurityGroup -detailed". For technical information, type "Get-Help Remove-RDMSecurityGroup -full".

---

### Syntax
```PowerShell
Remove-RDMSecurityGroup [-ID] <Guid> [[-Force]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
