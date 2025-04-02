Enable-VBRJobGuestFSIndexing
----------------------------

### Synopsis
Enables job guest file system indexing option.

---

### Description

This cmdlet enables guest file system indexing in the selected job. You can enable the guest file system indexing settings in case you have these settings set beforehand.

You can run this cmdlet with backup and replica jobs including vCloud jobs.
Run the Disable-VBRJobGuestFSIndexing cmdlet to disable the guest file system indexing option.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Enabling Guest File System Indexing Option [Using Pipeline]

Get-VBRJob -Name "Backup Job 01", "Backup Job 02" | Enable-VBRJobGuestFSIndexing
This example shows how to enable the guest file system indexing option in the Backup Job 01 and Backup Job 02 jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Enable-VBRJobGuestFSIndexing cmdlet.
> Example 2. Enabling Guest File System Indexing Option [Using Variable]

$job = Get-VBRJob -Name "Backup Job 01"
Enable-VBRJobGuestFSIndexing -Job $job
This example shows how to enable the guest file system indexing option in the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Enable-VBRJobGuestFSIndexing cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the array of jobs. The cmdlet will enable guest file system indexing for these jobs.

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
Enable-VBRJobGuestFSIndexing [-Job] <CBackupJob[]> [<CommonParameters>]
```
