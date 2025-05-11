New-VBRDailyOptions
-------------------

### Synopsis
Creates new job daily schedule settings.

---

### Description

This cmdlet creates the VBRDailyOptions object. This object contains job daily schedule settings.  You can use this object to set job schedule.

---

### Examples
> Example 1. Creating Schedule for Every Friday

$fridayoptions = New-VBRDailyOptions -DayOfWeek Friday -Period 23:00
This example shows how to create schedule with the following settings: every Friday at 23:00.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek parameter value. Specify the Period parameter value.
2. Save the result to the $fridayoptions variable.
> Example 2. Creating Schedule for Everyday

$everydayoptions = New-VBRDailyOptions -Type Everyday -Period 20:00
This example shows how to create schedule with the following settings: everyday at 20:00.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the Type parameter value. Specify the Period parameter value.
2. Save the result to the $everydayoptions variable.
> Example 3. Creating Schedule for Weekends

$weekendoptions = New-VBRDailyOptions -DayOfWeek Saturday, Sunday
This example shows how to create schedule with the following settings: on weekends at 18:00.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek parameter value.
2. Save the result to the $weekendoptions variable.

---

### Parameters
#### **DayOfWeek**
Specifies the day of week when the job will run.
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

#### **Period**
Specifies the time when the job will start.
Default: 18:00.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

#### **Type**
Specifies the job schedule type:
* Everyday: the job will run every day.
* WeekDays: the job will run Monday to Friday.
* SelectedDays: the job will run on selected days. Use the DaysOfWeek parameter to set the days.
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
New-VBRDailyOptions [-DayOfWeek {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Period <TimeSpan>] [-Type {Everyday | WeekDays | SelectedDays}] [<CommonParameters>]
```
