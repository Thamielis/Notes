Add-VSBApplicationGroup
-----------------------

### Synopsis
Creates a VMware application group for SureBackup job.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **RestorePoint**

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[COib[]]`|true    |1       |True (ByPropertyName, ByValue)|

#### **Vm**

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CVm[]]`|true    |1       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.ViSoap.CVm[]

Veeam.Backup.Core.COib[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VSBApplicationGroup [-Name] <String> [-RestorePoint] <COib[]> [<CommonParameters>]
```
```PowerShell
Add-VSBApplicationGroup [-Name] <String> [-Vm] <CVm[]> [<CommonParameters>]
```
