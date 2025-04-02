Set-VBRFullBackupOptions
------------------------

### Synopsis
Modifies active full backup schedule for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies the settings of schedule for Veeam Agent backup jobs. You can modify the settings of schedule for the following types of schedules for Veeam Agent backup jobs:
- HealthCheck schedules
- Compact full backup schedules
- Active full backup schedules
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRFullBackupOptions](New-VBRFullBackupOptions)

---

### Examples
> Modifying Active Full Backup Schedule from Weekly to Monthly

$activefull = New-VBRFullBackupOptions -Enable -ScheduleType Weekly -SelectedDays Sunday, Wednesday
Set-VBRFullBackupOptions -Options $activefull -Enable -ScheduleType Monthly -DayNumber OnDay -DayOfWeek Friday
This example shows how to modify an active full backup schedule. Veeam Backup & Replication will change the schedule from weekly to monthly.
Perform the following steps:
1. Run the New-VBRFullBackupOptions cmdlet. Provide the Enable parameter. Specify the ScheduleType and SelectedDays parameter values. Save the result to the $activefull variable.
2. Run the Set-VBRFullBackupOptions cmdlet. Specify the following settings:
- Set the $activefull variable as the Options parameter value.
- Provide the Enable parameter.
- Set the Monthly option for the ScheduleType parameter.
- Set the OnDay option for the DayNumber parameter.
- Set the Friday option for the DayOfWeek parameter.

---

### Parameters
#### **DayNumber**
For monthly backups.
Specifies the day of the month when active full backups will be created (for example, Saturday):
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
Enables the option for the Veeam Agent backup job to create active full backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Options**
Specifies the active full backup schedule that you want to modify.

|Type                    |Required|Position|PipelineInput |
|------------------------|--------|--------|--------------|
|`[VBRFullBackupOptions]`|true    |named   |True (ByValue)|

#### **ScheduleType**
Specifies the type of active full backup schedule.
* Monthly: the job will create an active full on selected days of the month.
* Weekly: the job will create an active full on selected days of the week.
Valid Values:

* Weekly
* Monthly

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRFullBackupScheduleType]`|false   |named   |False        |

#### **SelectedDays**
For weekly full backups.
Specifies the day of the week when active full backups will be created.
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
Veeam.Backup.PowerShell.Infos.VBRFullBackupOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRFullBackupOptions [-DayNumber {First | Second | Third | Fourth | Last | OnDay}] [-DayOfMonth <String>] [-DayOfWeek {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Enable] 
```
```PowerShell
-Options <VBRFullBackupOptions> [-ScheduleType {Weekly | Monthly}] [-SelectedDays {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-SelectedMonths {January | February | March | April | 
```
```PowerShell
May | June | July | August | September | October | November | December}] [<CommonParameters>]
```
