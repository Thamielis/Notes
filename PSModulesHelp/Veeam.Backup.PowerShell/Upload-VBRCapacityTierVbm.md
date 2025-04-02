Upload-VBRCapacityTierVbm
-------------------------

### Synopsis
WARNING! This cmdlet is for internal use only.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **ArchiveBackupId**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **ArchiveIndexId**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **CapacityExtent**

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRCapacityExtent]`|false   |named   |False        |

#### **Repository**

|Type                           |Required|Position|PipelineInput|Aliases|
|-------------------------------|--------|--------|-------------|-------|
|`[VBRScaleOutBackupRepository]`|true    |named   |False        |SOBR   |

#### **VbmFilePath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Upload-VBRCapacityTierVbm -ArchiveBackupId <Guid> -ArchiveIndexId <Guid> [-CapacityExtent <VBRCapacityExtent>] -Repository <VBRScaleOutBackupRepository> -VbmFilePath <String> [<CommonParameters>]
```
