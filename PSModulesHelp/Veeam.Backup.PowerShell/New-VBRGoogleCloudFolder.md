New-VBRGoogleCloudFolder
------------------------

### Synopsis
Creates Google Cloud folders.

---

### Description

This cmdlet creates Google Cloud folders in the selected bucket. Veeam Backup & Replication will use these folders to keep backup files there.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

* [Connect-VBRGoogleCloudService](Connect-VBRGoogleCloudService)

* [Get-VBRGoogleCloudBucket](Get-VBRGoogleCloudBucket)

---

### Examples
> Creating Google Cloud Folder

$account = Get-VBRGoogleCloudAccount -Id "0x0x0xxx-000x-0x0x-000-000x00000x0x"
$connection = Connect-VBRGoogleCloudService -Account $account -RegionType Global -ServiceType CapacityTier
$bucket = Get-VBRGoogleCloudBucket -Connection $connection -Region $region
New-VBRGoogleCloudFolder -Connection $connection -Bucket $bucket -Name "NewFolder"
This example shows how to create a new Google Cloud folder.
Perform the following steps:
1. Run the Get-VBRGoogleCloudAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRGoogleCloudService cmdlet. Specify the Account, RegionType, and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRGoogleCloudBucket cmdlet. Specify the Connection and Region parameter values. Save the result to the $bucket variable.
4. Run the New-VBRGoogleCloudFolder cmdlet. Specify the following settings:
- Set the $connection variable as the Connection parameter value.
- Set the $bucket variable as the Bucket parameter value.
- Provide the Name parameter value.

---

### Parameters
#### **Bucket**
Specifies a Google Cloud bucket. The cmdlet will add a new Google Cloud folder to this bucket.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRGoogleCloudBucket]`|true    |named   |False        |

#### **Connection**
Specifies an active session with Google Cloud object storage. The cmdlet will create a new folder in this Google Cloud object storage.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[IVBRGoogleCloudConnection]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for the Google Cloud folder. The cmdlet will create the Google Cloud folder with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
New-VBRGoogleCloudFolder -Bucket <VBRGoogleCloudBucket> -Connection <IVBRGoogleCloudConnection> -Name <String> [<CommonParameters>]
```
