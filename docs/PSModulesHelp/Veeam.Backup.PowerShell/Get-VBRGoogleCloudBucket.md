Get-VBRGoogleCloudBucket
------------------------

### Synopsis
Returns Google Cloud buckets.

---

### Description

This cmdlet returns an array of Google Cloud buckets.
IMPORTANT!
To be able to get a list of all buckets, you must configure the storage.buckets.list permission.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

* [Connect-VBRGoogleCloudService](Connect-VBRGoogleCloudService)

* [Get-VBRGoogleCloudRegion](Get-VBRGoogleCloudRegion)

---

### Examples
> Getting Array of Google Cloud Buckets within Region

$account = Get-VBRGoogleCloudAccount -Id "936edf7c-7cf3-4ddc-9895-c7485ef4bb2c"
$connection = Connect-VBRGoogleCloudService -Account $account -ServiceType CapacityTier
$region = Get-VBRGoogleCloudRegion -Connection $connection
Get-VBRGoogleCloudBucket -Connection $connection -Region $region
This example shows how to get an array of all Google Cloud buckets from a particular Google Cloud region.
Perform the following steps:
1. Run the Get-VBRGoogleCloudAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRGoogleCloudService cmdlet. Specify the Account, RegionType, and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRGoogleCloudRegion cmdlet. Specify the Connection parameter value. Save the result to the $region variable.
4. Run the Get-VBRGoogleCloudBucket cmdlet. Specify the following settings:
- Set the $connection variable as the Connection parameter value.
- Set the $region variable as the Region parameter value.

---

### Parameters
#### **Connection**
Specifies an active session with Google Cloud object storage.
The cmdlet will return an array of Google Cloud buckets for this Google Cloud object storage.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[IVBRGoogleCloudConnection]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies a name of the Google Cloud bucket. The cmdlet will return the bucket with this name.
Note: If you do not have permissions to get all buckets, the cmdlet will not return the necessary bucket.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Region**
Specifies an array of Google Cloud regions where Google Cloud buckets are located.
The cmdlet will return an array of Google Cloud buckets from these Google Cloud regions.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRGoogleCloudRegion[]]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRGoogleCloudConnection

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRGoogleCloudBucket -Connection <IVBRGoogleCloudConnection> [-Name <String[]>] -Region <VBRGoogleCloudRegion[]> [<CommonParameters>]
```
