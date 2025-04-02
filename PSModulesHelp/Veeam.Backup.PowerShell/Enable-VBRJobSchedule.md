Enable-VBRJobSchedule
---------------------

### Synopsis
Enables job schedule.

---

### Description

This cmdlet enables job schedule.
You can enable the job schedule in case you have the schedule configured for this job. You can run this cmdlet with any kind of jobs.
Run the Disable-VBRJobSchedule cmdlet to disable job schedule.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Enabling Specific Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01", "File Copy Job 02" | Enable-VBRJobSchedule
This example shows how to enable the schedule for Backup Job 01 and File Copy Job 02 jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Enable-VBRJobSchedule cmdlet.
> Example 2. Disabling Job Represented by Variable

$BackupJob01 = Get-VBRJob
Enable-VBRJobSchedule -Job $BackupJob01
This example shows how to enable the schedule for job represented by the $BackupJob01 variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $BackupJob01 variable.
2. Run the Enable-VBRJobSchedule cmdlet. Set the $BackupJob01 variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the array of jobs.  The cmdlet will enable schedule in these jobs.

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
Enable-VBRJobSchedule -Job <CBackupJob[]> [<CommonParameters>]
```
