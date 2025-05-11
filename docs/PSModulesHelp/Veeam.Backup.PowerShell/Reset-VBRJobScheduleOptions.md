Reset-VBRJobScheduleOptions
---------------------------

### Synopsis
Applies default schedule settings to jobs.

---

### Description

This cmdlet removes custom schedule settings of a specified job and restores its default values.
You can run this cmdlet with any kind of jobs.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Setting Default Schedule Options to Jobs [Using Pipeline]

Get-VBRJob -Name "Fileserver Backup Job", "Fileserver Copy Job" | Reset-VBRJobScheduleOptions
This example shows how to set default schedule options to Fileserver Backup Job and Fileserver Copy Job backup jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Reset-VBRJobScheduleOptions cmdlet.
> Example 2. Setting Default Schedule Options [Using Variable]

$job = Get-VBRJob
Reset-VBRJobScheduleOptions -Job $job
This example shows how to set default schedule options to the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Reset-VBRJobScheduleOptions cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the job you want to edit.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

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
Reset-VBRJobScheduleOptions -Job <CBackupJob> [<CommonParameters>]
```
