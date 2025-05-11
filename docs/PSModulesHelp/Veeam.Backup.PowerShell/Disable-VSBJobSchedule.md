Disable-VSBJobSchedule
----------------------

### Synopsis
Disables a selected SureBackup job schedule.

---

### Description

This cmdlet disables a selected SureBackup job schedule. The schedule settings are not deleted. When you disable a job schedule, you can launch the job manually by running Start-VSBJob.

---

### Examples
> Example 1

---

### Parameters
#### **Job**
Specifies the job. The cmdlet will disable the schedule of this job. You can assign multiple backup jobs to this object.

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
Disable-VSBJobSchedule [-Job <CSbJob[]>] [<CommonParameters>]
```
