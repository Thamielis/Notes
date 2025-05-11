Set-VBRViNetworkMappingRule
---------------------------

### Synopsis
Modifies network mapping rules of isolated networks.

---

### Description

This cmdlet modifies network mapping rules of isolated networks.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

* [New-VBRViNetworkMappingRule](New-VBRViNetworkMappingRule)

---

### Examples
> Example 1. Modifying Mapping to Production Network

$server = Get-VBRServer -Name "srv01.tech.local"
$production = Get-VBRViServerNetworkInfo -Server $server
$isolated = New-VBRViNetworkMappingRule -ProductionNetwork $production[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
Set-VBRViNetworkMappingRule -NetworkMapping $isolated -ProductionNetwork $production[7]
This example shows how to modify mapping rule and to map an isolated network to another production network.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $production variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the ProductionNetwork, IsolatedNetworkName and VLANID parameter values. Save the result to the $isolated variable.
4. Run the Set-VBRViNetworkMappingRule cmdlet. Set the $isolated variable as the NetworkMapping parameter value. Set the $production[7] as the ProductionNetwork parameter value.
The Get-VBRViServerNetworkInfo cmdlet will return an array of production networks. Mind the ordinal number of the necessary production network (An array starts with 0. In our example, it is the sixth production network in the array).
> Example 2. Modifying Isolated Network Name and ID

$server = Get-VBRServer -Name "srv01.tech.local"
$production = Get-VBRViServerNetworkInfo -Server $server
$isolated = New-VBRViNetworkMappingRule -ProductionNetwork $production[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
Set-VBRViNetworkMappingRule -NetworkMapping $isolated -IsolatedNetworkName "Sandbox07 Private VM Network" -VLANID 7
This example shows how to modify a name and ID of an isolated network.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $production variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the ProductionNetwork, IsolatedNetworkName and VLANID parameter values. Save the result to the $isolated variable.
4. Run the Set-VBRViNetworkMappingRule cmdlet. Specify the following settings:
- Set the $isolated variable as the NetworkMapping parameter value.
- Specify the IsolatedNetworkName parameter value.
- Specify the VLANID parameter value.

---

### Parameters
#### **IsolatedNetworkName**
Specifies a name of an isolated network. The cmdlet will create an isolated network with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NetworkMapping**
Specifies the network mapping rule of isolated networks. The cmdlet will modify settings of this network mapping rule.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRViVirtualLabNetworkMappingRule]`|true    |named   |False        |

#### **ProductionNetwork**
Specifies a production network with original VMs. The cmdlet will map VMs from this network to VMs from the isolated network.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRViNetworkInfo]`|false   |named   |False        |

#### **VLANID**
Specifies an ID of an isolated network. The cmdlet will create the isolated network with the specified ID.

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
Set-VBRViNetworkMappingRule [-IsolatedNetworkName <String>] -NetworkMapping <VBRViVirtualLabNetworkMappingRule> [-ProductionNetwork <VBRViNetworkInfo>] [-VLANID <Int32>] [<CommonParameters>]
```
