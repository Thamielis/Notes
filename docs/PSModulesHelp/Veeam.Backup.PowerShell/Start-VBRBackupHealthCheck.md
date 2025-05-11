Start-VBRBackupHealthCheck
--------------------------

### Synopsis
WARNING! This cmdlet is for internal use only.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Backup**

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CBackup]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Oib**

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|false   |1       |True (ByPropertyName, ByValue)|

#### **RunAsync**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackup

Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRBackupHealthCheck [-Backup] <CBackup> [[-Oib] <COib>] [-RunAsync] [<CommonParameters>]
```
