New-VBRComputerGFSYearlyOptions
-------------------------------

### Synopsis
Defines settings of a yearly GFS retention policy for Veeam Agent backup jobs.

---

### Description

This cmdlet creates the VBRComputerGFSMonthlyOptions object. This object contains settings of a yearly GFS retention policy for Veeam Agent backup jobs.

---

### Examples
> Defining Yearly GFS Retention Policy

New-VBRComputerGFSYearlyOptions -RetentionPeriod 2 -SelectedMonth November
This command defines a yearly GFS retention policy with the following settings:
- Veeam Backup & Replication will keep yearly full backups for 2 years.
- Veeam Backup & Replication will create yearly backups on November.

---

### Parameters
#### **RetentionPeriod**
Specifies the number of years to keep yearly full backups.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SelectedMonth**
Specifies a month when a yearly backup is created. You can specify either of the following months:
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

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[VBRMonth]`|false   |named   |False        |

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
New-VBRComputerGFSYearlyOptions [-RetentionPeriod <Int32>] [-SelectedMonth {January | February | March | April | May | June | July | August | September | October | November | December}] [<CommonParameters>]
```
