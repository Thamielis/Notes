Set-VBRHvVirtualLabProxyAppliance
---------------------------------

### Synopsis
Modifies settings of proxy appliances for Hyper-V virtual lab.

---

### Description

This cmdlet modifies settings of Hyper-V virtual lab proxy appliances.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRHvServerNetworkInfo](Get-VBRHvServerNetworkInfo)

* [New-VBRHvVirtualLabProxyAppliance](New-VBRHvVirtualLabProxyAppliance)

---

### Examples
> Enabling IPv6 Interface for Proxy Appliance

$host = Get-VBRServer -Name "esx09.tech.local"
$network = Get-VBRHvServerNetworkInfo -Server $host
$proxyapp = New-VBRHvVirtualLabProxyAppliance -Server $host -EnableIPv4Interface -ObtainIPAutomatically -ObtainDNSAutomatically -Name "Proxy_appliance_05" -Network $network[3]
Set-VBRHvVirtualLabProxyAppliance -ProxyAppliance $proxyapp -EnableIPv6Interface -ObtainIPv6AddressAutomatically -ObtainIPv6DNSAutomatically
This example shows how to enable IPv6 interface for the proxy appliance named Proxy_appliance_05. The proxy appliance will have both IPv4 and IPv6 interfaces enabled.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $host variable.
2. Run the Get-VBRHvServerNetworkInfo cmdlet. Set the $host variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRHvVirtualLabProxyAppliance cmdlet. Specify the Server, EnableIPv4Interface, ObtainIPAutomatically, ObtainDNSAutomatically, Name and Network parameter values. Save the result to the $proxyapp variable.
4. Run the Set-VBRHvVirtualLabProxyAppliance cmdlet. Specify the following settings:
- Set the $proxyapp variable as the ProxyAppliance parameter value.
- Provide the EnableIPv6Interface parameter.
- Provide the ObtainIPv6AddressAutomatically parameter.
- Provide the ObtainIPv6DNSAutomatically parameter.

---

### Parameters
#### **AlternateDNSServer**
Specifies an IPv4 address of an alternate DNS server.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

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

#### **Network**
Specifies the production network. The cmdlet will connect a proxy appliance to the specified network.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRHvServerNetworkInfo]`|false   |named   |False        |

#### **ObtainDNSAutomatically**
Defines that a proxy appliance will obtain DNS server settings automatically.
If you provide this parameter, Veeam Backup & Replication will obtain IPv4 DNS server settings for the proxy appliance automatically. Otherwise, you will need to set the DNS server settings manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObtainIPAutomatically**
Defines that a proxy appliance will obtain an IPv4 address automatically. If you provide this parameter, Veeam Backup & Replication will obtain an IP address for the proxy appliance automatically. Otherwise, you will need to set the IP address manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObtainIPv6AddressAutomatically**
Defines that a proxy appliance will obtain an IPv6 address automatically. If you provide this parameter, Veeam Backup & Replication will obtain an IP address for the proxy appliance automatically. Otherwise, you will need to set the IP address manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObtainIPv6DNSAutomatically**
Defines that a proxy appliance will obtain IPv6 DNS server settings automatically. If you provide this parameter, Veeam Backup & Replication will obtain DNS server settings for the proxy appliance automatically. Otherwise, you will need to set the DNS server settings manually.

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
|`[VBRHvVirtualLabProxyAppliance]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SubnetMask**
Specifies a subnet mask for a proxy appliance in the production network. The cmdlet will set up network settings of a proxy appliance with this subnet mask.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VLanID**
Specifies an ID of an isolated network. The cmdlet will create the isolated network with the specified ID.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRHvVirtualLabProxyAppliance

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRHvVirtualLabProxyAppliance [-AlternateDNSServer <IPAddress>] [-DefaultGateway <IPAddress>] [-EnableInternetProxy] [-EnableIPv4Interface] [-EnableIPv6Interface] [-HTTPPort <Int32>] [-IPAddress 
```
```PowerShell
<IPAddress>] [-IPv6Address <IPAddress>] [-IPv6AlternateDNSServer <IPAddress>] [-IPv6DefaultGateway <IPAddress>] [-IPv6PreferredDNSServer <IPAddress>] [-IPv6PrefixLength <Int32>] [-Network 
```
```PowerShell
<VBRHvServerNetworkInfo>] [-ObtainDNSAutomatically] [-ObtainIPAutomatically] [-ObtainIPv6AddressAutomatically] [-ObtainIPv6DNSAutomatically] [-PreferredDNSServer <IPAddress>] [-ProductionProxyIPAddress 
```
```PowerShell
<IPAddress>] -ProxyAppliance <VBRHvVirtualLabProxyAppliance> [-SubnetMask <String>] [-VLanID <Int32>] [<CommonParameters>]
```
