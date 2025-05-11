New-VBRViNetworkMappingRule
---------------------------

### Synopsis
Defines network mapping rules of isolated networks.

---

### Description

This cmdlet creates the VBRViVirtualLabNetworkMappingRule object that defines network mapping rules of isolated networks. Veeam Backup & Replication will map isolated networks to production networks that are specified in this rule.
You can use this object to specify network mapping rules in network settings of isolated networks.
Run the New-VBRViVirtualLabNetworkOptions cmdlet to specify network settings of isolated networks.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

---

### Examples
> Defining Isolated Mapping Rules

$server = Get-VBRServer -Name "srv01.tech.local"
$network = Get-VBRViServerNetworkInfo -Server $server
New-VBRViNetworkMappingRule -Server $server -ProductionNetwork $network[3] -IsolatedNetworkName "Sandbox01 Private VM Network" -VLANID 5
ProductionNetwork                       IsolatedNetworkName                                                  VLANID
-----------------                       -------------------                                                  ------
Veeam.Backup.PowerShell.Infos.VBRViN... Sandbox01 Private VM Network                                              5
This example shows how to define network mapping rules of isolated networks.
The cmdlet output will show details on the following network settings: ProductionNetwork, IsolatedNetworkName and VLANID.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRViServerNetworkInfo cmdlet. Set the $server variable as the Server parameter value. Save the result to the $network variable.
3. Run the New-VBRViNetworkMappingRule cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Set the $network[3] variable as the ProductionNetwork parameter value.
The Get-VBRViServerNetworkInfo cmdlet will return an array of production networks. Mind the ordinal number of the necessary production network (An array starts with 0. In our example, it is the fourth production network in the array).
- Specify the IsolatedNetworkName parameter value.
- Specify the VLANID parameter value.

---

### Parameters
#### **IsolatedNetworkName**
Specifies a name of an isolated network. The cmdlet will create an isolated network with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **ProductionNetwork**
Specifies a production network with original VMs. The cmdlet will map VMs from this network to VMs from the isolated network.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRViNetworkInfo]`|true    |named   |False        |

#### **Server**
Specifies an ESXi host. The cmdlet will define a network mapping rule for the virtual lab that is added to this host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

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
New-VBRViNetworkMappingRule -IsolatedNetworkName <String> -ProductionNetwork <VBRViNetworkInfo> -Server <CHost> [-VLANID <Int32>] [<CommonParameters>]
```
