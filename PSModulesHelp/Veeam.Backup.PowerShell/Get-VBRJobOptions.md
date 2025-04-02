Get-VBRJobOptions
-----------------

### Synopsis
Returns job settings.

---

### Description

This cmdlet returns job settings for a selected job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRJobObject](Get-VBRJobObject)

---

### Examples
> Example 1. Looking for List of Options of the Specific Job [Using Pipeline]

Get-VBRJob -Name "Fileserver Replica" | Get-VBRJobOptions
This example shows how to look for the list of options of the Fileserver Replica job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRJobOptions cmdlet.
> Example 2. Looking for List of Options of Job [Using Variable]

$fileserver_replica_job = Get-VBRJobObject -Name "Fileserver Replica"
Get-VBRJobOptions -Job $fileserver_replica_job
This example shows how to look for the list of options of the Fileserver Replica job.
Perform the following steps:
1. Run the Get-VBRJobObject cmdlet. Specify the Name parameter value. Save the result to the $fileserver_replica_job variable.
2. Run the Get-VBRJobOptions cmdlet. Set the $fileserver_replica_job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies the job. The cmdlet will return settings of this job.

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
Get-VBRJobOptions [-Job] <CBackupJob[]> [<CommonParameters>]
```
