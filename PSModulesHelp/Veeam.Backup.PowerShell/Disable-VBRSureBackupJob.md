Disable-VBRSureBackupJob
------------------------

### Synopsis
Disables running SureBackup jobs.

---

### Description

This cmdlet disables running SureBackup jobs.
Run the Enable-VBRSureBackupJob cmdlet to enable SureBackup jobs.

---

### Related Links
* [Get-VBRSureBackupJob](Get-VBRSureBackupJob)

---

### Examples
> Disabling SureBackup Job

$surejob = Get-VBRSureBackupJob -Name "Job01"
Disable-VBRSureBackupJob -Job $surejob
This example shows how to disable the Job01 SureBackup job.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $surejob variable.
2. Run the Disable-VBRSureBackupJob cmdlet. Set the $surejob variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies a SureBackup job. The cmdlet will disable this job.

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
Disable-VBRSureBackupJob -Job <VBRSureBackupJobBase> [<CommonParameters>]
```
