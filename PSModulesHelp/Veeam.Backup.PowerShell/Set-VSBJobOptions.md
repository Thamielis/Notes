Set-VSBJobOptions
-----------------

### Synopsis
Applies custom SureBackup job options.

---

### Description

This cmdlet applies customized job options to SureBackup jobs.

To customize the SureBackup job options you need to first run the New-VSBJobOptions cmdlet. New-VSBJobOptions returns the CDRJobOptionsobject containing the set of default SureBackup job options. You can customize any of these options and apply further to a SureBackup job.

Run Set-VBRJobOptions to edit job options of backup, replication or copy job.

---

### Examples
> Example 1

```PowerShell
Get-VBRJob -Name "SureBackup Job 01" | Set-VSBJobOptions -Options $"Sure Options"
This command applies the customized options to the SUreBackup job named "SureBackup Job 01". The job object is obtained with Get-VSBJob and piped down. The options to apply are set to the $"Sure Options" variable beforehand by running New-VSBJobOptions.
```
> Example 2

```PowerShell
Set-VBRJobScheduleOptions -Job $SureJob -Options $"Sure Options"
This command applies the customized job options to the SureBackup job represented by the $SureJob variable. The job is obtained with Get-VSBJob and assigned to the variable beforehand. The options to apply are set to the $"Sure Options" variable beforehand by running New-VSBJobOptions.
```

---

### Parameters
#### **Job**
Specifies the SureBackup job for which you want to customize the job options. You can assign multiple jobs to this object.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[CSbJob]`|false   |0       |True (ByPropertyName, ByValue)|

#### **Options**
Specifies the custom SureBackup job options. Accepts CDRJobOptions object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CDRJobOptions]`|false   |1       |False        |

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
Set-VSBJobOptions [[-Job] <CSbJob>] [[-Options] <CDRJobOptions>] [<CommonParameters>]
```
