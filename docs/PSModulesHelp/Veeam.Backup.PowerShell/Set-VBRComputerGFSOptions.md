Set-VBRComputerGFSOptions
-------------------------

### Synopsis
Modifies settings of GFS retention for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies settings of GFS retention for Veeam Agent backup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRComputerGFSWeeklyOptions](New-VBRComputerGFSWeeklyOptions)

* [New-VBRComputerGFSOptions](New-VBRComputerGFSOptions)

* [New-VBRComputerGFSMonthlyOptions](New-VBRComputerGFSMonthlyOptions)

* [New-VBRComputerGFSYearlyOptions](New-VBRComputerGFSYearlyOptions)

---

### Examples
> Example 1. Enabling Monthly GFS Retention Policy

$weekly = New-VBRComputerGFSWeeklyOptions -RetentionPeriod 3 -SelectedDay Wednesday
$options = New-VBRComputerGFSOptions -GFSWeeklyOptions $weekly
$monthly = New-VBRComputerGFSMonthlyOptions -RetentionPeriod 2 -SelectedWeek Last
Set-VBRComputerGFSOptions -GFSOptions $options -EnableGFSMonthlyBackup -GFSMonthlyOptions $monthly
This example shows how to enable the monthly retention policy to create backups on the last week of every month and will keep them for 2 months.
Perform the following steps:
1. Define the GFS Retention Policy:
a. Run the New-VBRComputerGFSWeeklyOptions cmdlet. Specify the RetentionPeriod and the SelectedDay parameter values. Save the result to the $weekly variable.
b. Run the New-VBRComputerGFSOptions cmdlet. Set the $weekly variable as the GFSWeeklyOptions parameter value. Save the result to the $options variable.
2. Run the New-VBRComputerGFSMonthlyOptions cmdlet. Specify the RetentionPeriod and the SelectedWeek parameter values. Save the result to the $monthly variable.
3. Run the Set-VBRComputerGFSOptions cmdlet. Specify the following settings:
- Set the $options variable as the GFSOptions parameter value.
- Provide the EnableGFSMonthlyBackup parameter.
- Set the $monthly variable as the GFSMonthlyOptions parameter value.
> Example 2. Enabling Yearly GFS Retention Policy

$weekly = New-VBRComputerGFSWeeklyOptions -RetentionPeriod 3 -SelectedDay Wednesday
$options = New-VBRComputerGFSOptions -GFSWeeklyOptions $weekly
$yearly = New-VBRComputerGFSYearlyOptions -RetentionPeriod 2 -SelectedMonth November
Set-VBRComputerGFSOptions -GFSOptions $options -EnableGFSYearlyBackup -GFSYearlyOptions $yearly
This example shows how to enable the yearly retention policy to create backups on November and will keep them for 2 years.
Perform the following steps:
1. Define the GFS Retention Policy:
a. Run the New-VBRComputerGFSWeeklyOptions cmdlet. Specify the RetentionPeriod and the SelectedDay parameter values. Save the result to the $weekly variable.
b. Run the New-VBRComputerGFSOptions cmdlet. Set the $weekly variable as the GFSWeeklyOptions parameter value. Save the result to the $options variable.
2. Run the New-VBRComputerGFSYearlyOptions cmdlet. Specify the RetentionPeriod and the SelectedMonth parameter values. Save the result to the $yearly variable.
3. Run the Set-VBRComputerGFSOptions cmdlet. Specify the following settings:
- Set the $options variable as the GFSOptions parameter value.
- Provide the EnableGFSYearlyBackup parameter.
- Set the $yearly variable as the GFSYearlyOptions parameter value.

---

### Parameters
#### **EnableGFSMonthlyBackup**
Defines that the cmdlet will enable a monthly GFS retention policy. If you do not provide this parameter, the cmdlet will not change the settings of a monthly GFS retention policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableGFSWeeklyBackup**
Defines that the cmdlet will enable a weekly GFS retention policy. If you do not provide this parameter, the cmdlet will not change the settings of weekly GFS retention policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableGFSYearlyBackup**
Defines that the cmdlet will enable a yearly GFS retention policy. If you do not provide this parameter, the cmdlet will not change the settings of a yearly GFS retention policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GFSMonthlyOptions**
Specifies settings of a monthly GFS retention policy. The cmdlet will define GFS retention with these settings.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRComputerGFSMonthlyOptions]`|false   |named   |False        |

#### **GFSOptions**
Specifies GFS retention. The cmdlet will modify this policy.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRComputerGFSOptions]`|true    |named   |True (ByValue)|

#### **GFSWeeklyOptions**
Specifies settings of a weekly GFS retention policy. The cmdlet will define GFS retention with these settings.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRComputerGFSWeeklyOptions]`|false   |named   |False        |

#### **GFSYearlyOptions**
Specifies settings of a yearly GFS retention policy. The cmdlet will define GFS retention with these settings.

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
Veeam.Backup.PowerShell.Infos.VBRComputerGFSOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerGFSOptions [-EnableGFSMonthlyBackup] [-EnableGFSWeeklyBackup] [-EnableGFSYearlyBackup] [-GFSMonthlyOptions <VBRComputerGFSMonthlyOptions>] -GFSOptions <VBRComputerGFSOptions> [-GFSWeeklyOptions 
```
```PowerShell
<VBRComputerGFSWeeklyOptions>] [-GFSYearlyOptions <VBRComputerGFSYearlyOptions>] [-ReadEntireRestorePoint] [<CommonParameters>]
```
