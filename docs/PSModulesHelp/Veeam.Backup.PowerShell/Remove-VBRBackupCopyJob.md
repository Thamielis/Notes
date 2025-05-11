Remove-VBRBackupCopyJob
-----------------------

### Synopsis
Removes backup copy jobs.

---

### Description

This cmdlet removes backup copy jobs.

---

### Related Links
* [Get-VBRBackupCopyJob](Get-VBRBackupCopyJob)

---

### Examples
> Removing Backup Copy Job

$job = Get-VBRBackupCopyJob
Remove-VBRBackupCopyJob -Job $job
This example shows how to remove a backup copy job.
Perform the following steps:
1. Run the Get-VBRBackupCopyJob cmdlet. Save the result to the $job variable.
2. Run the Remove-VBRBackupCopyJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of backup copy jobs that you want to remove.

|Type                  |Required|Position|PipelineInput |
|----------------------|--------|--------|--------------|
|`[VBRBackupCopyJob[]]`|true    |0       |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRBackupCopyJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRBackupCopyJob [-Job] <VBRBackupCopyJob[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
