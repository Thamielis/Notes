Set-VBRSureBackupJobScheduleOptions
-----------------------------------

### Synopsis
Modifies settings of a SureBackup job schedule.

---

### Description

This cmdlet modifies settings of a SureBackup job schedule.
NOTE: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

* [New-VBRSureBackupJobScheduleOptions](New-VBRSureBackupJobScheduleOptions)

---

### Examples
> Modifying Daily SureBackup Job Schedule

$daily = New-VBRDailyOptions -DayOfWeek Friday -Period 23:00
$schedule = New-VBRSureBackupJobScheduleOptions -Type Daily -DailyOptions $daily
$dailynew = New-VBRDailyOptions -DayOfWeek Saturday -Period 23:00
Set-VBRSureBackupJobScheduleOptions -VBRSbJobScheduleOptions $schedule -Type Daily -DailyOptions $dailynew
This example shows how to modify the daily SureBackup job schedule. The schedule is modified to run the SureBackup job every Saturday at 23:00.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek parameter value. Specify the Period parameter value. Save the result to the $daily variable.
2. Run the New-VBRSureBackupJobScheduleOptions cmdlet. Set the Daily option for the Type parameter value. Set the $daily variable as the DailyOptions parameter value. Save the result to the $schedule variable.
3. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek parameter value. Specify the Period parameter value. Save the result to the $dailynew variable.
4. Run the Set-VBRSureBackupJobScheduleOptions cmdlet. Specify the following settings:
- Set the $schedule variable as the VBRSbJobScheduleOptions parameter value.
- Set the Daily options for the Type parameter value.
- Set the $dailynew variable as the DailyOptions parameter value.

---

### Parameters
#### **DailyOptions**
For a daily schedule.
Specifies a daily schedule for a SureBackup job. The cmdlet will create the SureBackup job with this schedule.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **MonthlyOptions**
For a monthly schedule.
Specifies a monthly schedule for a SureBackup job. The cmdlet will create the SureBackup job with this schedule.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRMonthlyOptions]`|false   |named   |False        |

#### **ParentJob**
For running after a job. Specifies a name of the job after which Veeam Backup & Replication the SureBackup job must run. The cmdlet will create the SureBackup job with this schedule. Accepts the CBackupJob object. To create this object, run the Get-VBRJob cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CBackupJob]`|false   |named   |False        |

#### **Type**
Specifies how often a SureBackup job must run. You can select one of the following options:
* Daily: use this option if you want the SureBackup job to run every day. Provide the DailyOptions parameter to specify a daily schedule.
* Monthly: use this option if you want the SureBackup job to run monthly. Provide the MonthlyOptions parameter to specify a monthly schedule.
* AfterJob: use this option if you want the SureBackup job to run after a specific job. Provide the ParentJob parameter to specify the job after which the SureBackup job must run.
Valid Values:

* Daily
* Monthly
* AfterJob

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRSbJobScheduleType]`|false   |named   |False        |

#### **VBRSbJobScheduleOptions**
Specifies the SureBackup job schedule. The cmdlet will modify this schedule.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRSureBackupJobScheduleOptions]`|true    |named   |False        |

#### **WaitForParentJob**
Defines that the SureBackup job will wait until the linked backup or replication job completes.
If you provide this parameter, Veeam Backup & Replication will wait until the linked job completes. Otherwise, it will start the SureBackup job without waiting for the linked job to complete.
Use the WaitTimeMinutes parameter to specify how long the SureBackup job must wait for the linked job to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WaitTimeMinutes**
Specifies the time period in minutes that the SureBackup job must wait for the linked job to complete.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
Set-VBRSureBackupJobScheduleOptions [-DailyOptions <VBRDailyOptions>] [-MonthlyOptions <VBRMonthlyOptions>] [-ParentJob <CBackupJob>] [-Type {Daily | Monthly | AfterJob}] -VBRSbJobScheduleOptions 
```
```PowerShell
<VBRSureBackupJobScheduleOptions> [-WaitForParentJob] [-WaitTimeMinutes <Int32>] [<CommonParameters>]
```
