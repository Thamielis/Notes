Export-VBRBackup
----------------

### Synopsis
Exports a backup or restore point files to a selected folder.

---

### Description

This cmdlet copies a selected backup files to a user-specified directory.

You can copy a whole backup file or select backups for a specific job object. The job objects are VMs, VM containers, datastores or resource pools.

---

### Examples
> Example 1

```PowerShell
Export-VBRBackup -Backup $"AD backup" -Dir "C:\Export"
This command exports the backup file represented by the $"AD backup" to the folder "C:\Export". The backup file to export is obtained with Get-VBRBackup and assigned to the variable beforehand.
```
> Example 2

```PowerShell
Export-VBRBackup -RestorePoint $"AD_local" -Dir "C:\Export"
This command exports the backup file for a specific VM represented by the $"AD_local" to the folder "C:\Export". The backup file to export is obtained with Get-VBRRestorePoint and assigned to the variable beforehand.
```

---

### Parameters
#### **Backup**
Specifies the backup file you want to export.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CBackup]`|true    |0       |False        |

#### **Dir**
Specifies the path to the folder where you want to copy the files to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |False        |

#### **RestorePoint**
Specifies the job object (i.e. a VM) for which you want to export the backup files.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[COib]`|true    |0       |False        |

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
Export-VBRBackup [-Backup] <CBackup> [-Dir] <String> [<CommonParameters>]
```
```PowerShell
Export-VBRBackup [-RestorePoint] <COib> [-Dir] <String> [<CommonParameters>]
```
