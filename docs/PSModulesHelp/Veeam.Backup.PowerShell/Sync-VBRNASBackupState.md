Sync-VBRNASBackupState
----------------------

### Synopsis
Rolls back file share backups stored on an immutable short-term repository to a point in time state.

---

### Description

This cmdlet rolls back file share backups stored on an immutable short-term repository to a point in time state.

---

### Related Links
* [Get-VBRNASBackupJob](Get-VBRNASBackupJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRNASBackup](Get-VBRNASBackup)

---

### Examples
> Example 1. Rolling Back File Share Backups Created by Certain Job

$fileJob = Get-VBRNASBackupJob -Name "SMB Backup"
$time = Get-Date-Year 2020 -Month 2 -Day 2 -Hour 0 -Minute 0 -Second 0
Sync-VBRNASBackupState -Job $fileJob -PointInTime $time
This example shows how to roll back file share backups to a point in time. The file share backups created by the "SMB Backup" file backup jobs.

Perform the following steps:
1. Run the Get-VBRNASBackupJob cmdlet. Specify the Name parameter value. Save the result to the $fileJob variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $time variable.
3. Run the Sync-VBRNASBackupState cmdlet. Set the $fileJob variable as the Job parameter value. Set the $time variable as the PointInTime parameter value.
> Example 2. Rolling Back File Share Backups Stored in Certain Immutable Backup Repository

$repository = Get-VBRBackupRepository -Name "Repository 01"
$time = Get-Date-Year 2020 -Month 2 -Day 2 -Hour 0 -Minute 0 -Second 0
Sync-VBRNASBackupState -Job $fileJob -Repository $time
This example shows how to roll back file share backups to a point in time. The file share backups stored in the Repository 01 immutable backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $time variable.
3. Run the Sync-VBRNASBackupState cmdlet. Set the $repository variable as the Repository parameter value. Set the $time variable as the PointInTime parameter value.
> Example 3. Rolling Back Certain File Share Backups to Point in Time

$backup = Get-VBRNASBackup -Name "Reports backup"
$time = Get-Date-Year 2020 -Month 2 -Day 2 -Hour 0 -Minute 0 -Second 0
Sync-VBRNASBackupState -Backup $backup -PointInTime $time
This example shows how to roll back the Reports backup file share backup to a point in time.
Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Specify the Name parameter value. Save the result to the $fileJob variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $time variable.
3. Run the Sync-VBRNASBackupState cmdlet. Set the $backup variable as the Backup parameter value. Set the $time variable as the PointInTime parameter value.

---

### Parameters
#### **AllowDetach**
Defines that if the backup has restore points archived in the long-term repository or backup copies that cannot be rolled back, these restore points will be detached from the backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Backup**
Specifies the file share backup.  The cmdlet will roll back this backup to a point in time. Accepts the VBRNASBackup object. To get this object, run the Get-VBRNASBackup cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRNASBackup]`|true    |named   |False        |

#### **Force**
Defines that the cmdlet will roll backups without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the file share backup job.  The cmdlet will roll back file share backups created with this job to a point in time. Accepts the VBRNASBackupJob object. To create this object, run the Get-VBRNASBackupJob cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRNASBackupJob]`|true    |named   |False        |

#### **PointInTime**
Specifies the point in time. The cmdlet will select the restore point that is the closest to the selected point in time. For example, if you specify Thursday, October 25, 2018 3:25:45 PM as the point in time, the cmdlet will select the closest restore point to this point in time. Note: The date format depends on the date format of the OS where you run the script.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |named   |False        |

#### **Repository**
Specifies the backup repository. The cmdlet will roll back file share backups stored in this immutable backup repository to a point in time. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRNASBackupState [-AllowDetach] -Backup <VBRNASBackup> [-Force] -PointInTime <DateTime> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Sync-VBRNASBackupState [-AllowDetach] [-Force] -Job <VBRNASBackupJob> -PointInTime <DateTime> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Sync-VBRNASBackupState [-AllowDetach] [-Force] -PointInTime <DateTime> -Repository <CBackupRepository> [-RunAsync] [<CommonParameters>]
```
