Remove-VBRJob
-------------

### Synopsis
Removes a selected backup, replication or backup copy job.

---

### Description

This cmdlet removes a selected backup, replication or backup copy job from Veeam Backup & Replication console and database.

Run the Remove-VSBJob cmdlet to remove SureBackup jobs.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Removing File Copy Jobs [Using Pipeline]

Get-VBRJob -Name "File Copy*" | Remove-VBRJob
This example shows how to remove the file copy jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRJob cmdlet.
> Example 2. Removing Specific Job [Using Variable]

$job = Get-VBRJob
Remove-VBRJob -Job $job
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Remove-VBRJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the array of jobs you want to remove.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRJob [-Job] <CBackupJob[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
