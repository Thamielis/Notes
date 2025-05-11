Add-VBRComputerBackupJob
------------------------

### Synopsis
Creates Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Description

This cmdlet creates Veeam Agent backup jobs and Veeam Agent backup policies.
To create backup policies, you must specify the protection group with the protected computers that you plan to back up and the target location for storing backups.
To create Veeam Agent backup jobs, you must specify the protection group with the protected computers and the repository for storing backups.
- Run the Get-VBRProtectionGroup cmdlet to get the protection group.
- Run the Get-VBRBackupRepository cmdlet to get the repository.
- Run the New-VBRComputerDestinationOptions cmdlet to specify the target location for storing backups.
To enable guest file indexing and application-aware processing, you must first specify the settings for these options.
- Run the New-VBRApplicationProcessingOptions cmdlet to specify application-aware processing settings.
- Run the New-VBRComputerIndexingOptions cmdlet to specify guest file system indexing settings.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRComputerDestinationOptions](New-VBRComputerDestinationOptions)

* [New-VBRDailyOptions](New-VBRDailyOptions)

* [New-VBRLinuxScheduleOptions](New-VBRLinuxScheduleOptions)

* [New-VBRScriptProcessingOptions](New-VBRScriptProcessingOptions)

* [New-VBRApplicationProcessingOptions](New-VBRApplicationProcessingOptions)

* [New-VBRLinuxSelectedVolume](New-VBRLinuxSelectedVolume)

---

### Examples
> Example 1. Creating Veeam Agent Backup Job for Windows Servers

$group = Get-VBRProtectionGroup -Name "WindowsGroup"
$repository = Get-VBRBackupRepository -Name "Default Backup Repository"
Add-VBRComputerBackupJob -OSPlatform Windows -Type Server -Mode ManagedByBackupServer -Name "WindowsJob" -BackupObject $group -BackupType EntireComputer -BackupRepository $repository
This example shows how to create the Veeam Agent backup job for Windows servers.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Add-VBRComputerBackupJob cmdlet. Specify the following settings:
- Set the Windows option for the OSPlatform parameter.
- Set the Server option for the Type parameter.
- Set the ManagedByBackupServer option for the Mode parameter.
- Specify the Name parameter value.
- Set the $group variable as the BackupObject parameter value.
- Set the EntireComputer value for the BackupType parameter.
- Set the $repository variable as the BackupRepository parameter value.
> Example 2. Creating Veeam Agent Backup Job for Linux Workstation

$group = Get-VBRProtectionGroup -Name "LinuxGroup"
$repository = Get-VBRBackupRepository -Name "Default Backup Repository"
$destination = New-VBRComputerDestinationOptions -OSPlatform Linux -BackupRepository $repository
$daily = New-VBRDailyOptions -DayOfWeek Friday -Period 19:00
$schedule = New-VBRLinuxScheduleOptions -Type Daily -DailyOptions $daily
Add-VBRComputerBackupJob -OSPlatform Linux -Type Workstation -Mode ManagedByAgent -Name "LinuxJob" -BackupObject $group -BackupType EntireComputer -DestinationOptions $destination -ScheduleOptions $schedule -EnableSchedule
This example shows how to create the Veeam Agent backup policy for Linux workstation. A backup job will run on Fridays at 7:00 PM.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the New-VBRComputerDestinationOptions cmdlet. Set the Linux option for the OSPlatform parameter. Set the $repository variable as the BackupRepository parameter value. Save the result to the $destination variable.
4. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek and Period parameter values. Save the result to the $daily variable.
5. Run the New-VBRLinuxScheduleOptions cmdlet. Set the Daily value for the Type parameter. Set the $daily variable as the DailyOptions parameter value. Save the result to the $schedule variable.
6. Run the Add-VBRComputerBackupJob cmdlet. Specify the following settings:
- Set the Linux option for the OSPlatform parameter.
- Set the Workstation option for the Type parameter.
- Set the ManagedByAgent option for the Mode parameter.
- Specify the Name parameter value.
- Set the $group variable as the BackupObject parameter value.
- Set the EntireComputer option for the BackupType parameter.
- Set the $destination variable as the DestinationOptions parameter value.
- Set the $schedule variable as the ScheduleOptions parameter value.

- Provide the EnableSchedule parameter.
> Example 3. Creating Veeam Agent Backup Job for Failover Cluster

