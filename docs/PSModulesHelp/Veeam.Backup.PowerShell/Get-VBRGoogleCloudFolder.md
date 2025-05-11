Get-VBRGoogleCloudFolder
------------------------

### Synopsis
Returns Google Cloud folders.

---

### Description

This cmdlet returns an array of Google Cloud folders.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

* [Connect-VBRGoogleCloudService](Connect-VBRGoogleCloudService)

* [Get-VBRGoogleCloudBucket](Get-VBRGoogleCloudBucket)

---

### Examples
> Getting Google Cloud Folders

$account = Get-VBRGoogleCloudAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$connection = Connect-VBRGoogleCloudService -Account $account -ServiceType CapacityTier
$bucket = Get-VBRGoogleCloudBucket -Connection $connection -Region $region
Get-VBRGoogleCloudFolder -Connection $connection -Bucket $bucket
This example shows how to get folders added to Google Cloud object storage.
Perform the following steps:
1. Run the Get-VBRGoogleCloudAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRGoogleCloudService cmdlet. Specify the Account and the ServiceType parameters values. Save the result to the $connection variable.
3. Run the Get-VBRGoogleCloudBucket cmdlet. Specify the Connection and Region parameter values. Save the result to the $bucket variable.
4. Run the Get-VBRGoogleCloudFolder cmdlet. Set the $connection variable as the Connection parameter value. Set the $bucket variable as the Bucket parameter value.

---

### Parameters
#### **Bucket**
Specifies an array of Google Cloud buckets. The cmdlet will return an array of the folders added to these buckets.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRGoogleCloudBucket[]]`|true    |named   |False        |

#### **Connection**
Specifies an active session with Google Cloud object storage. The cmdlet will return an array of the folders added to this object storage.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[IVBRGoogleCloudConnection]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for the Google Cloud folders. Veeam Backup & Replication will return the folders with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
Get-VBRGoogleCloudFolder -Bucket <VBRGoogleCloudBucket[]> -Connection <IVBRGoogleCloudConnection> [-Name <String[]>] [<CommonParameters>]
```
