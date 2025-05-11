Get-VBRImportedEncryptedBackup
------------------------------

### Synopsis
Returns imported encrypted backups.

---

### Description

This cmdlet returns imported encrypted backup.  You can get the list of all imported encrypted backups, or narrow down the output by the backups names.

---

### Examples
> Example 1. Returning all Imported Encrypted Backups

```PowerShell
Get-VBRImportedEncryptedBackup
The command returns all imported encrypted backups.
```
> Example 2. Returning Specific Imported Encrypted Backup

```PowerShell
Get-VBRImportedEncryptedBackup -Name "Atlanta SQL Server Backup"
The command returns an imported encrypted backup named "Atlanta SQL Server Backup".
```

---

### Parameters
#### **Name**
Specifies the array of names of the imported encrypted backups. The cmdlet will return backups with these names.

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
Get-VBRImportedEncryptedBackup [-Name <String[]>] [<CommonParameters>]
```
