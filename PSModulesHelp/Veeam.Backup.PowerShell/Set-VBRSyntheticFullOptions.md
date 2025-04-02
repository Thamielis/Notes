Set-VBRSyntheticFullOptions
---------------------------

### Synopsis
Modifies the synthetic full backup schedule for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies the synthetic full backup schedule for Veeam Agent backup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRSyntheticFullOptions](New-VBRSyntheticFullOptions)

* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

---

### Examples
> Modifying Synthetic Full Backup Schedule

$job = Get-VBRComputerBackupJob -Name "BackupJob"
$options = New-VBRSyntheticFullOptions -Enable -Days Friday
Set-VBRSyntheticFullOptions -Options $options -Enable -Days Wednesday Friday
This example shows how to modify a synthetic full backup schedule. Per these settings, the Veeam Agent backup job will backup computers on Wednesday and Friday.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRSyntheticFullOptions cmdlet. Provide the Enable parameter. Set the Friday option for Days parameter. Save the result to the $options variable.
3. Run the Set-VBRSyntheticFullOptions cmdlet. Set the $options variable as the Options parameter value. Provide the Enable parameter. Set the Friday and Wednesday options for Days parameter.

---

### Parameters
#### **Days**
Specifies the days of the week when the Veeam Agent backup job will create synthetic full backups.
Valid Values:

* Sunday
* Monday
* Tuesday
* Wednesday
* Thursday
* Friday
* Saturday

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[DayOfWeek[]]`|false   |named   |False        |

#### **Enable**
Enables the option for the Veeam Agent backup job to create synthetic full backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Options**
Specifies synthetic full backup settings that you want to modify.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[VBRSyntheticFullOptions]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSyntheticFullOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSyntheticFullOptions [-Days {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Enable] -Options <VBRSyntheticFullOptions> [<CommonParameters>]
```
