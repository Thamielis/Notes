New-VBRBackupCopyJobStorageOptions
----------------------------------

### Synopsis
Defines storage settings for Veeam Agent backup copy jobs.

---

### Description

This cmdlet creates the VBRBackupCopyJobStorageOptions object that contains storage settings for Veeam Agent backup copy jobs. These settings allow you to modify the following options for the storage:
- Data compression options
- Data deduplication options
- Encryption options
For more information about job storage settings, see the Data Compression and Deduplication section of User Guide for VMware vSphere.

---

### Related Links
* [Add-VBREncryptionKey](Add-VBREncryptionKey)

---

### Examples
> Example 1. Defining Storage Optimization Settings for Veeam Agent Backup Copy Job

New-VBRBackupCopyJobStorageOptions -CompressionLevel Optimal -StorageOptimizationType LANTarget
This command defines storage optimization settings for a Veeam Agent backup copy jobs. These settings are defined with the following options:
- The compression level is set to Optimal.
- The storage optimization type is set to back up to NAS.
> Example 2. Defining Storage Optimization Settings with Data Deduplication

New-VBRBackupCopyJobStorageOptions -CompressionLevel Dedupe-friendly -StorageOptimizationType LANTarget -EnableDataDeduplication
This command defines storage optimization settings for a Veeam Agent backup copy job. These settings are defined with the following options:
- The compression level is set to dedupe-friendly.
- The storage optimization type is set to back up to local storage
- Data deduplication is enabled.
> Example 3. Defining Storage Optimization Settings with Encryption Option

$plainpassword = "VeeamPassword"
$securepassword = $plainpassword | ConvertTo-SecureString -AsPlainText -Force
$key = Add-VBREncryptionKey -Password $securepassword -Description "Veeam Administrator"
New-VBRBackupCopyJobStorageOptions -CompressionLevel Optimal -StorageOptimizationType LocalTargetHugeBackup -EnableEncryption -EncryptionKey $key
This example shows how to define storage optimization settings with the encryption option.
Perform the following steps:
1. Create the secure password:
a. Add the $plainpassword variable and set it to the VeeamPassword value.
b. Convert the $plainpassword variable to the secure string. Provide the ConvertTo-SecureString, AsPlainText  and Force parameters. Save the result to the $securepassword variable.
c. Run the Add-VBREncryptionKey cmdlet. Set the $securepassword variable as the Password parameter value. Specify the Description parameter value. Save the result to the $key variable.
2. Run the New-VBRBackupCopyJobStorageOptions cmdlet. Specify the following settings:
- Set the Optimal option for the CompressionLevel parameter.
- Set the LocalTargetHugeBackup option for the StorageOptimizationType parameter.
- Provide the EnableEncryption parameter.
- Set the $key variable as the EncryptionKey parameter value.

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
|`[VBRBackupCopyJobCompressionLevel]`|true    |named   |False        |

#### **EnableDataDeduplication**
Defines that the cmdlet will enable the data deduplication option for backup files created with a Veeam Agent backup copy job.
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
|`[VBRBackupCopyJobStorageOptimizationType]`|true    |named   |False        |

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
New-VBRBackupCopyJobStorageOptions -CompressionLevel {Auto | None | DedupeFriendly | Optimal | High | Extreme} [-EnableDataDeduplication] [-EnableEncryption] [-EncryptionKey <VBREncryptionKey>] [-KMSServer 
```
```PowerShell
<VBRKMSServer>] -StorageOptimizationType {Automatic | LocalTarget | LocalTargetHugeBackup | LANTarget | WANTarget} [<CommonParameters>]
```
