Save-VBRUnstructuredBackupFLRItem
---------------------------------

### Synopsis
Restores objects backed up by file backup jobs or object storage backup jobs to the specified file shares or object storage.

---

### Description

This cmdlet restores objects backed up by file backup jobs or object storage backup jobs to the specified file shares or object storage.

---

### Related Links
* [Get-VBRUnstructuredBackupRestorePoint](Get-VBRUnstructuredBackupRestorePoint)

* [Start-VBRUnstructuredBackupFLRSession](Start-VBRUnstructuredBackupFLRSession)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Get-VBRUnstructuredBackupFLRItem](Get-VBRUnstructuredBackupFLRItem)

---

### Examples
> Example 1. Restoring All Objects to File Shares

$restorepoint = Get-VBRUnstructuredBackupRestorePoint       
$session = Start-VBRUnstructuredBackupFLRSession  -RestorePoint $restorepoint       
$fileshare = Get-VBRUnstructuredServer -Name "\\WinSrv\Reports"     
$file = Get-VBRUnstructuredBackupFLRItem -Session $session      
Save-VBRUnstructuredBackupFLRItem -Item $file -Server $fileshare -Path "\\WinSrv\Reports\Restored"
This example shows how to restore all backed-up files and folders to the \WinSrv\Reports file share. Veeam Backup & Replication will save files and folders to the \WinSrv\Reports\Restored folder on the file share.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.
3. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $fileshare variable.
4. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Set the $session variable as the Session parameter value.
5. Run the Save-VBRUnstructuredBackupFLRItem cmdlet. Specify the following settings:
- Set the $file variable as the Item parameter value.
- Set the $fileshare variable as the Server parameter value.
- Specify the Path parameter value.
> Example 2. Restoring Specific Folder to File Shares

$restorepoint = Get-VBRUnstructuredBackupRestorePoint       
$session = Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint        
$fileshare = Get-VBRUnstructuredServer -Name "\\WinSrv\Reports"     
$file = Get-VBRUnstructuredBackupFLRItem -Session $session -Name "October Reports"      
Save-VBRUnstructuredBackupFLRItem -Item $files -Server $fileshare -Path "\\WinSrv\Reports\Restored"
This example shows how to restore the October Reports folder to the \WinSrv\Reports file share. Veeam Backup & Replication will save files and folders to the \WinSrv\Reports\Restored folder on the file share.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.
3. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $fileshare variable.
4. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Specify the Name parameter value. Set the $session variable as the Session parameter value. Save the result to the $files variable.
5. Run the Save-VBRUnstructuredBackupFLRItem cmdlet. Specify the following settings:
- Set the $files variable as the Item parameter value.
- Set the $fileshare variable as the Server parameter value.
- Specify the Path parameter value.

---

### Parameters
#### **Item**
Specifies an array of backed-up object. The cmdlet will restore these objects to the file share.
[For restore of backups to the specific restore point]: Accepts the VBRNASBackupFLRItem[] object. To get this object, run the Get-VBRUnstructuredBackupFLRItem cmdlet.
[For all versions of backups restore]: Accepts the VBRUnstructuredBackupFLRItemVersion object. To get this object, run the Get-VBRUnstructuredBackupFLRItemVersion cmdlet.

|Type                              |Required|Position|PipelineInput                 |
|----------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupFLRItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Path**
Specifies one of the location:
* [For file shares] a path to the folder.
* [For object storage] a bucket, a container and prefixes inside the bucket or a container.
The cmdlet will restore the backed-up object to that location.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PreservePermissions**
Defines that the cmdlet will restore permissions and security attributes of objects that you want to save.  If you provide this parameter, the cmdlet will restore backup files with security attributes and permissions set by the user. Otherwise, permissions and security attributes of restored backups will not be recovered.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies a file share or object storage. The cmdlet will restore the backed-up object to this file share or object storage. Accepts the VBRUnstructuredServer object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRUnstructuredServer]`|true    |named   |False        |

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
Save-VBRUnstructuredBackupFLRItem -Item <VBRUnstructuredBackupFLRItem[]> -Path <String> [-PreservePermissions] [-RunAsync] -Server <VBRUnstructuredServer> [<CommonParameters>]
```
