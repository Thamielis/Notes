Remove-VSBJob
-------------

### Synopsis
Removes a specified SureBackup job.

---

### Description

This cmdlet removes a specified SureBackup job from Veeam Backup & Replication.

---

### Examples
> Example 1

```PowerShell
Get-VSBJob -Name "SureJob 01", "SureJob 12"| Remove-VSBJob
This command removes the SureBackup job named "SureJob 01" and "SureJob 12". The SureBackup jobs are obtained with Get-VSBJob and piped down.
```
> Example 2

```PowerShell
Remove-VSBJob -Job $surejob
This command removes the SureBackup job represented by the $surejob variable. The SureBackup job is obtained with Get-VSBJob and assigned to the variable beforehand.
```

---

### Parameters
#### **Job**
Specifies the SureBackup job you want to remove. You can assign multiple jobs to this object.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[CSbJob[]]`|false   |0       |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.SureBackup.CSbJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VSBJob [[-Job] <CSbJob[]>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
