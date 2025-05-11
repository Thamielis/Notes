New-VBRHvIsolatedNetworkOptions
-------------------------------

### Synopsis
Defines network settings of isolated networks.

---

### Description

This cmdlet creates the VBRHvIsolatedNetworkOptions object that defines network settings of isolated networks and how to map it to production networks.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRHvServerNetworkInfo](Get-VBRHvServerNetworkInfo)

* [New-VBRHvProductionNetworkOptions](New-VBRHvProductionNetworkOptions)

---

### Examples
> Example 1. Defining Network Settings of Isolated Network Using IPv4

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRHvServerNetworkInfo -Server $server
$prodnet = New-VBRHvProductionNetworkOptions -ProductionNetwork $network[3] -UseProductionNetworkVLANID -ProductionNetworkVLANID "2"
New-VBRHvIsolatedNetworkOptions -ProductionNetworkOptions $prodnet -IPAddress 172.17.1.2 -SubnetMask 255.255.0.0 -MasqueradeAddress 172.22.22.22
This example shows how to define network settings of the Sandbox01 Private VM Network isolated network to map to the production network using IPv4. The isolated network will be set up with the following settings:
- The IP address of the proxy appliance is assigned to 172.17.1.2.
- The subnet mask is set to 255.255.0.0.
- The masquerade IP address is set to 172.22.22.22.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRHvProductionNetworkOptions cmdlet. Specify the ProductionNetwork and ProductionNetworkVLANID parameters. Provide the UseProductionNetworkVLANID parameter. Save the result to the $prodnet variable.
4. Run the New-VBRHvIsolatedNetworkOptions cmdlet. Specify the following settings:
- Set the $prodnet variable as the ProductionNetworkOptions parameter value.
- Specify the IPAddress parameter value.
- Specify the SubnetMask parameter value.
- Specify the MasqueradeIPAddress parameter value.
> Example 2. Defining Network Settings of Isolated Network Using IPv6

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRHvServerNetworkInfo -Server $server
$prodnet = New-VBRHvProductionNetworkOptions -ProductionNetwork $network[3] -UseProductionNetworkVLANID -ProductionNetworkVLANID "2"
New-VBRHvIsolatedNetworkOptions -ProductionNetworkOptions $prodnet -IPv6Address fdd1:aa80:bb80:cc80:dd80:ee80:fe80:10 -IPv6PrefixLength 64 -MasqueradeIPv6Address fdd1:ab80:bb80:cc88::
This example shows how to define network settings of the Sandbox01 Private VM Network isolated network to map to the production network using IPv6. The isolated network will be set up with the following settings:
- The IP address of the proxy appliance is assigned the fdd1:aa80:bb80:cc80:dd80:ee80:fe80:10 IP.
- The prefix length is set to 64.
- The masquerade IP address is set to fdd1:ab80:bb80:cc88::.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRHvProductionNetworkOptions cmdlet. Specify the ProductionNetwork and ProductionNetworkVLANID parameter values. Provide the UseProductionNetworkVLANID parameter. Save the result to the $prodnet variable.
4. Run the New-VBRHvIsolatedNetworkOptions cmdlet. Specify the following settings:
- Set the $prodnet variable as the ProductionNetworkOptions parameter value.
- Specify the IPv6Address parameter value.
- Specify the IPv6PrefixLength parameter value.
- Specify the MasqueradeIv6PAddress parameter value.

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
Specifies an IPv4 address of the proxy appliance. Veeam Backup & Replication will use this IP address to connect an isolated network with the production network.

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

#### **IsolatedNetworkName**
Specifies a name of an isolated network. The cmdlet will create an isolated network with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **IsolatedNetworkVLANID**
Specifies an ID of a isolated network. The cmdlet will create the isolated network with the specified ID.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MasqueradeIPAddress**
Specifies a masquerade IPv4 address. Veeam Backup & Replication will use this IP address to access VMs in the isolated network from the production network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **MasqueradeIPv6Address**
Specifies a masquerade IPv6 address. Veeam Backup & Replication will use this IP address to access VMs in the isolated network from the production network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **ProductionNetworkOptions**
Specifies a network mapping rule of an isolated network. The cmdlet will map the isolated network to the production network that is specified in this rule.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRHvProductionNetworkOptions[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SubnetMask**
Specifies a subnet mask of an isolated network.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRHvProductionNetworkOptions[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRHvIsolatedNetworkOptions [-DNSServer <IPAddress[]>] [-EnableDHCP] [-EnableDHCPv6] [-IPAddress <IPAddress>] [-IPv6Address <IPAddress>] [-IPv6DNSServer <IPAddress[]>] [-IPv6PrefixLength <Int32>] 
```
```PowerShell
-IsolatedNetworkName <String> [-IsolatedNetworkVLANID <Int32>] [-MasqueradeIPAddress <IPAddress>] [-MasqueradeIPv6Address <IPAddress>] -ProductionNetworkOptions <VBRHvProductionNetworkOptions[]> [-SubnetMask 
```
```PowerShell
<String>] [<CommonParameters>]
```
