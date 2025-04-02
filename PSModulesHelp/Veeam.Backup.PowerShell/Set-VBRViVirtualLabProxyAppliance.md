Set-VBRViVirtualLabProxyAppliance
---------------------------------

### Synopsis
Modifies settings of proxy appliances.

---

### Description

This cmdlet modifies settings of proxy appliances.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

* [New-VBRViVirtualLabProxyAppliance](New-VBRViVirtualLabProxyAppliance)

---

### Examples
> Example 1. Specifying Production Network and Datastore for Proxy Appliance

$ESXi = Get-VBRServer -Name "esx09.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $ESXi
$datastore = Find-VBRViDatastore -Server $ESXi -Name "esx09-das6"
$proxyapp = New-VBRViVirtualLabProxyAppliance -Server $ESXi -ObtainIPAutomatically -ObtainDNSAutomatically -Name "Proxy_appliance_05"
Set-VBRViVirtualLabProxyAppliance -ProxyAppliance $proxyapp -Datastore $datastore -Network $network[6]
This example shows how to specify a production network and a datastore for a proxy appliance.
- The proxy appliance will be deployed on the esx09.tech.local ESXi host.
- Veeam Backup & Replication will keep redo logs for verified VMs on the esx09-das6 datastore.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $ESXi variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $ESXi variable as the Server parameter value. Save the result to the $network variable.
3. Run the Find-VBRViDatastore cmdlet. Set the $ESXi variable as the Server parameter value. Specify the Name parameter value. Save the result to the $datastore variable.
4. Run the New-VBRViVirtualLabProxyAppliance cmdlet. Specify the Server, ObtainIPAutomatically, ObtainDNSAutomatically and Name parameter values. Save the result to the $proxyapp variable.
5. Run the Set-VBRViVirtualLabProxyAppliance cmdlet. Specify the following settings:
- Set the $proxyapp variable as the ProxyAppliance parameter value.
- Set the $datastore variable as the Datastore parameter value.
- Set the $network[6] variable as the Network parameter value.
The Get-VBRViServerNetworkInfo cmdlet will return an array of production networks. Mind the ordinal number of the necessary production network (An array starts with 0. In our example, it is the seventh production network in the array).
> Example 2. Modifying IP Address of Production Network

$ESXi = Get-VBRServer -Name "esx07.tech.local"
$proxyapp = New-VBRViVirtualLabProxyAppliance -Server $ESXi -Name "Proxy_appliance_07" -IPAddress 172.17.53.162 -SubnetMask 255.255.0.0 -DefaultGateway 172.17.53.168 -PreferredDNSServer 172.17.53.175 -AlternateDNSServer 172.17.53.176
Set-VBRViVirtualLabProxyAppliance -ProxyAppliance $proxyapp -IPAddress 172.17.53.167
This example shows how to modify an IP address of a production network.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $ESXi variable.
2. Run the New-VBRViVirtualLabProxyAppliance cmdlet. Specify the Server, Name, IPAddress, SubnetMask, DefaultGateway, PreferredDNSServer and AlternateDNSServer parameter values. Save the result to the $proxyapp variable.
3. Run the Set-VBRViVirtualLabProxyAppliance cmdlet. Set the $proxyapp variable as the ProxyAppliance parameter value. Specify the IPAddress parameter value.

---

### Parameters
#### **AlternateDNSServer**
Specifies an IPv4 address of an alternate DNS server.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **DefaultGateway**
Specifies an IPv4 address of a default gateway.
The cmdlet will assign this IP address to a default gateway on a proxy appliance.

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

#### **ProxyAppliance**
Specifies a proxy appliance that you want to modify.

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRViVirtualLabProxyAppliance]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SubnetMask**
Specifies a subnet mask for a proxy appliance in the production network.
The cmdlet will set up network settings of a proxy appliance with this subnet mask.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViVirtualLabProxyAppliance

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViVirtualLabProxyAppliance [-AlternateDNSServer <IPAddress>] [-DefaultGateway <IPAddress>] [-EnableInternetProxy] [-EnableIPv4Interface] [-EnableIPv6Interface] [-HTTPPort <Int32>] [-IPAddress 
```
```PowerShell
<IPAddress>] [-IPv6Address <IPAddress>] [-IPv6AlternateDNSServer <IPAddress>] [-IPv6DefaultGateway <IPAddress>] [-IPv6PreferredDNSServer <IPAddress>] [-IPv6PrefixLength <Int32>] [-Network <VBRViNetworkInfo>] 
```
```PowerShell
[-ObtainDNSAutomatically] [-ObtainIPAutomatically] [-ObtainIPv6AddressAutomatically] [-ObtainIPv6DNSAutomatically] [-PreferredDNSServer <IPAddress>] [-ProductionProxyIPAddress <IPAddress>] -ProxyAppliance 
```
```PowerShell
<VBRViVirtualLabProxyAppliance> [-SubnetMask <String>] [<CommonParameters>]
```
