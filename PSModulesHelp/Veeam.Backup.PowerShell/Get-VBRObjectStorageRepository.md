Get-VBRObjectStorageRepository
------------------------------

### Synopsis
Returns object storage added as backup repositories to Veeam Backup & Replication.

---

### Description

This cmdlet returns an array of object storage added as backup repositories to Veeam Backup & Replication. You can get the following types of these backup repositories:
- Amazon S3
- S3 compatible
- Azure Blob
- Azure Data Box
- Google Cloud object storage

---

### Examples
> Example 1. Getting All Microsoft Azure Blob Object Storage Added as Backup Repositories

```PowerShell
Get-VBRObjectStorageRepository -Type AzureBlob
This command gets all Azure Blob storage added as backup repositories.
```
> Example 2. Getting All Amazon S3 Object Storage Added as Backup Repositories

```PowerShell
Get-VBRObjectStorageRepository -Type Amazon S3
This command gets all Amazon S3 object storage added as backup repositories.
```
> Example 3. Getting All S3 Compatible Object Storage Added as Backup Repositories

```PowerShell
Get-VBRObjectStorageRepository -Type AmazonS3CompatibleService
This command gets all S3 compatible object storage added as backup repositories.
```

---

### Parameters
#### **Id**
Specifies an ID of a backup repository that you want to get.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies the name of a backup repository that you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Type**
Specifies the type of a backup repository that you want to get. You can select the following type of backup repositories:
* AmazonS3
* AmazonS3Compatible
* AzureBlob
* AzureDataBox
* GoogleCloudStorage
Valid Values:

* AmazonS3
* AmazonS3Compatible
* AzureBlob
* AzureDataBox
* GoogleCloudStorage
* Wasabi
* DataCloudVault

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRObjectStorageRepositoryType]`|false   |named   |False        |

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
Get-VBRObjectStorageRepository -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRObjectStorageRepository [-Name <String[]>] [-Type {AmazonS3 | AmazonS3Compatible | AzureBlob | AzureDataBox | GoogleCloudStorage | Wasabi}] [<CommonParameters>]
```
