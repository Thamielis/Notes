Enable-VSBJobSchedule
---------------------

### Synopsis
Enables a SureBackup job schedule.

---

### Description

This cmdlet enables a SureBackup job schedule. You can enable the job schedule in case the schedule is pre-configured for a selected job. You can enable the schedule that was was configured in a disabled state or that was disabled with Disable-VSBJobSchedule.

---

### Examples
> Example 1

---

### Parameters
#### **Job**
Specifies the job(s) you want to enable. You can assign multiple jobs to this object.

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
Enable-VSBJobSchedule [-Job <CSbJob[]>] [<CommonParameters>]
```
