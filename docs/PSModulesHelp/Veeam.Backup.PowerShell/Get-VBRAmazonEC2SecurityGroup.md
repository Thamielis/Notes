Get-VBRAmazonEC2SecurityGroup
-----------------------------

### Synopsis
Returns an array of AmazonEC2 security groups.

---

### Description

This cmdlet returns an array of Amazon EC2 security groups that are configured for the specified Amazon VPC.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRAmazonEC2Region](Get-VBRAmazonEC2Region)

* [Get-VBRAmazonEC2VPC](Get-VBRAmazonEC2VPC)

---

### Examples
> Example 1

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$region = Get-VBRAmazonEC2Region -Account $account -RegionType Global -Name "eu-west-3"
$vpc = Get-VBRAmazonEC2VPC -Region $region
Get-VBRAmazonEC2SecurityGroup -VPC $vpc
This example shows how to get an array of Amazon EC2 security groups that are configured for selected Amazon VCP.

Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Get-VBRAmazonEC2Region cmdlet.
Set the $account variable as the Account parameter value.    Set the Global value as the RegionType parameter value.    Specify the Name parameter value. Save the result to the $region variable.
3. Run the Get-VBRAmazonEC2VPC cmdlet. Set the $region variable as the Region parameter value. Save the result to the $vpc variable.
4. Run the Get-VBRAmazonEC2SecurityGroup cmdlet. Set the $vpc variable as the VPC parameter value.

---

### Parameters
#### **Name**
Specifies the name of the security group.
The cmdlet will return the security group with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VPC**
Specifies an Amazon VPC.
Accepts the VBRAmazonEC2VPC object.
To get this object, run the Get-VBRAmazonEC2VPC cmdlet.

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
Get-VBRAmazonEC2SecurityGroup [-Name <String>] -VPC <VBRAmazonEC2VPC> [<CommonParameters>]
```
