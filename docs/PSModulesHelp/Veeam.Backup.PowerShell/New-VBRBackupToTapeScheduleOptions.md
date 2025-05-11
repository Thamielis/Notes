New-VBRBackupToTapeScheduleOptions
----------------------------------

### Synopsis
Creates schedule settings for backup to tape job.

---

### Description

This cmdlet creates the VBRBackupToTapeScheduleOptions object.

The object contains schedule settings for backup to tape job and is used further to apply these settings to an existing backup to tape job.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

* [New-VBRMonthlyOptions](New-VBRMonthlyOptions)

* [New-VBRBackupWindowOptions](New-VBRBackupWindowOptions)

* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example - Creating Tape Job Schedule

$dailyoptions = New-VBRDailyOptions -DayOfWeek Friday -Period 23:00
$scheduleoptions = New-VBRBackupToTapeScheduleOptions -DailyOptions $dailyoptions -Enabled
This example shows how to create a tape job schedule with the following settings:
- The job runs every Friday.
- The job starts at 23:00.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Set Friday as the DayOfWeek parameter value and 23:00 as the Period parameter value. Save the result to the $dailyoptions variable.
2. Run the New-VBRBackupToTapeScheduleOptions cmdlet. Set the $dailyoptions variable as the DailyOptions parameter value. Save the schedule to the $scheduleoptions variable for future use.

---

### Parameters
#### **BackupWindowOptions**
Specifies backup windows: the tape job will run within the specified time interval. Accepts the VBRBackupWindowOptions object. The following settings are used by default:  From Sunday to Saturday, from 00:00 to 23:00, Enabled: True.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **DailyOptions**
Used to set days for the Type parameter (Daily option). Accepts the VBRDailyOptions object. The following settings are used by default:  Type: SelectedDays, Period: 18:00, DayOfWeek: Saturday

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **Enabled**
Defines if this schedule is enabled. Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the source backup job after which the tape job must run. Accepts the CBackupJob or the VBRJob objects. To get this object, run the Get-VBRJob cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[VBRJob]`|false   |named   |False        |

#### **MonthlyOptions**
Used to set months for the Type parameter (Monthly option). Accepts the VBRMonthlyOptions object. The following settings are used by default:
* Period: 22:00
* DayNumberInMonth: Fourth
* DayOfWeek: Saturday
* Months: January, February, March, April, May, June, July, August, September, October, November, December.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRMonthlyOptions]`|false   |named   |False        |

#### **Type**
Specifies the job schedule type:
* AfterJob: the tape job will wait for the source backup job to complete.
* AfterNewBackup: the tape job will periodically check the source jobs for new backups and archive new backups to tape.
* Daily: the tape job will run on selected days. Use the DailyOptions parameter to set the days.
* Monthly: the tape job will run on selected months. Use the MonthlyOptions parameter to set the months.
By default, the tape job runs daily.
Valid Values:

* AfterJob
* AfterNewBackup
* Daily
* Monthly

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRBackupToTapePolicyType]`|false   |named   |False        |

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
New-VBRBackupToTapeScheduleOptions [-BackupWindowOptions <VBRBackupWindowOptions>] [-DailyOptions <VBRDailyOptions>] [-Enabled] [-Job <VBRJob>] [-MonthlyOptions <VBRMonthlyOptions>] [-Type {AfterJob | 
```
```PowerShell
AfterNewBackup | Daily | Monthly}] [<CommonParameters>]
```
