Sync-VBRBackupRepository
------------------------

### Synopsis
Rescans a backup repository.

---

### Description

This cmdlet allows you to rescan a backup repository and get details on backups stored on it.
You can perform the repository rescan, for example, in case you have imported or copied backups.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Rescanning Backup Repository [Using Pipeline]

Get-VBRBackupRepository -Name "Local Repository 01" | Sync-VBRBackupRepository
This example shows how to rescan the repository named Local Repository 01.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Sync-VBRBackupRepository cmdlet.
> Example 2. Rescanning Backup Repository [Using Variable]

$repository = Get-VBRBackupRepository -Name "Local Repository 01"
Sync-VBRBackupRepository -Repository $repository
This example shows how to rescan the repository named Local Repository 01.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Sync-VBRBackupRepository cmdlet. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies an array of backup repositories you want to rescan.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[CBackupRepository[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CBackupRepository[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRBackupRepository -Repository <CBackupRepository[]> [<CommonParameters>]
```
