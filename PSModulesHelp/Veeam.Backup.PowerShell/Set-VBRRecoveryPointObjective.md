Set-VBRRecoveryPointObjective
-----------------------------

### Synopsis
Modifies an interval for backup copy jobs that process backups stored on external repositories.

---

### Description

This cmdlet modifies an interval for backup copy jobs that process backups stored on external repositories.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRRecoveryPointObjective](Get-VBRRecoveryPointObjective)

---

### Examples
> Modifying Backup Copy Interval

$job = Get-VBRJob -Name "EC2 BCJ 01"
$interval = Get-VBRRecoveryPointObjective -Job $job
$newinterval = Set-VBRRecoveryPointObjective -RecoveryPointObjective $interval -Value 5 -Unit Hour
This example shows how to modify the backup copy interval. The backup copy job will run every five hours.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRRecoveryPointObjective cmdlet. Set the $job variable as the Job parameter value. Save the result to the $interval variable.
3. Run the Set-VBRRecoveryPointObjective cmdlet. Specify the following settings:
- Set the $interval variable as the RecoveryPointObjective parameter value.
- Specify the Value parameter value.
- Set the Hour value for the Unit parameter.
Save the result to the $newinterval variable to apply the settings to the backup copy job.

---

### Parameters
#### **RecoveryPointObjective**
Specifies a schedule of a backup copy job that you want to modify.

|Type                         |Required|Position|PipelineInput |
|-----------------------------|--------|--------|--------------|
|`[VBRRecoveryPointObjective]`|true    |named   |True (ByValue)|

#### **StartTime**
For the daily option.
Specifies the start time for a backup copy job to run.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

#### **Unit**
Specifies the period of time for a backup copy job to run:
* Minute
* Hour
* Day
Valid Values:

* Minute
* Hour
* Day

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRRecoveryPointObjectiveUnit]`|false   |named   |False        |

#### **Value**
Specifies the number of times the backup copy job will copy new restore points.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRRecoveryPointObjective

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRRecoveryPointObjective -RecoveryPointObjective <VBRRecoveryPointObjective> [-StartTime <TimeSpan>] [-Unit {Minute | Hour | Day}] [-Value <Int32>] [<CommonParameters>]
```
