Get-VBRArchiveObjectStorageRepository
-------------------------------------

### Synopsis
Returns archive repositories added to the backup infrastructure.

---

### Description

This cmdlet returns a list of archive repositories added to Veeam Backup & Replication. You can get the following types of these archive repositories:
- Amazon S3 Glacier
- Azure Archive
- S3 compatible object storage with data archiving

---

### Examples
> Example 1. Getting Azure Archive Repositories

```PowerShell
Get-VBRObjectStorageRepository -Type AzureArchive
This command gets all Azure Archive repository instances added to the backup infrastructure.
```
> Example 2. Getting Amazon S3 Glacier Archive Repositories

```PowerShell
Get-VBRObjectStorageRepository -Type AmazonS3Glacier
This command gets all Amazon S3 Glacier archive repository instances added to the backup infrastructure.
```

---

### Parameters
#### **Id**
Specifies an ID of an archive repository that you want to get.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies a name of an archive repository that you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Type**
Specifies the type of an archive repository that you want to get. You can select the following type of backup repositories:
* Amazon S3 Glacier
* Azure Archive
Valid Values:

* AzureArchive
* AmazonS3Glacier
* S3GlacierCompatible

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[VBRArchiveObjectStorageRepositoryType]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRArchiveObjectStorageRepository

---

### Notes

---

### Syntax
```PowerShell
Get-VBRArchiveObjectStorageRepository [-Id <Guid[]>] [-Type {AzureArchive | AmazonS3Glacier | S3GlacierCompatible}] [<CommonParameters>]
```
```PowerShell
Get-VBRArchiveObjectStorageRepository [-Name <String[]>] [-Type {AzureArchive | AmazonS3Glacier | S3GlacierCompatible}] [<CommonParameters>]
```
