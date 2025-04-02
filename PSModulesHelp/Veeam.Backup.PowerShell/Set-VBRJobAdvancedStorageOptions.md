Set-VBRJobAdvancedStorageOptions
--------------------------------

### Synopsis
Customizes advanced job storage settings.

---

### Description

This cmdlet sets storage options for the selected job.
You can enable backup data deduplication and customize data units compression level and size.
Read more about job storage settings in Veeam Backup & Replication user guide at http://www.veeam.com/vmware-backup/help-center.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBREncryptionKey](Get-VBREncryptionKey)

---

### Examples
> Example 1. Editing Advanced Storage Settings for Backup Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01", "Backup Job 02" | Set-VBRJobAdvancedStorageOptions -EnableDeduplication $True -CompressionLevel 0 -StorageBlockSize 7
This example shows how to edit advanced storage settings for the Backup Job 01 and Backup Job 02 backup jobs.
- The EnableDeduplication parameter is set to enable data deduplication.
- The compression level is set to none (0).
- The storage blocks size is set to Automatic.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRJobAdvancedStorageOptions cmdlet. Specify the following settings:
- Provide the $True value for the EnableDeduplication parameter.
- Specify the CompressionLevel parameter value.
- Specify the StorageBlockSize parameter value.
> Example 2. Applying Optimal Compression Level to all Jobs [Using Pipeline]

Get-VBRJob | Set-VBRJobAdvancedStorageOptions -CompressionLevel 5
This example shows how to apply the optimal compression level (=5) to all jobs.
Perform the following steps:
1. Run the Get-VBRJob cmdlet.
2. Pipe the cmdlet output to the Set-VBRJobAdvancedStorageOptions cmdlet. Specify the CompressionLevel parameter value.

---

### Parameters
#### **CompressionLevel**
Specifies the compression level for the created backup:
* Auto = -1
* None = 0
* Dedupe-friendly = 4
* Optimal = 5
* High = 6
* Extreme = 9
Default: OPTIMAL.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **EnableDeduplication**
Defines whether the job will deduplicate.
* True: the data will be deduplicated during the backup job run (recommended).
* False: no data will be checked for duplication.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **EnableEncryption**
Defines whether the job must use encryption. Use the EncryptionKey parameter to specify the encryption key.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **EncryptionKey**
Used to specify the encryption key for the EnableEncryption parameter.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PSCryptoKey]`|false   |named   |False        |

#### **Job**
Specifies the array of jobs. The cmdlet will modify advanced storage options of these jobs.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **KMSServer**
Specifies KMS servers added to the Veeam Backup & Replication console. The cmdlet will decrypt data encrypted by this server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **StorageBlockSize**
Specifies the integer defining the data blocks size.
Larger sized blocks provide faster procession but lower deduplication level.
* KbBlockSize256 (former WAN Target) = 0.
* KbBlockSize512 (former LAN target) = 1.
* KbBlockSize1024 (former Local Target) = 3.
* KbBlockSize2048 = 4.
* KbBlockSize4096 (former Local Target (large blocks))= 5.
* KbBlockSize8192 = 6.
* Automatic (Defines the best block size depending on the target type)  = 7.
Default: KbBlockSize1024.
Valid Values:

* KbBlockSize256
* KbBlockSize512
* KbBlockSize1024
* KbBlockSize2048
* KbBlockSize4096
* KbBlockSize8192
* Automatic

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[EKbBlockSize]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRJobAdvancedStorageOptions [-CompressionLevel <Int32>] [-EnableDeduplication <Boolean>] [-EnableEncryption <Boolean>] [-EncryptionKey <PSCryptoKey>] -Job <CBackupJob[]> [-KMSServer <VBRKMSServer>] 
```
```PowerShell
[-StorageBlockSize {KbBlockSize256 | KbBlockSize512 | KbBlockSize1024 | KbBlockSize2048 | KbBlockSize4096 | KbBlockSize8192 | Automatic}] [<CommonParameters>]
```
