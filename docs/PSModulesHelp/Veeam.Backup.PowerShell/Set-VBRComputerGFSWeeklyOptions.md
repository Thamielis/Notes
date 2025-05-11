Set-VBRComputerGFSWeeklyOptions
-------------------------------

### Synopsis
Modifies settings of a weekly GFS retention policy for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies settings of a weekly GFS retention policy for Veeam Agent backup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRComputerGFSWeeklyOptions](New-VBRComputerGFSWeeklyOptions)

---

### Examples
> Example 1. Modifying Number of Weeks for GFS Retention Policy

$options = New-VBRComputerGFSWeeklyOptions -RetentionPeriod 3 -SelectedDay Wednesday
Set-VBRComputerGFSWeeklyOptions -Options $options -RetentionPeriod 5
This example shows how to modify a number of weeks to keep weekly backups. Veeam Backup & Replication will keep weekly backups for 5 days.
Perform the following steps:
1. Run the New-VBRComputerGFSWeeklyOptions cmdlet. Specify the RetentionPeriod and the SelectedDay parameter values. Save the result to the $options variable.
2. Run the Set-VBRComputerGFSWeeklyOptions cmdlet. Set the $options variable as the Options parameter value. Specify the RetentionPeriod parameter value.
> Example 2. Modifying Day When Backup is Created

$options = New-VBRComputerGFSWeeklyOptions -RetentionPeriod 3 -SelectedDay Wednesday
Set-VBRComputerGFSWeeklyOptions -Options $options -SelectedDay Tuesday
This example shows how to modify a day of a week when a weekly backup is created. Veeam Backup & Replication will create weekly backups on Tuesday.
Perform the following steps:
1. Run the New-VBRComputerGFSWeeklyOptions cmdlet. Specify the RetentionPeriod and the SelectedDay parameter values. Save the result to the $options variable.
2. Run the Set-VBRComputerGFSWeeklyOptions cmdlet. Set the $options variable as the Options parameter value. Set the Tuesday option for the SelectedDay parameter.

---

### Parameters
#### **Options**
Specifies a weekly GFS retention policy for Veeam Agent backup jobs. The cmdlet will modify this policy.

|Type                           |Required|Position|PipelineInput |
|-------------------------------|--------|--------|--------------|
|`[VBRComputerGFSWeeklyOptions]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRComputerGFSWeeklyOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerGFSWeeklyOptions -Options <VBRComputerGFSWeeklyOptions> [-RetentionPeriod <Int32>] [-SelectedDay {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [<CommonParameters>]
```
