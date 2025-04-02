Set-VSBJobScheduleOptions
-------------------------

### Synopsis
Applies customized job scheduling options to a selected SureBackup job.

---

### Description

This cmdlet applies customized scheduling options to a selected SureBackup job.

To customize the scheduling options you need to first run the New-VBRJobScheduleOptions cmdlet. New-VBRJobScheduleOptions returns the ScheduleOptions object containing the set of default scheduling options. You can customize any of these options and apply further to any kind of jobs.

Run Set-VBRJobScheduleOptions to set scheduling options of backup, replication or copy job.

---

### Examples
> Example 1

Get-VSBJob -Name "SharePoint SureJob", "MailServer SureJob" | Set-VSBJobScheduleOptions -Options $"Schedule Options"
This command applies the customized scheduling options to the SureBackup jobs named "SharePoint SureJob" and "MailServer SureJob".

- The jobs are obtained with Get-VSBJob and piped down.

- The options to apply are set to the $"Schedule Options" variable beforehand by running New-VBRJobScheduleOptions.
> Example 2

Set-VSBJobScheduleOptions -Job $SureJob -Options $"Schedule Options"
This command applies the customized scheduling options to the SureBackup job represented by the $SureJob variable.

- The job object is obtained with Get-VSBJob and assigned to the variable beforehand.

- The options to apply are set to the $"Schedule Options" variable beforehand by running New-VBRJobScheduleOptions.

---

### Parameters
#### **Job**
Specifies the SureBackup job for which you want to change the scheduling options. You can assign multiple SureBackup jobs to this object.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[CSbJob]`|false   |0       |True (ByPropertyName, ByValue)|

#### **Options**
Specifies the custom scheduling options. Accepts ScheduleOptions object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ScheduleOptions]`|false   |1       |False        |

---

### Inputs
Veeam.Backup.Core.SureBackup.CSbJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VSBJobScheduleOptions [[-Job] <CSbJob>] [[-Options] <ScheduleOptions>] [<CommonParameters>]
```
