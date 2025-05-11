Sync-VBRBackupCopyJob
---------------------

### Synopsis
Starts a backup copy job.

---

### Description

This cmdlet starts a backup copy job.
By default, the backup copy job runs continuously synchronizing the backup repositories in user-defined time periods. You can also use this cmdlet to synchronize the source and the target repositories manually.
IMPORTANT!
If you start a backup copy job in the periodic copy mode, the cmdlet will copy the latest source restore point according to schedule specified in backup copy job settings. To run the cmdlet, you must provide either the ImmediateCopyLastRestorePoint or FullBackup parameter.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Starting Backup Copy Job [Using Variable]

$copyjob = Get-VBRJob -Name "AD Backup Copy"
Sync-VBRBackupCopyJob -Job $copyjob
This example shows how to start the backup copy job using variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $copyjob variable.
2. Run the Sync-VBRBackupCopyJob cmdlet. Set the $copyjob variable as the Job parameter value.
> Example 2. Starting Backup Copy Job [Using Pipeline]

Get-VBRJob -Name "AD Backup Copy" | Sync-VBRBackupCopyJob
This example shows how to start the backup copy job using pipeline.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. 2. Pipe the cmdlet output to the Sync-VBRBackupCopyJob cmdlet.
> Example 3. Starting Backup Copy Job and Creating Active Full Backup

$copyjob = Get-VBRJob -Name "AD Job"
Sync-VBRBackupCopyJob -Job $copyjob -FullBackup
This example shows how to start the backup copy job and create an active full backup for the AD Job backup copy job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $copyjob variable.
2. Run the Sync-VBRBackupCopyJob cmdlet. Set the $copyjob variable as the Job parameter value. Provide the FullBackup parameter.

---

### Parameters
#### **FullBackup**
Defines that the job will create an active full backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ImmediateCopyLastRestorePoint**
Defines that the cmdlet will enable the immediate copy mode.
If you specify this parameter, Veeam Backup & Replication will copy only the latest restore point for each source job.
Otherwise, Veeam Backup & Replication will copy all restore points created by the source jobs that were not copied since the last backup copy job session.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the backup copy job. The cmdlet will start this job.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[IJob]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.IJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRBackupCopyJob [-FullBackup] [-ImmediateCopyLastRestorePoint] -Job <IJob> [<CommonParameters>]
```
