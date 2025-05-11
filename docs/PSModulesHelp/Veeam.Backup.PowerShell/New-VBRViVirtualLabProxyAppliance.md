New-VBRViVirtualLabProxyAppliance
---------------------------------

### Synopsis
Defines settings of proxy appliances.

---

### Description

This cmdlet creates the VBRViVirtualLabProxyAppliance object that defines settings of proxy appliances that are added to the virtual lab.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

---

### Examples
> Example 1. Defining Settings of Proxy Appliance with Automatic IP and DNS Setup

$ESXi = Get-VBRServer -Name "esx09.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $ESXi
$datastore = Find-VBRViDatastore -Server $ESXi -Name "esx09-das6"
New-VBRViVirtualLabProxyAppliance -Server $ESXi -ObtainIPAutomatically -ObtainDNSAutomatically -Name "Proxy_appliance_05" -Datastore $datastore -Network $network[3]
This example shows how to define settings of the Proxy_appliance_05 proxy appliance that is deployed with the automatic IP and DNS setup. The proxy appliance will be deployed with the following settings:
- The proxy appliance will be deployed on the esx09.tech.local ESXi host.
- Veeam Backup & Replication will keep redo logs for verified VMs on the esx09-das6 datastore.
- The proxy appliance will connect to the production network on the esx09.tech.local ESXi host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $ESXi variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $ESXi variable as the Server parameter value. Save the result to the $network variable.
3. Run the Find-VBRViDatastore cmdlet. Set the $ESXi variable as the Server parameter value. Specify the Name parameter value. Save the result to the $datastore variable.
4. Run the New-VBRViVirtualLabProxyAppliance cmdlet. Specify the following settings:
- Set the $ESXi variable as the Server parameter value.
- Provide the ObtainIPAutomatically parameter.
- Provide the ObtainDNSAutomatically parameter.
- Specify the Name parameter value.
- Set the $datastore variable as the Datastore parameter value.
- Set the $network[3] variable as the Network parameter value.
The Get-VBRViServerNetworkInfo cmdlet will return an array of production networks. Mind the ordinal number of the necessary production network (An array starts with 0. In our example, it is the fourth production network in the array).
> Example 2. Defining Settings of Proxy Appliance as Proxy

$ESXi = Get-VBRServer -Name "esx07.tech.local"
New-VBRViVirtualLabProxyAppliance -Server $ESXi -ObtainIPAutomatically -ObtainDNSAutomatically -HTTPPort 8085 -ProductionProxyIPAddress 172.17.1.2 -EnableInternetProxy
This example shows how to define settings of a proxy appliance that is deployed with the automatic IP and DNS and acts as an Internet proxy server. The proxy appliance will be deployed with the following settings:
- The proxy appliance will be deployed on the esx07.tech.local ESXi host.
- Veeam Backup & Replication will keep redo logs for verified VMs on the vPower NFS server.
- VMs from the isolated network will use the 172.17.1.2 IP address to access the Internet.
- VMs from isolated network will use this the 8085 port number to access the Internet.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $ESXi variable.
2. Run the New-VBRViVirtualLabProxyAppliance cmdlet. Specify the following settings:
- Set the $ESXi variable as the Server parameter value.
- Provide the ObtainIPAutomatically parameter.
- Provide the ObtainDNSAutomatically parameter.
- Specify the HTTPPort parameter value.
- Specify the ProductionProxyIPAddress parameter value.
- Provide the EnableInternetProxy parameter.
> Example 3. Defining Settings of Proxy Appliance with Manual IP and DNS Setup

$ESXi = Get-VBRServer -Name "esx07.tech.local"
New-VBRViVirtualLabProxyAppliance -Server $ESXi -Name "Proxy_appliance_07" -IPAddress 172.17.53.162 -SubnetMask 255.255.0.0 -DefaultGateway 172.17.53.168 -PreferredDNSServer 172.17.53.175 -AlternateDNSServer 172.17.53.176
This example shows how to define settings of the Proxy_appliance_07 proxy appliance that is deployed with manual IP and DNS setup.
The proxy appliance will be deployed with the following settings:
- The proxy appliance will be deployed on the esx07.tech.local ESXi host.
- The proxy appliance will use the 172.17.53.162 IP to connect to the production network.
- The proxy appliance is assigned the 255.255.0.0 subnet mask.
- The default gateway is assigned the 172.17.53.168 IP.
- The IP of the preferred DNS server is set to 172.17.53.175.
- The IP of the alternate DNS server is set to 172.17.53.176.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $ESXi variable.
2. Run the New-VBRViVirtualLabProxyAppliance cmdlet. Specify the following settings:
- Set the $ESXi variable as the Server parameter value.
- Specify the Name parameter value.
- Specify the IPAddress parameter value.
- Specify the SubnetMask parameter value.
- Specify the DefaultGateway parameter value.
- Specify the PreferredDNSServer parameter value.
- Specify the AlternateDNSServer parameter value.

