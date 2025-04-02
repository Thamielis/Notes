Set-VBRComputerGFSYearlyOptions
-------------------------------

### Synopsis
Modifies settings of a yearly GFS retention policy for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies settings of a yearly GFS retention policy for Veeam Agent backup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRComputerGFSYearlyOptions](New-VBRComputerGFSYearlyOptions)

---

### Examples
> Example 1. Modifying Number of Years for GFS Retention Policy

$options = New-VBRComputerGFSYearlyOptions -RetentionPeriod 2 -SelectedMonth November
Set-VBRComputerGFSYearlyOptions -Options $options -RetentionPeriod 3
This example shows how to modify a number of years to keep yearly backups. Veeam Backup & Replication will keep yearly backups for 3 years.
Perform the following steps:
1. Run the New-VBRComputerGFSYearlyOptions cmdlet. Specify the RetentionPeriod and the SelectedWeek parameter values. Save the result to the $options variable.
2. Run the Set-VBRComputerGFSYearlyOptions cmdlet. Set the $options variable as the Options parameter value. Specify the RetentionPeriod parameter value.
> Example 2. Modifying Month of Yearly Backup Schedule

$options = New-VBRComputerGFSYearlyOptions -RetentionPeriod 2 -SelectedMonth November
Set-VBRComputerGFSYearlyOptions -Options $options -SelectedMonth February
This example shows how to modify a month when a yearly backup is created. Veeam Backup & Replication will create yearly backups in February.
Perform the following steps:
1. Run the New-VBRComputerGFSYearlyOptions cmdlet. Specify the RetentionPeriod and the SelectedMonth parameter values. Save the result to the $options variable.
2. Run the Set-VBRComputerGFSYearlyOptions cmdlet. Set the $options variable as the Options parameter value. Set the February option for the SelectedMonth parameter.

---

### Parameters
#### **Options**
Specifies a yearly GFS retention policy for Veeam Agent backup jobs. The cmdlet will modify this policy.

|Type                           |Required|Position|PipelineInput |
|-------------------------------|--------|--------|--------------|
|`[VBRComputerGFSYearlyOptions]`|true    |named   |True (ByValue)|

#### **RetentionPeriod**
Specifies the number of months to keep yearly full backups.

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
Veeam.Backup.PowerShell.Infos.VBRComputerGFSYearlyOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerGFSYearlyOptions -Options <VBRComputerGFSYearlyOptions> [-RetentionPeriod <Int32>] [-SelectedMonth {January | February | March | April | May | June | July | August | September | October | 
```
```PowerShell
November | December}] [<CommonParameters>]
```
