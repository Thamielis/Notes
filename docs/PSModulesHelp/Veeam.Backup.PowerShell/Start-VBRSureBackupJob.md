Start-VBRSureBackupJob
----------------------

### Synopsis
Starts SureBackup jobs.

---

### Description

This cmdlet starts the SureBackup job.
Run the Stop-VBRSureBackupJob cmdlet to stop the SureBackup job.

---

### Related Links
* [Get-VBRSureBackupJob](Get-VBRSureBackupJob)

---

### Examples
> Example 1. Starting SureBackup Jobs From Recent Restore Point

$job = Get-VBRSureBackupJob -Name "Job02"
Start-VBRSureBackupJob -Job $job
This example shows how to start the Job02 SureBackup job from the most recent restore point.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Start-VBRSureBackupJob cmdlet. Set the $job variable as the Job parameter value.
> Example 2. Starting SureBackup Jobs From Specified Restore Point

$job = Get-VBRSureBackupJob -Name "Job02"
$date = Get-Date -Year 2020 -Month 2 -Day 2 -Hour 0 -Minute 0 -Second 0
Start-VBRSureBackupJob -Job $job -DateTime "2/20/2020"
This example shows how to start the Job02 SureBackup job from the specified restore point.
Perform the following steps:
1. Run the Get-VBRSureBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $date variable.
3. Run the Start-VBRSureBackupJob cmdlet. Set the $job variable as the Job parameter value.  Set the $date variable as the DateTime parameter value.

---

### Parameters
#### **DateTime**
Specifies a restore point that is created by the SureBackup job. The cmdlet will start VMs backed up by the SureBackup job from the specified restore point.
Note: If you do not specify this parameter, the cmdlet will start VMs from the most recent restore point.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **Job**
Specifies a SureBackup job. The cmdlet will start that job.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRSureBackupJobBase]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RestorePointType**
Specifies one of the restore point types, AppConsisrent or CrashConsistent.
Valid Values:

* CrashConsistent
* ApplicationConsistent

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRSureBackupRestorePointType]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSureBackupJobBase

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRSureBackupJob [-DateTime <DateTime>] -Job <VBRSureBackupJobBase> [-RestorePointType {CrashConsistent | ApplicationConsistent}] [-RunAsync] [<CommonParameters>]
```
