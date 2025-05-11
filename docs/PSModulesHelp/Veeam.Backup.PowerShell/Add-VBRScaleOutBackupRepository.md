Add-VBRScaleOutBackupRepository
-------------------------------

### Synopsis
Adds scale-out backup repositories to the backup infrastructure.

---

### Description

This cmdlet creates scale-out backup repositories. You can create the scale-out backup repositories with the following options:
- The performance tier option. To implement this option, you must add local backup repositories or object storage repositories as performance extents to the scale-out backup repository.
- Performance tier and capacity tier options. To implement this option, you must add local backup repositories and object storage repositories to the scale-out backup repository.
- Performance tier, capacity tier and archive tier options. To implement this option, you must add local backup repositories, object storage repositories and archive object storage repositories to the scale-out backup repository.
Run the Get-VBRBackupRepository cmdlet to get backup repositories.
Run the Get-VBRObjectStorageRepository cmdlet to get object storage repositories.
By default, Veeam Backup & Replication only moves backup files that form inactive backup chains. For more information about backup chains, see the Backup Chain Legitimacy section of User Guide for VMware vSphere.
If you want to move a backup file manually, run the Start-VBROffloadBackupFile cmdlet.

---

### Related Links
* [Get-VBRRBackupRepository](Get-VBRRBackupRepository)

* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

---

### Examples
> Example 1. Creating Scale-Out Backup Repository with Performance Tier [Backup Repositories Extents]

$ext1 = Get-VBRBackupRepository -Name "LinExtent 1"
$ext2 = Get-VBRBackupRepository -Name "LinExtent 2"
Add-VBRScaleOutBackupRepository -Name "Veeam Performance Scale-Out Repository" -PolicyType Performance -ObjectStorageRepository $ext1, $ext2
This example shows hot to create a scale-out backup repository with the following settings:
- The scale-out backup repository contains the performance tier.
- The performance tier consists of local backup repositories added as performance extents.
- The policy type is set to performance policy type.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $ext1 variable. 2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $ext2 variable. 3. Run the Add-VBRScaleOutBackupRepository cmdlet Specify the Name parameter value. Set the PolicyType parameter to the Performance value. Set the $ext1 and $ext2 variables as the Extent parameter values.
> Example 2. Creating Scale-Out Backup Repository with Capacity Tier

$ext1 = Get-VBRBackupRepository -Name "LinExtent 1"
$objectstorage = Get-VBRObjectStorageRepository -Name "Amazon S3"
Add-VBRScaleOutBackupRepository -Name "ScaleOutRepository" -Extent $ext1 -PolicyType Performance -EnableCapacityTier -ObjectStorageRepository $objectstorage
This example shows how to create a scale-out backup repository with the following settings:
- The scale-out backup repository contains performance tier and capacity tier.
- The performance tier consists of local backup repositories added as performance extents.
- The policy type is set to performance policy type.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $ext1 variable.
2. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $objectstorage variable.
3. Run the Add-VBRScaleOutBackupRepository cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $ext1 variable as the Extent parameter value.
- Set the PolicyType parameter to the Performance value.
- Provide the EnableCapacityTier parameter.
- Set the $objectstorage variable as the ObjectStorageRepository parameter value.
> Example 3. Creating Scale-Out Backup Repository with Performance Tier [Object Storage Extents]

