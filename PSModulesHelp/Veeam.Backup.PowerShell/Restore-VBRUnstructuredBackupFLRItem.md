Restore-VBRUnstructuredBackupFLRItem
------------------------------------

### Synopsis
Restores objects backed up by file backup jobs or object storage backup jobs to original file shares or object storage.

---

### Description

This cmdlet restores specific files and folders backed up by file backup jobs or object storage backup jobs. The cmdlet will restore files and folders to original file shares or object storage.

---

### Related Links
* [Get-VBRUnstructuredBackupRestorePoint](Get-VBRUnstructuredBackupRestorePoint)

* [Start-VBRUnstructuredBackupFLRSession](Start-VBRUnstructuredBackupFLRSession)

* [Get-VBRUnstructuredBackupFLRItem](Get-VBRUnstructuredBackupFLRItem)

* [Get-VBRUnstructuredBackupFLRItemVersion](Get-VBRUnstructuredBackupFLRItemVersion)

---

### Examples
> Example 1. Restoring all Versions of Objects to File Share

$restorepoint = Get-VBRUnstructuredBackupRestorePoint       
$session = Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint        
$files = Get-VBRUnstructuredBackupFLRItem -Session $session     
$fileversion = Get-VBRUnstructuredBackupFLRItemVersion -Item $files     
Restore-VBRUnstructuredBackupFLRItem -Item $fileversion[0]
This example shows how to restore specific versions of files and folders to the original file share. Veeam Backup & Replication will not overwrite files and folders that are already added to a file share with versions of these files and folders from a backup.
Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.
3. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Set the $session variable as the Session parameter value. Save the result to the $files variable.
4. Run the Get-VBRUnstructuredBackupFLRItemVersion cmdlet. Set the $files variable as the Item parameter value. Save the result to the $fileversion variable.
5. Run the Restore-VBRUnstructuredBackupFLRItem cmdlet. Set the $files variable as the Item parameter value.
> Example 2. Restoring Specific Restore Point of Objects to File Share

$restorepoint = Get-VBRUnstructuredBackupRestorePoint       
$session = Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint[3]     
Get-VBRUnstructuredBackupFLRItem -Session $session      
Restore-VBRUnstructuredBackupFLRItem -Item $fileversion -Overwrite
This example shows how to restore files and folders to the specific restore point.Veeam Backup & Replication will overwrite files and folders that are already added to a file share with versions of these files and folders from a backup.
Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.
3. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Set the $session variable as the Session parameter value. Save the result to the $files variable.
4. Run the Restore-VBRUnstructuredBackupFLRItem cmdlet. Set the $files variable as the Item parameter value. Specify the Overwrite parameter.

---

### Parameters
#### **ChangedItemsOnly**
Defines whether to restore changed files and folders only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Item**
Specifies an array of backed-up objects. The cmdlet will restore these objects to the original file share or object storage. Accepts the VBRUnstructuredBackupFLRItem[] object.  To get this object, run the Get-VBRUnstructuredBackupFLRItemVersion cmdlet.

|Type                              |Required|Position|PipelineInput                 |
|----------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupFLRItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Overwrite**
Defines that the cmdlet will overwrite an existing object with the restored one. If you provide this parameter, the cmdlet will overwrite an existing object on the file share or object storage server with the version of an object from a backup. Otherwise, an existing object will not be overwritten.

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
Restore-VBRUnstructuredBackupFLRItem [-ChangedItemsOnly] -Item <VBRUnstructuredBackupFLRItem[]> [-Overwrite] [-RunAsync] [<CommonParameters>]
```
