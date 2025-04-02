Set-VBRCloudProviderNetworkAppliance
------------------------------------

### Synopsis
Modifies network extension appliances on user side.

---

### Description

This cmdlet modifies a selected VMware or a Hyper-V network extension appliance on the user cloud host.

---

### Related Links
* [Get-VBRCloudProviderNetworkAppliance](Get-VBRCloudProviderNetworkAppliance)

* [Get-VBRServer](Get-VBRServer)

* [Get-VBRHvServerNetworkInfo](Get-VBRHvServerNetworkInfo)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

* [Find-VBRViResourcePool](Find-VBRViResourcePool)

* [Find-VBRViDatastore](Find-VBRViDatastore)

---

### Examples
> Example 1. Modifying Resource Pool Settings for VMware Appliance

$provider = Get-VBRCloudProvider -Name "104.45.95.227" 
$viAppl = Get-VBRCloudProviderNetworkAppliance -CloudProvider $provider
$server = $viAppl.Host
$newResPool = Find-VBRViResourcePool -Name "ResourcePool_05" -Server $server
$appliance = Set-VBRCloudProviderNetworkAppliance -NetworkAppliance $viAppl -ResourcePool $newResPool
This example shows how to change the resource pool for a VMware appliance created on the srv02.tech.local host.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value. Save the result to the $provider variable.
2. Run the Get-VBRCloudProviderNetworkAppliance cmdlet. Set the $provider variable as the CloudProvider parameter value. Save the result to the $viAppl variable.
3. Assign the $server variable the $viAppl.Host value.
4. Run the Find-VBRViResourcePool cmdlet. Specify the Name and Server parameter values. Save the result to the $newResPool variable.
5. Run the Set-VBRCloudProviderNetworkAppliance cmdlet. Set the $viAppl variable as the NetworkAppliance parameter value. Set the $newResPool variable as the ResourcePool parameter value. Save the result to the $appliance variable.
> Example 2. Modifying Folder Settings for Hyper-V Appliance

$provider = Get-VBRCloudProvider -Name "104.45.95.227"
$viAppl = Get-VBRCloudProviderNetworkAppliance -CloudProvider $provider
$newFolder = "C:\Users\admin"
$appliance = Set-VBRCloudProviderNetworkAppliance -NetworkAppliance $hvAppl -Folder $newFolder
This example shows how to change the folder for a Hyper-V appliance created on the srv02.tech.local host.
Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter values. Save the result to the $provider variable.
2. Run the Get-VBRCloudProviderNetworkAppliance cmdlet. Specify the CloudProvider parameter value. Save the result to the $viAppl variable.
3. Assign the $newFolder variable the C:\Users\admin value.
4. Run the Set-VBRCloudProviderNetworkAppliance cmdlet. Set the $hvAppl variable as the NetworkAppliance parameter value. Set the $newFolder variable as the Folder parameter value. Save the result to the $appliance variable.

---

### Parameters
#### **Datastore**
Specifies the datastore where you want to create the VMware appliance. Accepts the VBRViDatastore appliance object.  To get this object, run the Find-VBRViDatastore cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRViDatastore]`|false   |named   |False        |

#### **DefaultGateway**
Specifies the default gateway. This gateway will be used by the appliance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableIpv4Interface**
Enables the IPv4 settings. If you provide this parameter, you will be able to specify the following settings:
* IPv4 address
* Subnet mask
* Default gateway
Note  Mind the following:
* To disable the IPv4 settings, set the parameter to EnableIpv4Interface $False, value. In this case, you will not be able to specify the network settings manually.
* To enable IPv4 settings, set this parameter to EnableIpv4Interface $True.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **EnableIpv6Interface**
Enables the IPv6 settings. If you provide this parameter, you will be able to specify the following settings:
* IPv6 address
* The length of an IPv6 prefix
* Default gateway
Note: If you set this parameter to :$False, you will not be able to specify the network settings manually.
Consider the following:
* To disable the IPv6 settings, set the parameter to EnableIpv4Interface $False, value. In this case, you will not be able to specify the network settings manually.
* To enable IPv6 settings, set this parameter to EnableIpv4Interface $True.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **Folder**
Specifies the folder where you want to create the Hyper-V appliance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **IpAddress**
Specifies the IP address. This address will be assigned to the appliance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Ipv6Address**
Specifies the IPv6 address that you want to assign to the appliance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Ipv6DefaultGateway**
Specifies the IPv6 address of the default gateway. The appliance will use this IP address.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Ipv6PrefixLength**
Specifies the length of an IPv6 prefix.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Network**
Specifies the service provider network. The appliance will use this network to communicate between the user's production VMs and VM replicas on the cloud host.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[IVBRServerNetworkInfo]`|false   |named   |False        |

#### **NetworkAppliance**
Specifies the network appliance that you want to modify. Accepts the  VBRCloudTenantNetworkAp appliance object.  To get this object, run the Get-VBRCloudTenantNetworkAppliance cmdlet.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[VBRCloudProviderNetworkAppliance]`|true    |named   |False        |

#### **ObtainIpAddressAutomatically**
Defines that the cmdlet will assign the IPv4 address automatically.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObtainIpv6AddressAutomatically**
Defines that the cmdlet will assign the IPv6 address automatically.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ResourcePool**
Specifies the resource pool where you want to create the VMware appliance. Accepts the CViResourcePoolItem appliance object.  To get this object, run the Find-VBRViResourcePool cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **Server**
The ESX or a Hyper-V host where you want to create the appliance. Accepts the CHost object. To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **SubnetMask**
Specifies the subnet mask. This subnet mask will be used by the appliance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VLanId**
Specifies the VLAN network provided to the user by the hardware plan. The appliance will use this VLAN to connect to the service provider network.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
Set-VBRCloudProviderNetworkAppliance [-Datastore <VBRViDatastore>] [-DefaultGateway <String>] [-EnableIpv4Interface <Boolean>] [-EnableIpv6Interface <Boolean>] [-IpAddress <String>] [-Ipv6Address <String>] 
```
```PowerShell
[-Ipv6DefaultGateway <String>] [-Ipv6PrefixLength <Int32>] [-Network <IVBRServerNetworkInfo>] -NetworkAppliance <VBRCloudProviderNetworkAppliance> [-ObtainIpAddressAutomatically] 
```
```PowerShell
[-ObtainIpv6AddressAutomatically] [-ResourcePool <CViResourcePoolItem>] [-Server <CHost>] [-SubnetMask <String>] [<CommonParameters>]
```
```PowerShell
Set-VBRCloudProviderNetworkAppliance [-DefaultGateway <String>] [-EnableIpv4Interface <Boolean>] [-EnableIpv6Interface <Boolean>] [-Folder <String>] [-IpAddress <String>] [-Ipv6Address <String>] 
```
```PowerShell
[-Ipv6DefaultGateway <String>] [-Ipv6PrefixLength <Int32>] [-Network <IVBRServerNetworkInfo>] -NetworkAppliance <VBRCloudProviderNetworkAppliance> [-ObtainIpAddressAutomatically] 
```
```PowerShell
[-ObtainIpv6AddressAutomatically] [-Server <CHost>] [-SubnetMask <String>] [-VLanId <Int32>] [<CommonParameters>]
```
