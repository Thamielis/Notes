Get-VBRAmazonEC2InstanceType
----------------------------

### Synopsis
Returns an array of Amazon EC2 instances.

---

### Description

This cmdlet returns an array of Amazon EC2 instance types that are available for the specified AWS region. It also returns the information about the memory and the CPU available for each instance type.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRAmazonEC2Region](Get-VBRAmazonEC2Region)

---

### Examples
> Example 1

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$region = Get-VBRAmazonEC2Region -Account $account -RegionType Global -Name "ap-northeast-1"
Get-VBRAmazonEC2InstanceType -Region $region
This example shows how to get an array of all instance types from the specified AWS region.
The cmdlet will return all instance types from the ap-northeast-1 AWS region.

Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Get-VBRAmazonEC2Region cmdlet. Set the $account variable as the Account parameter value. Set the Global value as the RegionType parameter value. Specify the Name parameter value. Save the result to the $region variable.
3. Run the Get-VBRAmazonEC2InstanceType cmdlet. Set the $region variable as the Region parameter value.

---

### Parameters
#### **Name**
Specifies the name of the Amazon EC2 instance type.
The cmdlet will return the instance type with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Region**
Specifies an AWS region.
The cmdlet will return an array of Amazon EC2 instance types that are available for the specified AWS region.
Accepts the VBRAmazonEC2Region object.
To get this object, run the Get-VBRAmazonEC2Region cmdlet.

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
Get-VBRAmazonEC2InstanceType [-Name <String>] -Region <VBRAmazonEC2Region> [<CommonParameters>]
```
