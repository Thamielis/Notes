New-VBRCloudProviderNetworkAppliance
------------------------------------

### Synopsis
Creates a network extension appliance on the user side.

---

### Description

This cmdlet creates a VMware or a Hyper-V network extension appliance on the user's host. This appliance is applied in the cloud provider settings (see the Add-VBRCloudProvider cmdlet).

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRHvServerNetworkInfo](Get-VBRHvServerNetworkInfo)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

* [Find-VBRViResourcePool](Find-VBRViResourcePool)

* [Find-VBRViDatastore](Find-VBRViDatastore)

---

### Examples
> Example 1. Creating VMware Appliance with Advanced Settings [Using Variables]

$server = Get-VBRServer -Type ESX -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server | Where { $_.NetworkName -eq "VM Network" }
$respool = Find-VBRViResourcePool -Server $server -Name "ResourcePool_01" 
$datastore = Find-VBRViDatastore -Server $server -Name "NOPDatastore"
$viAppl = New-VBRCloudProviderNetworkAppliance -Server $server -Network $network -ResourcePool $respool -Datastore $datastore
This example shows how to create a VMware appliance with advanced settings on the "srv01.tech.local" host.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Set the ESXi option for the Type parameter. Specify the Name parameter value. Save the server to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Pass the result to the Where-Object cmdlet to select the networks with the NetworkName property that equals VM Network. Save the network to the $network variable.
3. Run the Find-VBRViResourcePool cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value. Save the resource pool to the $respool variable.
4. Run the Find-VBRViDatastore cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value. Save the datastore to the $datastore variable.
5. Run the New-VBRCloudProviderNetworkAppliance cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Set the $network variable as the Network parameter value.
- Set the $respool variable as the ResourcePool parameter value.
- Set the $datastore variable as the Datastore parameter value.
- Save the result to the $viAppl variable for future use.
> Example 2. Creating Hyper-V Appliance with Advanced Settings [Using Variables]

$server = Get-VBRServer -Type HvServer -Name "srv02.tech.local"
$folder = "C:\Datastore"
$network = Get-VBRHvServerNetworkInfo -Server $server  | Where { $_.NetworkName -eq "VM Network" }
$hvAppl = New-VBRCloudProviderNetworkAppliance -Server $server -Network $network -Folder $folder
This example shows how to create a Hyper-V appliance with advanced settings on the "srv02.tech.local" host.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Set the HvServer option for the Type parameter. Specify the Name parameter value. Save the server to the $server variable.
2. Assign the $folder variable the C:\Datastore value.
3. Run the Get-VBRHvServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value and use the Where-Object statement to filter the networks by the .NetworkName property. Save the network to the $network variable.
4. Run the New-VBRCloudProviderNetworkAppliance cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Set the $network variable as the Network parameter value.
- Set the $folder variable as the Folder parameter value.
- Save the result to the $hvAppl variable for future use.

---

### Parameters
#### **Datastore**
Specifies the datastore where you want to create the VMware appliance. Accepts the VBRViDatastore object.  To get this object, run the Find-VBRViDatastore cmdlet.

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
Note Mind the following:
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
Note Consider the following:
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
Specifies the service provider  network. The appliance will use this network to communicate between the user's production VMs and VM replicas on the cloud host. Accepts the IVBRServerNetworkInfo object.  To get this object, run the Get-VBRHvServerNetworkInfo cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[IVBRServerNetworkInfo]`|false   |named   |False        |

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
Specifies the resource pool where you want to create the VMware appliance. Accepts the CViResourcePoolItem object.  To get this object, run the Find-VBRViResourcePool cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **Server**
The ESX or a Hyper-V host where the VMs you want to replicate locate. The network appliance will be created on this host. Accepts the CHost object.  To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

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
New-VBRCloudProviderNetworkAppliance [-Datastore <VBRViDatastore>] [-DefaultGateway <String>] [-EnableIpv4Interface <Boolean>] [-EnableIpv6Interface <Boolean>] [-IpAddress <String>] [-Ipv6Address <String>] 
```
```PowerShell
[-Ipv6DefaultGateway <String>] [-Ipv6PrefixLength <Int32>] [-Network <IVBRServerNetworkInfo>] [-ObtainIpAddressAutomatically] [-ObtainIpv6AddressAutomatically] [-ResourcePool <CViResourcePoolItem>] -Server 
```
```PowerShell
<CHost> [-SubnetMask <String>] [<CommonParameters>]
```
```PowerShell
New-VBRCloudProviderNetworkAppliance [-DefaultGateway <String>] [-EnableIpv4Interface <Boolean>] [-EnableIpv6Interface <Boolean>] [-Folder <String>] [-IpAddress <String>] [-Ipv6Address <String>] 
```
```PowerShell
[-Ipv6DefaultGateway <String>] [-Ipv6PrefixLength <Int32>] [-Network <IVBRServerNetworkInfo>] [-ObtainIpAddressAutomatically] [-ObtainIpv6AddressAutomatically] -Server <CHost> [-SubnetMask <String>] [-VLanId 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
