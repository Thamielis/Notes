New-VBRJobScheduleOptions
-------------------------

### Synopsis
Creates new job schedule options.

---

### Description

This cmdlet creates an object containing default job scheduling settings. You can edit any setting that you want to apply to a job.

Run Set-VBRJobScheduleOptions to apply the schedule to a job.

You can set schedule for backup, replication or copy jobs.

---

### Examples
> Example 1

```PowerShell
$newschedule = New-VBRJobScheduleOptions
This command defines default schedule settings for a job.
```
> Example 2

$newschedule = New-VBRJobScheduleOptions
$newschedule.OptionsPeriodically.Enabled = $true
$newschedule.OptionsPeriodically.FullPeriod = 120
$newschedule.OptionsDaily.Enabled = $false
This example shows how to define schedule settings for a job. The job will run with the following schedule settings:

· The job will run repeatedly during a day   · The job will run every 120 minutes

You must perform the following steps:

1. Run New-VBRJobScheduleOptions to schedule settings for a job. Save the result to the $newschedule variable.   2. Set the OptionsPeriodically property of the $newschedule variable to the $true value to run the job repeatedly.   3. Specify the value for the OptionsPeriodically property in minutes to set the time interval for the job runs.   4. Set the OptionsDaily property of the $newschedule variable to the $false value to disable the daily schedule option.

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRJobScheduleOptions [<CommonParameters>]
```
