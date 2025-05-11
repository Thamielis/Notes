Set-VBRLinuxScheduleOptions
---------------------------

### Synopsis
Modifies the schedule for backup policies for Linux computers.

---

### Description

This cmdlet modifies schedule settings for a backup policy that the Veeam Agent backup job applies to Linux computers.
IMPORTANT!
For Veeam Agent jobs that back up Linux servers use the Set-VBRServerScheduleOptions cmdlet.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

* [New-VBRMonthlyOptions](New-VBRMonthlyOptions)

* [New-VBRLinuxScheduleOptions](New-VBRLinuxScheduleOptions)

* [New-VBRDailyOptions](New-VBRDailyOptions)

---

### Examples
> Modifying Schedule for Veeam Agent Job for Linux Computers

$job = Get-VBRComputerBackupJob -Name "Linux_W_job"
$monthly = New-VBRMonthlyOptions -Period 3:00 -DayNumberInMonth OnDay -DayOfMonth 20
$options = New-VBRLinuxScheduleOptions -Type Monthly -EnableRetry -RetryCount 7 -RetryTimeout 15 -MonthlyOptions $monthly
$daily = New-VBRDailyOptions -DayOfWeek Wednesday -Period 17:00 -Type SelectedDays
Set-VBRLinuxScheduleOptions -Options $options -Type Daily -DailyOptions $daily -EnableRetry -RetryCount 2 -RetryTimeout 45
This example shows how to modify an existing schedule for a Veeam Agent job that backs up Linux computers.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRMonthlyOptions cmdlet. Specify the Period, DayNumberInMonth and DayOfMonth parameter values. Save the result to the $monthly variable.
3. Run the New-VBRLinuxScheduleOptions cmdlet. Specify the following settings:
- Set the Monthly value as the Type parameter value.
- Provide the EnableRetry parameter.
- Specify the RetryCount parameter value.
- Specify the RetryTimeout parameter value.
- Set the $monthly variable as the MonthlyOptions parameter value.
Save the result to the $options variable.
4. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek, Period and Type parameter values. Save the result to the $daily variable.
5. Run the Set-VBRLinuxScheduleOptions cmdlet. Specify the following settings:
- Set the $options variable as the Options parameter value.
- Set the Daily value as the Type parameter value.
- Set the $daily variable as the DailyOptions parameter value.
- Provide the EnableRetry parameter.
- Specify the RetryCount parameter value.
- Specify the RetryTimeout parameter value.

---

### Parameters
#### **DailyOptions**
For daily schedule.
Specifies daily schedule settings. The cmdlet will create the server schedule with these settings.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **EnableRetry**
Enables the option for the Veeam Agent for Linux to run the Veeam Agent backup job again in case it fails.

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
Specifies the Linux computers schedule settings that you want to modify.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[VBRLinuxScheduleOptions]`|true    |named   |True (ByValue)|

#### **PeriodicallyOptions**
For periodical schedule.
Specifies periodically schedule settings. The cmdlet will create the server schedule with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRPeriodicallyOptions]`|false   |named   |False        |

#### **RetryCount**
For the EnableRetry parameter.
Specifies the number of attempts to run the failed Veeam Agent backup job.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetryTimeout**
For the EnableRetry parameter.
Specifies a timeout interval between retry attempts in minutes.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Type**
Specifies the Veeam Agent backup job schedule type.
* Daily: use this option to run the job at a specific time daily.
* Monthly: use this option to run the job once a month on specific days.
* Periodically: use this option run the job repeatedly throughout a day with a specific time interval.
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
Veeam.Backup.PowerShell.Infos.VBRLinuxScheduleOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRLinuxScheduleOptions [-DailyOptions <VBRDailyOptions>] [-EnableRetry] [-MonthlyOptions <VBRMonthlyOptions>] -Options <VBRLinuxScheduleOptions> [-PeriodicallyOptions <VBRPeriodicallyOptions>] [-RetryCount 
```
```PowerShell
<Int32>] [-RetryTimeout <Int32>] [-Type {Daily | Monthly | Periodically | AfterJob | RunManually}] [<CommonParameters>]
```
