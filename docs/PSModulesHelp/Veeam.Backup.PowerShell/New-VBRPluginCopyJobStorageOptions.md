New-VBRPluginCopyJobStorageOptions
----------------------------------

### Synopsis
Defines storage optimization settings for plug-in backup copy jobs.

---

### Description

This cmdlet creates the VBRPluginCopyJobStorageOptions object. This object contains storage optimization settings for plug-in backup copy jobs.
These settings allow you to modify the following options for the storage:
- Data compression options
- Data optimization options
For more information about job storage settings, see the Data Compression and Deduplication section of User Guide for VMware vSphere.

---

### Examples
> Example 1. Defining Storage Optimization Settings for Plug-In Backup Copy Job

New-VBRPluginCopyJobStorageOptions -CompressionLevel Optimal -StorageOptimizationType LANTarget
This command defines storage optimization settings for a plug-in backup copy job. These settings are defined with the following options:
- The compression level is set to Optimal.
- The storage optimization type is set to back up to NAS.
> Example 2. Defining Storage Optimization Settings with Data Deduplication for Plug-In Backup Copy Job

New-VBRPluginCopyJobStorageOptions -CompressionLevel Dedupe-friendly -StorageOptimizationType LANTarget -EnableDataDeduplication
This command defines storage optimization settings for a plug-in backup copy job. These settings are defined with the following options:
- The compression level is set to dedupe-friendly.
- The storage optimization type is set to back up to local storage.
- Data deduplication is enabled.

---

### Parameters
#### **CompressionLevel**
Specifies a compression level of backup files created with a plug-in backup copy job. You can specify either of the following compression levels:
* Auto: use this option to set the same compression level as in the copied backup files.
* None: use this option if you do not want to enable data compression.
* Dedupe-friendly: use this option to set a dedupe-friendly compression level.
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
Defines that the cmdlet will enable the data deduplication option for backup files created with a plug-in backup copy job.
If you do not provide this parameter, Veeam Backup & Replication will not decrease the size of these backup files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StorageOptimizationType**
Specifies the type of storage that you plan to use as a backup target.
* Automatic: use this option to set the same type of storage as in the copied backup files.
* LocalTarget: use this option for backup to SAN, DAS or local storage.
* LocalTargetHugeBackup: use this option for Veeam Agent jobs that can produce backup files larger than 16 TB.
* LANTarget: use this option for backup to NAS and for onsite backup.
* WANTarget: use this option if you plan to use WAN for offsite backup.
Depending on the selected storage type, the job will use data blocks of different sizes to optimize the size of backup files.
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
New-VBRPluginCopyJobStorageOptions -CompressionLevel {Auto | None | DedupeFriendly | Optimal | High | Extreme} [-EnableDataDeduplication] -StorageOptimizationType {Automatic | LocalTarget | 
```
```PowerShell
LocalTargetHugeBackup | LANTarget | WANTarget} [<CommonParameters>]
```
