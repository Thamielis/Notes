Set-VBRViVirtualLab
-------------------

### Synopsis
Modifies settings of VMware virtual labs.

---

### Description

This cmdlet modifies settings of VMware virtual labs of the following kinds:
- VMware Basic Virtual Lab
- VMware Advanced Virtual Lab
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRViVirtualLabConfiguration](Get-VBRViVirtualLabConfiguration)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Modifying Datastore for Virtual Lab

$lab = Get-VBRViVirtualLabConfiguration -Name "SQL Virtual Lab"
$ESXi = Get-VBRServer -Name "esx09.tech.local"
$datastore = Find-VBRViDatastore -Server $ESXi -Name "esx09-das6"
Set-VBRViVirtualLab -VirtualLab $lab -CacheDatastore $datastore
This example shows how to specify the custom datastore for a virtual lab.
Veeam Backup & Replication will keep redo logs on the esx09-das6 datastore instead of the Power NFS server.
Perform the following steps:
1. Run the Get-VBRViVirtualLabConfiguration cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $ESXi variable.
3. Run the Find-VBRViDatastore cmdlet. Set the $ESXi as the Server parameter value. Specify the Name parameter value. Save the result to the $datastore variable.
4. Run the Set-VBRViVirtualLab cmdlet. Set the $lab variable as the VirtualLab parameter value. Set the $datastore variable as the CacheDatastore parameter value.
> Example 2. Modifying Networking Mode for Virtual Lab

$lab = Get-VBRViVirtualLabConfiguration -Name "SQL Virtual Lab"
Set-VBRViVirtualLab = -VirtualLab $lab -Type Advanced
This example shows how to modify networking mode for a virtual lab. The networking mode will be switched to verify that all VMs are connected to different networks and are located on the same ESXi hosts.
Perform the following steps:
1. Run the Get-VBRViVirtualLabConfiguration cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
2. Run the Set-VBRViVirtualLab cmdlet. Set the $lab variable as the VirtualLab parameter value. Set the Advanced option for the Type parameter.

---

### Parameters
#### **CacheDatastore**
Specifies a datastore to keep redo logs for verified VMs.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRViDatastore]`|false   |named   |False        |

#### **Description**
Specifies a description. The cmdlet will create a virtual lab with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DVS**
Specifies the VMware Distributed vSwitch. The create a virtual lab with the specified virtual switch.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViVirtualSwitch]`|false   |named   |False        |

#### **EnableCacheRedirect**
Defines that the cmdlet will redirect redo logs of verified VMs to the datastore.
If you provide this parameter, Veeam Backup & Replication will keep the redo logs on the specified datastore. Otherwise, it will keep them on the vPower NFS server.
Run the CacheDatastore parameter to specify the datastore for the redo logs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableProxyAppliance**
Defines that the cmdlet will enable the proxy appliance option.
If you specify this option, Veeam Backup & Replication enable automatic recovery verification of VMs. Otherwise, Veeam Backup & Replication will only start VMs in the virtual lab and perform the heartbeat test for VMs during recovery verification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableRoutingBetweenvNics**
Defines that the cmdlet will enable communication between isolated networks.
If you provide this parameter, the cmdlet will enable communication between isolated networks. Otherwise, Veeam Backup & Replication will not be able to connect the isolated networks with production networks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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

#### **IpMappingRule**
Specifies static IP address mapping rules. The cmdlet will create a virtual lab with the specified mapping rules.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRViVirtualLabIPMappingRule[]]`|false   |named   |False        |

#### **NetworkMappingRule**
Specifies mapping rules of isolated networks with production networks. The cmdlet will create a virtual lab with the specified mapping rules.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRViVirtualLabNetworkMappingRule[]]`|false   |named   |False        |

#### **NetworkOptions**
Specifies network settings of an isolated network. The cmdlet will create a virtual lab with the specified network settings.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRViVirtualLabNetworkOptions[]]`|false   |named   |False        |

#### **ProxyAppliance**
Specifies a proxy appliance. The cmdlet will add this proxy appliance to a virtual lab.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRViVirtualLabProxyAppliance]`|false   |named   |False        |

#### **Type**
Specifies a networking mode for a virtual lab. You can select one of the following networking modes:
* Simple: use this option if all VMs that you want to verify are connected to the same production network.
* Advanced: use this option if all VMs that you want to verify are connected to different networks and are located on the same ESXi hosts.
* AdvancedMultiHost: use this option if all VMs that you want to verify are connected to different networks and are located on the different ESXi hosts.
Valid Values:

* Simple
* Advanced
* AdvancedMultiHost

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRViVirtualLabType]`|false   |named   |False        |

#### **VirtualLab**
Specifies a virtual lab that you want to modify.

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRViVirtualLabConfiguration]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViVirtualLabConfiguration

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViVirtualLab [-CacheDatastore <VBRViDatastore>] [-Description <String>] [-DVS <VBRViVirtualSwitch>] [-EnableCacheRedirect] [-EnableProxyAppliance] [-EnableRoutingBetweenvNics] [-EnableStaticIPMapping] 
```
```PowerShell
[-Force] [-IpMappingRule <VBRViVirtualLabIPMappingRule[]>] [-NetworkMappingRule <VBRViVirtualLabNetworkMappingRule[]>] [-NetworkOptions <VBRViVirtualLabNetworkOptions[]>] [-ProxyAppliance 
```
```PowerShell
<VBRViVirtualLabProxyAppliance>] [-Type {Simple | Advanced | AdvancedMultiHost}] -VirtualLab <VBRViVirtualLabConfiguration> [<CommonParameters>]
```
