New-VBRStorageOptions
---------------------

### Synopsis
Defines storage optimization settings for backup jobs.

---

### Description

This cmdlet creates the VBRStorageOptions object that contains the storage optimization settings for backup jobs. These settings allow you to modify the following options for the storage:
- Data compression options
- Data optimization options
- Encryption options
For more information about job storage settings, see the Data Compression and Deduplication section of User Guide for VMware vSphere.
For more information about job encryption settings, see the Storage Settings section in the Veeam Agent Management Guide.

---

### Related Links
* [Add-VBREncryptionKey](Add-VBREncryptionKey)

---

### Examples
> Specifying Data Compression and Storage Optimization Settings

$key = Add-VBREncryptionKey -Password $securepassword -Description Mypass
New-VBRStorageOptions -CompressionLevel Optimal -StorageOptimizationType LocalTargetHugeBackup -EnableEncryption -EncryptionKey $key
This example shows how to specify data compression and storage optimization settings for a backup job. The job will run with the following options:
- The backup job will encrypt the data and will apply the optimal compression level.
- The storage optimization type is set to keep backups larger than 16 TB on the local storage.
Perform the following steps:
1. Run the Add-VBREncryptionKey cmdlet. Specify the Password and Description parameter values. Save the result to the $key variable.
2. Run the New-VBRStorageOptions cmdlet. Specify the following settings:
- Set the Optimal option for the CompressionLevel parameter.
- Set the LocalTargetHugeBackup option for the StorageOptimizationType parameter.
- Provide the EnableEncryption parameter.
- Set the $key variable as the EncryptionKey parameter value.

---

### Parameters
#### **CompressionLevel**
Specifies the compression level of backups:
* None: use this option if you do not want to enable data compression.
* Dedupe-friendly: use this option to set a dedupe-friendly compression level.
* Optimal: use this option to set an optimal compression level.
* High: use this option to set a high compression level.
* Extreme: use this option to set an extreme compression level.
Default: Optimal.
Valid Values:

* None
* DedupeFriendly
* Optimal
* High
* Extreme

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRCompressionLevel]`|true    |named   |False        |

#### **EnableEncryption**
Enables the option for the Veeam Agent backup job to encrypt the backup data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EncryptionKey**
For the EnableEncryption parameter.
Specifies the encryption key that you want to use to encrypt the data.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **KMSServer**
Specifies KMS servers added to the Veeam Backup & Replication console. The cmdlet will decrypt data encrypted by this server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **StorageOptimizationType**
Specifies the type of the storage that you plan to use as a backup target.
* LocalTarget: use this option for backup to SAN, DAS or local storage.
* LocalTargetHugeBackup: use this option for Veeam Agent jobs that can produce backup files larger than 16 TB.
* LANTarget: use this option for backup to NAS and for onsite backup.
* WANTarget: use this option if you plan to use WAN for offsite backup.
Depending on the selected storage type, the job will use data blocks of different size to optimize the size of backup files.
Default: LocalTarget.
Valid Values:

* LocalTarget
* LocalTargetHugeBackup
* LANTarget
* WANTarget
* LocalTargetLegacy

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRStorageOptimizationType]`|true    |named   |False        |

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
New-VBRStorageOptions -CompressionLevel {None | DedupeFriendly | Optimal | High | Extreme} [-EnableEncryption] [-EncryptionKey <VBREncryptionKey>] [-KMSServer <VBRKMSServer>] -StorageOptimizationType 
```
```PowerShell
{LocalTarget | LocalTargetHugeBackup | LANTarget | WANTarget | LocalTargetLegacy} [<CommonParameters>]
```
