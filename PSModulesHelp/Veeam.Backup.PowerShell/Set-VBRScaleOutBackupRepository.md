Set-VBRScaleOutBackupRepository
-------------------------------

### Synopsis
Modifies scale-out backup repositories.

---

### Description

This cmdlet modifies settings of scale-out backup repositories.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRRepositoryExtent](Get-VBRRepositoryExtent)

---

### Examples
> Example 1. Adding New Extent to Scale-Out Repository

$repository = Get-VBRBackupRepository -Name "Veeam Scale-Out Repository" -ScaleOut
Set-VBRScaleOutBackupRepository -Repository $repository -Extent "Backup Repository 1", "Backup Repository 2", "Backup Repository 3"
This example shows how to add a new extent to the scale-out repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet to get the repository. Specify the Name parameter value. Provide the ScaleOut parameter. Save it to the $repository variable.
2. Run the Set-VBRScaleOutBackupRepository cmdlet. Set the $repository variable as the Repository parameter value. Specify the Extent parameter value.
> Example 2. Modifying Scale-Out Repository Policy

$repository = Get-VBRBackupRepository -Name "Veeam Scale-Out Repository" -ScaleOut
Set-VBRScaleOutBackupRepository -Repository $repository -PolicyType DataLocality -Extent "Backup Repository 1", "Backup Repository 2", "Backup Repository 3"
This example shows how to modify the scale-out repository policy.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet to get the repository. Specify the Name parameter value. Provide the ScaleOut parameter. Save it to the $repository variable.
2. Run the Set-VBRScaleOutBackupRepository cmdlet.  Set the $repository variable as the Repository parameter value. Set the DataLocality option for the PolicyType parameter. Specify the Extent parameter value.

---

### Parameters
#### **ArchiveObjectStorageRepository**
Specifies an archive storage. Veeam Backup & Replication will move the backup files to this archive storage.

|Type                                 |Required|Position|PipelineInput        |
|-------------------------------------|--------|--------|---------------------|
|`[VBRArchiveObjectStorageRepository]`|false   |named   |True (ByPropertyName)|

#### **ArchivePeriod**
For retention policy.
Specifies the number of days to keep backup files on the archive extent. When the number of days is passed, Veeam Backup & Replication will delete outdated backup files.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **CapacityTierHealthCheckOptions**
Specifies the health check schedule options.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRHealthCheckOptions]`|false   |named   |False        |

#### **Description**
Specifies a description of a scale-out repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableArchiveFullBackupMode**
Enables the option to store archived backups as standalone fulls, without any dependencies on the previous backup files.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableArchiveTier**
Enables the archive tier option. Veeam Backup & Replication will move backup files to an archive storage.
Default: False.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **EnableCapacityTier**
Enables the capacity tier option. Veeam Backup & Replication will move backup files to the object storage.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCapacityTierCopyPolicy**
Defines that the cmdlet will copy new backup files to object storage as soon as they are created.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCapacityTierMovePolicy**
Defines that the cmdlet will move inactive backup chains to object storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCopyAllMachineBackups**
For backup files created with Veeam Agent backup jobs and Veeam Backup jobs for VMs.
Enables copying of all backup files from the performance extents to the capacity extent. If you do not provide this parameter, the cmdlet will copy only the latest backup files.
Note: To activate the copy policy, you must provide the EnableCapacityTierCopyPolicy parameter.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCopyAllPluginBackups**
For backup files created with Veeam Plug-in for SAP HANA, Veeam Plug-in for Oracle RMAN.
Enables copying of all backup files from the performance extents to the capacity extent. If you do not provide this parameter, the cmdlet will disable copying of such backup files to the capacity extent.
Note: To activate the copy policy, you must provide the EnableCapacityTierCopyPolicy parameter.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCostOptimizedArchive**
Enables the option to archive backup files only if the remaining retention time is above minimal storage period.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEncryption**
Enables the encryption option. Veeam Backup & Replication will encrypt backup files before moving them to an object storage. Veeam Backup & Replication will encrypt all backup files from the backup chain, including the metadata.
Use the EncryptionKey parameter to specify the encryption key.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableOverridePolicy**
Enables the option to move backup files from the local repository to an object storage when the capacity reaches limits.
If set, this option overrides the retention policy. Veeam Backup & Replication will move backup files to an object storage even if the retention policy value has not reached limits.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnablePluginBackupOffload**
Enables offloading of the backup files created with plugin backup jobs to the capacity tier.
Default:
For scale-out backup repositories created with Veeam Backup & Replication versions 10 and earlier: False.
For scale-out backup repositories created with Veeam Backup & Replication versions 11 and later: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EncryptionKey**
For the encryption option.
Specifies an encryption key. Veeam Backup & Replication will use this key to encrypt the data.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **Extent**
Specifies an array of backup repositories. The cmdlet will add these repositories as extents to a scale-out repository.
IMPORTANT! The cmdlet will replace the extents currently added to the scale-out backup repository with this array.
To add an extent, specify all currently added extents plus the new one.
To remove an extent, specify the currently existing extents except for the extent that you want to remove.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will create the scale-out backup repository without showing up the notifications in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ForceStrictPlacementPolicy**
Defines that the cmdlet will enable strict placement policy. If you provide this parameter, Veeam Backup & Replication will not create a backup if it violates the backup placement policy and may result in that a backup job will fail.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **KMSServer**
Specifies the KMS server you want to use to encrypt the data.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **Name**
Specifies a name of a scale-out repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ObjectStorageRepository**
Specifies an object storage. Veeam Backup & Replication will move the backup files to this object storage.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRObjectStorageRepository[]]`|false   |named   |False        |