$ext1 = Get-VBRBackupRepository -Name "S3Ext01"
$ext2 = Get-VBRBackupRepository -Name "S3Ext02"
Add-VBRScaleOutBackupRepository -Name SOBR03 -Extent $ext1, $ext2 -PolicyType DataLocality
This command creates a scale-out backup repository with the following settings:
- The scale-out backup repository contains the performance tier.
- The performance tier consists of object storage repositories added as performance extents.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $ext1 variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $ext2 variable.
3. Run the Add-VBRScaleOutBackupRepository cmdlet. Specify the Name parameter value. Set the PolicyType parameter to the DataLocality value. Set the $ext1 and $ext2 variables as the ObjectStorageRepository parameter values.

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
Specifies the description of the scale-out backup repository.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

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
Enables the capacity tier option. Veeam Backup & Replication will move backup files to an object storage.
Default: False.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **EnableCapacityTierCopyPolicy**
Defines that the cmdlet will copy new backup files to object storage as soon as they are created.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCapacityTierMovePolicy**
Defines that the cmdlet will move inactive backup chains to object storage.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCopyAllMachineBackups**
For backup files created with Veeam Agent backup jobs and Veeam backup jobs for VMs.
Enables copying of all backup files from the performance extents to the capacity extent. If you do not provide this parameter, the cmdlet will copy only the latest backup files.
Note: You must provide the EnableCapacityTierCopyPolicy parameter to activate the copy policy.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCopyAllPluginBackups**
For backup files created with Veeam Plug-in for SAP HANA, Veeam Plug-in for Oracle RMAN.
Enables copying of all backup files from the performance extents to the capacity extent. If you do not provide this parameter, the cmdlet will not copy these backup files to the capacity extent.
Note: You must provide the EnableCapacityTierCopyPolicy parameter to activate the copy policy.
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
Enables the encryption. Veeam Backup & Replication will encrypt backup files before moving them to an object storage. Veeam Backup & Replication will encrypt all backup files from the backup chain, including the metadata.
Use the EncryptionKey parameter to specify the encryption key.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableOverridePolicy**
Enables the option to move backup files from the local repository to an object storage when the capacity reaches limits. If set, this option overrides the retention policy. Veeam Backup & Replication will move backup files to an object storage even if the retention policy value has not reached limits.
Use the OverrideSpaceThreshold parameter to specify the capacity value.
Default: False.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **EnablePluginBackupOffload**
Enables offloading of the backup files created with plugin backup jobs to the capacity tier.
Default:
* For scale-out backup repositories created with Veeam Backup & Replication versions 10 and earlier: False.
* For scale-out backup repositories created with Veeam Backup & Replication versions 11 and later: True.
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
Specifies the array of backup repositories. The cmdlet will add these repositories as performance extents to the scale-out backup repository.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[CBackupRepository[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will create the scale-out backup repository without showing up warnings in the PowerShell console.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ForceStrictPlacementPolicy**
Defines that the cmdlet will enable strict placement policy. If you provide this parameter, Veeam Backup & Replication will not create a backup if it violates the backup placement policy and may result in that a backup job will fail.
Default: False.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **KMSServer**
Specifies the KMS server you want to use to encrypt the data.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **Name**
Specifies the name of the scale-out backup repository.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

#### **ObjectStorageRepository**
Specifies an object storage. Veeam Backup & Replication will move the backup files to this object storage.

|Type                            |Required|Position|PipelineInput        |
|--------------------------------|--------|--------|---------------------|
|`[VBRObjectStorageRepository[]]`|false   |named   |True (ByPropertyName)|

#### **OffloadWindowOptions**
Specifies the time interval, when Veeam Backup & Replication is allowed will move the backup files to an object storage.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRBackupWindowOptions]`|false   |named   |True (ByPropertyName)|

#### **OperationalRestorePeriod**
For retention policy.
Specifies the number of days to keep backup files on the local repository. When the number of days is passed, Veeam Backup & Replication will move backup files to an object storage.
Note: If you select zero days, Veeam Backup & Replication will move all backup files from the local repository to the object storage immediately.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |True (ByPropertyName)|

#### **OverrideSpaceThreshold**
For the override option.
Specifies the capacity value in percent for the override option. Once the value reaches the limit, Veeam Backup & Replication will move the data from the local repository to an object storage.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |True (ByPropertyName)|

#### **PerformFullWhenExtentOffline**
If set to True, the job will create an active full backup if the extent with the previous backup file is offline.
If set to False, the job will fail to create an increment.
Default: False.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **PolicyType**
Specifies the policy for the scale-out backup repository:
* DataLocality - use this policy to store backup files that belong to the same backup chain.
* Performance - to store full and incremental backup files to different extents of the scale-out backup repository.
Note: For performance tier that consists of object storage repositories you must specify the DataLocality policy.
Valid Values:

* DataLocality
* Performance

|Type                                     |Required|Position|PipelineInput        |
|-----------------------------------------|--------|--------|---------------------|
|`[VBRScaleOutBackupRepositoryPolicyType]`|true    |named   |True (ByPropertyName)|

#### **UsePerVMBackupFiles**
If set to True, the repository will store each VM in the job as a separate backup file.
If set to False, each restore point will contain all VMs in the job.
Default: False.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.String

Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepositoryPolicyType

Veeam.Backup.Core.CBackupRepository[]

System.Management.Automation.SwitchParameter

System.Int32

Veeam.Backup.PowerShell.Infos.VBRBackupWindowOptions

Veeam.Backup.PowerShell.Infos.VBRObjectStorageRepository[]

Veeam.Backup.PowerShell.Infos.VBRArchiveObjectStorageRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRScaleOutBackupRepository [-ArchiveObjectStorageRepository <VBRArchiveObjectStorageRepository>] [-ArchivePeriod <Int32>] [-CapacityTierHealthCheckOptions <VBRHealthCheckOptions>] [-Description <String>] 
```
```PowerShell
[-EnableArchiveFullBackupMode] [-EnableArchiveTier] [-EnableCapacityTier] [-EnableCapacityTierCopyPolicy] [-EnableCapacityTierMovePolicy] [-EnableCopyAllMachineBackups] [-EnableCopyAllPluginBackups] 
```
```PowerShell
[-EnableCostOptimizedArchive] [-EnableEncryption] [-EnableOverridePolicy] [-EnablePluginBackupOffload] [-EncryptionKey <VBREncryptionKey>] -Extent <CBackupRepository[]> [-Force] [-ForceStrictPlacementPolicy] 
```
```PowerShell
[-KMSServer <VBRKMSServer>] [-Name <String>] [-ObjectStorageRepository <VBRObjectStorageRepository[]>] [-OffloadWindowOptions <VBRBackupWindowOptions>] [-OperationalRestorePeriod <Int32>] 
```
```PowerShell
[-OverrideSpaceThreshold <Int32>] [-PerformFullWhenExtentOffline] -PolicyType {DataLocality | Performance} [-UsePerVMBackupFiles] [<CommonParameters>]
```
