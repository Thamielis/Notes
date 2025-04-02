New-VBRBackupWindowOptions
--------------------------

### Synopsis
Defines backup window settings for a job.

---

### Description

This cmdlet creates the VBRBackupWindowOptions object. This object contains backup window settings for a job. These settings define a time interval within which the job must be completed. You can apply these settings to a job.
For more information on the backup windows option, see the Backup Window section in the User Guide for VMware vSphere.
Run the Set-VBRJobSchedule cmdlet to apply backup window settings to the backup, replication or backup copy job.
Run the New-VBRBackupToTapeScheduleOption cmdlet to apply backup window settings to a backup to tape job.

---

### Related Links
* [Set-VBRJobSchedule](Set-VBRJobSchedule)

* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Defining Backup Window Settings

```PowerShell
$windowoptions = New-VBRBackupWindowOptions -FromDay Monday -ToDay Friday -FromHour 20 -ToHour 22 -Enabled
This command defines backup window settings that will allow a job to run from 20:00 to 22:59 every day from Monday to Friday.
```
> Example 2. Defining Backup Window Settings for Specific Period of Time

$windowoptions = New-VBRBackupWindowOptions -FromDay Friday -FromHour 22 -ToDay Saturday -ToHour 22 -Enabled
This command defines backup window settings that will allow a job to run during the following period of time:
- From 22:00 to 22:59 on Friday
- From 22:00 to 22:59 on Saturday
> Example 3. Defining Period of Time When Job must not Run

```PowerShell
$windowoptions = New-VBRBackupWindowOptions -FromDay Monday -FromHour 08 -ToDay Friday -ToHour 20
This command defines backup window settings for a job. These settings specify the period of time when the job must not run.
According to these setting the job is not allowed to run from 08:00 to 20:59 on weekdays.
```
> Example 4. Modifying Schedule Settings of Existing Job

$windowoptions = New-VBRBackupWindowOptions -FromDay Friday -FromHour 19 -ToDay Sunday -ToHour 07 -Enabled
$job = Get-VBRJob -Name "SQL Backup Job"
Set-VBRJobSchedule -Job $job -Periodicaly -FullPeriod 6 -PeriodicallyKind Hours -PeriodicallySchedule $windowoptions
This example shows how to modify schedule settings of an existing job. The job is allowed to run from 07:00 to 19:59 every day from Sunday to Monday except for Saturday.
Perform the following steps:
1. Run the New-VBRBackupWindowOptions cmdlet. Specify the following settings:
- Specify the FromDay parameter value.
- Specify the FromHour parameter value.
- Specify the ToDay parameter value.
- Specify the ToHour parameter value.
- Provide the Enabled parameter.
Save the result to the $windowoptions variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
3. Run the Set-VBRJobSchedule cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Provide the Periodicaly parameter.
- Specify the FullPeriod parameter value.
- Set the Hours option for the PeriodicallyKind parameter.
- Set the $windowoptions as the PeriodicallySchedule parameter value.

---

### Parameters
#### **Enabled**
Defines that the cmdlet will enable the backup window.
If you provide this parameter, the period that you set for a backup window will specify the time when the job is allowed to run.
Otherwise, the period that you set for a backup window will specify the time when the job is not allowed to run.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

#### **FromDay**
Specifies the day of week on which the backup window opens.
Default: Sunday.
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

#### **FromHour**
Specifies an hour when the backup window opens.
Default: 0.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ToDay**
Specifies the day of week on which the backup window closes.
Default: Saturday.
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

#### **ToHour**
Specifies an hour when the backup window closes.
NOTE: The backup windows closes at the end of an hour that you specify in the ToHour parameter.
For example, if you specify the 22 value for the ToHour parameter, the backup window will end at 22:59.
Default: 23.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRBackupWindowOptions [-Enabled] [-FromDay {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-FromHour <Int32>] [-ToDay {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | 
```
```PowerShell
Saturday}] [-ToHour <Int32>] [<CommonParameters>]
```
