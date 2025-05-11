Dump-VBRCapacityTierBackupContent
---------------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

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

#### **DumpFolderPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **IncludeBlockList**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PerformVerboseDump**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Repository**

|Type                           |Required|Position|PipelineInput|Aliases|
|-------------------------------|--------|--------|-------------|-------|
|`[VBRScaleOutBackupRepository]`|true    |named   |False        |SOBR   |

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
Dump-VBRCapacityTierBackupContent -ArchiveBackupId <Guid> -ArchiveIndexId <Guid> [-CapacityExtent <VBRCapacityExtent>] -DumpFolderPath <String> [-IncludeBlockList] [-PerformVerboseDump] -Repository 
```
```PowerShell
<VBRScaleOutBackupRepository> [<CommonParameters>]
```
