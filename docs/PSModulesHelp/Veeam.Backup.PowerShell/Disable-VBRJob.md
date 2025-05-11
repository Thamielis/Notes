Disable-VBRJob
--------------

### Synopsis
Puts a selected job on hold.

---

### Description

This cmdlet disables an enabled job. The job and its settings are not deleted from Veeam Backup & Replication. You can run this cmdlet with backup, replication and copy jobs.

Run the Enable-VBRJob cmdlet to enable the job.

Run the Stop-VBRJob cmdlet to stop the job once without disabling it.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Disabling Specific Jobs [Using Pipeline]

Get-VBRJob -Name "Backup Job 01", "Backup Job 02" | Disable-VBRJob
This example shows how to disable jobs named Backup Job 01 and Backup Job 02.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Disable-VBRJob cmdlet.
> Example 2. Disabling Specific Job [Using Variable]

$job = Get-VBRJob
Disable-VBRJob -Job $job
This example shows how to disable the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Disable-VBRJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the array of jobs you want to disable.

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
Disable-VBRJob -Job <CBackupJob[]> [<CommonParameters>]
```
