Start-VBRUnstructuredBackupFLRSession
-------------------------------------

### Synopsis
Starts a restore session to explore objects backed-up by file backup jobs and object storage backup jobs.

---

### Description

This cmdlet mounts backup content and allows you to restore files, folders and objects that are backed-up by file backup jobs or object storage backup jobs. You can mount backup content to one of the following options:
- Mount backup to the specific restore point.
- Mount all versions of backup files that are located on the specific file share or object storage. The cmdlet will mount all versions of backup files that are located on the short-term and long-term repositories.
You might want to use this mount session to restore specifics files and folders that are backed-up by file backup jobs and object storage backup jobs.
Run the Get-VBRUnstructuredBackupFLRItem cmdlet to get items that you want to restore.
Run the Restore-VBRUnstructuredBackupFLRItem cmdlet to restore the necessary files and folders.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Get-VBRUnstructuredBackupRestorePoint](Get-VBRUnstructuredBackupRestorePoint)

---

### Examples
> Example 1. Restoring Backups on Specific Object Storage

$backup = Get-VBRUnstructuredBackup     
$server = Get-VBRUnstructuredServer     
Start-VBRUnstructuredBackupFLRSession -Backup $backup -Server $server
This example shows how to start a file-level restore of backups that are located on a specific file share.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Save the result to the $backup variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Save the result to the $server variable.
3. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Set the $backup variable as the Backup parameter value. Set the $server variable as the Server parameter value.
> Example 2. Restoring Backups to Specific Restore Point

$restorepoint = Get-VBRUnstructuredBackupRestorePoint       
Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint
This example shows how to start a file-level restore of backups to a specific restore point.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.

---

### Parameters
#### **Backup**
Specifies the backup file. The cmdlet will start a file-level restore to recover all versions of a backup file that is located on the short-term and long-term repositories. Accepts the  VBRUnstructuredBackup object.  To get this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RestorePoint**
Specifies a restore point. The cmdlet will start a restore of files, folders or individual objects. This parameter set recovers backup files or objects to the specified restore point. Accepts the VBRUnstructuredBackupRestorePoint object.  To get this object, run the Get-VBRUnstructuredBackupRestorePoint cmdlet.

|Type                                 |Required|Position|PipelineInput                 |
|-------------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupRestorePoint]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Server**
Specifies file shares or object storage. The cmdlet will start a restore of files, folders or individual objects. This parameter set recovers backup files or objects to the specified restore point. Accepts the VBRUnstructuredServer object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                     |Required|Position|PipelineInput        |
|-------------------------|--------|--------|---------------------|
|`[VBRUnstructuredServer]`|true    |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackupRestorePoint

Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackup

Veeam.Backup.PowerShell.Infos.VBRUnstructuredServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRUnstructuredBackupFLRSession -Backup <VBRUnstructuredBackup> -Server <VBRUnstructuredServer> [<CommonParameters>]
```
```PowerShell
Start-VBRUnstructuredBackupFLRSession -RestorePoint <VBRUnstructuredBackupRestorePoint> [<CommonParameters>]
```
