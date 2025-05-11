Disable-VBRJobSchedule
----------------------

### Synopsis
Disables job schedule.

---

### Description

This cmdlet disables job schedule. The schedule settings are not deleted. You can run this cmdlet with backup, replication and copy jobs.
Run the Start-VBRJob cmdlet to start the job once.
Run the Enable-VBRJobSchedule cmdlet to enable job schedule.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Disabling Specific Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01" | Disable-VBRJobSchedule
This example shows how to disable the Backup Job 01 job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Disable-VBRJobSchedule cmdlet.
> Example 2. Disabling Job Represented by Variable

$job = Get-VBRJob
Disable-VBRJobSchedule -Job $job
This example shows how to disable the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Disable-VBRJobSchedule cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the array of jobs. The cmdlet will disable schedule in these jobs.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Disable-VBRJobSchedule -Job <CBackupJob[]> [<CommonParameters>]
```
