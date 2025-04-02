Set-VBRJobScheduleOptions
-------------------------

### Synopsis
Applies customized job scheduling settings to a selected backup, replication or copy job.

---

### Description

This cmdlet applies customized scheduling options to a selected backup, replication or copy job.

To customize the scheduling options you need to first run the New-VBRJobScheduleOptions cmdlet. New-VBRJobScheduleOptions returns the ScheduleOptions object containing the set of default scheduling options.

Run Set-VSBJobScheduleOptions to set scheduling options to SureBackup job.

---

### Examples
> Example 1

Get-VBRJob -Name "DC Backup", "DC File Copy" | Set-VBRJobScheduleOptions -Options $ScheduleOptions
This command applies the customized scheduling options to the jobs named "DC Backup" and "DC File Copy".

- The jobs are obtained with Get-VBRJob and piped down.

- The options to apply are set to the $ScheduleOptions variable beforehand by running New-VBRJobScheduleOptions.
> Example 2

Set-VBRJobScheduleOptions -Job $job -Options $ScheduleOptions
This command applies the customized scheduling options to the job represented by the $job variable.

- The job is obtained with Get-VBRJob and assigned to the variable beforehand.

- The options to apply are set to the $ScheduleOptions variable beforehand by running New-VBRJobScheduleOptions.
> Example 3

$newschedule = New-VBRJobScheduleOptions

$newschedule.OptionsPeriodically.Enabled = $true

$newschedule.OptionsPeriodically.FullPeriod = 120

$newschedule.OptionsDaily.Enabled = $false

$job = Get-VBRJob -Name "Backup Job 1"

Set-VBRJobScheduleOptions -Job $job -Options $newschedule
This example shows how to schedule the backup job to run repeatedly throughout a day with the time interval of 2 hours.

1. Run New-VBRJobScheduleOptions to get the new job schedule settings object. Save the result to the $newschedule variable.   2. Set the OptionsPeriodically property of the $newschedule variable to the $true value to run the job repeatedly.   3. Specify the value for the OptionsPeriodically property in minutes to set the time interval for the job runs.   4. Set the OptionsDaily property of the $newschedule variable to the $false value to disable the daily schedule option.   5. Run Get-VBRJob to get the job whose schedule settings you want to modify. Save the result to the $job variable.   6. Run Set-VBRJobScheduleOptions with the $job and $newschedule variables to apply the new schedule settings to the job.

---

### Parameters
#### **Job**
Specifies the job for which you want to change the scheduling options. You can assign multiple jobs to this object.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Options**
Specifies the custom scheduling options. Accepts the ScheduleOptions object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ScheduleOptions]`|true    |1       |False        |

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
Set-VBRJobScheduleOptions [-Job] <CBackupJob[]> [-Options] <ScheduleOptions> [<CommonParameters>]
```
