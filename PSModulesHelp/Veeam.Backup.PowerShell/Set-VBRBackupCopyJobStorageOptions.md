Set-VBRBackupCopyJobStorageOptions
----------------------------------

### Synopsis
Modifies storage optimization settings for Veeam Agent backup copy jobs.

---

### Description

This cmdlet modifies storage optimization settings for Veeam Agent backup copy jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRBackupCopyJobStorageOptions](New-VBRBackupCopyJobStorageOptions)

---

### Examples
> Example 1. Enabling Data Deduplication for Storage Optimization Settings

$options = New-VBRBackupCopyJobStorageOptions -CompressionLevel Optimal -StorageOptimizationType LANTarget
Set-VBRBackupCopyJobStorageOptions -Options $options -EnableDataDeduplication
This example shows how to enable the data deduplication option for storage optimization settings of a Veeam Agent backup copy job.
Perform the following steps:
1. Run the New-VBRBackupCopyJobStorageOptions cmdlet. Specify the CompressionLevel and StorageOptimizationType parameter values. Save the result to the $options variable.
2. Run the Set-VBRBackupCopyJobStorageOptions cmdlet. Set the $options variable as the Options parameter value. Provide the EnableDataDeduplication parameter.
> Example 2. Modifying Compression Level of Backup Files

$options = New-VBRBackupCopyJobStorageOptions -CompressionLevel Dedupe-friendly -StorageOptimizationType LANTarget
Set-VBRBackupCopyJobStorageOptions -Options $options -CompressionLevel Extreme
This example shows how to modify compression level of backup files or storage optimization settings of a Veeam Agent backup copy jobs.
The cmdlet will change it from the dedupe-friendly to the extreme compression level.
Perform the following steps:
1. Run the New-VBRBackupCopyJobStorageOptions cmdlet. Specify the CompressionLevel and StorageOptimizationType parameter values. Save the result to the $options variable.
2. Run the Set-VBRBackupCopyJobStorageOptions cmdlet. Set the $options variable as the Options parameter value. Set the Extreme option for the CompressionLevel parameter.

---

### Parameters
#### **CompressionLevel**
Specifies a compression level of backup files created with a Veeam Agent backup copy job. You can specify either of the following compression level:
* Auto: use this option to set the same compression level as in the copied backup files.
* None: use this option if you do not want to enable data compression.
* DedupeFriendly: use this option to set a dedupe-friendly compression level.
* Optimal: use this option to set an optimal compression level.
* High: use this option to set a high compression level.
* Extreme: use this option to set an extreme compression level.
Default: Auto.
Valid Values:

* Auto
* None
* DedupeFriendly
* Optimal
* High
* Extreme

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[VBRBackupCopyJobCompressionLevel]`|false   |named   |False        |

#### **EnableDataDeduplication**
Enables the data deduplication option for backup files created with a Veeam Agent backup copy job.
If you do not provide this parameter, Veeam Backup & Replication will not decrease the size of these backup files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEncryption**
Defines that the cmdlet will encrypt backup files created with a Veeam Agent backup copy job.
If you do not provide this parameter, Veeam Backup & Replication will not encrypt these backup files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EncryptionKey**
For the encryption option.
Specifies an encryption key. Veeam Backup & Replication will use this key to encrypt backup files.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **KMSServer**
Specifies the KMS server you want to use to encrypt the data.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **Options**
Specifies optimization settings for Veeam Agent backup copy jobs. The cmdlet will modify these settings.

|Type                              |Required|Position|PipelineInput |
|----------------------------------|--------|--------|--------------|
|`[VBRBackupCopyJobStorageOptions]`|true    |named   |True (ByValue)|

#### **StorageOptimizationType**
Specifies data deduplication options.
* Automatic: use this option to set the same type of storage as in the copied backup files.
* LocalTarget: use this option for backup to SAN, DAS or local storage.
* LocalTargetHugeBackup: use this option for Veeam Agent jobs that can produce backup files larger than 16 TB.
* LANTarget: use this option for backup to NAS and for onsite backup.
* WANTarget: use this option if you plan to use WAN for offsite backup.
Depending on the selected storage type, the job will use data blocks of different size to optimize the size of backup files.
Default: LocalTarget.
Valid Values:

* Automatic
* LocalTarget
* LocalTargetHugeBackup
* LANTarget
* WANTarget

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[VBRBackupCopyJobStorageOptimizationType]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRBackupCopyJobStorageOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRBackupCopyJobStorageOptions [-CompressionLevel {Auto | None | DedupeFriendly | Optimal | High | Extreme}] [-EnableDataDeduplication] [-EnableEncryption] [-EncryptionKey <VBREncryptionKey>] [-KMSServer 
```
```PowerShell
<VBRKMSServer>] -Options <VBRBackupCopyJobStorageOptions> [-StorageOptimizationType {Automatic | LocalTarget | LocalTargetHugeBackup | LANTarget | WANTarget}] [<CommonParameters>]
```
