Start-VBRTapeObjectStorageRestore
---------------------------------

### Synopsis
Starts the restore of objects from tape.

---

### Description

This cmdlet starts the restore of objects backed-up by tape jobs.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRTapeCatalogItem](Find-VBRTapeCatalogItem)

---

### Examples
> Example 1. Restoring Objects from Tape to Original Location

$item = Find-VBRTapeCatalogItem
Start-VBRTapeObjectStorageRestore -CatalogItem $item[3]
This example shows how to start the restore to original location objects backed-up by tape jobs.

Perform the following steps:
1. Run the Find-VBRTapeCatalogItem cmdlet. Save the result to the $item variable.
The Find-VBRTapeCatalogItem cmdlet will return an array of objects to restore. Mind the ordinal number of the necessary object (in our example, it is the fourth restore point in the array).
2. Run the Start-VBRTapeObjectStorageRestore cmdlet. Set the $item[3] variable as the CatalogItem parameter value.
> Example 2. Restoring Objects from Tape to Another Location

$host = Get-VBRServer -Name target.tech.local
$item = Find-VBRTapeCatalogItem
Start-VBRTapeObjectStorageRestore -Server $host -Path "C:\Backup restore\Azure Blob Container" -CatalogItem $item[3]
This example shows how to start the restore to another location objects backed-up by tape jobs.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $host variable.
2. Run the Find-VBRTapeCatalogItem cmdlet. Save the result to the $item variable.
The Find-VBRTapeCatalogItem cmdlet will return an array of objects to restore. Mind the ordinal number of the necessary object (in our example, it is the fourth restore point in the array).
3. Run the Start-VBRTapeObjectStorageRestore cmdlet. Set the $host variable as the Server parameter value. Specify the Path parameter value. Set the $item[3] variable as the CatalogItem parameter value.
> Example 3. Restoring Objects from Tape to Another Object Storage Location

$azure = Get-VBRServer -Name "Azure Blob Storage"
$item = Find-VBRTapeCatalogItem -Name "ABC Bucket"
Start-VBRTapeObjectStorageRestore -Server $azure -Path "<ObjectStorageHostPath><Region>Azure Global (Standard)</Region><Container>SDK Container</Container><RelativePath></RelativePath><Delimiter>/</Delimiter><IsObject>False</IsObject></ObjectStorageHostPath>" -CatalogItem $item
This example shows how to start the restore of the ABC Bucket item to the SDK Container within Microsoft Azure Blob Storage.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $azure variable.
2. Run the Find-VBRTapeCatalogItem cmdlet. Specify the Name parameter value. Save the result to the $item variable.
3. Run the Start-VBRTapeObjectStorageRestore cmdlet. Specify the following settings:
- Set the $azure variable as the Server parameter value.
- Specify the Path parameter value.
- Set the $item variable as the CatalogItem parameter value.

---

### Parameters
#### **CatalogItem**
Specifies an array of objects to restore. Accepts the VBRTapeCatalogItem[] object. To get this object, run the Find-VBRTapeCatalogItem cmdlet.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRTapeCatalogItem[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **CatalogItemVersion**
Specifies an array of objects to restore. If this parameter is not specified, the cmdlet will restore the latest version of objects. Accepts the VBRTapeCatalogItemVersion[] object. To get this object, run the Find-VBRTapeCatalogItemVersion cmdlet.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRTapeCatalogItemVersion[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **EnableItemSecurityRestore**
Enables the option for the restored objects to keep their original ownership and security permissions.  Otherwise, Veeam Backup & Replication will change security settings: the user account under which the Veeam Backup Service runs will be set as the owner of the restored objects, while access permissions will be inherited from the target folder to which the objects are restored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ItemRestorePolicy**
Specifies overwrite options to use in case the object already exists in the target folder:
* LeaveExisting: use this option not to overwrite the existing object with the restored one.
* OverwriteOlder: use this option to overwrite the existing object only if it is older than the restored object.
* AlwaysOverwrite: use this option to overwrite the existing object with the restored object in all cases.
Valid Values:

* LeaveExisting
* OverwriteOlder
* AlwaysOverwrite

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRTapeCatalogItemRestorePolicy]`|false   |named   |False        |

#### **Path**
Specifies the path to the folder on the destination server to restore data to.
If you restore to another storage or container, you must provide the path to this new location in the XML format.
The format must have the following tags:
<ObjectStorageHostPath> <Region>Name of the region or * if there is no region for OS</Region> <Container>Name of the target container for restore</Container> <RelativePath>Prefix for restored object</RelativePath> - do not include it when restoring to the root <Delimiter>/</Delimiter> - always must be / <IsObject>False</IsObject> - always must be False </ObjectStorageHostPath>

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PreserveFolderHierarchy**
If you provide this parameter, the cmdlet will preserve the folder hierarchy of restored data. Otherwise, objects will be restored to the specified target folder without keeping the folder structure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies the server to restore data to. Accepts the CHost object. To get this object, run the Get-VBRServer cmdlet.

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
Start-VBRTapeObjectStorageRestore [-CatalogItem <VBRTapeCatalogItem[]>] [-CatalogItemVersion <VBRTapeCatalogItemVersion[]>] [-EnableItemSecurityRestore] [-ItemRestorePolicy {LeaveExisting | OverwriteOlder | 
```
```PowerShell
AlwaysOverwrite}] -Path <String> [-PreserveFolderHierarchy] [-RunAsync] -Server <CHost> [<CommonParameters>]
```
