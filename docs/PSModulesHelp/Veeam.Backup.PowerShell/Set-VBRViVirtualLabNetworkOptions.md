Set-VBRViVirtualLabNetworkOptions
---------------------------------

### Synopsis
Modifies network settings of isolated networks.

---

### Description

This cmdlet modifies network settings of isolated networks and how to map it to production networks.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

* [New-VBRViNetworkMappingRule](New-VBRViNetworkMappingRule)

* [New-VBRViVirtualLabNetworkOptions](New-VBRViVirtualLabNetworkOptions)

---

### Examples
> Example 1. Modifying Subnet Mask

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$maprule = New-VBRViNetworkMappingRule -ProductionNetwork $network[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
$isolated = New-VBRViVirtualLabNetworkOptions -NetworkMappingRule $maprule -IPAddress 172.17.1.2 -SubnetMask 255.255.0.0 -MasqueradeIPAddress 172.22.22.22
Set-VBRViVirtualLabNetworkOptions -Options $isolated -SubnetMask 255.255.255.0
This example shows how to modify a subnet mask of an isolated network that connects to the to production network.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the ProductionNetwork, IsolatedNetworkName and VLANID parameter values. Save the result to the $maprule variable.
4. Run the New-VBRViVirtualLabNetworkOptions cmdlet. Specify the NetworkMappingRule, IPAddress, SubnetMask and MasqueradeIPAddress parameter values. Save the result to the $isolated variable.
5. Run the Set-VBRViVirtualLabNetworkOptions cmdlet. Set the $isolated variable as the Options parameter value. Specify the SubnetMask parameter value.
> Example 2. Modifying Prefix Length

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$maprule = New-VBRViNetworkMappingRule -ProductionNetwork $network[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
$isolated = New-VBRViVirtualLabNetworkOptions -NetworkMappingRule $maprule -IPv6Address fdd1:aa80:bb80:cc80:dd80:ee80:fe80:10 -IPv6PrefixLength 64 -MasqueradeIPv6Address fdd1:ab80:bb80:cc88::
Set-VBRViVirtualLabNetworkOptions -Options $isolated -IPv6PrefixLength 64
This example shows how to modify a prefix length of an isolated network that connects to the to production network.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the ProductionNetwork, IsolatedNetworkName and VLANID parameter values. Save the result to the $maprule variable.
4. Run the New-VBRViVirtualLabNetworkOptions cmdlet. Specify the NetworkMappingRule, IPv6Address, IPv6PrefixLength and MasqueradeIPv6Address parameter values. Save the result to the $isolated variable.
5. Run the Set-VBRViVirtualLabNetworkOptions cmdlet. Set the $isolated variable as the Options parameter value. Specify the new IPv6PrefixLength parameter value.
> Example 3. Modifying IP of Proxy Appliance

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$maprule = New-VBRViNetworkMappingRule -ProductionNetwork $network[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
$isolated = New-VBRViVirtualLabNetworkOptions -NetworkMappingRule $maprule -IPAddress 172.17.1.2 -SubnetMask 255.255.0.0 -MasqueradeIPAddress 172.22.22.22
Set-VBRViVirtualLabNetworkOptions -Options $isolated -IPAddress 172.17.1.7
This example shows how to modify an IP address of a proxy appliance to which an isolated network is connected.
The isolated network will connect to the proxy appliance that has the 172.17.1.7 IP address.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the ProductionNetwork, IsolatedNetworkName and VLANID parameter values. Save the result to the $maprule variable.
4. Run the New-VBRViVirtualLabNetworkOptions cmdlet. Specify the NetworkMappingRule, IPAddress, SubnetMask and MasqueradeIPAddress parameter values. Save the result to the $isolated variable.
5. Run the Set-VBRViVirtualLabNetworkOptions cmdlet. Set the $isolated variable as the Options parameter value. Specify the IPAddress parameter value.
> Example 4. Modifying Masquerade IP Address

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$maprule = New-VBRViNetworkMappingRule -ProductionNetwork $network[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
$isolated = New-VBRViVirtualLabNetworkOptions -NetworkMappingRule $maprule -IPAddress 172.17.1.2 -SubnetMask 255.255.0.0 -MasqueradeIPAddress 172.22.22.22
Set-VBRViVirtualLabNetworkOptions -Options $isolated -MasqueradeIPAddress 172.22.22.24
This example shows how to modify a masquerade IP address of an isolated network that connect to the production network.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the ProductionNetwork, IsolatedNetworkName and VLANID parameter values. Save the result to the $maprule variable.
4. Run the New-VBRViVirtualLabNetworkOptions cmdlet. Specify the NetworkMappingRule, IPAddress, SubnetMask and MasqueradeIPAddress parameter values. Save the result to the $isolated variable.
5. Run the Set-VBRViVirtualLabNetworkOptions cmdlet. Set the $isolated variable as the Options parameter value. Specify the MasqueradeIPAddress parameter value.

---

### Parameters
#### **DNSServer**
Specifies an array of IP addresses of virtualized DNS servers.

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
Specifies an IP address of the proxy appliance. Veeam Backup & Replication will use this IP address to connect an isolated network with the production network.

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
Specifies a masquerade IP address. Veeam Backup & Replication will use this IP address to access VMs in the isolated network from the production network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **MasqueradeIPv6Address**
Specifies a masquerade IPv6 address. Veeam Backup & Replication will use this IP address to access VMs in the isolated network from the production network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **NetworkMappingRule**
Specifies a network mapping rule of an isolated network.
The cmdlet will map the isolated network to the production network that is specified in this rule.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRViVirtualLabNetworkMappingRule]`|false   |named   |False        |

#### **Options**
Specifies network settings that you want to modify.

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRViVirtualLabNetworkOptions]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SubnetMask**
Specifies a subnet mask of an isolated network.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViVirtualLabNetworkOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViVirtualLabNetworkOptions [-DNSServer <IPAddress[]>] [-EnableDHCP] [-EnableDHCPv6] [-IPAddress <IPAddress>] [-IPv6Address <IPAddress>] [-IPv6DNSServer <IPAddress[]>] [-IPv6PrefixLength <Int32>] 
```
```PowerShell
[-MasqueradeIPAddress <IPAddress>] [-MasqueradeIPv6Address <IPAddress>] [-NetworkMappingRule <VBRViVirtualLabNetworkMappingRule>] -Options <VBRViVirtualLabNetworkOptions> [-SubnetMask <String>] 
```
```PowerShell
[<CommonParameters>]
```
