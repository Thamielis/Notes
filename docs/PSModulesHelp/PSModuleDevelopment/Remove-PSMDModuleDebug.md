Remove-PSMDModuleDebug
----------------------

### Synopsis
Removes module debugging configurations.

---

### Description

Removes module debugging configurations.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-PSMDModuleDebug -Name "cPSNetwork"
Removes all module debugging configuration for the module cPSNetwork
```

---

### Parameters
#### **Name**
Name of modules whose debugging configuration should be removed.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Notes
Version 1.0.0.0
         Author: Friedrich Weinmann
         Created on: August 7th, 2016

---

### Syntax
```PowerShell
Remove-PSMDModuleDebug [-Name] <String[]> [-WhatIf] [-Confirm] [<CommonParameters>]
```
