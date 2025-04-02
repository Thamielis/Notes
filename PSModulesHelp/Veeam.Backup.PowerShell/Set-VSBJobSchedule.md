Set-VSBJobSchedule
------------------

### Synopsis
Sets SureBackup job schedule options.

---

### Description

This cmdlet sets custom schedule settings to the selected SureBackup job.

You can schedule the job to run:    - Daily on specific time, on specific days of week,    - Monthly on specific time, on specific days of month, on specific months,    - After a certain job you specify.

---

### Examples
> Example 1

```PowerShell
Get-VSBJob -Name "SureBackup Job 01", "SureBackup Job 05" | Set-VSBJobSchedule -Daily -At "23:00" -DailyKind Weekdays
This command schedules the jobs named "SureBackup Job 01" and "SureBackup Job 05" to run daily at 23:00 on weekdays. The SureBackup jobs object is obtained with Get-VSBJob and piped down.
```
> Example 2

```PowerShell
Get-VSBJob -Name *SureJob* | Set-VSBJobSchedule -Monthly -At "12:00" -NumberInMonth Last -Days Saturday  -Months February, May, August, December
This command schedules all SureBackup jobs to run every last Saturday at 12:00 in February, May, August and December. The SureBackup jobs object is obtained with Get-VSBJob and piped down.
```
> Example 3

```PowerShell
Get-VSBJob -Name "SureBackup Job 01" | Set-VSBJobSchedule -After -AfterJob $job
This command schedules the SureBackup job named "SureBackup Job 01" to run after the job represented by the $job variable. The SureBackup job object is obtained with Get-VSBJob and piped down.. The backup job object is obtained with Get-VBRJob and assigned to $job variable beforehand.
```

---

### Parameters
#### **After**
Sets SureBackup job schedule to run after a specific job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AfterJob**
Specifies the job after which you want to run the SureBackup job.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CBackupJob]`|false   |named   |False        |

#### **At**
Specifies the SureBackup job start time. If not set, the job will start at 10:00 by default.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **Daily**
Sets SureBackup job schedule to daily run.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DailyKind**
Specifies the days to run the SureBackup job:    Everyday: the job will run everyday,    Weekdays: the job will run Monday through Friday,    Selected days: the job will run on specific days (i.e. Saturdays). Use the Days parameter to set the specific days.
Valid Values:

* Everyday
* WeekDays
* SelectedDays

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[DailyKinds]`|false   |named   |False        |

#### **Days**
Specifies the days of week to run the SureBackup job.
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

#### **Job**
Specifies the SureBackup job you want to set schedule to. You can include multiple jobs into this object.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[CSbJob]`|false   |0       |True (ByPropertyName, ByValue)|

#### **Monthly**
Sets SureBackup job schedule to monthly run.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Months**
Specifies the months to run the SureBackup job.
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
Specifies the period condition for the SureBackup job run: First/Second/Third/Forth/Last. Use this parameter to set the condition for the Days parameter, i.e. to run the job on first Saturday every month.
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

---

### Inputs
Veeam.Backup.Core.SureBackup.CSbJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VSBJobSchedule [[-Job] <CSbJob>] [-After] [-AfterJob <CBackupJob>] [<CommonParameters>]
```
```PowerShell
Set-VSBJobSchedule [[-Job] <CSbJob>] [-At <DateTime>] [-Daily] [-DailyKind {Everyday | WeekDays | SelectedDays}] [-Days {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Set-VSBJobSchedule [[-Job] <CSbJob>] [-At <DateTime>] [-Days {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Monthly] [-Months {January | February | March | April | May | June | July | 
```
```PowerShell
August | September | October | November | December}] [-NumberInMonth {First | Second | Third | Fourth | Last | OnDay}] [<CommonParameters>]
```
