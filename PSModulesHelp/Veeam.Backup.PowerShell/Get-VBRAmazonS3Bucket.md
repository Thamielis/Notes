Get-VBRAmazonS3Bucket
---------------------

### Synopsis
Returns Amazon S3 buckets.

---

### Description

This cmdlet returns the VBRAmazonS3Bucket object that contains an array of Amazon buckets for the following Amazon services:
- Amazon S3
- Amazon S3 Compatible (including IBM Cloud Object Storage)
IMPORTANT! To be able to get a list of all buckets, you must configure the s3:ListAllMyBuckets permission.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Connect-VBRAmazonS3Service](Connect-VBRAmazonS3Service)

* [Get-VBRAmazonS3Region](Get-VBRAmazonS3Region)

---

### Examples
> Example 1. Getting All Amazon S3 Buckets from Specific Amazon S3 Region

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4ddc-9895-c7485ef4bb2c"
$connection = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
$region = Get-VBRAmazonS3Region -Connection $connection
Get-VBRAmazonS3Bucket -Connection $connection -Region $region
This example shows how to get an array of all Amazon S3 buckets from a particular Amazon S3 region.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRAmazonS3Region cmdlet. Set the $connection variable as the Connection parameter value. Save the result to the $region variable.
4. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connection variable as the Connection parameter value. Set the $region variable as the Region parameter value.
> Example 2. Getting All Amazon S3 Buckets from Specific Amazon S3 Region

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4ddc-9895-c7485ef4bb2c"
$connection = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
$region = Get-VBRAmazonS3Region -Connection $connection -Regionid eu-west-1
Get-VBRAmazonS3Bucket -Connection $connection -Region $region
This example shows how to get an array of all Amazon S3 buckets from the selected Amazon S3 region.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRAmazonS3Region cmdlet. Set the $connection variable as the Connection parameter value. Specify the Regionid parameter value. Save the result to the $region variable.
4. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connection variable as the Connection parameter value. Set the $region variable as the Region parameter value.
> Example 3. Getting Amazon S3 Bucket

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4ddc-9895-c7485ef4bb2c"
$connection = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
Get-VBRAmazonS3Bucket -Connection $connection -Name "MyBucket"
This example shows how to get an Amazon S3 bucket.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connection variable as the Connection parameter value. Specify the Name parameter value.

---

### Parameters
#### **Connection**
Specifies an active session with Amazon object storage. The cmdlet will return an array of Amazon S3 buckets for this Amazon object storage.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[IVBRAmazonS3Connection]`|true    |named   |False        |

#### **Name**
Specifies a name of the Amazon S3 bucket. The cmdlet will return the bucket with this name.
Note: If you do not grant necessary  permissions to the get all buckets, the cmdlet will not return the necessary bucket.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Region**
Specifies an array of Amazon S3 regions where Amazon S3 buckets are located. The cmdlet will return an array of Amazon S3 buckets from these Amazon S3 regions.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[VBRAmazonS3Region[]]`|false   |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3Region[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAmazonS3Bucket -Connection <IVBRAmazonS3Connection> [-Name <String[]>] [-Region <VBRAmazonS3Region[]>] [<CommonParameters>]
```
