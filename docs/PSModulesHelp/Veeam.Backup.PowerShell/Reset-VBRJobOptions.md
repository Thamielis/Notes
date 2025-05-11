Reset-VBRJobOptions
-------------------

### Synopsis
Applies default settings to jobs.

---

### Description

This cmdlet removes custom settings of a specified job and restores its default values. You can run this cmdlet with any kind of jobs.  The VSS settings (application-aware image processing and guest file system indexing) are not reset with this cmdlet.
Run the Reset-VBRJobVssOptions cmdlet to clear the job VSS settings.

Run the Disable-VBRJobVSSIntegration cmdlet or the Disable-VBRJobGuestFSIndexing cmdlet to temporarily disable the application-aware image processing and guest file system indexing settings.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Setting Default Settings to Backup Job [Using Pipeline]

Get-VBRJob -Name "Fileserver Backup Job 1", "Fileserver Backup Job 2" | Reset-VBRJobOptions
This example shows how to set default settings to backup jobs named Fileserver Backup Job 1 and Fileserver Backup Job 2.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Reset-VBRJobOptions cmdlet.
> Example 2. Setting Default Settings to Job [Using Variable]

$job = Get-VBRJob
Reset-VBRJobOptions -Job $job
This example shows how to set default settings to the job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the Reset-VBRJobOptions cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the job. The cmdlet will restore default settings of these jobs.

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
Reset-VBRJobOptions -Job <CBackupJob> [<CommonParameters>]
```