#### **OffloadWindowOptions**
Specifies the time interval, when Veeam Backup & Replication is allowed will move the backup files to an object storage.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **OperationalRestorePeriod**
For retention policy.
Specifies the number of days to keep backup files on the local repository. When the number of days is passed, Veeam Backup & Replication will move backup files to an object storage.
Note: If you select zero days, Veeam Backup & Replication will move all backup files from the local repository to the object storage immediately.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **OverrideSpaceThreshold**
For the override option.
Specifies the capacity value in percent for the override option. Once the value reaches the limit, Veeam Backup & Replication will move the data from the local repository to an object storage.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PerformFullWhenExtentOffline**
If set to True, the job will create an active full backup if the extent with the previous backup file is offline.
If set to False, the job will fail to create an increment.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PolicyType**
Specifies the policy for a scale-out repository:
* DataLocality - use this policy to store backup files that belong to the same backup chain together.
* Performance - to store full and incremental backup files to different extents of the scale-out backup repository.
Valid Values:

* DataLocality
* Performance

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[VBRScaleOutBackupRepositoryPolicyType]`|false   |named   |False        |

#### **Repository**
Specifies a scale-out repository that you want to modify.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRScaleOutBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **UsePerVMBackupFiles**
If set to True, the repository will store each VM in the job as a separate backup file.
If set to False, each restore point will contain all VMs in the job.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository

System.Management.Automation.SwitchParameter

Veeam.Backup.PowerShell.Infos.VBRArchiveObjectStorageRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRScaleOutBackupRepository [-ArchiveObjectStorageRepository <VBRArchiveObjectStorageRepository>] [-ArchivePeriod <Int32>] [-CapacityTierHealthCheckOptions <VBRHealthCheckOptions>] [-Description <String>] 
```
```PowerShell
[-EnableArchiveFullBackupMode] [-EnableArchiveTier] [-EnableCapacityTier] [-EnableCapacityTierCopyPolicy] [-EnableCapacityTierMovePolicy] [-EnableCopyAllMachineBackups] [-EnableCopyAllPluginBackups] 
```
```PowerShell
[-EnableCostOptimizedArchive] [-EnableEncryption] [-EnableOverridePolicy] [-EnablePluginBackupOffload] [-EncryptionKey <VBREncryptionKey>] [-Extent <CBackupRepository[]>] [-Force] [-ForceStrictPlacementPolicy] 
```
```PowerShell
[-KMSServer <VBRKMSServer>] [-Name <String>] [-ObjectStorageRepository <VBRObjectStorageRepository[]>] [-OffloadWindowOptions <VBRBackupWindowOptions>] [-OperationalRestorePeriod <Int32>] 
```
```PowerShell
[-OverrideSpaceThreshold <Int32>] [-PassThru] [-PerformFullWhenExtentOffline] [-PolicyType {DataLocality | Performance}] -Repository <VBRScaleOutBackupRepository> [-UsePerVMBackupFiles] [<CommonParameters>]
```
