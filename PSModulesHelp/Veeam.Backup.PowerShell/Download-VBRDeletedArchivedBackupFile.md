Download-VBRDeletedArchivedBackupFile
-------------------------------------

### Synopsis
Retrieves a backup file deleted from the archive tier and preserved by insider protection.

---

### Description

This cmdlet retrieves a backup file deleted from the archive tier and preserved by insider protection.

---

### Related Links
* [Get-VBRDeletedArchivedBackupFile](Get-VBRDeletedArchivedBackupFile)

---

### Examples
> Example 1. Retrieving Backup Files from Amazon S3 Glacier

$backupFile = Get-VBRDeletedArchivedBackupFile
Download-VBRDeletedArchivedBackupFile -BackupFile $BackupFile[0] -AmazonS3GlacierRetrievalPolicy Standard -Overwrite
This example shows how to retrieve backup files from Amazon S3 Glacier.
Perform the following steps:
1. Run the Get-VBRDeletedArchivedBackupFile cmdlet. Save the result to the $backupfile variable.
The Get-VBRDeletedArchivedBackupFile cmdlet will return an array of deleted backup files. Mind the ordinal number of the necessary backup file (in our example, it is the first backup file in the array).
2. Run the Download-VBRDeletedArchivedBackupFile cmdlet. Set the $backupfile[0] variable as the BackupFile parameter value. Specify the AmazonS3GlacierRetrievalPolicy parameter value. Provide the Overwrite parameter.
> Example 2. Retrieving Backup Files from Microsoft Azure Archive Storage

$backupFile = Get-VBRDeletedArchivedBackupFile
Download-VBRDeletedArchivedBackupFile -BackupFile $backupFile[0] AzureArchiveRetrievalPolicy StandardPriority -Overwrite
This example shows how to retrieve backup files from Microsoft Azure Archive Storage.
Perform the following steps:
1. Run the Get-VBRDeletedArchivedBackupFile cmdlet. Save the result to the $backupfile variable.
The Get-VBRDeletedArchivedBackupFile cmdlet will return an array of deleted backup files. Mind the ordinal number of the necessary backup file (in our example, it is the first backup file in the array).
2. Run the Download-VBRDeletedArchivedBackupFile cmdlet. Set the $backupfile[0] variable as the BackupFile parameter value. Specify the AzureArchiveRetrievalPolicy parameter value. Provide the Overwrite parameter.

---

### Parameters
#### **AmazonS3GlacierRetrievalPolicy**
Defines the method of data retrieval for Amazon S3 Glacier object storage. You can retrieve data using one of the following method:
* Expedited: Use this method to retrieve archived data within 1-5 minutes. Note: this is the most expensive method.
* Standard: Use this method to retrieve archived data within 3-5 hours.
-Bulk: Use this method to retrieve archived data within 5-12 hours.
Valid Values:

* Expedited
* StandardAccelerated
* Standard
* Bulk

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRAmazonS3GlacierRetrievalPolicy]`|true    |named   |False        |

#### **AzureArchiveRetrievalPolicy**
Defines the method of data retrieval for Azure Archive storage. You can retrieve data using one of the following method:
* StandardPriority: Use this method to retrieve archived data within 15 hours.
* HighPriority: Use this method to retrieve archived data within an hour. Note: this is the most expensive method.
Valid Values:

* StandardPriority
* HighPriority

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRAzureArchiveRetrievalPolicy]`|true    |named   |False        |

#### **BackupFile**
Specifies an array of deleted backup files that you want to retrieve.

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRDeletedArchivedBackupFile]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Overwrite**
Defines that the cmdlet will overwrite an existing object with the downloaded one.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRDeletedArchivedBackupFile

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Download-VBRDeletedArchivedBackupFile -AmazonS3GlacierRetrievalPolicy {Expedited | StandardAccelerated | Standard | Bulk} -BackupFile <VBRDeletedArchivedBackupFile> [-Overwrite] [-RunAsync] [<CommonParameters>]
```
```PowerShell
Download-VBRDeletedArchivedBackupFile -AzureArchiveRetrievalPolicy {StandardPriority | HighPriority} -BackupFile <VBRDeletedArchivedBackupFile> [-Overwrite] [-RunAsync] [<CommonParameters>]
```
