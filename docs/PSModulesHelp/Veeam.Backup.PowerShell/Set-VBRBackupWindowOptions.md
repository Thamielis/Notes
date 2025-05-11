Set-VBRBackupWindowOptions
--------------------------

### Synopsis
Modifies job backup window settings.

---

### Description

This cmdlet modifies the job backup window settings. You can use it to extend the existing backup window or remove specific days and hours from it. To modify settings, you must specify new values for the necessary parameters.
To modify the backup windows settings, you must provide the PassThru parameter in your scripts. If you omit this parameter, the backup window settings will not be modified.
To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRBackupWindowOptions](New-VBRBackupWindowOptions)

* [Set-VBRJobSchedule](Set-VBRJobSchedule)

* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Removing Specific Hours from Backup Window

$job = Get-VBRJob -Name "Backup Job"
$windowoptions = New-VBRBackupWindowOptions -FromDay Monday -FromHour 10 -ToDay Thursday -ToHour 22 -Enabled
$windowoptions = Set-VBRBackupWindowOptions -Options $windowoptions -FromDay Tuesday -FromHour 10 -ToDay Wednesday -ToHour 12 -Enabled:$false -PassThru
Set-VBRJobSchedule -Job $job -PeriodicallySchedule $windowoptions -Periodicaly -FullPeriod 6 -PeriodicallyKind Hours
This example shows how to modify the job backup window settings. The cmdlet will specify the time when the backup job is not allowed to run.
- The New-VBRBackupWindowOptions cmdlet defines the following backup window settings: the job is allowed to run from 10:00 AM till 22.59 PM on Monday, Tuesday, Wednesday and Thursday.
- The Set-VBRBackupWindowOptions modifies these settings. The job is not allowed to run from 10.00 AM till 12.59 AM on Tuesday and Wednesday.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRBackupWindowOptions cmdlet. Specify the following settings:
- Specify the FromDay parameter value.
- Specify the FromHour parameter value.
- Specify the ToDay parameter value.
- Specify the ToHour parameter value.
- Provide the Enabled parameter.
Save the result to the $windowoptions variable.
3. Run the Set-VBRBackupWindowOptions cmdlet. Specify the following settings:
- Set the $windowoptions variable as the Options parameter value.
- Specify the FromDay parameter value.
- Specify the FromHour parameter value.
- Specify the ToDay parameter value.
- Specify the ToHour parameter value.
- Provide the $false value for the Enabled parameter.
- Provide the PassThru parameter.
Save the result to the $windowoptions variable.
4. Run the Set-VBRJobSchedule cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Set the $windowoptions variable as the PeriodicallySchedule parameter value.
- Provide the Periodicaly parameter.
- Specify the FullPeriod parameter value.
- Set the Hours option for the PeriodicallyKind parameter.
> Example 2. Extending Backup Window

$job = Get-VBRJob -Name "Backup Job"
$windowoptions = New-VBRBackupWindowOptions -FromDay Monday -FromHour 10 -ToDay Thursday -ToHour 22 -Enabled
$windowoptions = Set-VBRBackupWindowOptions -Options $windowoptions -FromDay Friday -FromHour 10 -ToDay Saturday -ToHour 12 -Enabled -PassThru
Set-VBRJobSchedule -Job $job -Periodicaly -FullPeriod 6 -PeriodicallyKind Hours -PeriodicallySchedule $windowoptions
This example shows how to modify the job backup window settings. The cmdlet will extend the backup window to specify when the backup job is allowed to run.
- The New-VBRBackupWindowOptions cmdlet defines the following backup window settings: the job is allowed to run from 10:00 AM till 22.59 PM on Monday, Tuesday, Wednesday and Thursday.  · The Set-VBRBackupWindowOptions modifies these settings.

- The Set-VBRBackupWindowOptions cmdlet modifies these settings. The backup window is extended from 10.00 AM till 12.59 AM on Friday and Saturday.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRBackupWindowOptions cmdlet. Specify the following settings:
- Specify the FromDay parameter value.
- Specify the FromHour parameter value.
- Specify the ToDay parameter value.
- Specify the ToHour parameter value.
- Provide the Enabled parameter.
Save the result to the $windowoptions variable.
3. Run the Set-VBRBackupWindowOptions cmdlet. Specify the following settings:
- Set the $windowoptions variable as the Options parameter value.
- Specify the FromDay parameter value.
- Specify the FromHour parameter value.
- Specify the ToDay parameter value.
- Specify the ToHour parameter value.
- Provide the Enabled parameter.
- Provide the PassThru parameter.
Save the result to the $windowoptions variable.
4. Run the Set-VBRJobSchedule cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Provide the Periodicaly parameter.
- Specify the FullPeriod parameter value.
- Set the Hours option for the PeriodicallyKind parameter.
- Set the $windowoptions variable as the PeriodicallySchedule parameter value.

---

### Parameters
#### **Enabled**
Defines that the cmdlet will extend the backup window or will remove specific days and hours from it.
If you set this parameter to the Enabled:$false value, the cmdlet will remove the specified time period from the backup window.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **FromDay**
Specifies the day of the week on which the backup window opens. The cmdlet will extend the backup window with this day or will remove that day from the backup window.
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
|`[DayOfWeek]`|true    |named   |False        |

#### **FromHour**
Specifies the hour on which the backup window opens. The cmdlet will add this hour to the existing backup window or will remove that hour from the backup window.
Default: 0.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **Options**
Specifies the backup window settings that you want to modify.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRBackupWindowOptions]`|true    |named   |True (ByPropertyName, ByValue)|

#### **PassThru**
Defines that the command will return the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ToDay**
Specifies the day of the week on which the backup window ends. The cmdlet will extend the backup window with this day or will remove that day from the backup window.
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
|`[DayOfWeek]`|true    |named   |False        |

#### **ToHour**
Specifies the hour on which the backup window ends. The cmdlet will add this hour to the existing backup window or will remove that hour from the backup window.
Default: 23.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRBackupWindowOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRBackupWindowOptions -Enabled -FromDay {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday} -FromHour <Int32> -Options <VBRBackupWindowOptions> [-PassThru] -ToDay {Sunday | Monday | 
```
```PowerShell
Tuesday | Wednesday | Thursday | Friday | Saturday} -ToHour <Int32> [<CommonParameters>]
```
