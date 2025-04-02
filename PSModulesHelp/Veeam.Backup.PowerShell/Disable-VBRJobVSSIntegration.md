Disable-VBRJobVSSIntegration
----------------------------

### Synopsis
Disables job VSS settings.

---

### Description

This cmdlet disables the VSS settings in the selected job. The VSSs settings are not deleted form the job.
You can run this cmdlet with backup and replication jobs.
Run the Enable-VBRJobVSSIntegration cmdlet to enable VSS settings in the selected job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Disabling VSS Options in Specific Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01", "Backup Job 02" | Disable-VBRJobVSSIntegration
This example shows how to disable the VSS options in the Backup Job 01 and Backup Job 02 jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Disable-VBRJobVSSIntegration cmdlet.
> Example 2. Disabling VSS Options in Job [Using Variable]

$job = Get-VBRJob
Disable-VBRJobVSSIntegration -Job $job
This example shows how to disable the VSS options in job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Disable-VBRJobVSSIntegration cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the array of jobs. The cmdlet will disable VSS settings for these jobs.

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
Disable-VBRJobVSSIntegration [-Job] <CBackupJob[]> [<CommonParameters>]
```
