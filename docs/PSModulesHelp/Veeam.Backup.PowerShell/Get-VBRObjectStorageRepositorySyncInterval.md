Get-VBRObjectStorageRepositorySyncInterval
------------------------------------------

### Synopsis
Returns a time period available for synchronization for checkpoints located in object storage repositories.

---

### Description

This cmdlet returns a time period available for synchronization of checkpoints located in object storage repositories. You can get details on the time period when checkpoints in object storage are available for synchronization.
You may want to run this cmdlet before you roll back checkpoints in object storage repositories to the previous state.
Run the Sync-VBRObjectStorageRepositoryEntityState to synchronize the state of the backup chains.
Consider the following:
- Use this cmdlet only with object storage that support the immutability option.
- Do not use this cmdlet with object storage repositories added as a performance tier of a scale-out backup repository.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

* [Get-VBRBackup](Get-VBRBackup)

---

### Examples
> Example 1. Getting Time Period for all Checkpoints Available in Object Storage Repositories

$repository = Get-VBRObjectStorageRepository -Name "Amazon S3"
Get-VBRObjectStorageRepositorySyncInterval -Repository $repository

StartDateUtc                                                EndDateUtc
------------                                                ----------
2/20/2020 1:54:26 PM                                        2/20/2020 1:54:26 PM
This example shows how to get a time period for all checkpoints located in the Amazon S3 object storage repository.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBRObjectStorageRepositorySyncInterval cmdlet. Set the $repository variable as the Repository parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: StartDateUtc and EndDateUtc.
> Example 2. Getting Time Period of Checkpoints for Specific Job

$repository = Get-VBRObjectStorageRepository -Name "Amazon S3"
$job = Get-VBRJob -Name "Backup05"
Get-VBRObjectStorageRepositorySyncInterval -Repository $repository -Job $job

StartDateUtc                                                EndDateUtc
------------                                                ----------
2/20/2020 1:54:26 PM                                        2/20/2020 1:54:26 PM
This example shows how to get a time period that contains checkpoints located in the Amazon S3 created by the Backup05 job.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
3. Run the Get-VBRObjectStorageRepositorySyncInterval cmdlet. Set the $repository variable as the Repository parameter value. Set the $job variable as the Job parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: StartDateUtc and EndDateUtc.
> Example 3. Getting Time Period of Checkpoints for Specific Backup

$repository = Get-VBRObjectStorageRepository -Name "Amazon S3"
$backup = Get-VBRBackup -Name "Report05"
Get-VBRObjectStorageRepositorySyncInterval -Repository $repository -Backup $backup

StartDateUtc                                                EndDateUtc
------------                                                ----------
2/20/2020 1:54:26 PM                                        2/20/2020 1:54:26 PM
This example shows how to get a time period that contains details on checkpoints located in the Amazon S3 object storage repository available in the Report05 backup.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
3. Run the Get-VBRObjectStorageRepositorySyncInterval cmdlet. Set the $repository variable as the Repository parameter value. Set the $backup variable as the Backup parameter value.
The cmdlet output will contain the following details on the time period for the checkpoints: StartDateUtc and EndDateUtc.

---

### Parameters
#### **Backup**
Specifies a backup. The cmdlet will return a time period for checkpoints added to this backup.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[CBackup]`|true    |named   |True (ByPropertyName)|

#### **Job**
Specifies a job. The cmdlet will return a time period for checkpoints created by this job.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[VBRJob]`|true    |named   |True (ByPropertyName)|

#### **Repository**
Specifies an object storage repository. The cmdlet will return time periods for checkpoints located in this repository.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRObjectStorageRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **TenantBackupId**
Specifies an ID of the cloud tenant backup. The cmdlet will return a time period for checkpoints added to this backup.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

#### **TenantId**
Specifies an ID of the cloud tenant. The cmdlet will return a time period for checkpoints created by this tenant.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectStorageRepository

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
Get-VBRObjectStorageRepositorySyncInterval -Backup <CBackup> -Repository <VBRObjectStorageRepository> [<CommonParameters>]
```
```PowerShell
Get-VBRObjectStorageRepositorySyncInterval -Job <VBRJob> -Repository <VBRObjectStorageRepository> [<CommonParameters>]
```
```PowerShell
Get-VBRObjectStorageRepositorySyncInterval -Repository <VBRObjectStorageRepository> -TenantBackupId <Guid> [<CommonParameters>]
```
```PowerShell
Get-VBRObjectStorageRepositorySyncInterval -Repository <VBRObjectStorageRepository> -TenantId <Guid> [<CommonParameters>]
```
