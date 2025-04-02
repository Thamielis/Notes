Get-VBRRetentionPolicy
----------------------

### Synopsis
Returns a retention policy for backup copy jobs.

---

### Description

This cmdlet returns a retention policy for backup copy jobs of the following types:
- Backup copy jobs that process backups stored on external repositories.
- Veeam Agent backup copy jobs.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Getting Retention Policy for Backup Copy Job

$job = Get-VBRJob -Name "EC2 BCJ 01"
Get-VBRRetentionPolicy -Job $job
This example shows how to get a retention policy for a backup copy job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRRetentionPolicy cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies a backup copy job. The cmdlet will return a retention policy for the specified job.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[CBackupJob]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.Core.CBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRRetentionPolicy -Job <CBackupJob> [<CommonParameters>]
```