---

### Parameters
#### **AlternateDNSServer**
Specifies an IPv4 address of an alternate DNS server.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **Datastore**
Specifies the datastore. The cmdlet will deploy a proxy appliance on this datastore.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **DefaultGateway**
Specifies an IPv4 address of a default gateway. The cmdlet will assign this IP address to a default gateway on a proxy appliance.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **EnableInternetProxy**
Defines that a proxy appliance will act as an internet proxy for VMs in the isolated network.
If you provide this parameter, a proxy appliance will act as an internet proxy for VMs in the isolated network. Otherwise, VMs from the isolated network will not have access to the Internet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableIPv4Interface**
Defines that IPv4 interface will be enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableIPv6Interface**
Defines that IPv6 interface will be enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HTTPPort**
Specifies the port number. VMs from the isolated network will use this port number to access the Internet.
Default: 8080.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **IPAddress**
Specifies an IPv4 address for a proxy appliance in the production network. The cmdlet will assign this IP address to a proxy appliance.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6Address**
Specifies an IPv6 address for a proxy appliance in the production network. The cmdlet will assign this IP address to a proxy appliance.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6AlternateDNSServer**
Specifies an IPv6 address of an alternate DNS server.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6DefaultGateway**
Specifies an IPv6 address of a default gateway. The cmdlet will assign this IP address to a default gateway on a proxy appliance.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6PreferredDNSServer**
Specifies an IPv6 address of a preferred DNS server.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6PrefixLength**
Specifies a prefix length for a proxy appliance in the production network. The cmdlet will set up network settings of a proxy appliance with this prefix length.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies a name of a proxy appliance. The cmdlet will deploy the proxy appliance with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Network**
Specifies the production network. The cmdlet will connect a proxy appliance to the specified network.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRViNetworkInfo]`|false   |named   |False        |

#### **ObtainDNSAutomatically**
Defines that a proxy appliance will obtain DNS server settings automatically.
If you provide this parameter, Veeam Backup & Replication will obtain IPv4 DNS server settings for the proxy appliance automatically. Otherwise, you will need to set the DNS server settings manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObtainIPAutomatically**
Defines that a proxy appliance will obtain an IPv4 address automatically.
If you provide this parameter, Veeam Backup & Replication will obtain an IP address for the proxy appliance automatically. Otherwise, you will need to set the IP address manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObtainIPv6AddressAutomatically**
Defines that a proxy appliance will obtain an IPv6 address automatically.
If you provide this parameter, Veeam Backup & Replication will obtain an IP address for the proxy appliance automatically. Otherwise, you will need to set the IP address manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObtainIPv6DNSAutomatically**
Defines that a proxy appliance will obtain IPv6 DNS server settings automatically.
If you provide this parameter, Veeam Backup & Replication will obtain DNS server settings for the proxy appliance automatically. Otherwise, you will need to set the DNS server settings manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PreferredDNSServer**
Specifies an IPv4 address of a preferred DNS server.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **ProductionProxyIPAddress**
Specifies an IP address or a fully qualified domain name of an Internet-facing proxy server that VMs from the isolated network must use to access the Internet.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **Server**
Specifies an ESXi host. The cmdlet will deploy a proxy appliance on this host.
Note: The ESXi host must be the same as the ESXi host where the virtual lab is created.
This parameter must be the same as the Server parameter in the objects that are created by the following cmdlets:
* Add-VBRViAdvancedVirtualLab
* Add-VBRViSimpleVirtualLab
* Set-VBRViVirtualLab

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **SubnetMask**
Specifies a subnet mask for a proxy appliance in the production network.
The cmdlet will set up network settings of a proxy appliance with this subnet mask.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
New-VBRViVirtualLabProxyAppliance [-AlternateDNSServer <IPAddress>] [-Datastore <VBRViDatastoreBase>] [-DefaultGateway <IPAddress>] [-EnableInternetProxy] [-EnableIPv4Interface] [-EnableIPv6Interface] 
```
```PowerShell
[-HTTPPort <Int32>] [-IPAddress <IPAddress>] [-IPv6Address <IPAddress>] [-IPv6AlternateDNSServer <IPAddress>] [-IPv6DefaultGateway <IPAddress>] [-IPv6PreferredDNSServer <IPAddress>] [-IPv6PrefixLength <Int32>] 
```
```PowerShell
[-Name <String>] [-Network <VBRViNetworkInfo>] [-ObtainDNSAutomatically] [-ObtainIPAutomatically] [-ObtainIPv6AddressAutomatically] [-ObtainIPv6DNSAutomatically] [-PreferredDNSServer <IPAddress>] 
```
```PowerShell
[-ProductionProxyIPAddress <IPAddress>] -Server <CHost> [-SubnetMask <String>] [<CommonParameters>]
```
