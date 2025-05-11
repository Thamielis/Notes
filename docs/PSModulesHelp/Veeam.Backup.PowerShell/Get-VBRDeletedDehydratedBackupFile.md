Get-VBRDeletedDehydratedBackupFile
----------------------------------

### Synopsis
Returns a list of backup files deleted from the capacity tier and preserved by insider protection.

---

### Description

This cmdlet returns a list of backup files deleted from the capacity tier and preserved by insider protection.

---

### Examples
> Getting Deleted Backup Files by Name

```PowerShell
Get-VBRDeletedDehydratedBackupFile -Name "MonthlyReport"
This command returns backup files with MonthlyReport in name.
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
Get-VBRDeletedDehydratedBackupFile [-Name <String>] [<CommonParameters>]
```
