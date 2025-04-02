Remove-RDMLicense
-----------------

### Synopsis
Delete an existing license.

---

### Description

You will be prompted to confirm the delete.

---

### Parameters
#### **Force**
Forces removal of the license without confirmation by the user. Optional.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **License**
Specifies the license to delete.

|Type             |Required|Position|PipelineInput |
|-----------------|--------|--------|--------------|
|`[PSLicenseInfo]`|false   |2       |true (ByValue)|

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
For more information, type "Get-Help Remove-RDMLicense -detailed". For technical information, type "Get-Help Remove-RDMLicense -full".

---

### Syntax
```PowerShell
Remove-RDMLicense [[-License] <PSLicenseInfo>] [[-Force]] [-Confirm] [-WhatIf] [<CommonParameters>]
```
