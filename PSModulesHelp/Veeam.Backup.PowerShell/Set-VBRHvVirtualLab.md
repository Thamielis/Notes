Set-VBRHvVirtualLab
-------------------

### Synopsis
Modifies settings of Hyper-V virtual labs.

---

### Description

This cmdlet modifies settings of Hyper-V virtual labs of the following types:
- Hyper-V Basic Virtual Lab.
- Hyper-V Advanced Virtual Lab.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRHvVirtualLabConfiguration](Get-VBRHvVirtualLabConfiguration)

---

### Examples
> Example 1. Modifying Virtual Lab Description

$lab = Get-VBRHvVirtualLabConfiguration -Name "SQL Virtual Lab"
Set-VBRHvVirtualLab -VirtualLab $lab -Description "Virtual Lab for SQL"
This example shows how to modify description for the virtual lab named SQL Virtual Lab.
Perform the following steps:
1. Run the Get-VBRHvVirtualLabConfiguration cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
2. Run the Set-VBRHvVirtualLab cmdlet. Set the $lab variable as the VirtualLab parameter value. Specify the Description parameter value.
> Example 2. Modifying Networking Mode for Virtual Lab

$lab = Get-VBRHvVirtualLabConfiguration -Name "SQL Virtual Lab"
Set-VBRHvVirtualLab = -VirtualLab $lab -Type Advanced
This example shows how to modify networking mode for a virtual lab.
Perform the following steps:
1. Run the Get-VBRHvVirtualLabConfiguration cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
2. Run the Set-VBRHvVirtualLab cmdlet. Set the $lab variable as the VirtualLab parameter value. Set the Advanced option for the Type parameter.

---

### Parameters
#### **Description**
Specifies a description. The cmdlet will create a virtual lab with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableProxyAppliance**
Defines that the cmdlet will enable the proxy appliance option.
If you specify this option, Veeam Backup & Replication enable automatic recovery verification of VMs. Otherwise, Veeam Backup & Replication will only start VMs in the virtual lab and perform the heartbeat test for VMs during recovery verification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableRoutingBetweenvNics**
Defines that the cmdlet will enable communication between isolated networks.
If you provide this parameter, the cmdlet will enable communication between isolated networks. Otherwise, Veeam Backup & Replication will not be able to connect the isolated networks with production networks.

|Type      |Required|Position|PipelineInput|Aliases                 |
|----------|--------|--------|-------------|------------------------|
|`[Switch]`|false   |named   |False        |EnableRoutingBetweenNics|

#### **EnableStaticIPMapping**
Defines that the cmdlet will enable the static IP mapping option.
If you provide this parameter, Veeam Backup & Replication will assign a static IP address to every VM in the virtual lab. Otherwise, you must update the routing table on every client machine.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will not show any warning about network mapping. If you do not provide this parameter, the cmdlet will display a warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IsolatedNetworkOptions**
Specifies network settings of an isolated network. The cmdlet will create a virtual lab with the specified network settings.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRHvIsolatedNetworkOptions[]]`|false   |named   |False        |

#### **Path**
Specifies the path to the folder where virtual lab will be stored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ProxyAppliance**
Specifies a proxy appliance. The cmdlet will add this proxy appliance to a virtual lab.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRHvVirtualLabProxyAppliance]`|false   |named   |False        |

#### **StaticIPMappingRule**
Specifies static IP address mapping rules. The cmdlet will create a virtual lab with the specified mapping rules.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[VBRHvVirtualLabStaticIPMappingRule[]]`|false   |named   |False        |

#### **Type**
Specifies a networking mode for a virtual lab. You can select one of the following networking modes:
* Simple: use this option if all VMs that you want to verify are connected to the same production network.
* Advanced: use this option if all VMs that you want to verify are connected to different networks.
Valid Values:

* Simple
* Advanced

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRHvVirtualLabType]`|false   |named   |False        |

#### **VirtualLab**
Specifies a virtual lab that you want to modify.

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRHvVirtualLabConfiguration]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRHvVirtualLabConfiguration

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRHvVirtualLab [-Description <String>] [-EnableProxyAppliance] [-EnableRoutingBetweenvNics] [-EnableStaticIPMapping] [-Force] [-IsolatedNetworkOptions <VBRHvIsolatedNetworkOptions[]>] [-Path <String>] 
```
```PowerShell
[-ProxyAppliance <VBRHvVirtualLabProxyAppliance>] [-StaticIPMappingRule <VBRHvVirtualLabStaticIPMappingRule[]>] [-Type {Simple | Advanced}] -VirtualLab <VBRHvVirtualLabConfiguration> [<CommonParameters>]
```
