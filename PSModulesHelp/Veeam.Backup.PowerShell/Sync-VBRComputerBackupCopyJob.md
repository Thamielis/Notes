Sync-VBRComputerBackupCopyJob
-----------------------------

### Synopsis
Synchronizes Veeam Agent backup copy jobs.

---

### Description

This cmdlet synchronizes Veeam Agent backup copy jobs.

---

### Related Links
* [Get-VBRComputerBackupCopyJob](Get-VBRComputerBackupCopyJob)

---

### Examples
> Synchronizing Veeam Agent Backup Copy Job

$job = Get-VBRComputerBackupCopyJob -Name "Windows Copy Job05"
Sync-VBRComputerBackupCopyJob -Job $job
This example shows how to synchronize the Windows Copy Job05 Veeam Agent backup copy jobs.
Perform the following steps:
1. Run the Get-VBRComputerBackupCopyJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Sync-VBRComputerBackupCopyJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **FullBackup**
Defines that the job will create an active full backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ImmediateCopyLastRestorePoint**
Defines that the job will create restore points as soon as they appear in a source backup repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the Veeam Agent backup copy job. The cmdlet will synchronize this job.

|Type                        |Required|Position|PipelineInput                 |
|----------------------------|--------|--------|------------------------------|
|`[VBRComputerBackupCopyJob]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerBackupCopyJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRComputerBackupCopyJob [-FullBackup] [-ImmediateCopyLastRestorePoint] -Job <VBRComputerBackupCopyJob> [<CommonParameters>]
```
