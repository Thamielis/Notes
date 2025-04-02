Copy-VBRUnstructuredBackup
--------------------------

### Synopsis
Copies backups created by file backup jobs and object storage backup jobs to another location.

---

### Description

This cmdlet copies backups created by file backup jobs and object storage backup jobs to one of the following locations:
- Another repository
- Local folder
- Shared folder
- Archive repository
Veeam Backup & Replication copies the whole backup chain. When Veeam Backup & Replication performs the copy operation, it disables the job, copies files to the target location and then enables the job.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example - Copying Object Storage Backups to Another Repository

$backup = Get-VBRUnstructuredBackup     
$repository = Get-VBRBackupRepository           
Copy-VBRUnstructuredBackup -Backup $backup[3] -BackupRepository $repository
This example shows how to copy object storage backups to another repository.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Save the result to the $backup variable.
2. Run the Get-VBRBackupRepository cmdlet. Save the result to the $repository variable.
3. Run the Copy-VBRUnstructuredBackup cmdlet. Set the $backup[3] variable as the Backup parameter value. Set the $repository variable as the BackupRepository parameter value.

---

### Parameters
#### **ArchiveRepository**
Specifies the archive repository. The cmdlet will copy the backups created by file backup jobs and object storage backup jobs to this long-term archive repository. Accepts the CBackupRepository object.  To get this object, run the following cmdlets:
* Get-VBRBackupRepository: use this cmdlet to get backup repositories.
* Get-VBRObjectStorageRepository: use this cmdlet to get object storage repositories.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IRepository]`|false   |named   |False        |

#### **Backup**
Specifies an array of backups created by file backup jobs and object storage backup jobs. The cmdlet will copy these backups to a specified backup repository.
Accepts the VBRUnstructuredBackup[] object.  To get this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[VBRUnstructuredBackup[]]`|true    |named   |True (ByValue)|

#### **BackupRepository**
Specifies the backup repository. The cmdlet will copy the backups created by file backup jobs and object storage backup jobs to this backup repository.
Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Copy-VBRUnstructuredBackup [-ArchiveRepository <IRepository>] -Backup <VBRUnstructuredBackup[]> -BackupRepository <CBackupRepository> [-RunAsync] [<CommonParameters>]
```
