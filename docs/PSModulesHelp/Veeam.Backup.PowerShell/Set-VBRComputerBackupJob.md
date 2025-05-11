Set-VBRComputerBackupJob
------------------------

### Synopsis
Modifies Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Description

This cmdlet modifies settings of Veeam Agent backup jobs and Veeam Agent backup policies.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

* [New-VBRStorageOptions](New-VBRStorageOptions)

* [New-VBRFullBackupOptions](New-VBRFullBackupOptions)

* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

---

### Examples
> Example 1. Applying New Storage Settings to Veeam Agent Backup Job

$job = Get-VBRComputerBackupJob -Name "ClusterJob"
$storage = New-VBRStorageOptions -CompressionLevel Optimal -StorageOptimizationType LocalTarget
Set-VBRComputerBackupJob -Job $job -StorageOptions $storage
This example shows how to apply new storage settings to an existing Veeam Agent backup job.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRStorageOptions cmdlet. Set the Optimal option for the CompressionLevel parameter. Set the LocalTarget option for the StorageOptimizationType parameter. Save the result to the $storage variable.
3. Run the Set-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value. Set the $storage variable as the StorageOptions parameter value.
> Example 2. Applying New Retention Policy to Veeam Agent Backup Job

$job = Get-VBRComputerBackupJob -Name "LinuxJob"
$fulloptions = New-VBRFullBackupOptions -Enable -ScheduleType Weekly -SelectedDays Sunday, Wednesday
Set-VBRComputerBackupJob -Job $job -ActiveFullOptions $fulloptions -RetentionPolicy 7
This example shows how to modify an existing Veeam Agent backup job. The job will run with the following settings:
- The job will create a full backup on a regular basis.
- Veeam Backup & Replication will apply the retention policy for the backups created by the job.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRFullBackupOptions cmdlet. Provide the Enable parameter. Specify the ScheduleType and SelectedDays parameter values. Save the result to the $fulloptions variable.
3. Run the Set-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value. Set the $fulloptions variable as the ActiveFullOptions parameter value. Specify the RetentionPolicy parameter value.
> Example 3. Adding Protection Group to Veeam Agent Backup Job

$job = Get-VBRComputerBackupJob -Name "BackupJob"
$objects = $job.BackupObject
$group = Get-VBRProtectionGroup -Name "Protection group"
$objects += $group
Set-VBRComputerBackupJob -Job $job -BackupObject $objects
This example shows how to add a protection group to an existing Veeam Agent backup job.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Get the BackupObject property of the $job variable. Save the result to the $objects variable.
3. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
4. Add the protection group to the BackupObject array. Use the += operator.
5. Run the Set-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value. Set the $objects variable as the BackupObject parameter value.

---

### Parameters
#### **ActiveFullOptions**
Specifies the schedule for active full backup.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRFullBackupOptions]`|false   |named   |False        |

#### **ApplicationProcessingOptions**
Specifies the settings for application-aware processing.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRApplicationProcessingOptions[]]`|false   |named   |False        |

#### **BackupCacheOptions**
Specifies backup cache settings of a Veeam Agent backup job for Microsoft Windows.
Note: You can apply backup cache settings for Veeam Agent backup jobs that are targeted at the following types of backup location:
* Veeam backup repository
* Veeam Cloud Connect repository

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRBackupCacheOptions]`|false   |named   |False        |

#### **BackupObject**
Specifies an array of protection groups and discovered computers that you want to add to a backup job or to a backup policy.
Important! The cmdlet will replace the protection groups that are currently added to the backup job with this array.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |False        |

#### **BackupRepository**
Specifies the target backup location for a backup job.
Note: This parameter is not available for backup policies.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **BackupType**
Specifies the scope of data that you want to back up.
* EntireComputer: for entire computer image backups.
* SelectedFiles: for file-level backups.
Note: This option is not available for the job that backs up failover clusters. If you select this option, you will not be able to switch to the EntireComputer or SelectedVolumes options.
* SelectedVolumes: for volume-level backups.
* MacUserHome: for backups of the Users folder that contains the Home folders of all users.
* UnixEntireFileSystem: for backups of Unix computers.
Valid Values:

* EntireComputer
* SelectedFiles
* SelectedVolumes
* MacUserHome
* UnixEntireFileSystem

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRComputerBackupJobBackupType]`|false   |named   |False        |

