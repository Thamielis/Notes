Get-VBRRecoveryPointObjective
-----------------------------

### Synopsis
Returns a schedule for a backup copy jobs that process backups stored on external repositories.

---

### Description

Returns the VBRRecoveryPointObjective object.
This object contains schedule settings backup copy jobs that process backups stored on external repositories.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Getting Schedule Settings for Backup Copy Job

$job = Get-VBRJob -Name "EC2 BCJ 01"
Get-VBRRecoveryPointObjective -Job $job
This example shows how to get schedule settings for a backup copy job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRRecoveryPointObjective cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the backup copy job. The cmdlet will return schedule settings for the specified job.

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
Get-VBRRecoveryPointObjective -Job <CBackupJob> [<CommonParameters>]
```
