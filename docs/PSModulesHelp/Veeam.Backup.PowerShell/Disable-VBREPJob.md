Disable-VBREPJob
----------------

### Synopsis
Disables backup jobs run by Veeam Agent operating in a standalone mode.

---

### Description

This cmdlet disables backup jobs run by Veeam Agent operating in a standalone mode.
When you disable a job, you temporarily put it on hold. The job and its settings are not deleted from Veeam Backup & Replication.
Run the Enable-VBREPJob cmdlet to enable a disabled job.

---

### Related Links
* [Get-VBREPJob](Get-VBREPJob)

---

### Examples
> Example 1. Disabling Backup Job Run by Veeam Agent in Standalone Mode [Using Variable]

$job = Get-VBREPJob -Name "Backup Job Mediaserver"
Disable-VBREPJob -Job $job
This example shows how to disable a backup job run by Veeam Agent operating in a standalone mode using a variable.
Perform the following steps:
1. Run the Get-VBREPJob cmdlet. Specify the Name parameter value. Save it to the $job variable.
2. Run the Disable-VBREPJob cmdlet. Set the $job variable as the Job parameter value.
> Example 2. Disabling Backup Job Run by Veeam Agent in Standalone Mode [Using Pipeline]

Get-VBREPJob -Name "Backup Job Mediaserver" | Disable-VBREPJob
This example shows how to disable a backup job run by Veeam Agent operating in a standalone mode using a pipeline.
Perform the following steps:
1. Run the Get-VBREPJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Disable-VBREPJob cmdlet.

---

### Parameters
#### **Job**
Specifies the array of backup jobs. The cmdlet will disable these jobs.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[VBREPJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBREPJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBREPJob -Job <VBREPJob[]> [<CommonParameters>]
```
