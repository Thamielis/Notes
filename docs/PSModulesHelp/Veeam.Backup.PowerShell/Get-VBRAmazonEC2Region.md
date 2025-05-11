Get-VBRAmazonEC2Region
----------------------

### Synopsis
Returns AWS Regions and datacenters.

---

### Description

This cmdlet returns an array of AWS Regions and datacenters.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

---

### Examples
> Example 1

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
Get-VBRAmazonEC2Region -Account $account -RegionType Global -Name "eu-west-3"
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable. 2. Run the Get-VBRAmazonEC2Region cmdlet. Set the $account variable as the Account parameter value.    Set the Global value as the RegionType parameter value. Specify the Name parameter value.

---

### Parameters
#### **Account**
Specifies AWS credentials records. Veeam Backup and Replication will use these credentials to connect to the AWS account.
Accepts the VBRAmazonAccount object. To get this object, run the Get-VBRAmazonAccount cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRAmazonAccount]`|true    |named   |False        |

#### **Name**
Specifies the AWS datacenter.
The cmdlet will return the datacenter with the specified name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RegionType**
Specifies the AWS Regions type:
* Global
* Government
* China
Veeam Backup and Replication will get an array of Amazon EC2 Regions based on the specified type.
Valid Values:

* Global
* Government
* China

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRAmazonRegionType]`|true    |named   |False        |

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
Get-VBRAmazonEC2Region -Account <VBRAmazonAccount> [-Name <String>] -RegionType {Global | Government | China} [<CommonParameters>]
```
