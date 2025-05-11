New-VBRTapeGFSScheduleOptions
-----------------------------

### Synopsis
Creates new GFS schedule settings.

---

### Description

This cmdlet creates a new VBRTapeGFSScheduleOptions object. This object contains GFS schedule and is used to apply the schedule to a tape job.

---

### Examples
> Example - Creating GFS Backup to Tape Schedule

$sch = New-VBRTapeGFSScheduleOptions -WeeklyDay Tuesday -WeeklyStartAt 18:00
This command creates a new GFS schedule with the following settings:
- WeeklyOPtions: Tuesday 18:00:00
- MonthlyOptions: First Sunday of the month (default)
- QuarterlyOptions: First Sunday of the quarter (default)
- YearlyOptions: First Sunday of the year (default)
- DailyOptions: 0:00:00 (default)

---

### Parameters
#### **DailyStartAt**
For daily backup. Specifies the time when the daily backup is archived.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

#### **MonthlyDayOfMonth**
For monthly backup. Specifies the day in month for the MonthlyKind(DayOfMonth) parameter: 1-31/Last.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **MonthlyDayOfWeek**
For monthly backup. Specifies the day of week for the MonthlyKind (DayOfWeek) parameter.
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

#### **MonthlyDayOfWeekNumber**
For monthly backup. Specifies the number of the selected week day, for example, "the first" (Sunday) for the MonthlyKind(DayOfWeek) parameter: First/Second/Third/Forth/Last.
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

#### **MonthlyKind**
For monthly backup. Specifies the type of monthly schedule:
* DayOfWeek: The monthly backup will be archived on a selected week day in month, for example, every first Sunday of month. Use the MonthlyDayOfWeek parameter to set the day of week and the MonthlyDayOfWeekNumber parameter to set the number of day, for example, "first" (Sunday).
* DayOfMonth: The monthly backup will be archived on a selected day of month, for example, on the 1st. Use the MonthlyDayOfMonth parameter to set the day.
Valid Values:

* DayOfWeek
* DayOfMonth

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRGFSMonthlyKind]`|false   |named   |False        |

#### **MonthOfYear**
For yearly backup. Specifies the month for the YearlyKind (DayOfYear) parameter.
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
|`[VBRMonth]`|false   |named   |False        |

#### **QuarterlyDayOfMonth**
For quarterly backup. Specifies the day of month for the QuarterlyKind (DayOfQuarter) parameter: 1-31/Last.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **QuarterlyDayOfWeek**
For quarterly backup. Specifies the day of week for the QuarterlyKind (DayOfWeek) parameter.
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

#### **QuarterlyDayOfWeekNumber**
For quarterly backup. Specifies the number of the selected day, for example, "the first" (Sunday) for the QuarterlyKind(DayOfWeek) parameter: First/Second/Third/Fourth/Last.
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

#### **QuarterlyKind**
For quarterly backup. Specifies the type of quarterly schedule:
* DayOfWeek: The quarterly backup will be archived on a selected week day, for example, the first Sunday of a quarter. Use the QuarterlyDayOfWeekNumber parameter to set the number of the week day and the QuarterlyDayOfWeek parameter to set the day of week.
* DayOfQuarter: The quarterly backup will be archived on a selected day of month, for example, on the 1st of the first month of a quarter. Use the QuarterlyDayOfQuarter parameter to set the day of month and the QuartetlyMonthOfQuarter to set the month.
Valid Values:

* DayOfWeek
* DayOfQuarter

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRGFSQuarterlyKind]`|false   |named   |False        |

#### **QuarterlyMonthOfQuarter**
For quarterly backup. Specifies the number of month in quarter for the QuarterlyKind (DayOfQuarter) parameter: First/Last.
Valid Values:

* First
* Last

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRGFSMonthOfQuarter]`|false   |named   |False        |

#### **WeeklyDay**
For weekly backup. Specifies the day of week when the weekly backup is archived.
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

#### **WeeklyStartAt**
For weekly backup. Specifies the time when the weekly backup is archived.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

#### **YearlyDayOfMonth**
For yearly backup. Specifies the day of month for the YearlyKind (DayOfYear) parameter: 1-31/Last.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **YearlyDayOfWeek**
For yearly backup. Specifies the day of week for the YearlyKind (DayOfWeek) parameter.
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

#### **YearlyDayOfWeekNumber**
For yearly backup. Specifies the number of the selected day, for example, "the first" (Sunday) for the YearlyKind(DayOfWeek) parameter: First/Second/Third/Fourth/Last.
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

#### **YearlyKind**
For yearly backup. Specifies the type of yearly schedule:
* DayOfWeek: The yearly backup will be archived on a selected week day in year, for example, every first Sunday of year. Use the YearlyDayOfWeek parameter to set the day of week and the YearlyDayOfWeekNumber parameter to set the number of day, for example, "first" (Sunday).
* DayOfYear: The yearly backup will be archived on a selected day of month in year, for example, on the 1st of January. Use the YearlyDayOfMonth parameter to set the day in month and the MonthOfYear parameter to set the month.
Valid Values:

* DayOfWeek
* DayOfYear

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRGFSYearlyKind]`|false   |named   |False        |

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
New-VBRTapeGFSScheduleOptions [-DailyStartAt <TimeSpan>] [-MonthlyDayOfMonth <String>] [-MonthlyDayOfWeek {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-MonthlyDayOfWeekNumber {First 
```
```PowerShell
| Second | Third | Fourth | Last | OnDay}] [-MonthlyKind {DayOfWeek | DayOfMonth}] [-MonthOfYear {January | February | March | April | May | June | July | August | September | October | November | December}] 
```
```PowerShell
[-QuarterlyDayOfMonth <String>] [-QuarterlyDayOfWeek {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-QuarterlyDayOfWeekNumber {First | Second | Third | Fourth | Last | OnDay}] 
```
```PowerShell
[-QuarterlyKind {DayOfWeek | DayOfQuarter}] [-QuarterlyMonthOfQuarter {First | Last}] [-WeeklyDay {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-WeeklyStartAt <TimeSpan>] 
```
```PowerShell
[-YearlyDayOfMonth <String>] [-YearlyDayOfWeek {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-YearlyDayOfWeekNumber {First | Second | Third | Fourth | Last | OnDay}] [-YearlyKind 
```
```PowerShell
{DayOfWeek | DayOfYear}] [<CommonParameters>]
```
