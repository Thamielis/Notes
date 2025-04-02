Set-VBRCloudTenantNetworkAppliance
----------------------------------

### Synopsis
Modifies a network extension appliance.

---

### Description

This cmdlet modifies a selected network extension appliance. You can modify the network extension appliance for the cloud tenants of the following types:
- Simple cloud tenant accounts
- vCD Cloud tenant accounts
The cmdlets in this section operate only with the network appliances, created by service providers. To create a network appliance, a service provider must run the New-VBRCloudTenantReplicationResources cmdlet and provide the EnableNetworkFailoverResources parameter. The cmdlet will create a network appliance with the IPv4 and IPv6 addresses enabled by default.

---

### Related Links
* [Get-VBRCloudTenantNetworkAppliance](Get-VBRCloudTenantNetworkAppliance)

* [Get-VBRHvServerNetworkInfo](Get-VBRHvServerNetworkInfo)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

---

### Examples
> Modifying IPv4 Settings of Network Appliance

$appliance = Get-VBRCloudTenantNetworkAppliance -Name "Cloud Appliance for ABC Company"
Set-VBRCloudTenantNetworkAppliance -Appliance $appliance -Name "New Cloud Appliance for ABC Company" -EnableIpv4Interface $True -IpAddress 172.15.15.10 -SubnetMask 255.255.255.0 -DefaultGateway 172.15.15.1
This example shows how to modify the Cloud Appliance for ABC Company network appliance settings. The cmdlet will modify the IPv4 address, subnet mask and the default gateway settings.

Perform the following steps:
1. Run the Get-VBRCloudTenantNetworkAppliance cmdlet. Specify the Name parameter values. Save the result to the $appliance variable.
2. Run the Set-VBRCloudTenantNetworkAppliance cmdlet. Specify the following settings:
- Set the $appliance variable as the Appliance parameter value.
- Specify the Name parameter value.
- Provide the EnableIpv4Interface parameter and set its value to $True.
- Specify the IpAddress parameter value.
- Specify the SubnetMask parameter value.
- Specify the DefaultGateway parameter value.

---

### Parameters
#### **Appliance**
Specifies the network appliance you want to modify. Accepts the VBRCloudTenantNetworkAppliance object. To get this object, run the Get-VBRCloudTenantNetworkAppliance cmdlet.

|Type                              |Required|Position|PipelineInput                 |
|----------------------------------|--------|--------|------------------------------|
|`[VBRCloudTenantNetworkAppliance]`|true    |named   |True (ByPropertyName, ByValue)|

#### **DefaultGateway**
Specifies the IP address of the default gateway. The appliance will use this IP address.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **EnableIpv4Interface**
Enables the IPv4 settings. If you provide this parameter, you will be able to specify the following settings:
* IPv4 address
* Subnet mask
* Default gateway
Note Consider the following:
* To disable the IPv4 settings, set the parameter to EnableIpv4Interface $False, value. In this case, you will not be able to specify the network settings manually.
* To enable IPv4 settings, set this parameter to EnableIpv4Interface $True.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **EnableIpv6Interface**
Enables the IPv6 settings. If you provide this parameter, you will be able to specify the following settings: - IPv6 address
* The length of an IPv6 prefix
* Default gateway
Note Consider the following:
* To disable the IPv6 settings, set the parameter to EnableIpv4Interface $False, value. In this case, you will not be able to specify the network settings manually.
* To enable IPv6 settings, set this parameter to EnableIpv4Interface $True.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **IpAddress**
Specifies the IPv4 address that you want to assign to the appliance.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **Ipv6Address**
Specifies the IPv6 address that you want to assign to the appliance.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **Ipv6DefaultGateway**
Specifies the IPv6 address of the default gateway. The appliance will use this IP address.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **Ipv6PrefixLength**
Specifies the length of an IPv6 prefix.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the name of the network appliance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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

#### **ProductionNetwork**
Specifies the network. The appliance will be connected to this network. Accepts the IVBRServerNetworkInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[IVBRServerNetworkInfo]`|false   |named   |False        |

#### **SubnetMask**
Specifies the subnet mask. The appliance will use this subnet mask.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudTenantNetworkAppliance

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudTenantNetworkAppliance -Appliance <VBRCloudTenantNetworkAppliance> [-DefaultGateway <IPAddress>] [-EnableIpv4Interface <Boolean>] [-EnableIpv6Interface <Boolean>] [-IpAddress <IPAddress>] 
```
```PowerShell
[-Ipv6Address <IPAddress>] [-Ipv6DefaultGateway <IPAddress>] [-Ipv6PrefixLength <String>] [-Name <String>] [-ObtainIpAddressAutomatically] [-ObtainIpv6AddressAutomatically] [-ProductionNetwork 
```
```PowerShell
<IVBRServerNetworkInfo>] [-SubnetMask <String>] [<CommonParameters>]
```
