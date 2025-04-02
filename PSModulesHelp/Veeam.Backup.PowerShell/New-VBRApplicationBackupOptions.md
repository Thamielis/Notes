New-VBRApplicationBackupOptions
-------------------------------

### Synopsis
Creates the backup settings and full backup schedule for application backup policies.

---

### Description

This cmdlet creates the VBRApplicationBackupOptions object that contains backup settings and full backup schedule for application backup policies.

You can use this cmdlet to create a schedule for application backup policies for the following Veeam Plug-ins managed by Veeam Backup & Replication:
- Veeam Plug-in for Oracle RMAN
- Veeam Plug-in for SAP HANA
- Veeam Plug-in for SAP on Oracle

---

### Examples
> Example 1. Scheduling Application Backup Policy to Create Full Backups Weekly

```PowerShell
New-VBRApplicationBackupOptions -FullBackupScheduleType Weekly -WeeklyScheduleType SelectedDays -SelectedDays Sunday, Wednesday
This command schedules an application backup policy to create full backups weekly. The policy will create full backups on Sunday and Wednesday.
```
> Example 2. Scheduling Application Backup Policy to Create Full Backups Monthly

```PowerShell
New-VBRApplicationBackupOptions  -FullBackupScheduleType Monthly -DayNumber OnDay -DayOfMonth 15 -SelectedMonths January, April, September
This command schedules an application backup policy to create full backups monthly. The policy will create full backups on the 15th of January, April and September.
```

---

### Parameters
#### **BackupMode**
Specifies the backup mode:
* Incremental: the policy will create a backup of data changed since the last incremental data backup.
* Differential: the policy will create a backup of data changed since the last full data backup.
* Cumulative: the policy will create a full data backup.
Valid Values:

* Incremental
* Differential
* Cumulative

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRApplicationBackupMode]`|false   |named   |False        |

#### **DayNumber**
For monthly backups. Specifies the day of the month when the job creates full backups.
* First: the job will create a full backup on the first specified day of the week for the selected months.
* Second: the job will create a full backup on the second specified day of the week for the selected months.
* Third: the job will create a full backup on the third specified day of the week for the selected months.
* Fourth: the job will create a full backup on the fourth specified day of the week for the selected months.
* Last: the job will create a full backup on the last specified day of the week for the selected months.
* OnDay: the job will create a full backup on the selected day of the month. Use the DayOfMonth parameter to set the day.
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
For monthly backups with the OnDay option. Specifies the day of the month, when the job creates full backups. For example, on the 3rd day of November.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DayOfWeek**
For monthly backups. Specifies the day of the week, when the job creates full backups.
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

#### **FullBackupScheduleType**
Specifies the full backups schedule type.
* Monthly: the job will create a full backup on selected days of the month.
* Weekly: the job will create a full backup on selected days of the week.
Valid Values:

* Weekly
* Monthly

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFullBackupScheduleType]`|false   |named   |False        |

#### **SelectedDays**
For weekly backups with the SelectedDays option. Specifies the day of the week when the job creates full backups.
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
Specifies the months, when the job creates full backups. Default: all months are selected.
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

#### **WeeklyScheduleType**
For weekly backups. Specifies the full backups schedule type.
* Everyday: the job will create a full backup on selected days of the month.
* WeekDays: the job will create a full backup on selected days of the week.
* SelectedDays: the job will create a full backup on selected days.
Valid Values:

* Everyday
* WeekDays
* SelectedDays

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRDailyOptionsType]`|false   |named   |False        |

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
New-VBRApplicationBackupOptions [-BackupMode {Incremental | Differential | Cumulative}] [-DayNumber {First | Second | Third | Fourth | Last | OnDay}] [-DayOfMonth <String>] [-DayOfWeek {Sunday | Monday | 
```
```PowerShell
Tuesday | Wednesday | Thursday | Friday | Saturday}] [-FullBackupScheduleType {Weekly | Monthly}] [-SelectedDays {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-SelectedMonths {January 
```
```PowerShell
| February | March | April | May | June | July | August | September | October | November | December}] [-WeeklyScheduleType {Everyday | WeekDays | SelectedDays}] [<CommonParameters>]
```
