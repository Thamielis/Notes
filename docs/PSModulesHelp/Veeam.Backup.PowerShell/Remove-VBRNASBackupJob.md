Remove-VBRNASBackupJob
----------------------

### Synopsis
Removes file backup jobs from Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet removes file backup jobs from Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRNASBackupJob](Get-VBRNASBackupJob)

---

### Examples
> Example 1. Removing All File Backup Jobs

$job = Get-VBRNASBackupJob
Remove-VBRNASBackupJob -Job $job
This example shows how to remove all file backup jobs from the Veeam Backup & Replication infrastructure.

Perform the following steps:
1. Run the Get-VBRNASBackupJob cmdlet. Save the result to the $job variable.
2. Run the Remove-VBRNASBackupJob cmdlet. Set the $job variable as the Job parameter value.
> Example 2. Removing File Backup Jobs by Name

$job = Get-VBRNASBackupJob - "SMB Job"
Remove-VBRNASBackupJob -Job $job
This example shows how to remove the "SMB Job" file backup jobs.

Perform the following steps:
1. Run the Get-VBRNASBackupJob cmdlet. Save the result to the $job variable.
2. Run the Remove-VBRNASBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies a file backup job. The cmdlet will remove this job from the Veeam Backup & Replication infrastructure. Accepts the VBRNASBackupJob[] object.  To get this object, run the Get-VBRNASBackupJob cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRNASBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRNASBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRNASBackupJob -Job <VBRNASBackupJob[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
