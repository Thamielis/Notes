Get-VBRGoogleCloudComputeInstanceType
-------------------------------------

### Synopsis
Returns Google Cloud VM instance types.

---

### Description

This cmdlet returns Google Cloud VM instance types and information about the memory and the CPU available for each VM instance type.

---

### Related Links
* [Get-VBRGoogleCloudComputeRegion](Get-VBRGoogleCloudComputeRegion)

* [Get-VBRGoogleCloudComputeZone](Get-VBRGoogleCloudComputeZone)

---

### Examples
> Getting VM Instance Types for Google Cloud Region

$computeregion = Get-VBRGoogleCloudComputeRegion -Name "Europe-west1"
$computezone = Get-VBRGoogleCloudComputeZone -Region $computeregion
Get-VBRGoogleCloudComputeInstanceType -Zone $computezone
This example shows how to get an array of VM instance types for the Europe-west1 Google Cloud region.

Perform the following steps:

1. Run the Get-VBRGoogleCloudComputeRegion cmdlet. Specify the Name parameter value. Save the result to the $computeregion variable.
2. Run the Get-VBRGoogleCloudComputeZone cmdlet. Set the $computeregion variable as the Region parameter. Save the result to the $computezone parameter value.
3. Run the Get-VBRGoogleCloudComputeInstanceType cmdlet. Set the $computezone variable as the Zone parameter.

---

### Parameters
#### **Name**
Specifies the name of the Google Cloud VM instance type.
The cmdlet will return the VM instance type with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Zone**
Specifies a Google Cloud availability zone.
The cmdlet will return an array of Google Cloud VM instance types that are available for the specified availability zone.
Accepts the VBRGoogleCloudComputeZone object.
To get this object, run the Get-VBRGoogleCloudComputeZone cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeZone]`|true    |named   |False        |

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
Get-VBRGoogleCloudComputeInstanceType [-Name <String>] -Zone <VBRGoogleCloudComputeZone> [<CommonParameters>]
```
