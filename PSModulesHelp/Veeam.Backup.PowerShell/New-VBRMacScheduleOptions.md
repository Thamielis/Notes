New-VBRMacScheduleOptions
-------------------------

### Synopsis
Defines the schedule for macOS jobs.

---

### Description

This cmdlet creates the VBRMacScheduleOptions object. This object defines schedule for macOS jobs.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

---

### Examples
> Defining Schedule for MacOS Jobs

$daily = New-VBRDailyOptions -DayOfWeek Friday -Period 7:00
$macschedule = New-VBRMacScheduleOptions -Type Daily -DailyOptions $daily
This example shows how to define schedule for MacOS jobs. The job will run on Fridays at 7:00 PM.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek and Period parameter values. Save the result to the $daily variable.
2. Run the New-VBRMacScheduleOptions cmdlet. Set the Daily value as the Type parameter value. Set the $daily variable as the DailyOptions parameter value. Save the result to the $macschedule variable to be used with other cmdlets.

---

### Parameters
#### **DailyOptions**
For daily schedule.
Specifies daily schedule settings. The cmdlet will create the server schedule with these settings.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **EnableRetry**
Enables the option to run a macOS job again in case it fails.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MonthlyOptions**
For monthly schedule.
Specifies monthly schedule settings. The cmdlet will create the server schedule with these settings.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRMonthlyOptions]`|false   |named   |False        |

#### **PeriodicallyOptions**
For periodical run.
Specifies periodical schedule settings. The cmdlet will create the server schedule with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRPeriodicallyOptions]`|false   |named   |False        |

#### **RetryCount**
For the EnableRetry parameter.
Specifies the number of attempts to run the failed macOS backup job.
Default: 3.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetryTimeout**
For the EnableRetry parameter.
Specifies the time interval between retry attempts in minutes.
Default: 30.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Type**
Specifies the macOS schedule type.
* Daily: use this option to run the job at a specific time daily.
* Monthly: use this option to run the job once a month on specific days.
* Periodically: use this option to run the job repeatedly throughout a day with a specific time interval.
* AfterJob: use this option to create a chain of jobs. Veeam Backup & Replication will start the macOS job after the other backup job.
Note: The AfterJob option does not work for backup policy.
Valid Values:

* Daily
* Monthly
* Periodically
* AfterJob
* RunManually

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRServerScheduleType]`|true    |named   |False        |

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
New-VBRMacScheduleOptions [-DailyOptions <VBRDailyOptions>] [-EnableRetry] [-MonthlyOptions <VBRMonthlyOptions>] [-PeriodicallyOptions <VBRPeriodicallyOptions>] [-RetryCount <Int32>] [-RetryTimeout <Int32>] 
```
```PowerShell
-Type {Daily | Monthly | Periodically | AfterJob | RunManually} [<CommonParameters>]
```