$group = Get-VBRProtectionGroup -Name "ClusterGroup"
$repository = Get-VBRBackupRepository -Name "Default Backup Repository"
$script = New-VBRScriptProcessingOptions -ProcessingAction IgnoreFailures -ScriptPrefreezeCommand C:\script\pre-script.bat -ScriptPostthawCommand C:\script\post-script.bat
$processoptions = New-VBRApplicationProcessingOptions -BackupObject $group -OSPlatform Windows -Enable -GeneralTransactionLogAction ProcessLogsWithJob -ScriptProcessingOptions $script
Add-VBRComputerBackupJob -OSPlatform Windows -Type FailoverCluster -Mode ManagedByBackupServer -Name "NewCluster" -BackupObject $group -BackupType SelectedVolumes -SelectedVolumes "D:\" -BackupRepository $repository -EnableApplicationProcessing -ApplicationProcessingOptions $processoptions
This example shows how to create a Veeam Agent backup job for a failover cluster. The job will run with the following settings:
- Veeam Backup & Replication will run scripts located at the C:\script\ path before and after the backup job.
- The Veeam Agent backup job will still run if scripts fail.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the New-VBRScriptProcessingOptions cmdlet. Specify the ProcessingAction, ScriptPrefreezeCommand and ScriptPostthawCommand parameter values. Save the result to the $script variable.
4. Run the New-VBRApplicationProcessingOptions cmdlet. Set the the $group variable as the BackupObject parameter value. Specify the OSPlatform, Enable and GeneralTransactionLogAction parameter values. Set the $script variable as the ScriptProcessingOptions parameter value. Save the result to the $processoptions variable.
5. Run the Add-VBRComputerBackupJob cmdlet. Specify the following settings:
- Set the Windows option for the OSPlatform parameter.
- Set the FailoverCluster option for the Type parameter.
- Set the ManagedByBackupServer option for the Mode parameter.
- Specify the Name parameter value.
- Set the $group variable as the BackupObject parameter value.
- Set the SelectedVolumes option for the BackupType parameter.
- Specify the SelectedVolumes parameter value.
- Set the $repository variable as the BackupRepository parameter value.
- Provide the EnableApplicationProcessing parameter.
- Set the $processoptions variable as the ApplicationProcessingOptions parameter value.
> Example 4. Creating Veeam Agent Backup Policy for Linux Server

$group = Get-VBRProtectionGroup -Name "LinuxGroup"
$repository = Get-VBRBackupRepository -Name "Default Backup Repository"
$destination = New-VBRComputerDestinationOptions -OSPlatform Linux -BackupRepository $repository
$scope = New-VBRLinuxSelectedVolume -Type Device -Path "/dev/sda"
Add-VBRComputerBackupJob -OSPlatform Linux -Type Server -Mode ManagedByAgent -Name "LinuxServerJob" -BackupObject $group -BackupType SelectedVolumes -DestinationOptions $destination -SelectedVolumes $scope
This example shows how to create a Veeam Agent backup policy for Linux server. The backup job will create volume-level backups.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the New-VBRComputerDestinationOptions cmdlet. Set the Linux value for the OSPlatform parameter. Set the $repository variable as the BackupRepository parameter value. Save the result to the $destination variable.
4. Run the New-VBRLinuxSelectedVolume cmdlet. Set the Device value for the Type parameter. Specify the Path parameter value. Save the result to the $scope variable.
5. Run the Add-VBRComputerBackupJob cmdlet. Specify the following settings:
- Set the Linux option for the OSPlatform parameter.
- Set the Server option for the Type parameter.
- Set the ManagedByAgent option for the Mode parameter.
- Specify the Name parameter value.
- Set the $group variable as the BackupObject parameter value.
- Set the SelectedVolumes option for the BackupType parameter.
- Set the $destination variable as the DestinationOptions parameter value.
- Set the $scope variable as the SelectedVolumes parameter value.
> Example 5. Creating Veeam Agent Backup Job for Windows Servers (Volume-Level Backup)

$group = Get-VBRProtectionGroup -Name "WindowsGroup"
$repository = Get-VBRBackupRepository -Name "Default Backup Repository"
Add-VBRComputerBackupJob -OSPlatform Windows -Type Server -Mode ManagedByBackupServer -Name "WindowsJob" -BackupObject $group -BackupType SelectedVolumes -SelectedVolumes "OS" -BackupRepository $repository
This example shows how to create the Veeam Agent backup job for Windows servers. The backup job will include OS volumes to volume-level backups.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Add-VBRComputerBackupJob cmdlet. Specify the following settings:
- Set the Windows option for the OSPlatform parameter.
- Set the Server option for the Type parameter.
- Set the ManagedByBackupServer option for the Mode parameter.
- Specify the Name parameter value.
- Set the $group variable as the BackupObject parameter value.
- Set the SelectedVolumes option for the BackupType parameter.
- Specify the SelectedVolumes parameter value.
- Set the $repository variable as the BackupRepository parameter value.

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
Specifies an array of protection groups and discovered computers that you want to add to the Veeam Agent backup job.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|true    |named   |False        |

