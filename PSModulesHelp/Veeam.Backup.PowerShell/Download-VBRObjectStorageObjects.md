Download-VBRObjectStorageObjects
--------------------------------

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

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **CloudBackupId**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **Repository**

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRObjectStorageRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SubClientId**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |False        |

#### **VbmFilePath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Download-VBRObjectStorageObjects -ClientId <Guid> -CloudBackupId <Guid> -Repository <VBRObjectStorageRepository> [-SubClientId <Guid>] -VbmFilePath <String> [<CommonParameters>]
```
