New-VBRMonthlyOptions
---------------------

### Synopsis
Creates a new VBRMonthlyOptions object.

---

### Description

This cmdlet creates the VBRMonhtlyOptions object. This object contains the monthly schedule job settings.
You can use this object to set job schedule.

---

### Examples
> Example 1. Creating Schedule with Specific Day and Time

```PowerShell
New-VBRMonthlyOptions -DayNumberInMonth Second -DayOfWeek Wednesday -Period 23:00
This command creates the schedule for a job to run at 23:00 on the second Wednesday every month.
```
> Example 2. Creating Schedule to Run at 10:00 on Last Sunday of January and July

```PowerShell
New-VBRMonthlyOptions -DayNumberInMonth Last -DayOfWeek Sunday -Period 10:00 -Months January, July
This command creates the schedule for a job to run at 10:00 on the last Sunday of January and July.
```

---

### Parameters
#### **DayNumberInMonth**
Specifies the number of day in month (for example, Saturday):
* First: the job will run on the first (Saturday) of selected months.
* Second: the job will run on the second (Saturday) of selected months.
* Third: the job will run on the third (Saturday) of selected months.
* Fourth: the job will run on the fourth (Saturday) of selected months.
* Last: the job will run on the last (Saturday) of selected months.
Default: Forth.
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
Specifies the day in month: 1-31, Last.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DayOfWeek**
Specifies the week day for the DayNumberInMonth parameter.
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

#### **Months**
Specifies the months on which the job will run: January, February, March, April, May, June, July, August, September, October, November, December.
Default: all months.
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

#### **Period**
Specifies the time when the job will start.
Default: 22:00.

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
New-VBRMonthlyOptions [-DayNumberInMonth {First | Second | Third | Fourth | Last | OnDay}] [-DayOfMonth <String>] [-DayOfWeek {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Months 
```
```PowerShell
{January | February | March | April | May | June | July | August | September | October | November | December}] [-Period <TimeSpan>] [<CommonParameters>]
```
