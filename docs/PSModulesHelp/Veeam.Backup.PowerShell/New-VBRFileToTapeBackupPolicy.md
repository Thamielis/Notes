New-VBRFileToTapeBackupPolicy
-----------------------------

### Synopsis
Creates schedule settings for a file to tape job.

---

### Description

This cmdlet creates the VBRFileToTapeBackupPolicy object.

The object contains backup creation schedule settings for file to tape job and is used further to apply these settings to an existing file to tape job.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

* [New-VBRMonthlyOptions](New-VBRMonthlyOptions)

---

### Examples
> Example - Creating Monthly Job Schedule for File to Tape Jobs

$monthlyoptions = New-VBRMonthlyOptions -DayNumberInMonth Last -DayOfWeek Sunday Period 22:00
New-VBRFileToTapeBackupPolicy -Type Monthly -MonthlyOptions $monthlyoptions -Enabled
This example shows how to create file to tape job schedule to run on last Sunday on 22:00 every month. The schedule is enabled.

Perform the following steps:
1. Run the New-VBRMonthlyOptions cmdlet. Specify the DayNumberInMonth, DayOfWeek and the Period parameter values. Save the result to the $monthlyoptions variable.
2. Run the New-VBRFileToTapeBackupPolicy cmdlet. Set the Monthly option for the Type parameter. Set the $monthlyoptions variable as the MonthlyOptions parameter value. Provide the Enabled parameter.

---

### Parameters
#### **DailyOptions**
Used to set days for the Type parameter (Daily option). Accepts the VBRDailyOptions object. The following settings are used by default: Type: SelectedDays, Period: 18:00, DayOfWeek: Saturday

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **Enabled**
Defines if this schedule is enabled. Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MonthlyOptions**
Used to set months for the Type parameter (Monthly option). Accepts the VBRMonthlyOptions object. The following settings are used by default:
* Period: 22:00
* DayNumberInMonth: Fourth
* DayOfWeek: Saturday
* Months: January, February, March, April, May, June, July, August, September, October, November, December.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRMonthlyOptions]`|false   |named   |False        |

#### **Type**
Specifies the backup creation schedule type:
* Daily: the target files will be archived on selected days. Use the DailyOptions parameter to set the days.
* Monthly: the target files will be archived on selected months. Use the MonthlyOptions parameter to set the months.
Default: Daily.
Valid Values:

* Daily
* Monthly

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRFileToTapeBackupPolicyType]`|false   |named   |False        |

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
New-VBRFileToTapeBackupPolicy [-DailyOptions <VBRDailyOptions>] [-Enabled] [-MonthlyOptions <VBRMonthlyOptions>] [-Type {Daily | Monthly}] [<CommonParameters>]
```
