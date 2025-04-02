Get-VBRDeletedArchivedBackupFile
--------------------------------

### Synopsis
Returns an array of backup files deleted from the archive tier and preserved by insider protection.

---

### Description

This cmdlet returns an array of backup files deleted from the archive tier and preserved by insider protection.

---

### Examples
> Getting Deleted Backup Files by Name

```PowerShell
Get-VBRDeletedArchivedBackupFile -Name "Backup"
This command returns deleted backup files containing Backup in name.
```

---

### Parameters
#### **Name**
Specifies backup files names. The cmdlet will return backup files with these names.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Get-VBRDeletedArchivedBackupFile [-Name <String>] [<CommonParameters>]
```
