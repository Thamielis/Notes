New-VBRObjectStorageBackupJobObject
-----------------------------------

### Synopsis
Defines a scope of objects that will be added to the object storage backup job.

---

### Description

This cmdlet creates the VBRObjectStorageBackupJobObject object. This object contains a scope of objects that will be added to the object storage backup job.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [New-VBRObjectStorageBackupTagMask](New-VBRObjectStorageBackupTagMask)

---

### Examples
> Defining Scope of Objects to Back up with Object Storage Backup Job

$serv = Get-VBRUnstructuredServer -Name "Azure OS"
$object = New-VBRObjectStorageBackupJobObject -Server $serv -Container "Monthly Backups" -Path "Reports"
This example shows how to define a scope of objects that will be added to the object storage backup job. The cmdlet will add objects from the Montly backup container that are located within the Reports folder.

Perform the following steps:
1. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $serv variable.
2. Run the New-VBRObjectStorageBackupJobObject cmdlet. Set the $serv variable as the Server parameter value. Specify the Server parameter value. Specify the Path parameter value. Save the result to the $object variable.

---

### Parameters
#### **Container**
Specifies a bucket or a container that you want to back up.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ExclusionMask**
Specifies a file mask for objects that you do not want to add to the object storage backup job. The cmdlet will not back up these objects. Accepts the VBRObjectStorageBackupMask[] object. To get this object, run the following cmdles:
* New-VBRObjectStorageBackupContainerPathMask
* New-VBRObjectStorageBackupServerPathMask
* New-VBRObjectStorageBackupTagMask (for include and exclude).

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRObjectStorageBackupMask[]]`|false   |named   |False        |

#### **InclusionMask**
Specifies a file mask for objects that you want to add to the object storage backup job. The cmdlet will back up only objects specified in this file mask. Accepts the VBRObjectStorageBackupMask[] object. To get this object, run the New-VBRObjectStorageBackupTagMask cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRObjectStorageBackupMask[]]`|false   |named   |False        |

#### **IsObject**
Note: This parameter is required if the path that you specify is an object. Defines that the cmdlet will recognize the path as an object. If you omit this parameter, the cmdlet will recognize the path as the prefix.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Path**
Specifies object path or prefixes within a bucket or a container.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Server**
Specifies object storage which data you want to back up. Accepts the VBRObjectStorageServer object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRObjectStorageServer]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectStorageServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRObjectStorageBackupJobObject [-Container <String>] [-ExclusionMask <VBRObjectStorageBackupMask[]>] [-InclusionMask <VBRObjectStorageBackupMask[]>] [-IsObject] [-Path <String>] -Server 
```
```PowerShell
<VBRObjectStorageServer> [<CommonParameters>]
```
