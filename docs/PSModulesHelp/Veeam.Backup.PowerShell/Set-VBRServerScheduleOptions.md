Set-VBRServerScheduleOptions
----------------------------

### Synopsis
Modifies the schedule for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies schedule settings for the following types of jobs:
- Veeam Agent jobs that back up Linux servers.
- Veeam Agent jobs that back up failover clusters.
- Veeam Agent jobs that back up Windows servers.
- The backup policy that Veeam Agent job applies to Windows servers.
For Veeam Agent jobs that back up Linux workstations, use the New-VBRLinuxScheduleOptions cmdlet.
For the backup policy that Veeam Agent jobs applies to Windows workstations, use the New-VBRWindowsWorkstationScheduleOptions cmdlet.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

* [New-VBRServerScheduleOptions](New-VBRServerScheduleOptions)

* [New-VBRPeriodicallyOptions](New-VBRPeriodicallyOptions)

* [New-VBRBackupWindowOptions](New-VBRBackupWindowOptions)

---

### Examples
> Modifying Schedule for Veeam Agent Backup Job

$job = Get-VBRComputerBackupJob -Name "BackupJob"
$options = New-VBRServerScheduleOptions -Type Daily -DailyOptions $daily
$period = New-VBRPeriodicallyOptions -FullPeriod 12 -PeriodicallyKind Hours
$termination = New-VBRBackupWindowOptions -FromDay Friday -FromHour 17 -ToDay Monday -ToHour 8
Set-VBRServerScheduleOptions -Options $options -Type Periodically -PeriodicallyOptions $period -EnableBackupTerminationWindow -TerminationWindow $termination
This example shows how to modify an existing schedule for a Veeam Agent backup job.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRServerScheduleOptions cmdlet. Set the Daily value as the Type parameter value. Set the $daily variable as the DailyOptions parameter value. Save the result to the $options variable.
3. Run the New-VBRPeriodicallyOptions cmdlet. Specify the FullPeriod and PeriodicallyKind parameter values. Save the result to the $period variable.
4. Run the New-VBRBackupWindowOptions cmdlet. Specify the FromDay, FromHour, ToDay and ToHour parameter values. Save the result to the $termination variable.
5. Run the Set-VBRServerScheduleOptions cmdlet. Specify the following settings:
- Set the $options variable as the Options parameter value.
- Set the Periodically option for the Type parameter.
- Set the $period variable as the PeriodicallyOptions parameter value.
- Provide the EnableBackupTerminationWindow parameter.
- Set the $termination variable as the TerminationWindow parameter value.

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

#### **Options**
Specifies the server schedule settings that you want to modify.

|Type                        |Required|Position|PipelineInput |
|----------------------------|--------|--------|--------------|
|`[VBRServerScheduleOptions]`|true    |named   |True (ByValue)|

#### **PeriodicallyOptions**
For periodical run.
Specifies periodical schedule settings. The cmdlet will create the server schedule with these settings.

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
Specifies the time interval between retry attempts in minutes.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **TerminationWindow**
Specifies the time interval within which the backup job must complete. The cmdlet will create the Veeam Agent backup job with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Type**
Specifies the Veeam Agent backup job schedule type.
* Daily: use this option to run the job at a specific time daily.
* Monthly: use this option to run the job once a month on specific days.
* Periodically: use this option to run the job repeatedly throughout a day with a specific time interval.
* AfterJob: use this option to create a chain of jobs. Veeam Backup & Replication will start the Veeam Agent Backup job after the other backup job.
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
Veeam.Backup.PowerShell.Infos.VBRServerScheduleOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRServerScheduleOptions [-DailyOptions <VBRDailyOptions>] [-EnableBackupTerminationWindow] [-EnableRetry] [-Job <CBackupJob>] [-MonthlyOptions <VBRMonthlyOptions>] -Options <VBRServerScheduleOptions> 
```
```PowerShell
[-PeriodicallyOptions <VBRPeriodicallyOptions>] [-RetryCount <Int32>] [-RetryTimeout <Int32>] [-TerminationWindow <VBRBackupWindowOptions>] [-Type {Daily | Monthly | Periodically | AfterJob | RunManually}] 
```
```PowerShell
[<CommonParameters>]
```
