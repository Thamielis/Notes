Set-VBRStorageOptions
---------------------

### Synopsis
Modifies storage optimization settings for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies storage optimization settings for Veeam Agent backup jobs. You can modify the following options for the storage:
- Data compression settings
- Data optimization settings
- Encryption settings
Veeam Backup & Replication will apply the settings to new backups during the next Veeam Agent backup job run. The new settings will not modify previously created backups.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

* [New-VBRStorageOptions](New-VBRStorageOptions)

* [Set-VBRComputerBackupJob](Set-VBRComputerBackupJob)

---

### Examples
> Changing Data Compression and Storage Optimization Settings

$job = Get-VBRComputerBackupJob -Name "AgentBackupJob"
$options = New-VBRStorageOptions -CompressionLevel Optimal -StorageOptimizationType LocalTargetHugeBackup
$newoptions = Set-VBRStorageOptions -Options $options -CompressionLevel DedupeFriendly -StorageOptimizationType WANTarget
Set-VBRComputerBackupJob -Job $job -StorageOptions $newoptions
This example shows how to specify data compression and storage optimization settings for Veeam Agent backup job. The job will run with the following settings:
- Veeam Backup & Replication will change the optimization type to use WAN for offsite backup.
- Veeam Backup & Replication will change the compression level to dedupe-friendly.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRStorageOptions cmdlet. Specify the CompressionLevel and StorageOptimizationType parameter values. Save the result to the $options variable.
3. Run the Set-VBRStorageOptions cmdlet. Set the $options variable as the Options parameter value. Specify the CompressionLevel and StorageOptimizationType parameter values. Save the result to the $newoptions variable.
4. Run the Set-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value. Set the $newoptions variable as the StorageOptions parameter value.

---

### Parameters
#### **CompressionLevel**
Specifies the compression level for the backup:
* None: use this option if you do not want to enable data compression.
* Dedupe-friendly: use this option to set a dedupe-friendly compression level.
* Optimal: use this option to set an optimal compression level.
* High: use this option to set a high compression level.
* Extreme: use this option to set an extreme compression level.
Valid Values:

* None
* DedupeFriendly
* Optimal
* High
* Extreme

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRCompressionLevel]`|false   |named   |False        |

#### **EnableEncryption**
Enables the option for the Veeam Agent backup job to encrypt the backup data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EncryptionKey**
For the EnableEncryption option.
Specifies the encryption key that you want to use to encrypt the data.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **KMSServer**
Specifies KMS servers added to the Veeam Backup & Replication console. The cmdlet will decrypt data encrypted by this server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **Options**
Specifies storage options that you want to modify.

|Type                 |Required|Position|PipelineInput |
|---------------------|--------|--------|--------------|
|`[VBRStorageOptions]`|true    |named   |True (ByValue)|

#### **StorageOptimizationType**
Specifies the type of the storage that you plan to use as a backup target.
* LocalTarget: use this option for backup to SAN, DAS or local storage.
* LocalTargetHugeBackup: use this option for Veeam Agent jobs that can produce backup files larger than 16 TB.
* LANTarget: use this option for backup to NAS and for onsite backup.
* WANTarget: use this option if you plan to use WAN for offsite backup.
Depending on the selected storage type, the job will use data blocks of different size to optimize the size of backup files.
Valid Values:

* LocalTarget
* LocalTargetHugeBackup
* LANTarget
* WANTarget
* LocalTargetLegacy

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRStorageOptimizationType]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRStorageOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRStorageOptions [-CompressionLevel {None | DedupeFriendly | Optimal | High | Extreme}] [-EnableEncryption] [-EncryptionKey <VBREncryptionKey>] [-KMSServer <VBRKMSServer>] -Options <VBRStorageOptions> 
```
```PowerShell
[-StorageOptimizationType {LocalTarget | LocalTargetHugeBackup | LANTarget | WANTarget | LocalTargetLegacy}] [<CommonParameters>]
```
