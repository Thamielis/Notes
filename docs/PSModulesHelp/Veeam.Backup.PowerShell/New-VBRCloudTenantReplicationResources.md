New-VBRCloudTenantReplicationResources
--------------------------------------

### Synopsis
Creates the VBRCloudTenantReplicationResources objects that contain replication resources.

---

### Description

This cmdlet creates a new VBRCloudTenantReplicationResources object. This object contains the cloud tenant replication resources. To provide network access to cloud replicas, you need to configure a network extension appliance. You have the following options:
- Default network extension appliance. If you enable the the failover resources in this cmdlet, the network extension appliance will be created automatically. The network appliance will have default settings.
- Customize the default network appliance. After the network appliance is created automatically, you can change its settings. For details, see Tenant Network Appliances.
- Do not configure a network appliance. The tenant may deploy the network extension appliance(s) manually on their side.
To allocate a number of public IP addresses, you need to pre-configure the public IP addresses pool. For details, see the Add-VBRCloudPublicIP cmdlet.

---

### Related Links
* [New-VBRCloudTenantHwPlanOptions](New-VBRCloudTenantHwPlanOptions)

---

### Examples
> Example 1. Creating Replication Resources with Enabled Failover Capabilities

$HwPlan = Get-VBRCloudHardwarePlan -Name "VMware Silver"
$options = New-VBRCloudTenantHwPlanOptions -HardwarePlan $HwPlan
$resources = New-VBRCloudTenantReplicationResources -EnableNetworkFailoverResources -HardwarePlanOptions $options
This example shows how to create an object containing replication resources with enabled failover capabilities.

Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Specify the Name parameter value. Save it to the $HwPlan variable.
2. Run the New-VBRCloudTenantHwPlanOptions. Set the $HwPlan variable as the HardwarePlan parameter value. Save the result to the $options variable.
3. Run the New-VBRCloudTenantReplicationResources cmdlet. Provide the EnableNetworkFailoverResources parameter. Set the $options variable as the HardwarePlanOptions parameter value. Save the result to the $resources variable for further use.
> Example 2. Creating Replication Resources with Enabled Failover Capabilities and Allocated IP Addresses

$HwPlan = Get-VBRCloudHardwarePlan -Name "VMware Silver"
$options = New-VBRCloudTenantHwPlanOptions -HardwarePlan $HwPlan
$resources = New-VBRCloudTenantReplicationResources -EnableNetworkFailoverResources -HardwarePlanOptions $options -EnablePublicIp -NumberOfPublicIp 5
This example shows how to create an object containing replication resources with enabled failover capabilities and allocate 5 public IP addresses.

Perform the following steps:
1. Run the Add-VBRCloudPublicIP cmdlet. Specify the FirstIpAddress and the LastIpAddress parameter values.
2. Run the Get-VBRCloudHardwarePlan cmdlet. Specify the Name parameter value. Save it to the $HwPlan variable.
3. Run the New-VBRCloudTenantHwPlanOptions cmdlet. Set the $HwPlan variable as the HardwarePlan parameter value. Save the result to the $options variable.
4. Run the New-VBRCloudTenantReplicationResources cmdlet. Specify the following settings:
- Provide the EnableNetworkFailoverResources parameter.
- Set the $options variable as the HardwarePlanOptions parameter value.
- Provide the EnablePublicIp parameter.
- Specify the NumberOfPublicIp parameter value.
- Save the result to the $resources variable for further use.

---

### Parameters
#### **EnableNetworkFailoverResources**
Enables the tenant to use the built-in failover networking management capabilities. The cmdlet will create a network extension appliance with default settings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnablePublicIp**
Enables the tenant to use a range of public IP addresses. Use the NumberOfPublicIp parameter to set the maximum number of IPs. Default: 0.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HardwarePlanOptions**
Specifies the hardware plan options. Accepts the VBRCloudTenantHwPlanOptions object. To get this object, run the New-VBRCloudTenantHwPlanOptions cmdlet.

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRCloudTenantHwPlanOptions[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **NumberOfPublicIp**
Specifies the maximum number of public IPs for the tenant. Accepts values from 1 to 9999.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudTenantHwPlanOptions[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRCloudTenantReplicationResources [-EnableNetworkFailoverResources] [-EnablePublicIp] [-HardwarePlanOptions <VBRCloudTenantHwPlanOptions[]>] [-NumberOfPublicIp <Int32>] [<CommonParameters>]
```
