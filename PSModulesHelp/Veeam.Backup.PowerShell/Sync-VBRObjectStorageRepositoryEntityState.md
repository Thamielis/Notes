Sync-VBRObjectStorageRepositoryEntityState
------------------------------------------

### Synopsis
Rolls back checkpoints located in object storage repositories to the previous state.

---

### Description

This cmdlet rolls back checkpoints in object storage repositories to the previous state. You may can run this cmdlet if a specific checkpoint in your object storage repository is corrupted and you want to revert back to the previous checkpoint.
Consider the following:
- Run this cmdlet only with checkpoints located in object storage repositories that support the immutability option.
- Do not run this cmdlet with checkpoints located in object storage repositories added as a performance tier of a scale-out backup repository.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRCapacityTierSyncInterval](Get-VBRCapacityTierSyncInterval)

---

### Examples
> Example 1. Rolling Back Checkpoints Created by Specific Job

$job = Get-VBRJob -Name "BackupJob05"
Sync-VBRObjectStorageRepositoryEntityState -Job $job -PointInTime "2/20/2020 1:54:26 PM"

CreationTime : 2/20/2020 6:26:59 AM
EndTime      : 2/20/2020 6:28:24 AM
JobId        : 876cddc2-2879-484e-9680-7b5b2261fa30
Result       : Success
State        : Stopped
Id           : ae8fccee-78e5-4e73-a98d-0069fd61032f
This example shows how to roll back checkpoints created by the BackupJob05 job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Sync-VBRObjectStorageRepositoryEntityState cmdlet. Set the $job variable as the Job parameter value. Specify the PointInTime parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: CreationTime, EndTime, JobId, Result, State and Id.
> Example 2. Rolling Back Checkpoints Located in Specific Object Storage Repository

$repository = Get-VBRObjectStorageRepository -Name "Amazon S3"
StartDateUtc                                                EndDateUtc
------------                                                ----------
2/20/2020 1:54:26 PM                                        2/20/2020 1:54:26 PM
Sync-VBRObjectStorageRepositoryEntityState -Repository $repository -PointInTime "2/20/2020 1:54:26 PM"

CreationTime : 2/20/2020 6:26:59 AM
EndTime      : 2/20/2020 6:28:24 AM
JobId        : 23e57bae-a759-42a2-a47e-06219ac410df
Result       : Success
State        : Stopped
Id           : 10957ec5-adc9-418c-a708-2f24ba11d40e
This example shows how to roll back checkpoints located in the Amazon S3 object storage repository.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBRCapacityTierSyncInterval cmdlet. Set the $repository variable as the Repository parameter value.
3. Run the Sync-VBRObjectStorageRepositoryEntityState cmdlet. Set the $repository variable as the Repository parameter value. Specify the PointInTime parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: CreationTime, EndTime, JobId, Result, State and Id.
> Example 3. Synchronizing Data for Specific Backup

$backup = Get-VBRBackup -Name "BackupJob05"
$date = Get-Date -Year 2020 -Month 2 -Day 2 -Hour 0 -Minute 0 -Second 0
Sync-VBRObjectStorageRepositoryEntityState -Backup $backup -PointInTime $date

CreationTime : 2/20/2020 6:26:59 AM
EndTime      : 2/20/2020 6:28:24 AM
JobId        : a1116d74-6d0e-4449-813e-08d094d355c1
Result       : Success
State        : Stopped
Id           : 3cb43bcc-86fc-48a2-b08b-c79d4bfb7183
This example shows how to roll back checkpoints for the specified backup.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $date variable.
3. Run the Sync-VBRObjectStorageRepositoryEntityState cmdlet. Set the $backup variable as the Backup parameter value. Set the $date variable as the PointInTime parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: CreationTime, EndTime, JobId, Result, State and Id.

---

### Parameters
#### **Backup**
Specifies a backup. The cmdlet will roll back a checkpoint added to this backup.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CBackup]`|true    |named   |False        |

#### **Job**
Specifies a job. The cmdlet will roll back a checkpoint created by this job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[VBRJob]`|true    |named   |False        |

#### **PointInTime**
Specifies a period in time to which you want to roll back a checkpoint.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |named   |False        |

#### **Repository**
Specifies a? object storage repository. The cmdlet will roll back checkpoints located in this repository.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRObjectStorageRepository]`|true    |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TenantBackupId**
Specifies an ID of the cloud tenant backup. The cmdlet will roll back a checkpoint added to this backup.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **TenantId**
Specifies an ID of the cloud tenant. The cmdlet will roll back a checkpoint created by this tenant.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

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
Sync-VBRObjectStorageRepositoryEntityState -Backup <CBackup> -PointInTime <DateTime> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Sync-VBRObjectStorageRepositoryEntityState -Job <VBRJob> -PointInTime <DateTime> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Sync-VBRObjectStorageRepositoryEntityState -PointInTime <DateTime> -Repository <VBRObjectStorageRepository> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Sync-VBRObjectStorageRepositoryEntityState -PointInTime <DateTime> -Repository <VBRObjectStorageRepository> [-RunAsync] -TenantId <Guid> [<CommonParameters>]
```
```PowerShell
Sync-VBRObjectStorageRepositoryEntityState -PointInTime <DateTime> [-RunAsync] -TenantBackupId <Guid> [<CommonParameters>]
```
