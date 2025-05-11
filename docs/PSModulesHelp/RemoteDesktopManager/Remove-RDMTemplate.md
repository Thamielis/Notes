Remove-RDMTemplate
------------------

### Synopsis
Delete an existing template.

---

### Description

You will be prompted to confirm the delete.

---

### Related Links
* [Get-RDMDataSource](Get-RDMDataSource)

* [Set-RDMDataSource](Set-RDMDataSource)

* [Get-RDMSession](Get-RDMSession)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-RDMSession; Remove-RDMSession $list[1]
Retrieves the list of available template, deletes template at index 1.
```
> EXAMPLE 2

```PowerShell
PS C:\> Remove-RDMTemplate "{00000000-0000-0000-0000-000000000000}"
Delete the template with the ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 3

```PowerShell
PS C:\> Remove-RDMTemplate -ID "{00000000-0000-0000-0000-000000000000}" -Force
Force delete the template with the ID = "{00000000-0000-0000-0000-000000000000}".
```
> EXAMPLE 4

```PowerShell
PS C:\> $templates = Get-RDMTemplate; Remove-RDMTemplate -Template $templates[0] -Force
Force delete the first template
```

---

### Parameters
#### **Force**
Forces removal of the templates without confirmation by the user. Optional.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **ID**
Specifies the ID of the template to be deleted.
Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

|Type    |Required|Position|PipelineInput |
|--------|--------|--------|--------------|
|`[Guid]`|true    |1       |true (ByValue)|

#### **Template**
Specifies the templates to remove

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSTemplate[]]`|true    |1       |true (ByValue)|

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
For more information, type "Get-Help Remove-RDMTemplate -detailed". For technical information, type "Get-Help Remove-RDMTemplate -full".

---

### Syntax
```PowerShell
Remove-RDMTemplate [-ID] <Guid> [[-Force]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-RDMTemplate [-Template] <PSTemplate[]> [[-Force]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
