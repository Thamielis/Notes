Dump-VBRObjectStorageRepositoryBackupContent
--------------------------------------------

### Synopsis
This cmdlet is for internal use only.

---

### Description

WARNING! This cmdlet is for internal use only.

---

### Examples
> Example 1

---

### Parameters
#### **ClientId**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **CloudBackupId**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **DumpPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PerformVerboseDump**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Repository**

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRObjectStorageRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SelectedCheckpointIds**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[UInt64[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectStorageRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Dump-VBRObjectStorageRepositoryBackupContent -ClientId <String> -CloudBackupId <Guid> -DumpPath <String> [-PerformVerboseDump] -Repository <VBRObjectStorageRepository> [-SelectedCheckpointIds <UInt64[]>] 
```
```PowerShell
[<CommonParameters>]
```
