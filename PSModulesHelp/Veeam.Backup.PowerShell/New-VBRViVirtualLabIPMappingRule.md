New-VBRViVirtualLabIPMappingRule
--------------------------------

### Synopsis
Defines static IP address mapping rules.

---

### Description

This cmdlet creates the VBRViVirtualLabIPMappingRule object that defines static IP address mapping rules.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

---

### Examples
> Example 1. Defining Static IPv4 Address Mapping Rules

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
New-VBRViVirtualLabIPMappingRule -ProductionNetwork $network[2] -IsolatedIPAddress 172.17.53.15 -AccessIPAddress 172.17.53.162 -Note "IP address to access DNS"
This example shows how to define static IPv4 address mapping rules.
The cmdlet output will contain the following details on mapping settings: ProductionNetwork, IsolatedIPAddress, AccessIPAddress and Note.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViVirtualLabIPMappingRule cmdlet. Specify the following settings:
- Set the $network[2] variable as the ProductionNetwork parameter value.
The Get-VBRViServerNetworkInfo cmdlet will return an array of production networks. Mind the ordinal number of the necessary production network (An array starts with 0. In our example, it is the third production network in the array).
- Specify the IsolatedIPAddress parameter value.
- Specify the AccessIPAddress parameter value.
- Specify the Note parameter parameter value.
> Example 2. Defining Static IPv6 Address Mapping Rules

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
New-VBRViVirtualLabIPMappingRule -ProductionNetwork $network[2] -IsolatedIPv6Address fdd1:aa80:bb80:cc80:dd80:ee80:ff80:1 -AccessIPv6Address fdd1:aa80:bb80:ac80:dd80:ee80:ff80:1 -Note "IP address to access DNS"
This example shows how to define static IPv6 address mapping rules. The cmdlet output will contain the following details on mapping settings: ProductionNetwork, IsolatedIPAddress, AccessIPAddress and Note.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViVirtualLabIPMappingRule cmdlet. Specify the following settings:
- Set the $network[2] variable as the ProductionNetwork parameter value.
The Get-VBRViServerNetworkInfo cmdlet will return an array of production networks. Mind the ordinal number of the necessary production network (An array starts with 0. In our example, it is the third production network in the array).
- Specify the IsolatedIPv6Address parameter value.
- Specify the AccessIPv6Address parameter value.
- Specify the Note parameter value.
> Example 3. Defining Static IPv4 and IPv6 Address Mapping Rules

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
New-VBRViVirtualLabIPMappingRule -ProductionNetwork $network[2] -IsolatedIPAddress 192.168.10.20 -AccessIPAddress 192.158.10.20 -IsolatedIPv6Address fdd1:aa80:bb80:cc80:dd80:ee80:ff80:1 -AccessIPv6Address fdd1:aa80:bb80:ac80:dd80:ee80:ff80:1 -Note "IP address to access DNS"
This example shows how to define static IPv4 and IPv6 address mapping rules. The cmdlet output will contain the following details on mapping settings: ProductionNetwork, IsolatedIPAddress, AccessIPAddress and Note.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViVirtualLabIPMappingRule cmdlet. Specify the following settings:
- Set the $network[2] variable as the ProductionNetwork parameter value.
The Get-VBRViServerNetworkInfo cmdlet will return an array of production networks. Mind the ordinal number of the necessary production network (An array starts with 0. In our example, it is the third production network in the array).
- Specify the IsolatedIPAddress parameter value.
- Specify the AccessIPAddress parameter value.
- Specify the IsolatedIP6Address parameter value.
- Specify the AccessIPv6Address parameter value.
- Specify the Note parameter value.

---

### Parameters
#### **AccessIPAddress**
Specifies an IPv4 address of a production network.
The cmdlet will map this IP address with an IP address of an isolated network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **AccessIPv6Address**
Specifies an IPv6 address of a production network.
The cmdlet will map this IP address with an IP address of an isolated network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IsolatedIPAddress**
Specifies an IPv4 address of an isolated network.
The cmdlet will map this IP address with an IP address of a production network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IsolatedIPv6Address**
Specifies an IPv6 address of an isolated network.
The cmdlet will map this IP address with an IP address of a production network.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **Note**
Specifies notes that you want to assign to the static mapping settings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ProductionNetwork**
Specifies a production network with original VMs.
The cmdlet will set up static mapping of IP address from this network with IP addresses from the isolated network.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRViNetworkInfo]`|true    |named   |False        |

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
New-VBRViVirtualLabIPMappingRule [-AccessIPAddress <IPAddress>] [-AccessIPv6Address <IPAddress>] [-IsolatedIPAddress <IPAddress>] [-IsolatedIPv6Address <IPAddress>] [-Note <String>] -ProductionNetwork 
```
```PowerShell
<VBRViNetworkInfo> [<CommonParameters>]
```
