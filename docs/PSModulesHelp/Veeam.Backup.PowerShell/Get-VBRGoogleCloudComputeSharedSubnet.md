Get-VBRGoogleCloudComputeSharedSubnet
-------------------------------------

### Synopsis
Returns subnets of Google Cloud shared VPC network.

---

### Description

This cmdlet returns subnets of Google Cloud shared VPC network.

---

### Related Links
* [Get-VBRGoogleCloudComputeAccount](Get-VBRGoogleCloudComputeAccount)

---

### Examples
> Getting Subnets of Shared VPC Network for Google Cloud Service Account

$account = Get-VBRGoogleCloudComputeAccount -Name "GCP service acc 1"
Get-VBRGoogleCloudComputeSharedSubnet -Account $account
This example shows how to get subnets of the shared VPC network for the GCP service acc 1 Google Cloud service account.

Perform the following steps:

1. Run the Get-VBRGoogleCloudComputeAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Get-VBRGoogleCloudComputeSharedSubnet cmdlet. Set the $account variable as the Account parameter.

---

### Parameters
#### **Account**
Specifies a Google Cloud service account.
The cmdlet will return subnets of the shared VPC network for the specified Google Cloud service account.
Accepts the VBRGoogleCloudComputeAccount object.
To create this object, run the Add-VBRGoogleCloudComputeAccount cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeAccount]`|true    |named   |False        |

#### **Name**
Specifies a name of the subnet.
The cmdlet will return the subnet with the specified name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Region**
Specifies a Google Cloud region.
The cmdlet will return subnets of the shared VPC for the specified Google Cloud region.
Accepts the VBRGoogleCloudComputeRegion object.
To get this object, run the Get-VBRGoogleCloudComputeRegion cmdlet.

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
Get-VBRGoogleCloudComputeSharedSubnet -Account <VBRGoogleCloudComputeAccount> [-Name <String>] [-Region <String>] [<CommonParameters>]
```
