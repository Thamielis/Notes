Set-VBRJobAdvancedOptions
-------------------------

### Synopsis
Customizes advanced job settings.

---

### Description

This cmdlet sets advanced options for the selected job.
You can set:
- Integrity check: Veeam Backup and Replication will check every full backup file for integrity and recovery availability.
- Deleted VMs retention period: if a VM included in this job is deleted, its data will be stored for the specified period. When this period ends, the backup files are deleted. The default period is 14 days.
- Post job activity: you can specify a command you want to run after the job run, i.e. to sent a job result report. You can schedule this command to run i.e. every second job run or on specific days.
Read more about advanced job settings in Veeam Backup & Replication user guide at http://www.veeam.com/vmware-backup/help-center.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Editing Advanced Job Settings to Specific Backup Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01" | Set-VBRJobAdvancedOptions -EnableIntegrityChecks $True -RetainDays 30
This example shows how to edit the advanced job settings to backup job named "Backup Job 01":
- The integrity check is enabled.
- The data retention period is set to 30 days.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRJobAdvancedOptions cmdlet. Provide the $True value for the EnableIntegrityChecks parameter. Specify the RetainDays parameter value.
> Example 2. Editing Advanced Job Settings to Specific Backup Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01" | Set-VBRJobAdvancedOptions -EnableIntegrityChecks $True -Enabled $True -CommandLine "report.exe" -Periodicity Cycles  -Frequency 5
This example shows how to edit the advanced job settings to backup job named "Backup Job 01":
- The integrity check is enabled.
- The data retention period is changed to 30 days.
- The post job activity is enabled to run the "report.exe" command periodically after every fifth job run.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRJobAdvancedOptions cmdlet. Specify the following settings:
- Provide the $True value for the EnableIntegrityChecks parameter.
- Provide the $True value for the Enabled parameter.
- Specify the CommandLine parameter value.
- Specify the Periodicity parameter value.
- Specify the Frequency parameter value.

---

### Parameters
#### **CommandLine**
Specifies the command you want to execute after the job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **CompactFullMonthlyOptions**
For a monthly schedule.
Specifies a monthly schedule for a job.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRMonthlyOptions]`|false   |named   |False        |

#### **CompactFullScheduleType**
Specifies the type of the job schedule. Parameter accepts the following values:
* Monthly: the job will run on selected days of the month.
* Weekly: the job will run on selected days of the week.
Valid Values:

* Weekly
* Monthly

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRAdvancedOptionsScheduleType]`|false   |named   |False        |

#### **CompactFullWeeklyOptions**
For a weekly schedule.
Specifies a weekly schedule for a job.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **Days**
For command schedule on days.
Specifies the days to run the command: Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday.
Valid Values:

* Sunday
* Monday
* Tuesday
* Wednesday
* Thursday
* Friday
* Saturday

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[DayOfWeek[]]`|false   |named   |False        |

#### **EnableCompactFull**
Enables the Defragment and compact full backup file option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Enabled**
Defines whether the job will execute a user-defined command after the job.
Use the CommandLine parameter to set the command.
Schedule the command to run periodically with the Periodicity and Frequency parameters, or on specific days with the Days parameter.

|Type       |Required|Position|PipelineInput|Aliases         |
|-----------|--------|--------|-------------|----------------|
|`[Boolean]`|false   |named   |False        |EnablePostScript|

#### **EnableHealthCheck**
Enables the Health check option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableIntegrityChecks**
Defines whether the job will use the automatic backup integrity check.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **EnablePreScript**
Defines whether the job will execute a user script before the job starts.
Use the PreJobScript parameter to specify the script.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **Frequency**
For command cycle schedule.
Specifies the number of the backup cycles after which the command will be executed (for example, every 3 backup cycles).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |False        |

#### **HealthCheckMonthlyOptions**
Specifies health check monthly options.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRMonthlyOptions]`|false   |named   |False        |

#### **HealthCheckScheduleType**
Specifies a health check schedule.
Valid Values:

* Weekly
* Monthly

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRAdvancedOptionsScheduleType]`|false   |named   |False        |

#### **HealthCheckWeeklyOptions**
Specifies health check weekly options.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **Job**
Specifies the array of jobs. The cmdlet will modify advanced options of these jobs.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Periodicity**
For command schedule.
Specifies the command schedule type:
* Cycles: the command will be executed in periods set with the Frequency parameter.
* Days: the command will be executed on the days specified with the Days parameter.
Valid Values:

* Cycles
* Days

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[PeriodicityType]`|false   |named   |False        |

#### **PreJobScript**
Specifies the script you want to run before job for the job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RetainDays**
Specifies the number of days to keep backup data for the deleted VMs.
Default: 14 days.
Note: You cannot enable the retention policy for deleted VMs with Veeam PowerShell. Read more about Retention Policy for Deleted VMs in Veeam Backup & Replication user guide at http://www.veeam.com/vmware-backup/help-center.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRJobAdvancedOptions [-CommandLine <String>] [-CompactFullMonthlyOptions <VBRMonthlyOptions>] [-CompactFullScheduleType {Weekly | Monthly}] [-CompactFullWeeklyOptions <VBRDailyOptions>] [-Days {Sunday | 
```
```PowerShell
Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-EnableCompactFull] [-Enabled <Boolean>] [-EnableHealthCheck] [-EnableIntegrityChecks <Boolean>] [-EnablePreScript <Boolean>] [-Frequency <UInt32>] 
```
```PowerShell
[-HealthCheckMonthlyOptions <VBRMonthlyOptions>] [-HealthCheckScheduleType {Weekly | Monthly}] [-HealthCheckWeeklyOptions <VBRDailyOptions>] -Job <CBackupJob[]> [-Periodicity {Cycles | Days}] [-PreJobScript 
```
```PowerShell
<String>] [-RetainDays <Int32>] [<CommonParameters>]
```
