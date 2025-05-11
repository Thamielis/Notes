Enable-VBRPluginJob
-------------------

### Synopsis
Starts plug-in backup jobs and plug-in backup copy jobs.

---

### Description

This cmdlet starts plug-in backup jobs and plug-in backup copy jobs.
Run the Disable-VBRPluginJob cmdlet to stop plug-in backup jobs and plug-in backup copy jobs.

---

### Related Links
* [Get-VBRPluginJob](Get-VBRPluginJob)

---

### Examples
> Starting All Plug-in Backup Jobs and Plug-in Backup Copy Jobs

$job = Get-VBRPluginJob -Name "Plug-in backup 17"
Enable-VBRPluginJob -Job $job
This example shows how to start plug-in backup jobs and plug-in backup copy jobs.
Perform the following steps:
1. Run the Get-VBRPluginJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Enable-VBRPluginJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of plug-in backup jobs and plug-in backup copy jobs. The cmdlet will start these jobs. Accepts the VBRPluginJob[] object.  To get this object, run the Get-VBRPluginJob cmdlet.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[VBRPluginJob[]]`|true    |0       |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRPluginJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRPluginJob [-Job] <VBRPluginJob[]> [<CommonParameters>]
```
