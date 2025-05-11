Start-VBRTapeFileRestore
------------------------

### Synopsis
Starts the restore of files and folders from tape.

---

### Description

This cmdlet starts the restore of files and folders from tape.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRTapeCatalogItem](Find-VBRTapeCatalogItem)

---

### Examples
> Example 1. Restoring to Original Location Items Backed-Up by Tape Jobs

$item = Find-VBRTapeCatalogItem 
Start-VBRTapeFileRestore -CatalogItem $item[3]
This example shows how to start the restore to original location files and folders backed-up by tape jobs.

Perform the following steps:
1. Run the Find-VBRTapeCatalogItem cmdlet. Save the result to the $item variable.
2. Run the Start-VBRTapeFileRestore cmdlet. Set the $item[3] variable as the CatalogItem parameter value.

> Example 2. Restoring to Another Location Items Backed-Up by Tape Jobs

$host = Get-VBRServer -Name target.tech.local
$item = Find-VBRTapeCatalogItem 
Start-VBRTapeFileRestore -Server $host -Path "C:\Backup restore\Fileserv05" -CatalogItem $item[3]
This example shows how to start the restore to original location files and folders backed-up by tape jobs.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $host variable.
2. Run the Find-VBRTapeCatalogItem  cmdlet. Save the result to the $item variable.
3. Run the Start-VBRTapeFileRestore cmdlet. Set the $host variable as the Server parameter value. Specify the Path parameter value. Set the $item[3] variable as the CatalogItem parameter value.

---

### Parameters
#### **CatalogItem**
Specifies an array of files or folders to restore. Accepts the VBRTapeCatalogItem[] object. To get this object, run the Find-VBRTapeCatalogItem cmdlet.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRTapeCatalogItem[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **CatalogItemVersion**
Specifies an array of versions of files or folders to restore.  If this parameter is not specified, the cmdlet will restore the latest version of files or folders. Accepts the VBRTapeCatalogItemVersion[] object. To get this object, run the Find-VBRTapeCatalogItemVersion cmdlet.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRTapeCatalogItemVersion[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **EnableItemSecurityRestore**
Enables the Restore file and folder security option: use it if you want the restored files to keep their original ownership and security permissions.  Otherwise, Veeam Backup & Replication will change security settings: the user account under which the Veeam Backup Service runs will be set as the owner of the restored objects, while access permissions will be inherited from the target folder to which the objects are restored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ItemRestorePolicy**
Specifies overwrite options to use in case the file already exists in the target folder:
* LeaveExisting: use this option not to overwrite the existing file with the restored one.
* OverwriteOlder: use this option to overwrite the existing file only if it is older than the restored file.
* AlwaysOverwrite: use this option to overwrite the existing file with the restored file in all cases.
Valid Values:

* LeaveExisting
* OverwriteOlder
* AlwaysOverwrite

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRTapeCatalogItemRestorePolicy]`|false   |named   |False        |

#### **Path**
Specifies the path to the folder on the destination server to restore data to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PreserveFolderHierarchy**
If you provide this parameter, the cmdlet will preserve the folder hierarchy of restored data. Otherwise, files will be restored to the specified target folder without keeping the folder structure.  Note: Do not use this parameter when restoring NDMP volumes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies the server to restore data to. Accepts the CHost object.  To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeCatalogItem[]

Veeam.Backup.PowerShell.Infos.VBRTapeCatalogItemVersion[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRTapeFileRestore [-CatalogItem <VBRTapeCatalogItem[]>] [-CatalogItemVersion <VBRTapeCatalogItemVersion[]>] [-EnableItemSecurityRestore] [-ItemRestorePolicy {LeaveExisting | OverwriteOlder | 
```
```PowerShell
AlwaysOverwrite}] -Path <String> [-PreserveFolderHierarchy] [-RunAsync] -Server <CHost> [<CommonParameters>]
```
