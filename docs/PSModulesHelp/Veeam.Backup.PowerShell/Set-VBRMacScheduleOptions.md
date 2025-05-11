Set-VBRMacScheduleOptions
-------------------------

### Synopsis
Modifies schedule for macOS jobs.

---

### Description

This cmdlet modifies schedule for macOS jobs, created with Veeam Agent for Oracle Solaris or Veeam Agent for IBM AIX.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

* [New-VBRMacScheduleOptions](New-VBRMacScheduleOptions)

* [New-VBRDailyOptions](New-VBRDailyOptions)

---

### Examples
> Defining Schedule for MacOS Jobs

$daily = New-VBRDailyOptions -DayOfWeek Friday -Period 7:00
$macschedule = New-VBRMacScheduleOptions -Type Daily -DailyOptions $daily
$newdaily = New-VBRDailyOptions -DayOfWeek Wednesday -Period 7:00
Set-VBRMacScheduleOptions -Options $macschedule -DailyOptions $newdaily
This example shows how to modify schedule for macOS jobs. The job schedule will be set to run on Wednesday instead of Fridays.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek and Period parameter values. Save the result to the $daily variable.
2. Run the New-VBRMacScheduleOptions cmdlet. Set the Daily option for the Type parameter. Set the $daily variable as the DailyOptions parameter value. Save the result to the $macschedule variable.
3. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek and Period parameter values. Save the result to the $newdaily variable.
4. Run the Set-VBRMacScheduleOptions cmdlet. Set the $macschedule variable as the Options parameter value. Set the $newdaily variable as the DailyOptions parameter value.

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

#### **Options**
Specifies schedule settings for macOS jobs that you want to modify.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRMacScheduleOptions]`|true    |named   |True (ByValue)|

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
|`[VBRServerScheduleType]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRMacScheduleOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRMacScheduleOptions [-DailyOptions <VBRDailyOptions>] [-EnableRetry] [-MonthlyOptions <VBRMonthlyOptions>] -Options <VBRMacScheduleOptions> [-PeriodicallyOptions <VBRPeriodicallyOptions>] [-RetryCount 
```
```PowerShell
<Int32>] [-RetryTimeout <Int32>] [-Type {Daily | Monthly | Periodically | AfterJob | RunManually}] [<CommonParameters>]
```
