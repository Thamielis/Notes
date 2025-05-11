Remove-VBRComputerBackupCopyJob
-------------------------------

### Synopsis
Removes Veeam Agent backup copy jobs.

---

### Description

This cmdlet removes Veeam Agent backup copy jobs.

---

### Related Links
* [Get-VBRComputerBackupCopyJob](Get-VBRComputerBackupCopyJob)

---

### Examples
> Removing Veeam Agent Backup Copy Jobs

$job = Get-VBRComputerBackupCopyJob
Remove-VBRComputerBackupCopyJob -Job $job
This example shows how to remove Veeam Agent backup copy job.
Perform the following steps:
1. Run the Get-VBRComputerBackupCopyJob cmdlet. Save the result to the $job variable.
2. Run the Remove-VBRComputerBackupCopyJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies a Veeam Agent backup copy job that you want to remove.

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBRComputerBackupCopyJob[]]`|true    |0       |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRComputerBackupCopyJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRComputerBackupCopyJob [-Job] <VBRComputerBackupCopyJob[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
