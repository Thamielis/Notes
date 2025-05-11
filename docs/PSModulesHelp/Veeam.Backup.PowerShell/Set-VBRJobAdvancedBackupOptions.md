Set-VBRJobAdvancedBackupOptions
-------------------------------

### Synopsis
Modifies advanced job backup settings.

---

### Description

This cmdlet modifies advanced backup options of a selected job.
You can select backup method: reverse incremental or incremental, and set schedule settings for synthetic full backups.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Setting Specific Backup Options for Backup Job [Using Pipeline]

$job = Get-VBRJob -Name "Backup Job"
$job | Set-VBRJobAdvancedBackupOptions -Algorithm ReverseIncremental -FullBackupScheduleKind Monthly
This example shows how to set the following backup options for the backup job represented by the $job variable:
- The backup algorithm is set to ReverseIncremental.
- The active full backup schedule is set to monthly.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Pipe the cmdlet output to the Set-VBRJobAdvancedBackupOptions cmdlet. Set the ReverseIncremental option for the Algorithm parameter. Set the Monthly option for the FullBackupScheduleKind parameter.
> Example 2. Setting Specific Backup Options for all Backup Jobs [Using Pipeline]

Get-VBRJob -Name Backup* | Set-VBRJobAdvancedBackupOptions -Algorithm Incremental -TransformFullToSyntethic $True -TransformToSyntethicDays Sunday, Thursday -EnableFullBackup $True -FullBackupScheduleKind Monthly -DayNumberInMonth Second -FullBackupScheduleKind Daily -DayOfWeek Sunday
This example shows how to set the following backup options for all backup jobs:
- The backup algorithm is set to Incremental.
- The synthetic full backup is enabled on every Sunday and Thursday.
- The previous fulls are set to rollback to chain of increments to save disk space.
- The active full backup schedule is set to every second Sunday monthly.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRJobAdvancedBackupOptions cmdlet. Specify the following settings:
- Specify the Algorithm parameter value.
- Provide the $True value for the TransformFullToSynthetic parameter.
- Specify the TransformToSyntheticDays parameter value.
- Provide the $True value for the EnableFullBackup parameter.
- Specify the FullBackupScheduleKind parameter value.
- Specify the DayNumberInMonth parameter value.
- Specify the FullBackupScheduleKind parameter value.
- Specify the DayOfWeek parameter value.

---

### Parameters
#### **Algorithm**
Specifies backup method:
* ReverseIncremental: reverse incremental backup method.
* Incremental: incremental backup method.
* RecoveryPointObjective: not supported.
* Unknown: not supported.
Note: To enable forever forward incremental backup method, disable the TransformFullToSynthetic and EnableFullBackup parameters.
Valid Values:

* ReverseIncremental
* Incremental
* RecoveryPointObjective
* Unknown

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[JobAlgorithms]`|false   |named   |False        |

#### **DayNumberInMonth**
For active full schedule: monthly.
Specifies the number of day in month (for example, Saturday):
* First: the job will create an active full on the first (Saturday) of the selected months.
* Second: the job will create an active full on the second (Saturday) of the selected months.
* Third: the job will create an active full on the third (Saturday) of the selected months.
* Fourth: the job will create an active full on the fourth (Saturday) of the selected months.
* Last: the job will create an active full on the last (Saturday) of the selected months.
* OnDay: the job will create an active full backup on a specific day of month. Use the DayOfMonth parameter to specify the day of month.
Valid Values:

* First
* Second
* Third
* Fourth
* Last
* OnDay

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[EDayNumberInMonth]`|false   |named   |False        |

#### **DayOfMonth**
For active full schedule: monthly with the OnDay option. Specifies the day of month to perform an active full backup.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CDayOfMonth]`|false   |named   |False        |

#### **DayOfWeek**
Sets backup schedule.
Specifies the day of week to run the backup job: Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday.
Use this parameter to set the day for -NumberInMonth parameter,  i.e. to run the job on first Saturday every month.
Valid Values:

* Sunday
* Monday
* Tuesday
* Wednesday
* Thursday
* Friday
* Saturday

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[DayOfWeek]`|false   |named   |False        |

#### **EnableFullBackup**
Defines whether the job will create active full backups.
Use the FullBackupDays, FullBackupScheduleKind, Months, DayNumberInMonth and DayOfWeek parameters to set the full backup schedule.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **FullBackupDays**
For active full schedule: daily.
Specifies days when the job will perform the active full backup: Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday.
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

#### **FullBackupScheduleKind**
For active full schedule.
Specifies the active full backup schedule type:
* Daily: the job will create an active full on selected days of week. Use the FullBackupDays parameter to set the days.
* Monthly: the job will create an active full on selected days of month. Use the Months, DayNumberInMonth and DayOfWeek parameters to set the days.
Valid Values:

* Daily
* Monthly

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[EFullBackupScheduleKind]`|false   |named   |False        |

#### **Job**
Specifies the array of jobs. The cmdlet will modify advanced backup options of these jobs.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Months**
For active full schedule: monthly.
Specifies months to perform the full backup: January, February, March, April, May, June, July, August, September, October, November, December.
Valid Values:

* January
* February
* March
* April
* May
* June
* July
* August
* September
* October
* November
* December

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[EMonth[]]`|false   |named   |False        |

