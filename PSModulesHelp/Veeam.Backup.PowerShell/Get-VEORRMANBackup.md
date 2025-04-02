Get-VEORRMANBackup
------------------

### Synopsis
Returns RMAN backups from the backup server.

---

### Description

This cmdlet returns the array of RMAN backups from the backup server.

---

### Examples
> Example 1

```PowerShell
Get-VEORRMANBackup
This example shows how to get an array of RMAN backups from the backup server.
```

---

### Parameters
#### **Name**
Specifies an array of backup jobs that contain RMAN backups.

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
Get-VEORRMANBackup [-Name <String[]>] [<CommonParameters>]
```
