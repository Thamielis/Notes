Get-GPOZaurrBackupInformation
-----------------------------

### Synopsis
Retrieves backup information from GPOZaurr manifest files.

---

### Description

This function retrieves backup information from GPOZaurr manifest files located in the specified BackupFolder(s).

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrBackupInformation -BackupFolder "C:\Backups"
Description:
Retrieves backup information from GPOZaurr manifest files located in the "C:\Backups" folder.
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrBackupInformation -BackupFolder "C:\Backups", "D:\Archives"
Description:
Retrieves backup information from GPOZaurr manifest files located in both "C:\Backups" and "D:\Archives" folders.
```

---

### Parameters
#### **BackupFolder**
Specifies the path(s) to the folder containing GPOZaurr manifest files.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrBackupInformation [[-BackupFolder] <String[]>] [<CommonParameters>]
```
