New-VBRFullBackupToTapePolicy
-----------------------------

### Synopsis
Creates schedule settings for creating virtual synthesized full backup for tape.

---

### Description

This cmdlet creates the VBRFullBackupToTapePolicy object.

The object contains schedule settings for creating virtual synthesized full backup for tape and is used further to apply these settings to an existing backup to tape job.

---

### Related Links
* [New-VBRMonthlyOptions](New-VBRMonthlyOptions)

---

### Examples
> Example - Creating Schedule Settings for Weekly Virtual Full Backup

```PowerShell
New-VBRFullBackupToTapePolicy -Type WeeklyOnDays -WeeklyOnDays Saturday
This example shows how to create schedule settings for weekly virtual full backup scheduled to run on Saturdays.
```

---

### Parameters
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
Specifies the virtual synthesized full backup creation type:
* Monthly: the virtual synthesized full backup is created on selected months. Use the MonthlyOptions parameter to set the months.
* WeeklyOnDays: the virtual synthesized full backup is created on selected days of week. Use the WeeklyOnDays parameter to set the days.
Default: WeeklyOnDays.
Valid Values:

* Monthly
* WeeklyOnDays

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRFullBackupToTapePolicyType]`|false   |named   |False        |

#### **WeeklyOnDays**
Used to set days of week for the Type parameter (WeeklyOnDays option).
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
New-VBRFullBackupToTapePolicy [-MonthlyOptions <VBRMonthlyOptions>] [-Type {Monthly | WeeklyOnDays}] [-WeeklyOnDays {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [<CommonParameters>]
```
