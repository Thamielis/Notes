New-VBRAmazonS3Folder
---------------------

### Synopsis
Creates Amazon S3 folders.

---

### Description

This cmdlet creates Amazon S3 folders in the selected bucket. Veeam Backup & Replication will use these folders to keep backup files there.
You can create a new folder for the following types of Amazon object storage:
- Amazon S3
- S3 compatible (including IBM Cloud Object Storage)

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Connect-VBRAmazonS3Service](Connect-VBRAmazonS3Service)

* [Get-VBRAmazonS3Bucket](Get-VBRAmazonS3Bucket)

---

### Examples
> Creating New Amazon S3 Folder

$account = Get-VBRAmazonAccount -Id "0x0x0xxx-000x-0x0x-000-000x00000x0x"
$connection = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
$bucket = Get-VBRAmazonS3Bucket -Connection $connection
New-VBRAmazonS3Folder -Connection $connection -Bucket $bucket -Name "NewFolder"
This example shows how to create a new Amazon S3 folder.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connection variable as the Connection parameter value. Save the result to the $bucket variable.
4. Run the New-VBRAmazonS3Folder cmdlet. Set the $connection variable as the Connection parameter value. Set the $bucket variable as the Bucket parameter value. Specify the Name parameter value.

---

### Parameters
#### **Bucket**
Specifies an Amazon S3 bucket. The cmdlet will add a new Amazon S3 folder to this bucket.

|Type                 |Required|Position|PipelineInput |
|---------------------|--------|--------|--------------|
|`[VBRAmazonS3Bucket]`|true    |named   |True (ByValue)|

#### **Connection**
Specifies an active session with Amazon S3 object storage. The cmdlet will create a new folder in this Amazon S3 object storage.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[IVBRAmazonS3Connection]`|true    |named   |False        |

#### **Name**
Specifies a name of the Amazon S3 folder. The cmdlet will create the Amazon S3 folder with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3Bucket

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRAmazonS3Folder -Bucket <VBRAmazonS3Bucket> -Connection <IVBRAmazonS3Connection> -Name <String> [<CommonParameters>]
```
