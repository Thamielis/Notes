New-VBRComputerGFSMonthlyOptions
--------------------------------

### Synopsis
Specifies settings of a monthly GFS retention policy for Veeam Agent backup jobs.

---

### Description

This cmdlet creates the VBRComputerGFSMonthlyOptions object.This object contains settings of a monthly GFS retention policy for Veeam Agent backup jobs.

---

### Examples
> Example 1. Defining Monthly GFS Retention Policy to Create Backups on First Week

New-VBRComputerGFSMonthlyOptions -RetentionPeriod 3 -SelectedWeek First
This command defines monthly GFS retention policy with the following settings:
- Veeam Backup & Replication will keep monthly backups for 3 weeks.
- Veeam Backup & Replication will create monthly backups on the first week of the month.
> Example 2. Defining Monthly GFS Retention Policy to Create Backups on Last Week

New-VBRComputerGFSMonthlyOptions -RetentionPeriod 3 -SelectedWeek Last
This command defines monthly GFS retention policy with the following settings:
- Veeam Backup & Replication will keep monthly backups for 3 weeks.
- Veeam Backup & Replication will create monthly backups on the last week of the month.

---

### Parameters
#### **RetentionPeriod**
Specifies the number of months to keep monthly full backups.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SelectedWeek**
Specifies a week of a month when a monthly backup is created. You can specify either of the following weeks:
* First - the cmdlet will create the monthly backup in the first week of the month.
* Last - the cmdlet will create the monthly backup in the last week of the month.
Valid Values:

* First
* Last
* Second
* Third
* Fourth
* Fifth

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRWeekOfMonth]`|false   |named   |False        |

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
New-VBRComputerGFSMonthlyOptions [-RetentionPeriod <Int32>] [-SelectedWeek {First | Last | Second | Third | Fourth | Fifth}] [<CommonParameters>]
```
