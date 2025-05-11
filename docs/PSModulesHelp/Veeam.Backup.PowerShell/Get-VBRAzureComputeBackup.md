Get-VBRAzureComputeBackup
-------------------------

### Synopsis
Returns Azure backups.

---

### Description

This cmdlet returns an array of Azure backups.

---

### Examples
> Getting Azure Backups

```PowerShell
Get-VBRAzureComputeBackup
This command returns an array of Azure backups.
```

---

### Parameters
#### **Name**
Specifies an array of names for Azure backups. The cmdlet will return Azure backups with the specified names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
Get-VBRAzureComputeBackup [-Name <String[]>] [<CommonParameters>]
```
