Save-VBRNASBackupFLRItem
------------------------

### Synopsis
Restore objects backed up by file backup jobs to the specified file shares.

---

### Description

This cmdlet restores objects backed up by file backup jobs to the specified file shares.

---

### Related Links
* [Get-VBRNASBackupFLRSession](Get-VBRNASBackupFLRSession)

* [Get-VBRNASServer](Get-VBRNASServer)

* [Get-VBRNASBackupFLRItem](Get-VBRNASBackupFLRItem)

---

### Examples
> Example 1. Restoring All Objects to File Shares

$session = Get-VBRNASBackupFLRSession
$fileshare = Get-VBRNASServer -Name "\\WinSrv\Reports"
$files = Get-VBRNASBackupFLRItem -Session $session
Save-VBRNASBackupFLRItem -Item $folder -Server $fileshare -Path "\\WinSrv\Reports\Restored"
This example shows how to restore all backed-up files and folders to the \\WinSrv\Reports file share. Veeam Backup & Replication will save files and folders to the \\WinSrv\Reports\Restored folder on the file share.

Perform the following steps:
1. Run the Get-VBRNASBackupFLRSession cmdlet. Save the result to the $session variable.
2. Run the Get-VBRNASServer cmdlet. Specify the Name parameter value. Save the result to the $fileshare variable.
3. Run the Get-VBRNASBackupFLRItem cmdlet. Set the $session variable as the Session parameter value.
4. Run the Save-VBRNASBackupFLRItem cmdlet. Specify the following settings:
- Set the $folder variable as the Item parameter value.
- Set the $fileshare variable as the Server parameter value.
- Specify the Path parameter value.
> Example 2. Restoring Specific Folder to File Shares

$session = Get-VBRNASBackupFLRSession
$fileshare = Get-VBRNASServer -Name "\\WinSrv\Reports"
$files = Get-VBRNASBackupFLRItem -Session $session -Name "October Reports"
Save-VBRNASBackupFLRItem -Item $files -Server $fileshare -Path "\\WinSrv\Reports\Restored"
This example shows how to restore the October Reports folder to the \\WinSrv\Reports file share. Veeam Backup & Replication will save files and folders to the \\WinSrv\Reports\Restored folder on the file share.

Perform the following steps:
1. Run the Get-VBRNASBackupFLRSession cmdlet. Save the result to the $session variable.
2. Run the Get-VBRNASServer cmdlet. Specify the Name parameter value. Save the result to the $fileshare variable.
3. Run the Get-VBRNASBackupFLRItem cmdlet. Specify the Name parameter value. Set the $session variable as the Session parameter value. Save the result to the $files variable.
4. Run the Save-VBRNASBackupFLRItem cmdlet. Specify the following settings:
- Set the $files variable as the Item parameter value.
- Set the $fileshare variable as the Server parameter value.
- Specify the Path parameter value.

---

### Parameters
#### **Item**
Specifies an array of backed-up object.  The cmdlet will restore these objects to the file share. [For restore of backups to the specific restore point]: Accepts the VBRNASBackupFLRItem[] object.  To get this object, run the Get-VBRNASBackupFLRItem cmdlet. [For all versions of backups restore]: Accepts the VBRNASBackupFLRItemVersion object.  To get this object, run the Get-VBRNASBackupFLRItemVersion cmdlet.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRNASBackupFLRItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Path**
Specifies a path on a file share.  The cmdlet will restore the backed-up object to that path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PreservePermissions**
Defines that the cmdlet will restore permissions and security attributes of objects that you want to save. If you provide this parameter, the cmdlet will restore backup files with security attributes and permissions set by the user. Otherwise, permissions and security attributes of restored backups will not be recovered.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.v

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies a file share.  The cmdlet will restore the backed-up object to this file share. Accepts the VBRNASServer object. To get this object, run the Get-VBRNASServer cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRNASServer]`|true    |named   |False        |

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
Save-VBRNASBackupFLRItem -Item <VBRNASBackupFLRItem[]> -Path <String> [-PreservePermissions] [-RunAsync] -Server <VBRNASServer> [<CommonParameters>]
```
