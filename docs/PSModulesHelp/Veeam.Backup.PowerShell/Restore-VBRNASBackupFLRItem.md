Restore-VBRNASBackupFLRItem
---------------------------

### Synopsis
Restore objects backed up by file share backup jobs to original file shares.

---

### Description

This cmdlet restores objects that have been backed up by file backup jobs to original file shares.

---

### Related Links
* [Get-VBRNASBackupFLRSession](Get-VBRNASBackupFLRSession)

* [Get-VBRNASBackupFLRItem](Get-VBRNASBackupFLRItem)

* [Get-VBRNASBackupRestorePoint](Get-VBRNASBackupRestorePoint)

---

### Examples
> Example 1. Restoring all Versions of Objects to File Share

$session = Get-VBRNASBackupFLRSession
$files = Get-VBRNASBackupFLRItem -Session $session
$fileversion = Get-VBRNASBackupFLRItemVersion -Item $files
Restore-VBRNASBackupFLRItem -Item $fileversion[0]
This example shows how to restore specific versions of files and folders to the original file share. Veeam Backup & Replication will not overwrite files and folders that are already added to a file share with versions of these files and folders from a backup.

Perform the following steps:
1. Run the Get-VBRNASBackupFLRSession cmdlet. Save the result to the $session variable.
2. Run the Get-VBRNASBackupFLRItem cmdlet. Set the $session variable as the Session parameter value. Save the result to the $files variable.  3. Run the Get-VBRNASBackupFLRItemVersion cmdlet. Set the $files variable as the Item parameter value. Save the result to the $fileversion variable.  4. Run the Restore-VBRNASBackupFLRItem cmdlet. Set the $fileversion[0] variable as the Item parameter value.
> Example 2. Restoring Specific Restore Point of Objects to File Share

$restorepoint = Get-VBRNASBackupRestorePoint
$session = Start-VBRNASBackupFLRSession -RestorePoint $restorepoint[3]
Get-VBRNASBackupFLRItem -Session $session
Restore-VBRNASBackupFLRItem -Item $fileversion -Overwrite
This example shows how to restore files and folders to the specific restore point. Veeam Backup & Replication will overwrite files and folders that are already added to a file share with versions of these files and folders from a backup.

Perform the following steps:
1. Run the Get-VBRNASBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRNASBackupFLRSession cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $session variable.
3. Run the Get-VBRNASBackupFLRItem cmdlet. Set the $session variable as the Session parameter value. Save the result to the $files variable.
4. Run the Restore-VBRNASBackupFLRItem cmdlet. Set the $fileversion variable as the Item parameter value. Provide the Overwrite parameter.

---

### Parameters
#### **ChangedItemsOnly**
Defines whether to restore changed files and folders only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Item**
Specifies an array of backed-up objects. The cmdlet will restore these objects to the original file share or object storage.
Accepts the VBRNASBackupFLR Item[] object. To get this object, run the Get-VBRUnstructuredBackupFLRItemVersion cmdlet.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRNASBackupFLRItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Overwrite**
Defines that the cmdlet will overwrite an existing object with the restored one.
If you provide this parameter, the cmdlet will overwrite an existing object on the file share with the version of an object from a backup. Otherwise, an existing object will not be overwritten.

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
Veeam.Backup.PowerShell.Infos.VBRNASBackupFLRItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Restore-VBRNASBackupFLRItem [-ChangedItemsOnly] -Item <VBRNASBackupFLRItem[]> [-Overwrite] [-RunAsync] [<CommonParameters>]
```
