Remove-VBRBackupSession
-----------------------

### Synopsis
IMPORTANT! This cmdlet is obsolete and not supported in Veeam Backup & Replication v.8.0.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Session**

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[CBackupSession[]]`|true    |0       |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.CBackupSession[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRBackupSession [-Session] <CBackupSession[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
