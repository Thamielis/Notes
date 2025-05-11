Set-VBRJobSchedule
------------------

### Synopsis
Modifies job schedule.

---

### Description

This cmdlet modifies schedule settings of a selected job.

To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.
Important: The Periodicaly parameter has a typo in spelling. In scripts, enter parameters as specified in command syntax.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VSBJob](Get-VSBJob)

---

### Examples
> Example 1. Scheduling Daily Backup Job

$job = Get-VBRJob -Name "Backup Job 01"
Set-VBRJobSchedule -Job $job -Daily -At "23:00" -DailyKind Weekdays
This example shows how to schedule the Backup Job 01 job to run daily at 23:00 on weekdays.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Set-VBRJobSchedule cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Provide the Daily parameter.
- Specify the At parameter value.
- Specify the DailyKind parameter value.
> Example 2. Scheduling Monthly Replication Jobs

$job = Get-VBRJob -Name Replica*
Set-VBRJobSchedule -Job $job -Monthly -At "12:00" -NumberInMonth Last -Days Saturday -Months February, May, August, December
This example shows how to schedule all replication jobs to run monthly every last Saturday at 12:00 in February, May, August and December.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Set-VBRJobSchedule cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Provide the Monthly parameter.
- Specify the At parameter value.
- Specify the NumberInMonth parameter value.
- Specify the Days parameter value.
- Specify the Months parameter value.
> Example 3. Scheduling Job to Run Every Several Hours

$job = Get-VBRJob -Name Daily Job
Set-VBRJobSchedule -Job $job -Periodicaly -FullPeriod 12 -PeriodicallyKind Hours
This example shows how to schedule the Daily Job to run every 12 hours.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Set-VBRJobSchedule cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Provide the Periodicaly parameter.
- Specify the FullPeriod parameter value.
- Specify the PeriodicallyKind parameter value.
> Example 4. Scheduling Job to Run After Another Job

$dbjob = Get-VSBJob -Name "Database Job"
$dailyjob = Get-VBRJob -Name "Daily Job"
Set-VBRJobSchedule -Job $dailyjob -After -AfterJob $dbjob
This example shows how to schedule the Daily Job to run after the Database Job.
Perform the following steps:
1. Run the Get-VSBJob cmdlet. Specify the Name parameter value. Save the result to the $dbjob variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $dailyjob variable.
3. Run the Set-VBRJobSchedule cmdlet. Specify the following settings:
- Set the $dailyjob variable as the Job parameter value.
- Provide the After parameter.
- Set the $dbjob as the AfterJob parameter value.

---

### Parameters
#### **After**
For running after a job.
Defines that the job will start after another job.
Use the AfterJob parameter to set the primary job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AfterJob**
For running after a job.
Specifies the job after which you want to run this job.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CBackupJob]`|false   |named   |False        |

#### **At**
For daily schedule.
Specifies the job start time.
Default: 10:00.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **Daily**
For daily schedule.
Defines that the job runs daily.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DailyKind**
For daily schedule.
Specifies the days to run the job:
* Everyday: the job will run everyday.
* Weekdays: the job will run Monday through Friday.
* SelectedDays: the job will run on specific days (for example, Saturdays). Use the Days parameter to set the specific days.
Valid Values:

* Everyday
* WeekDays
* SelectedDays

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[DailyKinds]`|false   |named   |False        |

#### **DayOfMonth**
For monthly schedule.
Specifies the day in month: 1-31, Last.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Days**
For daily schedule.
Specifies the days of week to run the job.
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

#### **EnableBackupTerminationWindow**
Defines that the Veeam Backup & Replication will stop the Veeam Agent backup job if it exceeds the backup window.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FullPeriod**
For periodical run.
Specifies the number of hours or minutes for the PeriodicallyKind parameter.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Job**
Specifies the job you want to edit.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Monthly**
For monthly schedule.
Defines that the job runs once a month.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Months**
For monthly schedule.
Specifies the months when the job will run: January, February, March, April, May, June, July, August, September, October, November, December.
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

#### **NumberInMonth**
For monthly schedule.
Specifies the number of day in month (for example, Saturday):
* First: the job will run on the first (Saturday) of selected months.
* Second: the job will run on the second (Saturday) of selected months.
* Third: the job will run on the third (Saturday) of selected months.
* Fourth: the job will run on the fourth (Saturday) of selected months.
* Last: the job will run on the last (Saturday) of selected months.
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

#### **PeriodicallyKind**
For periodical run.
Specifies the periodically schedule type:
* Hours: the job will run periodically in specifies number of hours (for example, every 6 hours).
* Minutes: the job will run periodically in specified number of minutes (for example, every 30 minutes).
* Continuously: the job will start right after it finished.
Valid Values:

* Hours
* Minutes
* Continuously

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRPeriodicallyKinds]`|false   |named   |False        |

#### **PeriodicallyOffset**
For periodical run.
Used to set the exact time when the backup window starts.
Specifies the number of minutes (1-59). The job will start at the hour set in the backup window plus the indicated period (for example, at 8:30).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **PeriodicallySchedule**
For periodical run.
Specifies the backup window.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Periodicaly**
Note: This parameter has a typo in spelling. In scripts, enter parameters as specified in command syntax.
For periodical run. Defines that the job runs periodically (for example, every 6 hours).
Use the FullPeriod and PeriodicallyKind parameters to set the periodical schedule.
Use the PeriodicallySchedule parameter to set backup window.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TerminationWindow**
Specifies the time interval within which the backup job must complete.  The cmdlet will create the Veeam Agent backup job with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRJobSchedule [-After] [-AfterJob <CBackupJob>] [-EnableBackupTerminationWindow] -Job <CBackupJob> [-TerminationWindow <VBRBackupWindowOptions>] [<CommonParameters>]
```
```PowerShell
Set-VBRJobSchedule [-At <DateTime>] [-Daily] [-DailyKind {Everyday | WeekDays | SelectedDays}] [-Days {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-EnableBackupTerminationWindow] 
```
```PowerShell
-Job <CBackupJob> [-TerminationWindow <VBRBackupWindowOptions>] [<CommonParameters>]
```
```PowerShell
Set-VBRJobSchedule [-At <DateTime>] [-DayOfMonth <String>] [-Days {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-EnableBackupTerminationWindow] -Job <CBackupJob> [-Monthly] [-Months 
```
```PowerShell
{January | February | March | April | May | June | July | August | September | October | November | December}] [-NumberInMonth {First | Second | Third | Fourth | Last | OnDay}] [-TerminationWindow 
```
```PowerShell
<VBRBackupWindowOptions>] [<CommonParameters>]
```
```PowerShell
Set-VBRJobSchedule [-EnableBackupTerminationWindow] [-FullPeriod <Int32>] -Job <CBackupJob> [-PeriodicallyKind {Hours | Minutes | Continuously}] [-PeriodicallyOffset <Int32>] [-PeriodicallySchedule 
```
```PowerShell
<VBRBackupWindowOptions>] [-Periodicaly] [-TerminationWindow <VBRBackupWindowOptions>] [<CommonParameters>]
```
