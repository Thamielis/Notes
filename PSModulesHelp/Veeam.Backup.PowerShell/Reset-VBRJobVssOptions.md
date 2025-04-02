Reset-VBRJobVssOptions
----------------------

### Synopsis
Sets job VSS settings to default.

---

### Description

This cmdlet clears the custom VSS settings of the specified job and restores their default values.
You can run this cmdlet with any kind of jobs.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Setting Default VSS Settings to Job [Using Pipeline]

Get-VBRJob -Name "Fileserver Backup Job 1", "Fileserver Backup Job 2" | Reset-VBRJobVssOptions
This example shows how to set default VSS settings to Fileserver Backup Job 1 and Fileserver Backup Job 2 backup jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Reset-VBRJobVssOptions cmdlet.
> Example 2. Setting Default VSS Settings to Job [Using Variable]

$job = Get-VBRJob -Name "Fileserver Backup Job 1"
Reset-VBRJobVssOptions -Job $job
This example shows how to set default VSS settings to the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Reset-VBRJobVssOptions cmdlet. Set the $job variable as the Job parameter value.

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
Reset-VBRJobVssOptions -Job <CBackupJob> [<CommonParameters>]
```
