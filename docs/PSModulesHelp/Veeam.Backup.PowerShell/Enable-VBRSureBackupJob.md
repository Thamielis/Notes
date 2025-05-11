Enable-VBRSureBackupJob
-----------------------

### Synopsis
Enables stopped SureBackup jobs.

---

### Description

This cmdlet disables running SureBackup jobs.
Run the Disable-VBRSureBackupJob cmdlet to disable SureBackup jobs.

---

### Related Links
* [Get-VBRSureBackupJob](Get-VBRSureBackupJob)

---

### Examples
> Enabling SureBackup Job

$surejob = Get-VBRSureBackupJob -Name "Job01"
Enable-VBRSureBackupJob -Job $surejob
This example shows how to enable the Job01 SureBackup job.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $surejob variable.
2. Run the Enable-VBRSureBackupJob cmdlet. Set the $surejob variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies a SureBackup job. The cmdlet will enable this job.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRSureBackupJobBase]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSureBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRSureBackupJob -Job <VBRSureBackupJobBase> [<CommonParameters>]
```
