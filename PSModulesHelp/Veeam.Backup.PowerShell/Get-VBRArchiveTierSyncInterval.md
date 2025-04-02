Get-VBRArchiveTierSyncInterval
------------------------------

### Synopsis
Returns a time period of checkpoints in the archive tier that are available for synchronization.

---

### Description

This cmdlet returns a time period of checkpoints in the archive tier that are available for synchronization.
You may want to run this cmdlet before you synchronize the state of backup chains with the state of backup chains on the archive tier for the specific period of time.
When you synchronize the state of backup chains with state of backup chains on the archive tier, the state of backup chains on the capacity tier does not change.
Run the Sync-VBRSOBREntityState cmdlet to synchronize the state of the backup chains.
IMPORTANT! Use this cmdlet only with archive storage that support the immutability option.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRJob](Get-VBRJob)

* [Get-VBRBackup](Get-VBRBackup)

---

### Examples
> Example 1. Getting Time Period for all Checkpoints Available on Archive Tier

$repository = Get-VBRBackupRepository -ScaleOut
Get-VBRArchiveTierSyncInterval -Repository $repository

StartDateUtc                                                EndDateUtc
------------                                                ----------
2/20/2020 1:54:26 PM                                        2/20/2020 1:54:26 PM
This example shows how to get a time period with contains checkpoints on archive tier that are available for synchronization.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter value. Save the result to the $repository variable.
2. Run the Get-VBRArchiveTierSyncInterval cmdlet. Set the $repository variable as the Repository parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: StartDateUtc and EndDateUtc.
> Example 2. Getting Time Period of Checkpoints for Specific Job

$repository = Get-VBRBackupRepository -ScaleOut
$job = Get-VBRJob -Name "Backup05"
Get-VBRArchiveTierSyncInterval -Repository $repository -Job $job

StartDateUtc                                                EndDateUtc
------------                                                ----------
2/20/2020 1:54:26 PM                                        2/20/2020 1:54:26 PM
This example shows how to get a time period that contains checkpoints on archive tier that you can synchronize for the Backup05 job.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter value. Save the result to the $repository variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
3. Run the Get-VBRArchiveTierSyncInterval cmdlet. Set the $repository variable as the Repository parameter value. Set the $job variable as the Job parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: StartDateUtc and EndDateUtc.
> Example 3. Getting Time Period of Checkpoints for Specific Backup

$repository = Get-VBRBackupRepository -ScaleOut
$backup = Get-VBRBackup -Name "Report05"
Get-VBRArchiveTierSyncInterval -Repository <VBRScaleOutBackupRepository> -Backup $backup

StartDateUtc                                                EndDateUtc
------------                                                ----------
2/20/2020 1:54:26 PM                                        2/20/2020 1:54:26 PM
This example shows how to get a time period that contains details on checkpoints on archive tier that you can synchronize for the Report05 backup.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter value. Save the result to the $repository variable.
2. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
3. Run the Get-VBRArchiveTierSyncInterval cmdlet. Set the $repository variable as the Repository parameter value. Set the $backup variable as the Backup parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: StartDateUtc and EndDateUtc.

---

### Parameters
#### **Backup**
Specifies a backup. The cmdlet will return a time period that contains checkpoints on the archive tier for this backup.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[CBackup]`|true    |named   |True (ByPropertyName)|

#### **Job**
Specifies a job. The cmdlet will return a time period that contains checkpoints on the archive tier for this job.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[VBRJob]`|true    |named   |True (ByPropertyName)|

#### **Repository**
Specifies a scale-out backup repository. The cmdlet will return a time period that contains checkpoints that were moved from this scale-out backup repository but are still available on the archive tier.

|Type                           |Required|Position|PipelineInput                 |Aliases|
|-------------------------------|--------|--------|------------------------------|-------|
|`[VBRScaleOutBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|SOBR   |

#### **TenantBackupId**
Specifies an ID of the cloud tenant backup. The cmdlet will return a time period that contains checkpoints on the archive tier for this backup.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **TenantId**
Specifies an ID of the cloud tenant. The cmdlet will return a time period that contains checkpoints on the archive tier created by this tenant.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository

Veeam.Backup.PowerShell.Infos.VBRJob

Veeam.Backup.Core.CBackup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRArchiveTierSyncInterval -Backup <CBackup> -Repository <VBRScaleOutBackupRepository> [<CommonParameters>]
```
```PowerShell
Get-VBRArchiveTierSyncInterval -Job <VBRJob> -Repository <VBRScaleOutBackupRepository> [<CommonParameters>]
```
```PowerShell
Get-VBRArchiveTierSyncInterval -Repository <VBRScaleOutBackupRepository> -TenantBackupId <Guid> [<CommonParameters>]
```
```PowerShell
Get-VBRArchiveTierSyncInterval -Repository <VBRScaleOutBackupRepository> -TenantId <Guid> [<CommonParameters>]
```
