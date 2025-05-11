Get-VBRGoogleCloudComputeSubnet
-------------------------------

### Synopsis
Returns subnets for Google Cloud region.

---

### Description

This cmdlet returns subnets for Google Cloud region.

---

### Related Links
* [Get-VBRGoogleCloudComputeRegion](Get-VBRGoogleCloudComputeRegion)

* [Get-VBRGoogleCloudComputeAccount](Get-VBRGoogleCloudComputeAccount)

* [Get-VBRGoogleCloudComputeVPC](Get-VBRGoogleCloudComputeVPC)

---

### Examples
> Getting Subnets for Google Cloud Region

$computeregion = Get-VBRGoogleCloudComputeRegion -Name "Europe-west1"
$account = Get-VBRGoogleCloudComputeAccount -Name "GCP service account 1"
$vpc = Get-VBRGoogleCloudComputeVPC -Account $account
Get-VBRGoogleCloudComputeSubnet -Region $computeregion -VPC $vpc
This example shows how to get subnets for the Europe-west1 Google Cloud region and VPC network of the GCP service account 1 Google Cloud service account.

Perform the following steps:

1. Run the Get-VBRGoogleCloudComputeRegion cmdlet. Specify the Name parameter value. Save the result to the $computeregion variable.
2. Run the Get-VBRGoogleCloudComputeAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
3. Run the Get-VBRGoogleCloudComputeVPC cmdlet. Set the $account variable as the Account parameter. Save the result to the $vpc variable.
4. Run the Get-VBRGoogleCloudComputeSubnet cmdlet. Set the $computeregion variable as the Region parameter. Set the $vpc variable as the VPC parameter.

---

### Parameters
#### **Name**
Specifies a name of the subnet.
The cmdlet will return the subnet with the specified name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Region**
Specifies a Google Cloud region.
The cmdlet will return subnets for the specified Google Cloud region.
Accepts the VBRGoogleCloudComputeRegion object.
To get this object, run the Get-VBRGoogleCloudComputeRegion cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeRegion]`|true    |named   |False        |

#### **VPC**
Specifies a Google Cloud VPC network.
The cmdlet will return subnets for the specified Google Cloud VPC network.
Accepts the VBRGoogleCloudComputeVPC object.
To get this object, run the Get-VBRGoogleCloudComputeVPC cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeVPC]`|false   |named   |False        |

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
Get-VBRGoogleCloudComputeSubnet [-Name <String>] -Region <VBRGoogleCloudComputeRegion> [-VPC <VBRGoogleCloudComputeVPC>] [<CommonParameters>]
```
