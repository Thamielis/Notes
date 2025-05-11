Enable-VBRJobVSSIntegration
---------------------------

### Synopsis
Enables job VSS settings.

---

### Description

This cmdlet enables VSS settings in a selected job that were previously disabled. You can enable the VSS settings in case you have these settings set beforehand.
You can run this cmdlet with backup and replica jobs including vCloud jobs.
Run the Disable-VBRJobVSSIntegration cmdlet to disable VSS settings in the selected job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Enabling VSS Option in Specific Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01", "Backup Job 02" | Enable-VBRJobVSSIntegration
This example shows how to enable the VSS option in the Backup Job 01 and Backup Job 02 jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Enable-VBRJobVSSIntegration cmdlet.
> Example 2. Enabling VSS Option in Job [Using Variable]

$BackupJob01 = Get-VBRJob -Name "Backup Job 01"
Enable-VBRJobVSSIntegration -Job $"Backup Job 01"
This example shows how to enable the VSS option in the Backup Job 01 job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $BackupJob01 variable.
2. Run the Enable-VBRJobVSSIntegration cmdlet. Set the $BackupJob01 variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the array of jobs. The cmdlet will enable VSS settings for these jobs.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRJobVSSIntegration [-Job] <CBackupJob[]> [<CommonParameters>]
```
