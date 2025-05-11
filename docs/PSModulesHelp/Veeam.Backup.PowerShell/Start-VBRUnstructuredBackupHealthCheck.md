Start-VBRUnstructuredBackupHealthCheck
--------------------------------------

### Synopsis
Performs a health check of the latest restore point created by file backup jobs and object storage backup jobs and their repair if necessary.

---

### Description

This cmdlet performs a health check for the latest restore point created by file backup jobs and object storage backup jobs. During the health check, Veeam Backup & Replication performs a CRC check for metadata and a hash check for data blocks in backup files to verify their integrity. If the health check returns notifications of some inconsistencies, you can run the backup repair. To repair the backup, run the cmdlet and provide the Repair parameter.

---

### Related Links
* [Get-VBRUnstructuredBackupJob](Get-VBRUnstructuredBackupJob)

---

### Examples
> Example 1. Performing Health Check for File Backup Job

$job = Get-VBRUnstructuredBackupJob
Start-VBRUnstructuredBackupHealthCheck -Job $job
This example shows how to perform a health check for a file backup job.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Save the result to the $job variable.
2. Run the Start-VBRUnstructuredBackupHealthCheck cmdlet. Set the $job variable as the Job parameter value.
> Example 2. Performing Backup Repair

$job = Get-VBRUnstructuredBackupJob     
Start-VBRUnstructuredBackupHealthCheck -Job $job -Repair
This example shows how to perform a repair of corrupted data if the previously run health check detects them.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Save the result to the $job variable.
2. Run the Start-VBRUnstructuredBackupHealthCheck cmdlet. Set the $job variable as the Job parameter value. Specify the Repair parameter.

---

### Parameters
#### **Backup**
Specifies backup files created by file backup jobs and object storage backup jobs. The cmdlet will perform a health check for these backup files. Accepts the VBRUnstructuredBackup[] object.  To get this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will perform a health check without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **Job**
Specifies an array of file backup jobs and object storage backup jobs. The cmdlet will perform a health check for these backup jobs.
Accepts the CBackupJob[] object.  To get this object, run the Get-VBRUnstructuredBackupJob cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Repair**
Defines that the cmdlet will repair missing data and metadata.
If you provide this parameter, the cmdlet will repair the missing metadata. Otherwise, the cmdlet will perform a health check of backup files and if corruption is detected, it will return a notification.
Note: First, run the cmdlet with this option disabled to perform the health check. After that, if there are any inconsistencies in the backup, run the cmdlet again with this option enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob[]

Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackup[]

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRUnstructuredBackupHealthCheck -Backup <VBRUnstructuredBackup[]> [-Force] [-Repair] [-RunAsync] [<CommonParameters>]
```
```PowerShell
Start-VBRUnstructuredBackupHealthCheck [-Force] -Job <CBackupJob[]> [-Repair] [-RunAsync] [<CommonParameters>]
```