#### **BackupRepository**
Specifies the target backup location for the Veeam Agent backup job.
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
|`[VBRComputerBackupJobBackupType]`|true    |named   |False        |

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
Specifies the description of the Veeam Agent backup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DestinationOptions**
Specifies the target backup location for the protected computers that you want to add to the backup policy.
Note: This parameter does not work for Veeam Agent backup jobs.

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
Specifies a GFS retention. The cmdlet will create Veeam Agent job with the specified policy.

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
Note: This parameter is available starting from Veeam Backup & Replication 11a (build 11.0.1.1261).
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

#### **Mode**
Specifies the Veeam Agent backup job mode:
* ManagedByAgent: use this option to create the backup policy.
Note: This mode is the only available mode for jobs that back up workstations.
* ManagedByBackupServer: use this option to create a backup job.
Note: This mode is the only available mode for jobs that back up failover clusters.
Valid Values:

* ManagedByAgent
* ManagedByBackupServer

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRComputerBackupJobMode]`|true    |named   |False        |

#### **Name**
Specifies the name that you want to assign to the Veeam Agent backup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings for the Veeam Agent backup job.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OSPlatform**
Specifies the OS of the protected computers:
* Windows: for Windows computers.
* Linux: for Linux computers.
* Mac: for macOS computers.
* Unix: for Unix computers.
Valid Values:

* Windows
* Linux
* Mac
* Unix

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRAgentType]`|true    |named   |False        |

#### **RetentionPolicy**
Specifies the retention policy for backups created by the Veeam Agent.
Note: Retention policy specifies the following settings:
* For jobs that back up Windows workstations the retention policy specifies the number of days.
* For jobs that back up Linux computes the retention policy specifies the number of restore points.
* For jobs that back up servers, the retention policy specifies the number of restore points or a number of days.
* For Veeam Agent policies that that back up macOS computers, the retention policy specifies the restore points.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionType**
Specifies a retention type for Veeam Agent jobs managed by the Veeam Backup server. You can specify either of the following types:
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
Specifies an array of folders with files that you want to back up.

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
Note: This parameter is not available for backup policies that Veeam Agent job applies to Linux computers.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRSyntheticFullOptions]`|false   |named   |False        |

#### **Type**
Specifies the type of the protected computers:
* Workstation: for remote workstations or laptops. Veeam Backup & Replication will apply the settings that are available in the Workstation edition of Veeam Agent.
* Server: for standalone servers. Veeam Backup & Replication will apply the settings available for the Server edition of Veeam Agent.
* FailoverCluster: for failover clusters.
Note: The FailoverCluster type does not apply for Veeam Agent for Linux.
Valid Values:

* Workstation
* Server
* FailoverCluster

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRComputerBackupJobType]`|true    |named   |False        |

#### **UseSnapshotlessFileLevelBackup**
Defines that the cmdlet will create the crash-consistent file-level backup without a snapshot.
Note: This parameter is available for Linux machines with the file-level backup scope only.

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRComputerBackupJob [-ActiveFullOptions <VBRFullBackupOptions>] [-ApplicationProcessingOptions <VBRApplicationProcessingOptions[]>] [-BackupCacheOptions <VBRBackupCacheOptions>] -BackupObject <Object[]> 
```
```PowerShell
[-BackupRepository <CBackupRepository>] -BackupType {EntireComputer | SelectedFiles | SelectedVolumes | MacUserHome | UnixEntireFileSystem} [-CompactFullOptions <VBRFullBackupOptions>] 
```
```PowerShell
[-DeletedComputerRetentionPolicy <Int32>] [-Description <String>] [-DestinationOptions <VBRComputerDestinationOptions>] [-EnableApplicationProcessing] [-EnableDeletedComputerRetention] [-EnableIndexing] 
```
```PowerShell
[-EnableSchedule] [-ExcludedVolumes <VBRWindowsSelectedVolume[]>] [-GFSOptions <VBRComputerGFSOptions>] [-HealthCheckOptions <VBRHealthCheckOptions>] [-HighPriority] [-IncludeUsbDrives] [-IndexingOptions 
```
```PowerShell
<VBRComputerIndexingOptions[]>] -Mode {ManagedByAgent | ManagedByBackupServer} [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] -OSPlatform {Windows | Linux | Mac | Unix} [-RetentionPolicy 
```
```PowerShell
<Int32>] [-RetentionType {RestorePoints | RestoreDays}] [-SanIntegrationOptions <VBRSanIntegrationOptions>] [-ScheduleOptions <VBRObject>] [-ScriptOptions <VBRJobScriptOptions>] [-SelectedFilesOptions 
```
```PowerShell
<VBRSelectedFilesBackupOptions>] [-SelectedVolumes <IVBRSelectedVolume[]>] [-StorageOptions <VBRStorageOptions>] [-SyntheticFullOptions <VBRSyntheticFullOptions>] -Type {Workstation | Server | FailoverCluster} 
```
```PowerShell
[-UseSnapshotlessFileLevelBackup] [-WarningOptions <VBRComputerWarningOptions>] [<CommonParameters>]
```
