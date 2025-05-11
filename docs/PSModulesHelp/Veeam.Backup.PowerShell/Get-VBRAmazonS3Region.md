Get-VBRAmazonS3Region
---------------------

### Synopsis
Returns Amazon S3 regions.

---

### Description

This cmdlet returns an array of Amazon S3 regions. You can get regions for the following services:
- Amazon S3
- S3 compatible (including IBM Cloud Object Storage)

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Connect-VBRAmazonS3Service](Connect-VBRAmazonS3Service)

---

### Examples
> Example 1. Getting Amazon S3 Regions

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$connection = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
Get-VBRAmazonS3Region -Connection $connection
This example shows how to get Amazon S3 regions.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRAmazonS3Region cmdlet. Set the $connection variable as the Connection parameter value.
> Example 2. Getting Amazon S3 Regions for Amazon S3 Object Storage

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$connection = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
Get-VBRAmazonS3Region -Connection $connection -RegionId "eu-west-3"
This example shows how to get Amazon S3 regions for Amazon S3 object storage.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRAmazonS3Region cmdlet. Set the $connection variable as the Connection parameter value. Specify the RegionId parameter value.

---

### Parameters
#### **Connection**
Specifies an active session with AWS. The cmdlet will return an array of all Amazon S3 regions from this session.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[IVBRAmazonS3Connection]`|false   |named   |False        |

#### **RegionId**
Specifies an ID of Amazon S3 region. The cmdlet will return an array of Amazon S3 regions with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Get-VBRAmazonS3Region [-Connection <IVBRAmazonS3Connection>] [-RegionId <String>] [<CommonParameters>]
```
