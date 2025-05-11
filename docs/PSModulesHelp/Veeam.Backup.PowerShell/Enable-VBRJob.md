Enable-VBRJob
-------------

### Synopsis
Enables a disabled job.

---

### Description

This cmdlet enables a disabled job.  When you disable a job, you put it on hold until you enable it with this cmdlet. You can run this cmdlet with backup, replication and copy jobs.

Run the Disable-VBRJob cmdlet to disable a job.

Run the Start-VBRJob cmdlet to start a job once.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Enabling Specific Jobs [Using Pipeline]

Get-VBRJob -Name "Backup Job 01", "Backup Job 02" | Enable-VBRJob
This example shows how to enable the Backup Job 01 and Backup Job 02 jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Enable-VBRJob cmdlet.
> Example 2. Enabling Specific Job [Using Variable]

$job = Get-VBRJob
Enable-VBRJob -Job $job
This example shows how to enable the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Enable-VBRJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the array of jobs you want to enable.

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
Enable-VBRJob -Job <CBackupJob[]> [<CommonParameters>]
```
