New-VBRFullBackupOptions
------------------------

### Synopsis
Creates an active full backup schedule for backup jobs.

---

### Description

This cmdlet creates the VBRFullBackupOptions object. This object contains schedule for backup jobs. You can use this object to set up the following types of schedules for backup jobs:
- HealthCheck schedules
- Compact full backup schedules
- Active full backup schedules

---

### Examples
> Example 1. Creating Schedule for Weekly Active Full Backups

```PowerShell
New-VBRFullBackupOptions -Enable -ScheduleType Weekly -SelectedDays Sunday, Wednesday
This command schedules a backup job to create active full backups weekly. The job will create active full backups on Sunday and Wednesday.
```
> Example 2. Creating Schedule for Monthly Active Full Backups

```PowerShell
New-VBRFullBackupOptions -Enable -ScheduleType Monthly -DayNumber OnDay -DayOfMonth 15 -SelectedMonths January, April, September
This command schedules a backup job to create active full backups monthly. The job will create active full backups on the 15th of January, April and September.
```

---

### Parameters
#### **DayNumber**
For monthly backups.
Specifies the day of the month when the job creates active full backups.
* First: the job will create an active full backup on the first specified day of the week for the selected months.
* Second: the job will create an active full backup on the second specified day of the week for the selected months.
* Third: the job will create an active full backup on the third specified day of the week for the selected months.
* Fourth: the job will create an active full backup on the fourth specified day of the week for the selected months.
* Last: the job will create an active full backup on the last specified day of the week for the selected months.
* OnDay: the job will create an active full backup on the selected day of the month. Use the DayOfMonth parameter to set the day.
Valid Values:

* First
* Second
* Third
* Fourth
* Last
* OnDay

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRDayNumberInMonth]`|false   |named   |False        |

#### **DayOfMonth**
For monthly backups with the OnDay option.
Specifies the day of the month, when the job creates active full backups.
For example, on the 3rd day of November.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DayOfWeek**
For monthly backups.
Specifies the day of the week, when the job creates active full backups.
* Sunday
* Monday
* Tuesday
* Wednesday
* Thursday
* Friday
* Saturday
Default: Saturday.
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

#### **Enable**
Enables the option for the backup job to create active full backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ScheduleType**
Specifies the active full backups schedule type.
* Monthly: the job will create an active full on selected days of the month.
* Weekly: the job will create an active full on selected days of the week.
Valid Values:

* Weekly
* Monthly

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFullBackupScheduleType]`|false   |named   |False        |

#### **SelectedDays**
For weekly backups.
Specifies the day of the week when the job creates active full backups.
Default: Saturday.
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

#### **SelectedMonths**
Specifies the months, when the job creates active full backups.
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
Default: all months are selected.
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

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[VBRMonth[]]`|false   |named   |False        |

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
New-VBRFullBackupOptions [-DayNumber {First | Second | Third | Fourth | Last | OnDay}] [-DayOfMonth <String>] [-DayOfWeek {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Enable] 
```
```PowerShell
[-ScheduleType {Weekly | Monthly}] [-SelectedDays {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-SelectedMonths {January | February | March | April | May | June | July | August | 
```
```PowerShell
September | October | November | December}] [<CommonParameters>]
```
