Get-VBRGoogleCloudComputeVPC
----------------------------

### Synopsis
Returns Virtual Private Cloud (VPC) networks.

---

### Description

This cmdlet returns VPC networks.

---

### Related Links
* [Get-VBRGoogleCloudComputeAccount](Get-VBRGoogleCloudComputeAccount)

---

### Examples
> Getting VPC Networks for Google Cloud Service Account

$account = Get-VBRGoogleCloudComputeAccount -Name "GCP service account 1"
Get-VBRGoogleCloudComputeVPC -Account $account
This example shows how to get VPC networks for the GCP service account 1 Google Cloud service account.

Perform the following steps:

1. Run the Get-VBRGoogleCloudComputeAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Get-VBRGoogleCloudComputeVPC cmdlet. Set the $account variable as the Account parameter.

---

### Parameters
#### **Account**
Specifies a Google Cloud service account.
The cmdlet will return VPC networks for the specified Google Cloud service account.
Accepts the VBRGoogleCloudComputeAccount object.
To create this object, run the Add-VBRGoogleCloudComputeAccount cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeAccount]`|true    |named   |False        |

#### **Name**
Specifies a name of the VPC network.
The cmdlet will return the VPC network with the specified name.

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
Get-VBRGoogleCloudComputeVPC -Account <VBRGoogleCloudComputeAccount> [-Name <String>] [<CommonParameters>]
```
