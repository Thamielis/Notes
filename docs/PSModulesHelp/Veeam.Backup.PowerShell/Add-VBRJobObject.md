Add-VBRJobObject
----------------

### Synopsis
Adds VMs or VM containers to existing job.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Entities**

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CEntity[]]`|true    |2       |True (ByPropertyName, ByValue)|

#### **Job**

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CBackupJob]`|true    |0       |False        |

#### **Objects**

|Type        |Required|Position|PipelineInput                 |Aliases|
|------------|--------|--------|------------------------------|-------|
|`[String[]]`|true    |2       |True (ByPropertyName, ByValue)|VM     |

#### **Server**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |1       |False        |

---

### Inputs
System.String[]

Veeam.Backup.ViSoap.CEntity[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRJobObject [-Job] <CBackupJob> [-Server] <CHost> [-Entities] <CEntity[]> [<CommonParameters>]
```
```PowerShell
Add-VBRJobObject [-Job] <CBackupJob> [-Server] <CHost> [-Objects] <String[]> [<CommonParameters>]
```
