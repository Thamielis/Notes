Set-VBRViVirtualLabIPMappingRule
--------------------------------

### Synopsis
Modifies static IP address mapping rules.

---

### Description

This cmdlet modifies static IP address mapping rules.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

* [New-VBRViVirtualLabIPMappingRule](New-VBRViVirtualLabIPMappingRule)

---

### Examples
> Example 1. Modifying IPv4 Address of Isolated Network

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$mapping = New-VBRViVirtualLabIPMappingRule -ProductionNetwork $network[2] -IsolatedIPAddress 172.17.53.15 -AccessIPAddress 172.17.53.162
Set-VBRViVirtualLabIPMappingRule -Rule $mapping -IsolatedIPAddress 172.17.53.75
This example shows how to modify an IPv4 address of isolated network for a static IP address mapping rule.
The 172.17.53.75 IP of the isolated network will be mapped with the 172.17.53.162 IP address of the production network.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViVirtualLabIPMappingRule cmdlet. Specify ProductionNetwork, IsolatedIPAddress and AccessIPAddress parameter values. Save the result to the $mapping variable.
4. Run the Set-VBRViVirtualLabIPMappingRule cmdlet. Set the $mapping variable as the Rule parameter value. Specify the IsolatedIPAddress parameter value.
> Example 2. Modifying IPv6 Address of Isolated Network

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$mapping = New-VBRViVirtualLabIPMappingRule -ProductionNetwork $network[2] -IsolatedIPv6Address fdd1:aa80:bb80:cc80:dd80:ee80:ff80:1 -AccessIPv6Address fdd1:aa80:bb80:ac80:dd80:ee80:ff80:1
Set-VBRViVirtualLabIPMappingRule -Rule $mapping -IsolatedIPv6Address fdd1:ab80:bb80:cc80:dd80:ee80:ff80:1
This example shows how to modify an IPv6 address of isolated network for a static IP address mapping rule.
The fdd1:ab80:bb80:cc80:dd80:ee80:ff80:1 IP of the isolated network will be mapped with the fdd1:aa80:bb80:ac80:dd80:ee80:ff80:1 IP address of the production network.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViVirtualLabIPMappingRule cmdlet. Specify ProductionNetwork, IsolatedIPv6Address and AccessIPv6Address parameter values. Save the result to the $mapping variable.
4. Run the Set-VBRViVirtualLabIPMappingRule cmdlet. Set the $mapping variable as the Rule parameter value. Specify the IsolatedIPv6Address parameter value.
> Example 3. Modifying IPv4 Address of Production Network

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
$mapping = New-VBRViVirtualLabIPMappingRule -ProductionNetwork $network[2] -IsolatedIPAddress 172.17.53.15 -AccessIPAddress 172.17.53.162
Set-VBRViVirtualLabIPMappingRule -Rule $mapping -AccessIPAddress 172.17.53.170
This example shows how to modify an IPv4 address of a production network for a static IP address mapping rule.
The 172.17.53.15 IP of the isolated network will be mapped with the 172.17.53.170 IP address of the production network.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViVirtualLabIPMappingRule cmdlet. Specify the ProductionNetwork, IsolatedIPAddress and AccessIPAddress parameter values. Save the result to the $mapping variable.
4. Run the Set-VBRViVirtualLabIPMappingRule cmdlet. Set the $mapping variable as the Rule parameter value. Specify the AccessIPAddress parameter value.

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
|`[VBRViNetworkInfo]`|false   |named   |False        |

#### **Rule**
Specifies a static IP mapping rule that you want to modify.

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRViVirtualLabIPMappingRule]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViVirtualLabIPMappingRule

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViVirtualLabIPMappingRule [-AccessIPAddress <IPAddress>] [-AccessIPv6Address <IPAddress>] [-IsolatedIPAddress <IPAddress>] [-IsolatedIPv6Address <IPAddress>] [-Note <String>] [-ProductionNetwork 
```
```PowerShell
<VBRViNetworkInfo>] -Rule <VBRViVirtualLabIPMappingRule> [<CommonParameters>]
```
