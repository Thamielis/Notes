Disable-VBRJobGuestFSIndexing
-----------------------------

### Synopsis
Disables job guest file system indexing option.

---

### Description

This cmdlet disables guest file system indexing in the selected job. The guest file system indexing settings are not deleted.

You can run this cmdlet with backup and replication jobs.

Run the Enable-VBRJobGuestFSIndexing cmdlet to enable the guest file system indexing option.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Disabling Guest File System Indexing Option [Using Pipeline]

Get-VBRJob -Name "Backup Job 01", "Backup Job 02" | Disable-VBRJobGuestFSIndexing
This example shows how to disable the guest file system indexing option in Backup Job 01 and Backup Job 02 jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Disable-VBRJobGuestFSIndexing cmdlet.
> Example 2. Disabling Guest File System Indexing Option [Using Variable]

$job = Get-VBRJob -Name "Backup Job 01"
Disable-VBRJobGuestFSIndexing -Job $job
This example shows how to disable the guest file system indexing option in the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Disable-VBRJobGuestFSIndexing cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the array of jobs. The cmdlet will disable guest file system indexing for these jobs.

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
Disable-VBRJobGuestFSIndexing [-Job] <CBackupJob[]> [<CommonParameters>]
```
