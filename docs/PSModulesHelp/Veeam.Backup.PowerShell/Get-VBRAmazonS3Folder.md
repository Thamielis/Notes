Get-VBRAmazonS3Folder
---------------------

### Synopsis
Returns Amazon S3 folders.

---

### Description

This cmdlet returns the VBRAmazonS3Folder object that contains an array of Amazon S3 folders. You can get the array of the folders for the following types of Amazon object storage:
- Amazon S3
- Amazon S3 Compatible (including IBM Cloud Object Storage)
Note:
The Get-VBRAmazonS3Folder cmdlet returns the array of Amazon S3 folders that are created under the following paths:
- [For Capacity Tier] - /Veeam/Archive/
- [For External Repository] - /Veeam/Backup/

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Connect-VBRAmazonS3Service](Connect-VBRAmazonS3Service)

* [Get-VBRAmazonS3Bucket](Get-VBRAmazonS3Bucket)

---

### Examples
> Example 1. Getting All Folders Added to Amazon Object Storage

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$connection = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
$bucket = Get-VBRAmazonS3Bucket -Connection $connection
Get-VBRAmazonS3Folder -Connection $connection -Bucket $bucket
This example shows how to get folders added to Amazon object storage.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connection variable as the Connection parameter value. Save the result to the $bucket variable.
4. Run the Get-VBRAmazonS3Folder cmdlet. Set the $connection variable as the Connection parameter value. Set the $bucket variable as the Bucket parameter value.
> Example 2. Getting Specific Folder Added to Amazon Object Storage

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$connection = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
$bucket = Get-VBRAmazonS3Bucket -Connection $connection
Get-VBRAmazonS3Folder -Connection $connection -Bucket $bucket -Name "NewBucket"
This example shows how to get a folder added to Amazon object storage.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connection variable as the Connection parameter value. Save the result to the $bucket variable.
4. Run the Get-VBRAmazonS3Folder cmdlet. Set the $connection variable as the Connection parameter value. Set the $bucket variable as the Bucket parameter value. Specify the Name parameter value.

---

### Parameters
#### **Bucket**
Specifies an Amazon S3 bucket. The cmdlet will return an array of the folders added to this bucket.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[VBRAmazonS3Bucket[]]`|true    |named   |True (ByValue)|

#### **Connection**
Specifies an active session with Amazon S3 object storage. The cmdlet will return an array of the folders added to this object storage.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[IVBRAmazonS3Connection]`|true    |named   |False        |

#### **Name**
Specifies a name of the Amazon S3 folder. Veeam Backup & Replication will return the folder with this name.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3Bucket[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAmazonS3Folder -Bucket <VBRAmazonS3Bucket[]> -Connection <IVBRAmazonS3Connection> [-Name <String[]>] [<CommonParameters>]
```
