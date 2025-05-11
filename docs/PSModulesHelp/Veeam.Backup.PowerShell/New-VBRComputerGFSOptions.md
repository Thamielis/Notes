New-VBRComputerGFSOptions
-------------------------

### Synopsis
Defines settings of GFS retention for Veeam Agent backup jobs.

---

### Description

This cmdlet creates the VBRComputerGFSOptions object. This object contains settings of GFS retention for Veeam Agent backup jobs.
For more information on GFS retention, see the GFS Retention Policy section of the User Guide for VMware vSphere.

---

### Related Links
* [New-VBRComputerGFSWeeklyOptions](New-VBRComputerGFSWeeklyOptions)

* [New-VBRComputerGFSMonthlyOptions](New-VBRComputerGFSMonthlyOptions)

* [New-VBRComputerGFSYearlyOptions](New-VBRComputerGFSYearlyOptions)

---

### Examples
> Defining GFS Retention Policy for Veeam Agent Backup Jobs

$weekly = New-VBRComputerGFSWeeklyOptions -RetentionPeriod 3 -SelectedDay Wednesday
$monthly = New-VBRComputerGFSMonthlyOptions -RetentionPeriod 3 -SelectedWeek First
$yearly = New-VBRComputerGFSYearlyOptions -RetentionPeriod 2 -SelectedMonth November
New-VBRComputerGFSOptions -GFSWeeklyOptions $weekly -GFSMonthlyOptions $monthly -GFSYearlyOptions $yearly
This example shows how to define GFS retention for Veeam Agent backup jobs. The cmdlet will define the GFS retention with the following weekly, monthly and yearly settings:
- Weekly: every Wednesday, keep backups for 3 weeks.
- Monthly: every first week of the month, keep backups for 3 months.
- Yearly: every November, keep backups for 2 years.
Perform the following steps:
1. Run the New-VBRComputerGFSWeeklyOptions cmdlet. Specify the RetentionPeriod and the SelectedDay parameter values. Save the result to the $weekly variable.
2. Run the New-VBRComputerGFSMonthlyOptions cmdlet. Specify the RetentionPeriod and the SelectedWeek parameter values. Save the result to the $monthly variable.
3. Run the New-VBRComputerGFSYearlyOptions cmdlet. Specify the RetentionPeriod and the SelectedMonth parameter values. Save the result to the $yearly variable.
4. Run the New-VBRComputerGFSOptions cmdlet. Specify the following settings:
- Set the $weekly variable as the GFSWeeklyOptions parameter value.
- Set the $monthly variable as the GFSMonthlyOptions parameter value.
- Set the $yearly variable as the GFSYearlyOptions parameter value.

---

### Parameters
#### **GFSMonthlyOptions**
Specifies settings of a monthly GFS retention. The cmdlet will define GFS retention with these settings.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRComputerGFSMonthlyOptions]`|false   |named   |False        |

#### **GFSWeeklyOptions**
Specifies settings of a weekly GFS retention. The cmdlet will define GFS retention with these settings.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRComputerGFSWeeklyOptions]`|false   |named   |False        |

#### **GFSYearlyOptions**
Specifies settings of a yearly GFS retention policy. The cmdlet will define a GFS retention policy with these settings. Accepts the VBRComputerGFSYearlyOptions object. To create this object, run the New-VBRComputerGFSYearlyOptions cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRComputerGFSYearlyOptions]`|false   |named   |False        |

#### **ReadEntireRestorePoint**
Defines that the cmdlet will process the most recent restore point instead of waiting for the current backup file to become available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
New-VBRComputerGFSOptions [-GFSMonthlyOptions <VBRComputerGFSMonthlyOptions>] [-GFSWeeklyOptions <VBRComputerGFSWeeklyOptions>] [-GFSYearlyOptions <VBRComputerGFSYearlyOptions>] [-ReadEntireRestorePoint] 
```
```PowerShell
[<CommonParameters>]
```
