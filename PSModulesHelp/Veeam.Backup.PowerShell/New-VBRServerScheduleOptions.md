New-VBRServerScheduleOptions
----------------------------

### Synopsis
Creates the schedule for jobs.

---

### Description

This cmdlet creates the VBRServerScheduleOptions object. This object contains schedule settings for backup jobs.
You can use this cmdlet to create a schedule for the following types of jobs:
- Veeam Agent jobs that back up Linux servers.
- Veeam Agent jobs that back up failover clusters.
- Veeam Agent jobs that back up Windows servers.
- The backup policy that the Veeam Agent job applies to Windows servers.
- File backup jobs.
- VDC replica jobs.
- Application backup policies.
NOTE:
- For Veeam Agent jobs that back up Linux workstations, use the New-VBRLinuxScheduleOptions cmdlet.
- For the backup policy that Veeam Agent job applies to Windows workstations, use the New-VBRWindowsWorkstationScheduleOptions cmdlet.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

---

### Examples
> Creating Server Schedule for Veeam Agent Backup Job

$daily = New-VBRDailyOptions -DayOfWeek Friday -Period 7:00
New-VBRServerScheduleOptions -Type Daily -DailyOptions $daily
This example shows how to create the server schedule for a Veeam Agent backup job. The job will run on Fridays at 7:00 PM.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek and Period parameter values. Save the result to the $daily variable.
2. Run the New-VBRServerScheduleOptions cmdlet. Set the Daily value as the Type parameter value. Set the $daily variable as the DailyOptions parameter value.

---

### Parameters
#### **DailyOptions**
For daily schedule.
Specifies daily schedule settings. The cmdlet will create the server schedule with these settings.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **EnableBackupTerminationWindow**
Enables the option to stop the Veeam Agent backup job if it exceeds the backup window.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableRetry**
Enables the option to run the Veeam Agent backup job again in case it fails.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
For running after a job.
Specifies the name of the backup job after which Veeam Backup & Replication will run Veeam Agent backup jobs. The cmdlet will create the server schedule with these settings.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CBackupJob]`|false   |named   |False        |

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
Specifies the number of attempts to run the failed Veeam Agent backup job.
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

#### **TerminationWindow**
Specifies the time interval within which the backup job must complete. The cmdlet will create the Veeam Agent backup job with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Type**
Specifies the backup job schedule type.
* Daily: use this option to run the job at a specific time daily.
* Monthly: use this option to run the job once a month on specific days.
* Periodically: use this option to run the job repeatedly throughout a day with a specific time interval.
* AfterJob: use this option to create a chain of jobs. Veeam Backup & Replication will start the Veeam Agent backup job after the other backup job.
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
New-VBRServerScheduleOptions [-DailyOptions <VBRDailyOptions>] [-EnableBackupTerminationWindow] [-EnableRetry] [-Job <CBackupJob>] [-MonthlyOptions <VBRMonthlyOptions>] [-PeriodicallyOptions 
```
```PowerShell
<VBRPeriodicallyOptions>] [-RetryCount <Int32>] [-RetryTimeout <Int32>] [-TerminationWindow <VBRBackupWindowOptions>] -Type {Daily | Monthly | Periodically | AfterJob | RunManually} [<CommonParameters>]
```
