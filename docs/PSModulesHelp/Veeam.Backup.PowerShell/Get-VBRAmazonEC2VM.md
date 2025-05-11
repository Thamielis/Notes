Get-VBRAmazonEC2VM
------------------

### Synopsis
Returns Amazon EC2 instances.

---

### Description

This cmdlet returns the Amazon EC2 instances.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRAmazonEC2Region](Get-VBRAmazonEC2Region)

---

### Examples
> Getting all Amazon EC2 Instances Available in Specific AWS Region

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$region = Get-VBRAmazonEC2Region -Account $account -RegionType Global -Name "eu-west-3"
$EC2 = Get-VBRAmazonEC2VM -Region $region
This example shows how to get all Amazon EC2 instances available in the Global AWS Region.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter values. Save the result to the $account variable.
2. Run the Get-VBRAmazonEC2Region cmdlet. Set the $account variable as the Account parameter. Set the Global value as the RegionType parameter value. Specify the Name parameter value. Save the result to the $region variable.
3. Run the Get-VBRAmazonEC2VM cmdlet. Set the $region variable as the Region parameter. Save the result to the $EC2 variable.

---

### Parameters
#### **Region**
Specifies AWS Regions in which you want to deploy Veeam Agent on cloud machines.

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
Get-VBRAmazonEC2VM -Region <VBRAmazonEC2Region> [<CommonParameters>]
```
