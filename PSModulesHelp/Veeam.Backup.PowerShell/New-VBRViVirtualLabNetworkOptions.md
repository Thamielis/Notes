New-VBRViVirtualLabNetworkOptions
---------------------------------

### Synopsis
Defines network settings of isolated networks.

---

### Description

This cmdlet creates the VBRViVirtualLabNetworkOption object that defines network settings of isolated networks and how to map it to production networks.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

* [New-VBRViNetworkMappingRule](New-VBRViNetworkMappingRule)

---

### Examples
> Example 1. Defining Network Settings of Isolated Network Using IPv4

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$maprule = New-VBRViNetworkMappingRule -ProductionNetwork $network[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
New-VBRViVirtualLabNetworkOptions -NetworkMappingRule $maprule -IPAddress 172.17.1.2 -SubnetMask 255.255.0.0 -MasqueradeAddress 172.22.22.22
This example shows how to define network settings of the Sandbox01 Private VM Network isolated network to map to the production network using IPv4. The isolated network will be set up with the following settings:
- The IP address of the proxy appliance is assigned the 172.17.1.2 IP.
- The subnet mask is set to 255.255.0.0.
- The masquerade IP address is set to 172.22.22.22.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the ProductionNetwork, IsolatedNetworkName and VLANID parameters. Save the result to the $maprule variable.
4. Run the New-VBRViVirtualLabNetworkOptions cmdlet. Specify the following settings:
- Set the $maprule variable as the NetworkMappingRule parameter value.
- Specify the IPAddress parameter value.
- Specify the SubnetMask parameter value.
- Specify the MasqueradeIPAddress parameter value.
> Example 2. Defining Network Settings of Isolated Network Using IPv6

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$maprule = New-VBRViNetworkMappingRule -ProductionNetwork $network[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
New-VBRViVirtualLabNetworkOptions -NetworkMappingRule $maprule -IPv6Address fdd1:aa80:bb80:cc80:dd80:ee80:fe80:10 -IPv6PrefixLength 64 -MasqueradeIPv6Address fdd1:ab80:bb80:cc88::
This example shows how to define network settings of the Sandbox01 Private VM Network isolated network to map to the production network using IPv6. The isolated network will be set up with the following settings:
- The IP address of the proxy appliance is assigned the fdd1:aa80:bb80:cc80:dd80:ee80:fe80:10 IP.
- The prefix length is set to 64.
- The masquerade IP address is set to fdd1:ab80:bb80:cc88::.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the ProductionNetwork, IsolatedNetworkName and VLANID parameters. Save the result to the $maprule variable.
4. Run the New-VBRViVirtualLabNetworkOptions cmdlet. Specify the following settings:
- Set the $maprule variable as the NetworkMappingRule parameter value.
- Specify the IPv6Address parameter value.
- Specify the IPv6PrefixLength parameter value.
- Specify the MasqueradeIv6PAddress parameter value.
> Example 3. Defining Network Settings of Isolated Network with DHCP Service and DNS Server Using IPv4

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$maprule = New-VBRViNetworkMappingRule -ProductionNetwork $network[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
New-VBRViVirtualLabNetworkOptions -NetworkMappingRule $maprule -IPAddress 172.17.1.2 -SubnetMask 255.255.0.0 -MasqueradeIPAddress 172.22.22.22 -DNSServer 192.168.1.99 -EnableDHCP
This example shows how to define network settings of the Sandbox01 Private VM Network isolated network to connect to map to the production network using the DHCP Service and DNS Server and IPv4.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the ProductionNetwork, IsolatedNetworkName and VLANID parameters. Save the result to the $maprule variable.
4. Run the New-VBRViVirtualLabNetworkOptions cmdlet. Specify the following settings:
- Set the $maprule variable as the NetworkMappingRule parameter value.
- Specify the IPAddress parameter value.
- Specify the SubnetMask parameter value.
- Specify the MasqueradeIPAddress parameter value.
- Specify the DNSServer parameter value.
- Provide the EnableDHCP parameter.
> Example 4. Defining Network Settings of Isolated Network with DHCP Service and DNS Server Using IPv6

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$maprule = New-VBRViNetworkMappingRule -ProductionNetwork $network[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
New-VBRViVirtualLabNetworkOptions -NetworkMappingRule $maprule -IPv6Address fdd1:aa80:bb80:cc80:dd80:ee80:fe80:10 -IPv6PrefixLength 64 -MasqueradeIPv6Address fdd1:ab80:bb80:cc88:: -IPv6DNSServer fdd1:aa80:bb80:cc80:dd80:ee80:ff80:3 -EnableDHCPv6
This example shows how to define network settings of the Sandbox01 Private VM Network isolated network to connect to map to the production network using the DHCP Service and DNS Server and IPv6.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the ProductionNetwork, IsolatedNetworkName and VLANID parameters. Save the result to the $maprule variable.
4. Run the New-VBRViVirtualLabNetworkOptions cmdlet. Specify the following settings:
Set the $maprule variable as the NetworkMappingRule parameter value.
- Specify the IPv6Address parameter value.
- Specify the IPv6PrefixLength parameter value.
- Specify the MasqueradeIv6PAddress parameter value.
- Specify the IPv6DNSServer parameter value.
- Provide the EnableDHCPv6 parameter.

---

### Parameters
#### **DNSServer**
Specifies an array of IPv4 addresses of virtualized DNS servers.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IPAddress[]]`|false   |named   |False        |

#### **EnableDHCP**
Defines that the cmdlet will enable the DHCP service.
If you provide this parameter, Veeam Backup & Replication will dynamically assign IP addresses for isolated VMs. Otherwise, you must assign the IP addresses manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableDHCPv6**
Defines that the cmdlet will enable the DHCPv6 service.
If you provide this parameter, Veeam Backup & Replication will dynamically assign IP addresses for isolated VMs. Otherwise, you must assign the IP addresses manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IPAddress**
Specifies an IPv4 address of the proxy appliance.
Veeam Backup & Replication will use this IP address to connect an isolated network with the production network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6Address**
Specifies an IPv6 address of the proxy appliance. Veeam Backup & Replication will use this IP address to connect an isolated network with the production network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6DNSServer**
Specifies an array of IPv6 addresses of virtualized DNS servers.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IPAddress[]]`|false   |named   |False        |

#### **IPv6PrefixLength**
Specifies a prefix length of an isolated network.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MasqueradeIPAddress**
Specifies a masquerade IPv4 address.
Veeam Backup & Replication will use this IP address to access VMs in the isolated network from the production network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **MasqueradeIPv6Address**
Specifies a masquerade IPv6 address.
Veeam Backup & Replication will use this IP address to access VMs in the isolated network from the production network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **NetworkMappingRule**
Specifies a network mapping rule of an isolated network.
The cmdlet will map the isolated network to the production network that is specified in this rule.

|Type                                 |Required|Position|PipelineInput                 |
|-------------------------------------|--------|--------|------------------------------|
|`[VBRViVirtualLabNetworkMappingRule]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SubnetMask**
Specifies a subnet mask of an isolated network.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViVirtualLabNetworkMappingRule

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRViVirtualLabNetworkOptions [-DNSServer <IPAddress[]>] [-EnableDHCP] [-EnableDHCPv6] [-IPAddress <IPAddress>] [-IPv6Address <IPAddress>] [-IPv6DNSServer <IPAddress[]>] [-IPv6PrefixLength <Int32>] 
```
```PowerShell
[-MasqueradeIPAddress <IPAddress>] [-MasqueradeIPv6Address <IPAddress>] -NetworkMappingRule <VBRViVirtualLabNetworkMappingRule> [-SubnetMask <String>] [<CommonParameters>]
```
