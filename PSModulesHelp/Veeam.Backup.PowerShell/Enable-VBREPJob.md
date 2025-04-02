Enable-VBREPJob
---------------

### Synopsis
Enables disabled backup jobs run by Veeam Agent operating in a standalone mode.

---

### Description

This cmdlet enables backup jobs run by Veeam Agent operating in a standalone mode that were previously disabled.
Run the Disable-VBREPJob cmdlet to disable a job.

---

### Related Links
* [Get-VBREPJob](Get-VBREPJob)

---

### Examples
> Example 1. Enabling Backup Job Run by Veeam Agent in Standalone Mode [Using Variable]

$job = Get-VBREPJob -Name "Backup Job Mediaserver"
Enable-VBREPJob -Job $job
This example shows how to enable a backup job run by Veeam Agent operating in a standalone mode using a variable.
Perform the following steps:
1. Run the Get-VBREPJob cmdlet. Specify the Name parameter value. Save it to the $job variable.
2. Run the Enable-VBREPJob cmdlet. Set the $job variable as the Job parameter value.
> Example 2. Enabling Backup Job Run by Veeam Agent in Standalone Mode [Using Pipeline]

Get-VBREPJob -Name "Backup Job Mediaserver" | Enable-VBREPJob
This example shows how to enable a backup job run by Veeam Agent operating in a standalone mode using a pipeline.
Perform the following steps:
1. Run the Get-VBREPJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Enable-VBREPJob cmdlet.

---

### Parameters
#### **Job**
Specifies the array of backup jobs. The cmdlet will enable these jobs.

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
Enable-VBREPJob -Job <VBREPJob[]> [<CommonParameters>]
```
