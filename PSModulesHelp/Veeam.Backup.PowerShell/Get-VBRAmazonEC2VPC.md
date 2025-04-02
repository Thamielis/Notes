Get-VBRAmazonEC2VPC
-------------------

### Synopsis
Returns an Amazon VPC.

---

### Description

This cmdlet returns an Amazon VPC.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRAmazonEC2Region](Get-VBRAmazonEC2Region)

---

### Examples
> Example 1

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$region = Get-VBRAmazonEC2Region -Account $account -RegionType Global -Name "ap-northeast-1"
Get-VBRAmazonEC2VPC -Region $region
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Get-VBRAmazonEC2Region cmdlet.    Set the $account variable as the Account parameter value.    Set the Global value as the RegionType parameter value.    Specify the Name parameter value. Save the result to the $region variable.
3. Run the Get-VBRAmazonEC2VPC cmdlet. Set the $region variable as the Region parameter value.

---

### Parameters
#### **AWSObjectId**
Specifies the internal ID of the Amazon VPC.
The cmdlet will return the VPC with this ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Region**
Specifies an AWS region.
The cmdlet will return Amazon VPCs that are configured for this AWS location.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRAmazonEC2Region]`|true    |named   |False        |

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
Get-VBRAmazonEC2VPC [-AWSObjectId <String>] -Region <VBRAmazonEC2Region> [<CommonParameters>]
```
