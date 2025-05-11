New-VBRAmazonEC2ProxyAppliance
------------------------------

### Synopsis
Defines settings for Amazon EC2 helper appliances.

---

### Description

This cmdlet creates the VBRAmazonEC2ProxyAppliance object. This object contains settings for Amazon EC2 helper appliances.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRAmazonEC2Region](Get-VBRAmazonEC2Region)

* [Get-VBRAmazonEC2InstanceType](Get-VBRAmazonEC2InstanceType)

* [Get-VBRAmazonEC2VPC](Get-VBRAmazonEC2VPC)

* [Get-VBRAmazonEC2SecurityGroup](Get-VBRAmazonEC2SecurityGroup)

* [Get-VBRAmazonEC2Subnet](Get-VBRAmazonEC2Subnet)

---

### Examples
> Example 1

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$region = Get-VBRAmazonEC2Region -Account $account -RegionType Global -Name "ap-northeast-1"
$instance = Get-VBRAmazonEC2InstanceType -Region $region
$vpc = Get-VBRAmazonEC2VPC -Region $region
$sgroup = Get-VBRAmazonEC2SecurityGroup -VPC $vpc
$subnet = Get-VBRAmazonEC2Subnet -VPC $vpc -AvailabilityZone "eu-west-1a"
New-VBRAmazonEC2ProxyAppliance -InstanceType $instance -Subnet $subnet -SecurityGroup $sgroup -RedirectorPort 443
This example shows how to define settings for the AmazonEC2 helper appliance.

Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Get-VBRAmazonEC2Region cmdlet. Set the $account variable as the Account parameter value. Set the Global value as the RegionType parameter value. Specify the Name parameter value. Save the result to the $region variable.
3. Run the Get-VBRAmazonEC2InstanceType cmdlet. Set the $region variable as the Region parameter value. Save the result to the $instance variable.
4. Run the Get-VBRAmazonEC2VPC cmdlet. Set the $region variable as the Region parameter value. Save the result to the $vpc variable.
5. Run the Get-VBRAmazonEC2SecurityGroup cmdlet. Set the $vpc variable as the VPC parameter value. Save the result to the $sgroup variable.
6. Run the Get-VBRAmazonEC2Subnet cmdlet. Set the $vpc variable as the VPC parameter value. Specify the AvailabilityZone parameter value. Save the result to the $subnet variable.
7. Run the New-VBRAmazonEC2ProxyAppliance cmdlet. Specify the following settings:
- Set the $instance variable as the InstanceType parameter value.
- Set the $subnet variable as the Subnet parameter value.
- Set the $sgroup variable as the SecurityGroup parameter value.
- Specify the RedirectorPort parameter value.

---

### Parameters
#### **InstanceType**
Specifies a Amazon EC2 instance type.
The cmdlet will set the CPU and memory settings for a Amazon EC2 instance according to this instance type.
Accepts the VBRAmazonEC2InstanceType object. To get this object, run the Get-VBRAmazonEC2InstanceType cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRAmazonEC2InstanceType]`|true    |named   |False        |

#### **RedirectorPort**
Specifies the redirection port number.
Veeam Backup & Replication will use this port to connect to the proxy appliance.
Default: 443

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **SecurityGroup**
Specifies the Amazon EC2 security group.
Accepts the VBRAmazonEC2SecurityGroup object.
To get this object, run the Get-VBRAmazonEC2SecurityGroup cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRAmazonEC2SecurityGroup]`|true    |named   |False        |

#### **Subnet**
Specifies the Amazon VPC subnet.
Accepts the VBRAmazonEC2Subnet object.
To get this object, run the Get-VBRAmazonEC2Subnet cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRAmazonEC2Subnet]`|true    |named   |False        |

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
New-VBRAmazonEC2ProxyAppliance -InstanceType <VBRAmazonEC2InstanceType> -RedirectorPort <Int32> -SecurityGroup <VBRAmazonEC2SecurityGroup> -Subnet <VBRAmazonEC2Subnet> [<CommonParameters>]
```
