Upload-VBRArchiveTierObjects
----------------------------

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

#### **AuxDataFilePath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **GlacierMetaFilePath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**

|Type                           |Required|Position|PipelineInput|Aliases|
|-------------------------------|--------|--------|-------------|-------|
|`[VBRScaleOutBackupRepository]`|true    |named   |False        |SOBR   |

#### **VbmFilePath**

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
Upload-VBRArchiveTierObjects -ArchiveBackupId <Guid> -ArchiveIndexId <Guid> [-AuxDataFilePath <String>] [-GlacierMetaFilePath <String>] -Repository <VBRScaleOutBackupRepository> [-VbmFilePath <String>] 
```
```PowerShell
[<CommonParameters>]
```
