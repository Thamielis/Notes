Enable-VSBJob
-------------

### Synopsis
Enables a disabled SureBackup job.

---

### Description

This cmdlet enables a disabled SureBackup job. When you disable a job, you put it on hold until you enable it with this cmdlet. You can disable a job by running Disable-VSBJob. Run Start-VSBJob to run a disabled job once.

---

### Examples
> Example 1

---

### Parameters
#### **Job**
Specifies the job. The cmdlet will enable schedule for this job. You can assign multiple jobs to this object.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[CSbJob[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.SureBackup.CSbJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VSBJob [-Job <CSbJob[]>] [<CommonParameters>]
```
