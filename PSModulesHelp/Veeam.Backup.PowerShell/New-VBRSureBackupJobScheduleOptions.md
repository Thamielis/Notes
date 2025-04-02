New-VBRSureBackupJobScheduleOptions
-----------------------------------

### Synopsis
Defines a SureBackup job schedule.

---

### Description

This cmdlet creates the VBRSureBackupJobScheduleOptions object that defines a SureBackup job schedule.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

* [New-VBRMonthlyOptions](New-VBRMonthlyOptions)

* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Defining Daily SureBackup Job Schedule

$daily = New-VBRDailyOptions -DayOfWeek Friday -Period 23:00
New-VBRSureBackupJobScheduleOptions -Type Daily -DailyOptions $daily
This example shows how to define the daily SureBackup job schedule. The schedule is created to run the SureBackup job every Friday at 23:00.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek parameter value. Specify the Period parameter value. Save the result to the $daily variable.
2. Run the New-VBRSureBackupJobScheduleOptions cmdlet. Set the Daily option for the Type parameter value. Set the $daily variable as the DailyOptions parameter value.
> Example 2. Defining Monthly SureBackup Job Schedule

$monthly = New-VBRMonthlyOptions -DayNumberInMonth Second -DayOfWeek Wednesday -Period 23:00
New-VBRSureBackupJobScheduleOptions -Type Monthly MonthlyOptions $monthly
This example shows how to define the monthly SureBackup job schedule. The schedule is created to run the SureBackup job at 23:00 on the second Wednesday every month.
Perform the following steps:
1. Run the New-VBRMonthlyOptions cmdlet. Set the Second option for the DayNumberInMonth parameter value. Set the Wednesday option for the DayOfWeek parameter value. Specify the Period parameter value. Save the result to the $monthly variable.
2. Run the New-VBRSureBackupJobScheduleOptions cmdlet. Set the Monthly option for the Type parameter value. Set the $monthly variable as the DailyOptions parameter value.
> Example 3. Defining Chained SureBackup Job Schedule

$job = Get-VBRJob -Name "Exchange Backup Job"
New-VBRSureBackupJobScheduleOptions -Type AfterJob -ParentJob $job
This example shows how to define the chained SureBackup job schedule. The schedule is created to run the SureBackup job after the Exchange Backup Job job completes.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRSureBackupJobScheduleOptions cmdlet. Set the AfterJob option for the Type parameter value. Set the $job variable as the ParentJob parameter value.

---

### Parameters
#### **DailyOptions**
For daily schedule.
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
For running after a job.
Specifies a name of the job after which Veeam Backup & Replication the SureBackup job must run. The cmdlet will create the SureBackup job with this schedule.

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
|`[VBRSbJobScheduleType]`|true    |named   |False        |

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
New-VBRSureBackupJobScheduleOptions [-DailyOptions <VBRDailyOptions>] [-MonthlyOptions <VBRMonthlyOptions>] [-ParentJob <CBackupJob>] -Type {Daily | Monthly | AfterJob} [-WaitForParentJob] [-WaitTimeMinutes 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
