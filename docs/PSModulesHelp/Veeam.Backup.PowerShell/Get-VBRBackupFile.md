Get-VBRBackupFile
-----------------

### Synopsis
Returns backup files.

---

### Description

This cmdlet returns backup files. You can use this cmdlet to get backup files from an object storage and to move them to the object storage.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

---

### Examples
> Example 1. Getting all Backup Files from Specified Backup

$backup = Get-VBRBackup -Name "Exchange backups"
Get-VBRBackupFile -Backup $backup
This example shows how to get all backup files from the specified backup.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRBackupFile cmdlet. Set the $backup variable as the Backup parameter value.
> Example 2. Getting all Incremental Backup Files from Specified Backup

$backup = Get-VBRBackup -Name "Exchange backups"
Get-VBRBackupFile -Backup $backup -Path "C:\Users\Administrator\Downloads\.vib"
This example shows how to get all incremental backup files from the specified backup.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRBackupFile cmdlet. Set the $backup variable as the Backup parameter value. Specify the Path parameter value.

---

### Parameters
#### **Backup**
Specifies the backup. The cmdlet will return an array of backup files for this backup.

|Type       |Required|Position|PipelineInput |
|-----------|--------|--------|--------------|
|`[CBackup]`|true    |named   |True (ByValue)|

#### **Id**
Specifies an ID of a backup file. The cmdlet will return the backup file with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Path**
Specifies a relative path to the folder with backup files.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRBackupFile -Backup <CBackup> [-Path <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRBackupFile -Id <Guid[]> [<CommonParameters>]
```
