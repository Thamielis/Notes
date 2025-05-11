Copy-VBRNASBackup
-----------------

### Synopsis
Copies file share backups to another repository or local or shared folder.

---

### Description

This cmdlet copies file share backups to another repository or local or shared folder. Veeam Backup & Replication copies the whole backup chain. When Veeam Backup & Replication performs the copy operation, it disables the job, copies files to the target location and then enables the job.

---

### Related Links
* [Get-VBRNASBackup](Get-VBRNASBackup)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example - Copying File Share Backups to Another Repository

$backup = Get-VBRNASBackup
$repository = Get-VBRBackupRepository
Copy-VBRNASBackup -Backup $backup[3] -BackupRepository $repository
This example shows how to copy file share backups to another repository.

Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Save the result to the $backup variable.
2. Run the Get-VBRBackupRepository cmdlet. Save the result to the $repository variable.
3. Run the Copy-VBRNASBackup cmdlet. Set the $backup[3] variable as the Backup parameter value. Set the $repository variable as the BackupRepository parameter value.

---

### Parameters
#### **ArchiveRepository**
Specifies the archive repository. The cmdlet will copy the archive associated with the file share backup being copied to this long-term archive repository. Accepts the CBackupRepository object. To get this object, run the following cmdlets:
* Get-VBRBackupRepository: use this cmdlet to get backup repositories.
* Get-VBRObjectStorageRepository: use this cmdlet to get object storage repositories.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IRepository]`|false   |named   |False        |

#### **Backup**
Specifies an array of file share backups. The cmdlet will copy these backups to a specified backup repository. Accepts the VBRNASBackup[] object.  To get this object, run the Get-VBRNASBackup cmdlet.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[VBRNASBackup[]]`|true    |named   |True (ByValue)|

#### **BackupRepository**
Specifies the backup repository. The cmdlet will copy the specified file share backups to this backup repository. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

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
Veeam.Backup.PowerShell.Infos.VBRNASBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Copy-VBRNASBackup [-ArchiveRepository <IRepository>] -Backup <VBRNASBackup[]> -BackupRepository <CBackupRepository> [-RunAsync] [<CommonParameters>]
```
