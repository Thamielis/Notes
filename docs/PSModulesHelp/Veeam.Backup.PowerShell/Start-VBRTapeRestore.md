Start-VBRTapeRestore
--------------------

### Synopsis
IMPORTANT! This cmdlet is obsolete.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Path**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Reason**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **RestorePoint**

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[COib[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRTapeRestore -Path <String> [-Reason <String>] -RestorePoint <COib[]> [-RunAsync] -Server <CHost> [<CommonParameters>]
```
```PowerShell
Start-VBRTapeRestore [-Reason <String>] -Repository <CBackupRepository> -RestorePoint <COib[]> [-RunAsync] [<CommonParameters>]
```
