Get-VBRGoogleCloudComputeRegion
-------------------------------

### Synopsis
Returns Google Cloud regions.

---

### Description

This cmdlet returns Google Cloud regions.

---

### Related Links
* [Get-VBRGoogleCloudComputeAccount](Get-VBRGoogleCloudComputeAccount)

---

### Examples
> Getting Regions for Google Cloud Service Account

$account = Get-VBRGoogleCloudComputeAccount -Name "GCP service acc 1"
Get-VBRGoogleCloudComputeRegion -Account $account
This example shows how to return regions for the GCP service acc 1 Google Cloud service account.

Perform the following steps:

Perform the following steps:
1. Run the Get-VBRGoogleCloudComputeAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Get-VBRGoogleCloudComputeRegion cmdlet. Set the $account variable as the Account parameter.

---

### Parameters
#### **Account**
Specifies a Google Cloud service account.
The cmdlet will return regions for the specified Google Cloud service account.
Accepts the VBRGoogleCloudComputeAccount object.
To create this object, run the Add-VBRGoogleCloudComputeAccount cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeAccount]`|true    |named   |False        |

#### **Name**
Specifies a name of the Google Cloud region.
The cmdlet will return the region with the specified name.

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
Get-VBRGoogleCloudComputeRegion -Account <VBRGoogleCloudComputeAccount> [-Name <String>] [<CommonParameters>]
```
