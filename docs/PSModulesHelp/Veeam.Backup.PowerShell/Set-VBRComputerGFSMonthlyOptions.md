Set-VBRComputerGFSMonthlyOptions
--------------------------------

### Synopsis
Modifies settings of a monthly GFS retention policy for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies settings of a monthly GFS retention policy for Veeam Agent backup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRComputerGFSMonthlyOptions](New-VBRComputerGFSMonthlyOptions)

---

### Examples
> Example 1. Modifying Number of Months for GFS Retention Policy

$options = New-VBRComputerGFSMonthlyOptions -RetentionPeriod 3 -SelectedWeek First
Set-VBRComputerGFSMonthlyOptions -Options $options -RetentionPeriod 5
This example shows how to modify a number of months to keep monthly backups. Veeam Backup & Replication will keep monthly backups for 5 months.
Perform the following steps:
1. Run the New-VBRComputerGFSMonthlyOptions cmdlet. Specify the RetentionPeriod and the SelectedWeek parameter values. Save the result to the $options variable.
2. Run the Set-VBRComputerGFSMonthlyOptions cmdlet. Set the $options variable as the Options parameter value. Specify the RetentionPeriod parameter value.
> Example 2. Modifying Day When Backup is Created

$options = New-VBRComputerGFSMonthlyOptions -RetentionPeriod 3 -SelectedWeek First
Set-VBRComputerGFSMonthlyOptions -Options $options -SelectedWeek Last
This example shows how to modify a week when a monthly backup is created. Veeam Backup & Replication will create monthly backups on the last week of a month.
Perform the following steps:
1. Run the New-VBRComputerGFSMonthlyOptions cmdlet. Specify the RetentionPeriod and the SelectedWeek parameter values. Save the result to the $options variable.
2. Run the Set-VBRComputerGFSMonthlyOptions cmdlet. Set the $options variable as the Options parameter value. Set the Last option for the SelectedWeek parameter.

---

### Parameters
#### **Options**
Specifies a monthly GFS retention policy for Veeam Agent backup jobs. The cmdlet will modify this policy.

|Type                            |Required|Position|PipelineInput |
|--------------------------------|--------|--------|--------------|
|`[VBRComputerGFSMonthlyOptions]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRComputerGFSMonthlyOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerGFSMonthlyOptions -Options <VBRComputerGFSMonthlyOptions> [-RetentionPeriod <Int32>] [-SelectedWeek {First | Last | Second | Third | Fourth | Fifth}] [<CommonParameters>]
```
