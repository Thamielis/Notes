Add-VBRViAdvancedVirtualLab
---------------------------

### Synopsis
Creates a VMware advanced virtual lab.

---

### Description

This cmdlet creates a VMware advanced virtual lab.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViDatastore](Find-VBRViDatastore)

---

### Examples
> Example 1. Creating Advanced Virtual Lab

$esxi = Get-VBRServer -Name "esx09.tech.local"
Add-VBRViAdvancedVirtualLab -Server $esxi -Name "Exchange Lab"  -Description "Virtual Lab for Exchange VMs"
This example shows how to create an advanced virtual lab with default settings. The cmdlet will create the virtual lab on the esx09.tech.local ESXi host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $esxi variable.
2. Run the Add-VBRViAdvancedVirtualLab cmdlet. Set the $esxi variable as the Server parameter value. Specify the Name parameter value. Specify the Description parameter value.
> Example 2. Creating Virtual Lab with Custom Datastore

$esxi = Get-VBRServer -Name "esx09.tech.local"
$datastore = Find-VBRViDatastore -Server $esxi -Name "esx09-das6"
Add-VBRViAdvancedVirtualLab -Server $esxi -Name "SQL Database Lab" -Description "Virtual Lab for SQL Databases" -DesignatedResourcePoolName "SQL test" -DesignatedVMFolderName "SQL" -CacheDatastore $datastore
The following request returns license usage data for the VAO server with the ID 76da0d75-75b0-4675-8296-0142ad0d52a7.
- Veeam Backup & Replication will keep redo logs on the esx09-das6 datastore.
- The virtual lab will be located on the SQL test resource pool with the SQL folder.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $esxi variable.
2. Run the Find-VBRViDatastore cmdlet. Set the $esxi variable as the Server parameter value. Specify the Name parameter value. Save the result to the $datastore variable.
3. Run the Add-VBRViAdvancedVirtualLab cmdlet. Specify the following settings:
- Set the $esxi variable as the Server parameter value.
- Specify the Name parameter value.
- Specify the Description parameter value.
- Specify the DesignatedResourcePoolName parameter value.
- Specify the DesignatedVMFolderName parameter value.

- Set the $datastore variable as the CacheDatastore parameter value.

---

### Parameters
#### **CacheDatastore**
Specifies a datastore to keep redo logs for verified VMs.
Note: If you do not specify this parameter, Veeam Backup & Replication will store redo logs on the vPower NFS server.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRViDatastore]`|false   |named   |False        |

#### **Description**
Specifies a description. The cmdlet will create a virtual lab with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DesignatedResourcePoolName**
Specifies a name of a resource pool. The cmdlet will create the resource pool with the specified name on the ESXi host.
Default: Same name as the Virtual Lab.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DesignatedVMFolderName**
Specifies a name of the dedicated folder. The cmdlet will create the folder in a resource pool with the specified name.
Default: Same name as the Virtual Lab.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DVS**
Specifies the VMware Distributed vSwitch. The create a virtual lab with the specified virtual switch.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViVirtualSwitch]`|false   |named   |False        |

#### **EnableRoutingBetweenvNics**
Defines that the cmdlet will enable communication between isolated networks.
If you provide this parameter, the cmdlet will enable communication between isolated networks. Otherwise, Veeam Backup & Replication will not be able to connect the isolated networks with production networks.

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

#### **Name**
Specifies a name. The cmdlet will create a virtual lab with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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

#### **Server**
Specifies an ESXi host. The cmdlet will create a virtual lab on this host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

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
Add-VBRViAdvancedVirtualLab [-CacheDatastore <VBRViDatastore>] [-Description <String>] [-DesignatedResourcePoolName <String>] [-DesignatedVMFolderName <String>] [-DVS <VBRViVirtualSwitch>] 
```
```PowerShell
[-EnableRoutingBetweenvNics] [-Force] [-IpMappingRule <VBRViVirtualLabIPMappingRule[]>] [-Name <String>] [-NetworkMappingRule <VBRViVirtualLabNetworkMappingRule[]>] [-NetworkOptions 
```
```PowerShell
<VBRViVirtualLabNetworkOptions[]>] [-ProxyAppliance <VBRViVirtualLabProxyAppliance>] -Server <CHost> [<CommonParameters>]
```
