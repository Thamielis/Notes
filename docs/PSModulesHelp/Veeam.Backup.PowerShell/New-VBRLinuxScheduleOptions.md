New-VBRLinuxScheduleOptions
---------------------------

### Synopsis
Creates the schedule for backup policies for Linux computers.

---

### Description

This cmdlet creates the VBRLinuxScheduleOptions object. This object contains schedule settings for a backup policy that the Veeam Agent backup job applies to Linux computers.
Note: For Veeam Agent jobs that back up Linux servers use the New-VBRServerScheduleOptions cmdlet.

---

### Related Links
* [New-VBRMonthlyOptions](New-VBRMonthlyOptions)

---

### Examples
> Creating Monthly Schedule for Veeam Agent Job for Linux Computers

$monthly = New-VBRMonthlyOptions -Period 3:00 -DayNumberInMonth OnDay -DayOfMonth 20
New-VBRLinuxScheduleOptions -Type Monthly -EnableRetry -RetryCount 7 -RetryTimeout 15 -MonthlyOptions $monthly
This example shows how to create a monthly schedule for a Veeam Agent job that backs up Linux computers. The job will run monthly at 3:00 AM on the first Sunday.
Perform the following steps:
1. Run the New-VBRMonthlyOptions cmdlet. Specify the Period, DayNumberInMonth and DayOfMonth parameter values. Save the result to the $monthly variable.
2. Run the New-VBRLinuxScheduleOptions cmdlet. Specify the following settings:
- Set the Monthly option for the Type parameter.
- Provide the EnableRetry parameter.
- Specify the RetryCount parameter value.
- Specify the RetryTimeout parameter value.
- Set the $monthly variable as the MonthlyOptions parameter value.

---

### Parameters
#### **DailyOptions**
For daily schedule.
Specifies daily schedule settings. The cmdlet will create the server schedule with these settings.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **EnableRetry**
Enables the option for the Veeam Agent for Linux to try to run the Veeam Agent backup job in case it fails.

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
For periodical schedule.
Specifies periodically schedule settings. The cmdlet will create the server schedule with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRPeriodicallyOptions]`|false   |named   |False        |

#### **RetryCount**
For the EnableRetry parameter.
Specifies the number of attempts to run the failed Veeam Agent backup job.
Default: 3.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetryTimeout**
For the EnableRetry parameter.
Specifies a timeout interval between retry attempts in minutes.
Default: 30.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Type**
Specifies the Veeam Agent backup job schedule type.
* Daily: use this option to run the job at a specific time daily.
* Monthly: use this option to run the job once a month on specific days.
* Periodically: use this option to run the job repeatedly throughout a day with a specific time interval.
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
New-VBRLinuxScheduleOptions [-DailyOptions <VBRDailyOptions>] [-EnableRetry] [-MonthlyOptions <VBRMonthlyOptions>] [-PeriodicallyOptions <VBRPeriodicallyOptions>] [-RetryCount <Int32>] [-RetryTimeout <Int32>] 
```
```PowerShell
-Type {Daily | Monthly | Periodically | AfterJob | RunManually} [<CommonParameters>]
```
