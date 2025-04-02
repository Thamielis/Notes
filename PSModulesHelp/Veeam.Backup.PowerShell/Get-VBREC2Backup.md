Get-VBREC2Backup
----------------

### Synopsis
Returns EC2 instance backups.

---

### Description

This cmdlet returns an array of EC2 instance backups.

---

### Examples
> Getting EC2 Instance Backups

```PowerShell
Get-VBREC2Backup
This command returns all EC2 instance backups.
```

---

### Parameters
#### **Name**
Specifies an array of names for EC2 instance backups. The cmdlet will return backups with these names.

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
Get-VBREC2Backup [-Name <String[]>] [<CommonParameters>]
```
