Set-FilePermission
------------------

### Synopsis
Sets file permissions for a specified user or group on a given path.

---

### Description

This function sets file permissions for a specified user or group on a given path. It allows you to define the type of access control, inheritance flags, and propagation flags.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-FilePermission -Path "C:\Example\File.txt" -Principal "domain\username" -AclRightsToAssign "Modify"
Sets Modify permissions for the user 'domain\username' on the file "File.txt" located at "C:\Example".
```
> EXAMPLE 2

```PowerShell
Set-FilePermission -Path "D:\Data" -Principal "domain\group" -AclRightsToAssign "FullControl" -InheritedFolderPermissions @("ContainerInherit")
Sets FullControl permissions for the group 'domain\group' on the directory "Data" located at "D:\" with inheritance only for subfolders.
```

---

### Parameters
#### **Path**
The path to the file or directory for which permissions need to be set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Principal**
Specifies the user or group for which permissions are being set. Use the format 'domain\username'.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |2       |false        |UserOrGroup|

#### **InheritedFolderPermissions**
Specifies the inheritance flags for folder permissions. Default values are ContainerInherit and ObjectInherit.
Valid Values:

* None
* ContainerInherit
* ObjectInherit

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[InheritanceFlags]`|false   |3       |false        |

#### **AccessControlType**
Specifies the type of access control to be allowed or denied. Default is Allow.
Valid Values:

* Allow
* Deny

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[AccessControlType]`|false   |4       |false        |

#### **PropagationFlags**
Specifies how the access control entries are propagated to child objects. Default is None.
Valid Values:

* None
* NoPropagateInherit
* InheritOnly

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[PropagationFlags]`|false   |5       |false        |

#### **AclRightsToAssign**
Specifies the file system rights to assign to the user or group.
Valid Values:

* ListDirectory
* ListDirectory
* CreateFiles
* CreateFiles
* CreateDirectories
* CreateDirectories
* ReadExtendedAttributes
* WriteExtendedAttributes
* Traverse
* Traverse
* DeleteSubdirectoriesAndFiles
* ReadAttributes
* WriteAttributes
* Write
* Delete
* ReadPermissions
* Read
* ReadAndExecute
* Modify
* ChangePermissions
* TakeOwnership
* Synchronize
* FullControl

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[FileSystemRights]`|false   |6       |false        |

---

### Notes
File permissions are set using the Set-Acl cmdlet from the System.Security.AccessControl module.

---

### Syntax
```PowerShell
Set-FilePermission [[-Path] <String>] [[-Principal] <String>] [[-InheritedFolderPermissions] {None | ContainerInherit | ObjectInherit}] [[-AccessControlType] {Allow | Deny}] [[-PropagationFlags] {None | NoPropagateInherit | InheritOnly}] [[-AclRightsToAssign] {ReadData | ListDirectory | WriteData | CreateFiles | AppendData | CreateDirectories | ReadExtendedAttributes | WriteExtendedAttributes | ExecuteFile | Traverse | DeleteSubdirectoriesAndFiles | ReadAttributes | WriteAttributes | Write | Delete | ReadPermissions | Read | ReadAndExecute | Modify | ChangePermissions | TakeOwnership | Synchronize | FullControl}] [<CommonParameters>]
```
