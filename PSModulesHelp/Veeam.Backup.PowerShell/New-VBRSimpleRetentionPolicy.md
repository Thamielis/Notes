New-VBRSimpleRetentionPolicy
----------------------------

### Synopsis
Creates a retention policy for backup copy jobs that process backups stored on external repositories.

---

### Description

This cmdlet specifies a retention policy for backup copy job that process backups stored on external repositories.
Veeam Backup & Replication will keep regular backups on the target backup repository according to this policy.
NOTE: Run the New-VBRGFSRetentionPolicy cmdlet to create the GFS retention policy for backup copy jobs.

---

### Examples
> Creating Retention Policy for Backup Copy Job

```PowerShell
New-VBRSimpleRetentionPolicy -RestorePoints 5
This command creates a retention policy for a backup copy job. The target backup repository will keep the last 5 restore points.
```

---

### Parameters
#### **RestorePoints**
Specifies a number of restore points.
Veeam Backup & Replication will keep the selected number of restore points on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
New-VBRSimpleRetentionPolicy [-RestorePoints <Int32>] [<CommonParameters>]
```