#### **CompactFullOptions**
Specifies the schedule for the compact operation of full backups created by the Veeam Agent backup job.
Veeam Backup & Replication will defragment and compact a full backup per the schedule settings specified in the VBRFullBackupOptions object.
Note: This parameter is not available for backup policies that Veeam Agent job applies to Linux computers.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRFullBackupOptions]`|false   |named   |False        |

#### **DeletedComputerRetentionPolicy**
For the EnableDeletedComputerRetention option.
Specifies the period of time in days to keep backup files for machines that have not been backed up for a certain period of time. Veeam Backup & Replication will remove backup files of these computers in case Veeam Agent backup job will not be able to back up these computers when the specified period of time is over.
Default: 30 days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Description**
Specifies the description of a backup job or a backup policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DestinationOptions**
Specifies the target backup location for the protected computers that you want to add to the backup policy.
Note: This parameter is not available for backup jobs.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRComputerDestinationOptions]`|false   |named   |False        |

#### **EnableApplicationProcessing**
Enables application-aware processing for the Veeam Agent backup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableDeletedComputerRetention**
Enables the option to keep the backup data for machines that have not been backed up for a certain period of time. Veeam Backup & Replication will remove backup files of these computers in case Veeam Agent backup job will not be able to back up these computers for the specified period.
Use the DeletedComputerRetentionPolicy parameter to specify the number of days for keeping the backup files of machines that have not been backed up for a certain period of time.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableGFSRetention**
Enables the GFS retention option for Veeam Agent jobs.
If you do not provide this parameter, Veeam Agent jobs will run without GFS retention policy.
Note: This options is not available for Veeam Agent policies.
Use the GFSOptions parameter to specify the GFS retention policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableIndexing**
Enables the guest file system indexing.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSchedule**
Enables the Veeam Agent backup job to run on a regular basis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludedVolumes**
For volume-level backups.
Specifies an array of computer volumes that you want to exclude from backup.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRWindowsSelectedVolume[]]`|false   |named   |False        |

#### **GFSOptions**
For the EnableGFSRetention option.
Specifies GFS retention. The cmdlet will create Veeam Agent job with the specified policy.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRComputerGFSOptions]`|false   |named   |False        |

#### **HealthCheckOptions**
Specifies the health check schedule for the latest restore point.
Note: This parameter is not available for backup policies that Veeam Agent job applies to Linux computers.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRHealthCheckOptions]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IncludeUsbDrives**
Defines that Veeam Backup & Replication will back up the periodically connected USB drives.
Note: You can set this parameter only for the following types of Veeam Agent jobs:
* Veeam Agent jobs that back up entire images of Windows computers.
* Veeam Agent backup policies that back up the Users folder that contains the Home folders of all users.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IndexingOptions**
Specifies indexing scope settings.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRComputerIndexingOptions[]]`|false   |named   |False        |

#### **Job**
Specifies the backup job or a backup policy that you want to modify.

|Type                    |Required|Position|PipelineInput |
|------------------------|--------|--------|--------------|
|`[VBRComputerBackupJob]`|true    |named   |True (ByValue)|

#### **Name**
Specifies the name that you want to assign to a backup job or to a backup policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings for the Veeam Agent backup job.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **RetentionPolicy**
Specifies the retention policy for backups created by the Veeam Agent.
Note: Retention policy specifies the following settings:
* For jobs that back up workstations, the retention policy specifies the number of days.
* For jobs that back up Linux computes, the retention policy specifies the number of restore points.
* For jobs that back up servers, the retention policy specifies the number of restore points.
* For Veeam Agent policies that that back up macOS computers, the retention policy specifies the restore points.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionType**
Specifies retention type for Veeam Agent jobs managed by the Veeam Backup server. You can specify either of the following types:
* RestorePoints
* RestoreDays
Valid Values:

* RestorePoints
* RestoreDays

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRRetentionType]`|false   |named   |False        |

