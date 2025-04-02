Add-VBRBackupJob
----------------

### Synopsis
Creates a new backup job.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Description**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **FileName**

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |False        |TargetFileName|

#### **Folder**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |False        |

#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **Objects**

|Type        |Required|Position|PipelineInput                 |Aliases|
|------------|--------|--------|------------------------------|-------|
|`[String[]]`|true    |named   |True (ByPropertyName, ByValue)|VM     |

#### **Server**

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[CHost]`|true    |2       |False        |Host   |

#### **Type**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |False        |

---

### Inputs
System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRBackupJob [-Name] <String> [[-Type] <String>] [-Server] <CHost> [-Folder] <String> [-Description <String>] [-FileName <String>] -Objects <String[]> [<CommonParameters>]
```
