Sync-VBRObjectStorageRepository
-------------------------------

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
#### **Repository**

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRObjectStorageRepository[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RescanAgentBackups**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectStorageRepository[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRObjectStorageRepository -Repository <VBRObjectStorageRepository[]> [-RescanAgentBackups] [<CommonParameters>]
```
