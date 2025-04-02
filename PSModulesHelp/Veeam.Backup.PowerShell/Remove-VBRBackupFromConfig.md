Remove-VBRBackupFromConfig
--------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Backup**

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Veeam.Backup.Core.CBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRBackupFromConfig [-Backup] <CBackup[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
