Get-VBRGoogleCloudRegion
------------------------

### Synopsis
Returns Google Cloud regions.

---

### Description

This cmdlet returns an array of Google Cloud regions.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

* [Connect-VBRGoogleCloudService](Connect-VBRGoogleCloudService)

---

### Examples
> Getting Google Cloud Regions

$account = Get-VBRGoogleCloudAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$connection = Connect-VBRGoogleCloudService -Account $account -ServiceType CapacityTier
Get-VBRGoogleCloudRegion -Connection $connection
This example shows how to get Google Cloud regions.
Perform the following steps:
1. Run the Get-VBRGoogleCloudAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRGoogleCloudService cmdlet. Specify the Account and ServiceType parameter values. Save the result to the $connection variable.
3. Run the Get-VBRGoogleCloudRegion cmdlet. Set the $connection variable as the Connection parameter value.

---

### Parameters
#### **Connection**
Specifies an active session with Google Cloud. The cmdlet will return an array of all Google Cloud regions from this session.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[IVBRGoogleCloudConnection]`|false   |named   |True (ByPropertyName, ByValue)|

#### **RegionId**
Specifies an ID of Google Cloud region. The cmdlet will return the Google Cloud region with this IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Get-VBRGoogleCloudRegion [-Connection <IVBRGoogleCloudConnection>] [-RegionId <String>] [<CommonParameters>]
```
