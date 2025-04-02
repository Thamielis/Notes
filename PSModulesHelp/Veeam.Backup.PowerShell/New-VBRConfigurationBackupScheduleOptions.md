New-VBRConfigurationBackupScheduleOptions
-----------------------------------------

### Synopsis
Creates a new VBRConfigurationBackupScheduleOptions object.

---

### Description

This cmdlet creates a new VBRConfigurationBackupScheduleOptions object.
This object contains schedule settings for configuration backup job. It is used then in the Set-VBRConfigurationBackupJob cmdlet.
If you run this cmdlet without parameters, it will create an object with default settings.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

* [New-VBRMonthlyOptions](New-VBRMonthlyOptions)

---

### Examples
> Example 1. Creating Object with Default Configuration Job Schedule Settings

```PowerShell
$defaultschedule = New-VBRConfigurationBackupScheduleOptions
This command creates an object with default configuration job schedule settings. The object is saved to the $defaultschedule variable.
```
> Example 2. Setting Daily Schedule for Configuration Backup Job

$daily = New-VBRDailyOptions -Period "05:00" -DayOfWeek Saturday
$dailyschedule = New-VBRConfigurationBackupScheduleOptions -Type Daily -DailyOptions $daily
This example shows how to set daily schedule for the configuration backup job. The job will run on 5 AM on Saturdays.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek and the Period parameter values. Save the result to the $daily variable.
2. Run the New-VBRConfigurationBackupScheduleOptions cmdlet. Set the Daily option for the Type parameter. Set the $daily variable as the DailyOptions parameter value. Save the result to the $dailyschedule variable.
> Example 3. Setting Monthly Schedule for Configuration Backup Job

$monthly = New-VBRMonthlyOptions -Period "00:00" -DayOfWeek Friday -DayNumberInMonth First
$monthlyschedule = New-VBRConfigurationBackupScheduleOptions -Type Monthly -MonthlyOptions $monthly
This example shows how to set monthly schedule for the configuration backup job. The job will run on 00:00 the first Friday of each month.
Perform the following steps:
1. Run the New-VBRMonthlyOptions cmdlet. Specify the Period, the DayOfWeek and the DayNumberInMonth parameter values. Save the result to the $monthly variable.
2. Run the New-VBRConfigurationBackupScheduleOptions cmdlet. Set the Monthly option for the Type parameter. Set the $monthly variable as the MonthlyOptions parameter value. Save the result to the $monthlyschedule variable.
> Example 4. Disabling Configuration Job Schedule

```PowerShell
$disableschedule = New-VBRConfigurationBackupScheduleOptions -Enable:$false
This command disables the configuration job schedule. The object is saved to the $disableschedule variable.
```

---

### Parameters
#### **DailyOptions**
For daily schedule. Specifies the daily schedule options.
Default: 10:00, everyday.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **Enable**
Defines that the job will run automatically on schedule.
If set to False, you will need to run the job manually.
Default: True.
Note: To disable the configuration job schedule, specify the $false value for the Enable parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MonthlyOptions**
For monthly schedule. Specifies the monthly schedule options.
Default: 22:00, Fourth Saturday, all months.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRMonthlyOptions]`|false   |named   |False        |

#### **Type**
Specifies the type of the schedule:
* Daily
* Monthly
Default: Daily.
Valid Values:

* Daily
* Monthly

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[VBRConfigurationBackupScheduleType]`|false   |named   |False        |

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
New-VBRConfigurationBackupScheduleOptions [-DailyOptions <VBRDailyOptions>] [-Enable] [-MonthlyOptions <VBRMonthlyOptions>] [-Type {Daily | Monthly}] [<CommonParameters>]
```
