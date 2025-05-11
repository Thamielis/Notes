New-VBRObjectStorageBackupContainerPathMask
-------------------------------------------

### Synopsis
Defines an exclusion mask for objects in object storage.

---

### Description

This cmdlet creates the VBRObjectStorageBackupContainerPathMask object. This object defines an exclusion mask for objects in object storage. You can exclude either an entire bucket, container, or an object.

---

### Examples
> Defining Exclusion Mask for Objects Within Object Storage

```PowerShell
$ExclusionMask = New-VBRObjectStorageBackupContainerPathMask -Container "Monthly Backups" -Path "files/old"
This command defines that all objects that start with files/old will be excluded from the Monthly Backups container.
```

---

### Parameters
#### **Container**
Specifies a bucket or a container. The cmdlet will exclude this bucket or container.  If you specify the Path parameter, the cmdlet will exclude certain objects from the bucket or container.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Path**
Specifies a path to an object that you want to exclude.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRObjectStorageBackupContainerPathMask -Container <String> [-Path <String>] [<CommonParameters>]
```
