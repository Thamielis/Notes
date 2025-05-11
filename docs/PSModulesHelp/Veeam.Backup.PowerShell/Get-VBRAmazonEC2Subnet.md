Get-VBRAmazonEC2Subnet
----------------------

### Synopsis
Returns an array of Amazon VPC subnets.

---

### Description

This cmdlet returns an array of subnets that are available in the selected Amazon VPC.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRAmazonEC2Region](Get-VBRAmazonEC2Region)

* [Get-VBRAmazonEC2VPC](Get-VBRAmazonEC2VPC)

---

### Examples
> Example 1

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$region = Get-VBRAmazonEC2Region -Account $account -RegionType Global -Name "ap-northeast-1"
$vpc = Get-VBRAmazonEC2VPC -Region $region
Get-VBRAmazonEC2Subnet -VPC $vpc -AvailabilityZone "eu-west-1a"
This example shows how to get the Amazon VPC subnet by geographic location and the associated Availability Zone.

Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet.    Specify the Id parameter value.    Save the result to the $account variable.
2. Run the Get-VBRAmazonEC2Region cmdlet.    Set the $account variable as the Account parameter value.    Set the Global value as the RegionType parameter value.    Specify the Name parameter value. Save the result to the $region variable.
3. Run the Get-VBRAmazonEC2VPC cmdlet.    Set the $region variable as the Region parameter value.    Save the result to the $vpc variable.
4. Run the Get-VBRAmazonEC2Subnet cmdlet.    Set the $vpc variable as the VCP parameter value.    Specify the AvailabilityZone parameter value.

---

### Parameters
#### **AvailabilityZone**
Specifies the Availability Zone.
The cmdlet will return the Amazon VPC subnet that resides in the specified Availability Zone.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the IP range.
The cmdlet will return the Amazon VPC subnet with this IP range.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **VPC**
Specifies the Amazon VPC.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRAmazonEC2VPC]`|true    |named   |False        |

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
Get-VBRAmazonEC2Subnet [-AvailabilityZone <String>] -VPC <VBRAmazonEC2VPC> [<CommonParameters>]
```
```PowerShell
Get-VBRAmazonEC2Subnet -Name <String> -VPC <VBRAmazonEC2VPC> [<CommonParameters>]
```
