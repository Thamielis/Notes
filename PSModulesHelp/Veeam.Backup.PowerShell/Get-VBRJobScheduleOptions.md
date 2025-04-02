Get-VBRJobScheduleOptions
-------------------------

### Synopsis
Returns job scheduling settings.

---

### Description

This cmdlet returns job scheduling options for a selected job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRJobObject](Get-VBRJobObject)

---

### Examples
> Example 1. Looking for List of Scheduling Options of Specific Job [Using Pipeline]

Get-VBRJob -Name "ActiveDirectory Copy Job" | Get-VBRJobScheduleOptions
This example shows how to look for the list of scheduling options of the ActiveDirectory Copy Job job.

Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRJobScheduleOptions cmdlet.
> Example 2. Looking for List of Options of Job Represented by Variable

$activedirectory_copy_job = Get-VBRJob -Name "ActiveDirectory Copy Job"
Get-VBRJobScheduleOptions -Job $activedirectory_copy_job
This example shows how to look for the list of options of the job represented by the $activedirectory_copy_job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $activedirectory_copy_job variable.
2. Run the Get-VBRJobScheduleOptions cmdlet. Set the $activedirectory_copy_job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the array of jobs.  The cmdlet will return scheduling options of these jobs.

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
Get-VBRJobScheduleOptions [-Job] <CBackupJob[]> [<CommonParameters>]
```