#### **SyntheticDayNumberInMonth**
Specifies the number of a day in a month (for example, Saturday):
* First: the job will create a synthetic full on the first (Saturday) of the selected months.
* Second: the job will create a synthetic full on the second (Saturday) of the selected months.
* Third: the job will create a synthetic full on the third (Saturday) of the selected months.
* Fourth: the job will create a synthetic full on the fourth (Saturday) of the selected months.
* Last: the job will create a synthetic full on the last (Saturday) of the selected months.
* OnDay: the job will create a synthetic full backup on a specific day of month. Use the SyntheticDayOfMonth parameter to specify the day of month.
Valid Values:

* First
* Second
* Third
* Fourth
* Last
* OnDay

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[EDayNumberInMonth]`|false   |named   |False        |

#### **SyntheticDayOfMonth**
For synthetic full schedule: monthly with the SyntheticDayNumberInMonth parameter set to OnDay.
Specifies the day of month to perform an active full backup.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CDayOfMonth]`|false   |named   |False        |

#### **SyntheticDayOfWeek**
Specifies the day of week to run the backup job:: Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday.
Use this parameter to set the day for SyntheticDayNumberInMonth parameter, for example, to run the job on first Saturday every month.
Valid Values:

* Sunday
* Monday
* Tuesday
* Wednesday
* Thursday
* Friday
* Saturday

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[DayOfWeek]`|false   |named   |False        |

#### **TransformFullToSynthetic**
For incremental backup method.
Defines whether the job will create a full synthetic backup.
Use the TransformToSyntheticDays parameter to set the days to perform the synthetic full backups.

|Type       |Required|Position|PipelineInput|Aliases                 |
|-----------|--------|--------|-------------|------------------------|
|`[Boolean]`|false   |named   |False        |TransformFullToSyntethic|

#### **TransformIncrementsToSynthetic**
For incremental backup method with synthetic full. Defines whether the job will transform the backup chains before the synthetic full backup into rollbacks.

|Type       |Required|Position|PipelineInput|Aliases                       |
|-----------|--------|--------|-------------|------------------------------|
|`[Boolean]`|false   |named   |False        |TransformIncrementsToSyntethic|

#### **TransformToSyntheticDays**
For synthetic full schedule.
Specifies days when the job will perform the synthetic fulls: Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday.
Valid Values:

* Sunday
* Monday
* Tuesday
* Wednesday
* Thursday
* Friday
* Saturday

|Type           |Required|Position|PipelineInput|Aliases                 |
|---------------|--------|--------|-------------|------------------------|
|`[DayOfWeek[]]`|false   |named   |False        |TransformToSyntethicDays|

#### **TransformToSyntheticMonths**
For synthetic full schedule: monthly.
Specifies months to perform the synthetic full backup: January, February, March, April, May, June, July, August, September, October, November, December.
Valid Values:

* January
* February
* March
* April
* May
* June
* July
* August
* September
* October
* November
* December

|Type        |Required|Position|PipelineInput|Aliases                   |
|------------|--------|--------|-------------|--------------------------|
|`[EMonth[]]`|false   |named   |False        |TransformToSyntethicMonths|

#### **TransformToSyntheticScheduleKind**
For synthetic full schedule.
Specifies the active full backup schedule type:
* Daily: the job will create a synthetic full on selected days of week. Use the TransformToSyntheticDays parameter to set the days.
* Monthly: the job will create a synthetic full on selected days of month. Use the TransformToSyntheticMonths, SyntheticDayNumberInMonth and SyntheticDayOfMonth parameters to configure the schedule.
Valid Values:

* Daily
* Monthly

|Type                       |Required|Position|PipelineInput|Aliases                         |
|---------------------------|--------|--------|-------------|--------------------------------|
|`[EFullBackupScheduleKind]`|false   |named   |False        |TransformToSyntethicScheduleKind|

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
Set-VBRJobAdvancedBackupOptions [-Algorithm {ReverseIncremental | Incremental | RecoveryPointObjective | Unknown}] [-DayNumberInMonth {First | Second | Third | Fourth | Last | OnDay}] [-DayOfMonth 
```
```PowerShell
<CDayOfMonth>] [-DayOfWeek {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-EnableFullBackup <Boolean>] [-FullBackupDays {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | 
```
```PowerShell
Saturday}] [-FullBackupScheduleKind {Daily | Monthly}] -Job <CBackupJob[]> [-Months {January | February | March | April | May | June | July | August | September | October | November | December}] 
```
```PowerShell
[-SyntheticDayNumberInMonth {First | Second | Third | Fourth | Last | OnDay}] [-SyntheticDayOfMonth <CDayOfMonth>] [-SyntheticDayOfWeek {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] 
```
```PowerShell
[-TransformFullToSynthetic <Boolean>] [-TransformIncrementsToSynthetic <Boolean>] [-TransformToSyntheticDays {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-TransformToSyntheticMonths 
```
```PowerShell
{January | February | March | April | May | June | July | August | September | October | November | December}] [-TransformToSyntheticScheduleKind {Daily | Monthly}] [<CommonParameters>]
```
