Get-VBRGoogleCloudComputeZone
-----------------------------

### Synopsis
Returns Google Cloud availability zones.

---

### Description

This cmdlet returns Google Cloud availability zones.

---

### Related Links
* [Get-VBRGoogleCloudComputeRegion](Get-VBRGoogleCloudComputeRegion)

---

### Examples
> Getting Availability Zones for Google Cloud Region

$computeregion = Get-VBRGoogleCloudComputeRegion -Name "Europe-west1"
Get-VBRGoogleCloudComputeZone -Region $computeregion
This example shows how to return availability zones for the Europe-west1 Google Cloud region.

Perform the following steps:

1. Run the Get-VBRGoogleCloudComputeRegion cmdlet. Specify the Name parameter value. Save the result to the $computeregion variable.
2. Run the Get-VBRGoogleCloudComputeZone cmdlet. Set the $computeregion variable as the Region parameter.

---

### Parameters
#### **Name**
Specifies a name of the availability zone.
The cmdlet will return the availability zone with the specified name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Region**
Specifies a Google Cloud region.
The cmdlet will return availability zones for the specified Google Cloud region.
Accepts the VBRGoogleCloudComputeRegion object.
To get this object, run the Get-VBRGoogleCloudComputeRegion cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeRegion]`|true    |named   |False        |

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
Get-VBRGoogleCloudComputeZone [-Name <String>] -Region <VBRGoogleCloudComputeRegion> [<CommonParameters>]
```
