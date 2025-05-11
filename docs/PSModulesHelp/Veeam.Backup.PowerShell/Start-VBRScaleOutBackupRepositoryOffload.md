Start-VBRScaleOutBackupRepositoryOffload
----------------------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **ApproximateOffloadSizeGB**

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |named   |True (ByPropertyName)|

#### **Repository**

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRScaleOutBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository

System.Int64

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRScaleOutBackupRepositoryOffload -ApproximateOffloadSizeGB <Int64> -Repository <VBRScaleOutBackupRepository> [<CommonParameters>]
```
