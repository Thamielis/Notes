New-VBRHealthCheckOptions
-------------------------

### Synopsis
Defines the health check schedule options.

---

### Description

This cmdlet creates the VBRHealthCheckOptions object that defines backup files health check schedule options.
Important! You cannot apply the New-VBRHealthCheckOptions cmdlet to a backup job.

---

### Examples
> Defining Backup Files Health Check Schedule Options

New-VBRHealthCheckOptions -Enable -ScheduleType Weekly -DayOfWeek Sunday -WeeklyPeriod 18:00
This command defines the following health check schedule options:
- The job will perform the light health check.
- The job runs weekly on Sunday at 18:00.

---

### Parameters
#### **DayNumber**
For the monthly health check of backup files.
Specifies the day of the month when the job performs backup files health check. Parameter accepts the following values:
* First: the job will perform the health check on the first specified day of the week for the selected months.
* Second: the job will perform the health check on the second specified day of the week for the selected months.
* Third: the job will perform the health check on the third specified day of the week for the selected months.
* Fourth: the job will perform the health check on the fourth specified day of the week for the selected months.
* Last: the job will perform the health check on the last specified day of the week for the selected months.
* OnDay: the job will perform the health check on the selected day of the month. Use the DayOfMonth parameter to set the day.
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
For the monthly health check of backup files. Specifies the day of the month, when the job performs backup files health check.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DayOfWeek**
For the weekly health check of backup files.
Specifies the day of the week, when the job performs the health check. Parameter accepts the following values:
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
Defines that the job will perform the light health check of backup files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableFullHealthCheck**
Defines that the job will perform the full health check of backup files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MonthlyPeriod**
For the monthly health check of backup files. Specifies the job start time.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

#### **ScheduleType**
Specifies the type of the health check job schedule. Parameter accepts the following values:
* Monthly: the job will run on selected days of the month.
* Weekly: the job will run on selected days of the week.
Valid Values:

* Weekly
* Monthly

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRHealthCheckScheduleType]`|false   |named   |False        |

#### **SelectedDays**
For the weekly health check of backup files. Specifies the day of the week when the job will perform the health check of backup files.
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
For the monthly health check of backup files. Specifies the month when the job will perform the health check of backup files.
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

#### **WeeklyPeriod**
For the weekly health check of backup files. Specifies the job start time.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

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
New-VBRHealthCheckOptions [-DayNumber {First | Second | Third | Fourth | Last | OnDay}] [-DayOfMonth <String>] [-DayOfWeek {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Enable] 
```
```PowerShell
[-EnableFullHealthCheck] [-MonthlyPeriod <TimeSpan>] [-ScheduleType {Weekly | Monthly}] [-SelectedDays {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-SelectedMonths {January | 
```
```PowerShell
February | March | April | May | June | July | August | September | October | November | December}] [-WeeklyPeriod <TimeSpan>] [<CommonParameters>]
```
