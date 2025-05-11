New-VBRGoogleCloudComputeProxyAppliance
---------------------------------------

### Synopsis
Creates proxy appliances for restoring VMs to Google Cloud.

---

### Description

This cmdlet creates proxy appliances for restoring VMs to Google Cloud.

---

### Related Links
* [Get-VBRGoogleCloudComputeRegion](Get-VBRGoogleCloudComputeRegion)

* [Get-VBRGoogleCloudComputeZone](Get-VBRGoogleCloudComputeZone)

* [Get-VBRGoogleCloudComputeInstanceType](Get-VBRGoogleCloudComputeInstanceType)

* [Get-VBRGoogleCloudComputeAccount](Get-VBRGoogleCloudComputeAccount)

* [Get-VBRGoogleCloudComputeVPC](Get-VBRGoogleCloudComputeVPC)

* [Get-VBRGoogleCloudComputeSubnet](Get-VBRGoogleCloudComputeSubnet)

---

### Examples
> Creating Google Cloud Proxy Appliance

$computeregion = Get-VBRGoogleCloudComputeRegion -Name "Europe-west1"
$computezone = Get-VBRGoogleCloudComputeZone -Region $computeregion
$instancetype = Get-VBRGoogleCloudComputeInstanceType -Zone $computezone
$account = Get-VBRGoogleCloudComputeAccount -Name "GCP service account 1"
$vpc = Get-VBRGoogleCloudComputeVPC -Account $account
$subnet = Get-VBRGoogleCloudComputeSubnet -Region $computeregion -VPC $vpc
New-VBRGoogleCloudComputeProxyAppliance -InstanceType $instancetype -Subnet $subnet -RedirectorPort "443"
This example shows how to create a new Google Cloud proxy appliance.

Perform the following steps:

1. Run the Get-VBRGoogleCloudComputeRegion cmdlet. Specify the Name parameter value. Save the result to the $computeregion variable.
2. Run the Get-VBRGoogleCloudComputeZone cmdlet. Set the $computeregion variable as the Region parameter. Save the result to the $computezone parameter value.
3. Run the Get-VBRGoogleCloudComputeInstanceType cmdlet. Set the $computezone variable as the Zone parameter. Save the result to the $instancetype parameter value.
4. Run the Get-VBRGoogleCloudComputeAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
5. Run the Get-VBRGoogleCloudComputeVPC cmdlet. Set the $account variable as the Account parameter. Save the result to the $vpc variable.
6. Run the Get-VBRGoogleCloudComputeSubnet cmdlet. Set the $computeregion variable as the Region parameter. Set the $vpc variable as the VPC parameter. Save the result to the $subnet parameter value.
7. Run the New-VBRGoogleCloudComputeProxyAppliance cmdlet. Specify the following settings:
- Set the $instancetype variable as the InstanceType parameter.
- Set the $subnet variable as the Subnet parameter.
- Provide the RedirictorPort parameter value.

---

### Parameters
#### **InstanceType**
Specifies a Google Cloud instance type.
The cmdlet will create a new proxy appliance with the settings based on this VM instance type.
Accepts the VBRGoogleCloudComputeInstanceType object.
To get this object, run the Get-VBRGoogleCloudComputeInstanceType cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeInstanceType]`|true    |named   |False        |

#### **RedirectorPort**
Specifies a port.
Veeam Backup & Replication will use this port to route requests between the proxy appliance that the cmdlet will create and backup infrastructure components

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **Subnet**
Specifies a Google Cloud subnet.
The cmdlet will create a new proxy appliance that will use the specified subnet.
Accepts the VBRGoogleCloudComputeSubnet object.
To get this object, run the Get-VBRGoogleCloudComputeSubnet cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeSubnet]`|true    |named   |False        |

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
New-VBRGoogleCloudComputeProxyAppliance -InstanceType <VBRGoogleCloudComputeInstanceType> -RedirectorPort <Int32> -Subnet <VBRGoogleCloudComputeSubnet> [<CommonParameters>]
```
