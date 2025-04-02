Sync-VBRSOBREntityState
-----------------------

### Synopsis
Synchronizes the state of backup chains on performance extents with the state of data on capacity and archive extents of a scale-out backup repositories.

---

### Description

This cmdlet synchronizes the state of backup chains on performance extents of scale-out backup repositories with the state of data on capacity and archive extents of scale-out backup repositories for the specific period of time.
Run the Get-VBRCapacityTierSyncInterval cmdlet to get details on the period of time when checkpoints in the capacity tier are available for synchronization.
Run the Get-VBRArchiveTierSyncInterval cmdlet to get details on the period of time when checkpoints in the archive tier are available for synchronization.

IMPORTANT! Use this cmdlet only with object storage that support the immutability option.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCapacityTierSyncInterval](Get-VBRCapacityTierSyncInterval)

* [Get-VBRBackup](Get-VBRBackup)

---

### Examples
> Example 1. Synchronizing Data for Specific Job

$job = Get-VBRJob -Name "BackupJob05"
Sync-VBRSOBREntityState -Job $job -PointInTime "2/20/2020 1:54:26 PM"

CreationTime : 2/20/2020 6:26:59 AM
EndTime      : 2/20/2020 6:28:24 AM
JobId        : 876cddc2-2879-484e-9680-7b5b2261fa30
Result       : Success
State        : Stopped
Id           : ae8fccee-78e5-4e73-a98d-0069fd61032f
This example shows how to synchronize data that is stored in the capacity extent for the BackupJob05 job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Sync-VBRSOBREntityState cmdlet. Set the $job variable as the Job parameter value. Specify the PointInTime parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: CreationTime, EndTime, JobId, Result, State and Id.
> Example 2. Synchronizing Data for Scale-Out Backup Repository

$repository = Get-VBRBackupRepository -ScaleOut
Get-VBRCapacityTierSyncInterval -Repository $repository
StartDateUtc                                                EndDateUtc
------------                                                ----------
2/20/2020 1:54:26 PM                                        2/20/2020 1:54:26 PM
Sync-VBRSOBREntityState -Repository $repository -PointInTime "2/20/2020 1:54:26 PM"
CreationTime : 2/20/2020 6:26:59 AM
EndTime      : 2/20/2020 6:28:24 AM
JobId        : 23e57bae-a759-42a2-a47e-06219ac410df
Result       : Success
State        : Stopped
Id           : 10957ec5-adc9-418c-a708-2f24ba11d40e
This example shows how to synchronize data that is stored in the capacity extent for the specified scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter value. Save the result to the $repository variable.
2. Run the Get-VBRCapacityTierSyncInterval cmdlet. Set the $repository variable as the Repository parameter value.
3. Run the Sync-VBRSOBREntityState cmdlet. Set the $repository variable as the Repository parameter value. Specify the PointInTime parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: CreationTime, EndTime, JobId, Result, State and Id.
> Example 3. Synchronizing Data for Specific Backup

$backup = Get-VBRBackup -Name "BackupJob05"
$date = Get-Date -Year 2020 -Month 2 -Day 2 -Hour 0 -Minute 0 -Second 0
Sync-VBRSOBREntityState -Backup $backup -PointInTime $date

CreationTime : 2/20/2020 6:26:59 AM
EndTime      : 2/20/2020 6:28:24 AM
JobId        : a1116d74-6d0e-4449-813e-08d094d355c1
Result       : Success
State        : Stopped
Id           : 3cb43bcc-86fc-48a2-b08b-c79d4bfb7183
This example shows how to synchronize data that is stored on extents for the specified backup.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $date variable.
3. Run the Sync-VBRSOBREntityState cmdlet. Set the $backup variable as the Backup parameter value. Set the $date variable as the PointInTime parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: CreationTime, EndTime, JobId, Result, State and Id.

---

### Parameters
#### **ArchiveTier**
Defines that the cmdlet will synchronize the state of backup chains on performance extents with the state of backup chains located in the archive tier.
If you do not provide this parameter, the cmdlet will synchronizes the state of backup chains on performance extents with the state of backup chains on the capacity extent.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Backup**
Specifies a backup. The cmdlet will synchronize data for a specified period in time from the capacity extent for these backups.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CBackup]`|true    |named   |False        |

#### **Job**
Specifies a job. The cmdlet will synchronize data for a specified period in time from the capacity extent for this job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[VBRJob]`|true    |named   |False        |

#### **PointInTime**
Specifies a period in time to which you want to restore data. The cmdlet will synchronize data from the capacity extent to the specified period.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |named   |False        |

#### **Repository**
Specifies a scale-out backup repository. The cmdlet will synchronize data for a specified period in time from the capacity extent for this repository.

|Type                           |Required|Position|PipelineInput|Aliases|
|-------------------------------|--------|--------|-------------|-------|
|`[VBRScaleOutBackupRepository]`|true    |named   |False        |SOBR   |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TenantBackupId**
Specifies a ID of the tenant backup.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **TenantId**
Specifies a tenant ID.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRSOBREntityState [-ArchiveTier] -Backup <CBackup> -PointInTime <DateTime> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Sync-VBRSOBREntityState [-ArchiveTier] -Job <VBRJob> -PointInTime <DateTime> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Sync-VBRSOBREntityState [-ArchiveTier] -PointInTime <DateTime> -Repository <VBRScaleOutBackupRepository> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Sync-VBRSOBREntityState [-ArchiveTier] -PointInTime <DateTime> -Repository <VBRScaleOutBackupRepository> [-RunAsync] -TenantId <Guid> [<CommonParameters>]
```
```PowerShell
Sync-VBRSOBREntityState [-ArchiveTier] -PointInTime <DateTime> [-RunAsync] -TenantBackupId <Guid> [<CommonParameters>]
```
