Start-VBRNASBackupFLRSession
----------------------------

### Synopsis
Starts a restore session to explore objects backed-up by file backup jobs.

---

### Description

This cmdlet starts a restore session to explore objects backed-up by file backup jobs. You can restore files to either of the following options:
- Restore backups to the specific restore point.
- Restore all versions of backups that are located on the specific file share.
The cmdlet will restore all versions of backup files that are located on the short-term and long-term repositories.

---

### Related Links
* [Get-VBRNASBackupRestorePoint](Get-VBRNASBackupRestorePoint)

* [Get-VBRNASServer](Get-VBRNASServer)

* [Get-VBRNASBackup](Get-VBRNASBackup)

---

### Examples
> Example 1. Restoring Backups to Specific Restore Point

$restorepoint = Get-VBRNASBackupRestorePoint
Start-VBRNASBackupFLRSession -RestorePoint $restorepoint
This example shows how to start a file-level restore of backups to a specific restore point.

Perform the following steps:
1. Run the Get-VBRNASBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRNASBackupFLRSession cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.
> Example 2. Restoring Backups on Specific File Share

$backup = Get-VBRNASBackup
$server = Get-VBRNASServer
Start-VBRNASBackupFLRSession -NASBackup $backup -NASServer $server
This example shows how to start a file-level restore of backups that are located on a specific file share.

Perform the following steps:
1. Run the Get-VBRNASBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRNASBackupFLRSession cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.

---

### Parameters
#### **NASBackup**
Specifies an array of backup files.  The cmdlet will start a file-level restore to recover all versions of backup files that are located on the short-term and long-term repositories. Accepts the VBRNASBackup object.  To get this object, run the Get-VBRNASBackup cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRNASBackup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **NASServer**
Specifies an array of file shares.  The cmdlet will start a file-level restore to recover all versions of backup files that are located on the specified file shares. Accepts the VBRNASServer object.  To get this object, run the Get-VBRNASServer cmdlet.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[VBRNASServer]`|true    |named   |True (ByPropertyName)|

#### **RestorePoint**
Specifies a restore point. The cmdlet will start a file-level restore to recover backup files to the specified restore point. Accepts the VBRNASBackupRestorePoint object.  To get this object, run the Get-VBRNASBackupRestorePoint cmdlet.

|Type                        |Required|Position|PipelineInput                 |
|----------------------------|--------|--------|------------------------------|
|`[VBRNASBackupRestorePoint]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackupRestorePoint

Veeam.Backup.PowerShell.Infos.VBRNASBackup

Veeam.Backup.PowerShell.Infos.VBRNASServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRNASBackupFLRSession -NASBackup <VBRNASBackup> -NASServer <VBRNASServer> [<CommonParameters>]
```
```PowerShell
Start-VBRNASBackupFLRSession -RestorePoint <VBRNASBackupRestorePoint> [<CommonParameters>]
```