#### **SanIntegrationOptions**
Specifies storage integration settings for the Veeam Agent jobs.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRSanIntegrationOptions]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies the settings for Veeam Agent job schedule.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VBRObject]`|false   |named   |False        |

#### **ScriptOptions**
Specifies custom script settings. Veeam Backup & Replication will run pre-job and post-job scripts per these settings.
Note: This parameter is not available for backup policies that Veeam Agent job applies to Windows computers.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|false   |named   |False        |

#### **SelectedFilesOptions**
For file-level backups.
Specifies an array of the folders with the files that you want to back up.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRSelectedFilesBackupOptions]`|false   |named   |False        |

#### **SelectedVolumes**
For volume-level backups.
Specifies an array of computer volumes that you want to back up.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[IVBRSelectedVolume[]]`|false   |named   |False        |

#### **StorageOptions**
Specifies the settings for compression and storage optimization of the target backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRStorageOptions]`|false   |named   |False        |

#### **SyntheticFullOptions**
Specifies the schedule for synthetic full backup.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRSyntheticFullOptions]`|false   |named   |False        |

#### **UseSnapshotlessFileLevelBackup**
Defines that the cmdlet will create the crash-consistent file-level backup without a snapshot.
Note: Available for Linux machines with the file-level backup scope only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WarningOptions**
Specifies notifications settings for computers processed by Veeam Agent policies.
Note: This parameter is not available for computers processed by Veeam Agent backup jobs.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRComputerWarningOptions]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerBackupJob [-ActiveFullOptions <VBRFullBackupOptions>] [-ApplicationProcessingOptions <VBRApplicationProcessingOptions[]>] [-BackupCacheOptions <VBRBackupCacheOptions>] [-BackupObject <Object[]>] 
```
```PowerShell
[-BackupRepository <CBackupRepository>] [-BackupType {EntireComputer | SelectedFiles | SelectedVolumes | MacUserHome | UnixEntireFileSystem}] [-CompactFullOptions <VBRFullBackupOptions>] 
```
```PowerShell
[-DeletedComputerRetentionPolicy <Int32>] [-Description <String>] [-DestinationOptions <VBRComputerDestinationOptions>] [-EnableApplicationProcessing] [-EnableDeletedComputerRetention] [-EnableGFSRetention] 
```
```PowerShell
[-EnableIndexing] [-EnableSchedule] [-ExcludedVolumes <VBRWindowsSelectedVolume[]>] [-GFSOptions <VBRComputerGFSOptions>] [-HealthCheckOptions <VBRHealthCheckOptions>] [-HighPriority] [-IncludeUsbDrives] 
```
```PowerShell
[-IndexingOptions <VBRComputerIndexingOptions[]>] -Job <VBRComputerBackupJob> [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-RetentionPolicy <Int32>] [-RetentionType {RestorePoints | 
```
```PowerShell
RestoreDays}] [-SanIntegrationOptions <VBRSanIntegrationOptions>] [-ScheduleOptions <VBRObject>] [-ScriptOptions <VBRJobScriptOptions>] [-SelectedFilesOptions <VBRSelectedFilesBackupOptions>] [-SelectedVolumes 
```
```PowerShell
<IVBRSelectedVolume[]>] [-StorageOptions <VBRStorageOptions>] [-SyntheticFullOptions <VBRSyntheticFullOptions>] [-UseSnapshotlessFileLevelBackup] [-WarningOptions <VBRComputerWarningOptions>] 
```
```PowerShell
[<CommonParameters>]
```
