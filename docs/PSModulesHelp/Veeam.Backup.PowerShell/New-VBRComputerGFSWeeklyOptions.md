New-VBRComputerGFSWeeklyOptions
-------------------------------

### Synopsis
Defines settings of a weekly GFS retention policy for Veeam Agent backup jobs.

---

### Description

This cmdlet creates the VBRComputerGFSWeeklyOptions object. This object contains settings of a weekly GFS retention policy for Veeam Agent backup jobs.

---

### Examples
> Defining Weekly GFS Retention Policy

New-VBRComputerGFSWeeklyOptions -RetentionPeriod 3 -SelectedDay Wednesday
This command defines settings of a weekly GFS retention policy with the following settings:
- Veeam Backup & Replication will keep full backups for three weeks.
- Veeam Backup & Replication will create weekly backups every Wednesday.

---

### Parameters
#### **RetentionPeriod**
Specifies the number of weeks to keep weekly full backups.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SelectedDay**
Specifies a day of week when a weekly backup is created. You can specify either of the following day of a week:
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
New-VBRComputerGFSWeeklyOptions [-RetentionPeriod <Int32>] [-SelectedDay {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [<CommonParameters>]
```
