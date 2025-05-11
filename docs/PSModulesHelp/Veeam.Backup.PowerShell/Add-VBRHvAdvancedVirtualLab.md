Add-VBRHvAdvancedVirtualLab
---------------------------

### Synopsis
Creates a Hyper-V advanced virtual lab.

---

### Description

This cmdlet creates a Hyper-V advanced virtual lab.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Creating Advanced Virtual Lab

$host = Get-VBRServer -Name "esx09"
Add-VBRHvAdvancedVirtualLab -Server $host -Name "Exchange Lab" -Description "Virtual Lab for Exchange VMs"
This example shows how to create an advanced virtual lab with default settings. The cmdlet will create the virtual lab on the esx09 host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $host variable.
2. Run the Add-VBRHvAdvancedVirtualLab cmdlet. Set the $host variable as the Server parameter value. Specify the Name parameter value. Specify the Description parameter value.

---

### Parameters
#### **Description**
Specifies a description. The cmdlet will create a virtual lab with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableRoutingBetweenvNics**
Defines that the cmdlet will enable communication between isolated networks.
If you provide this parameter, the cmdlet will enable communication between isolated networks. Otherwise, Veeam Backup & Replication will not be able to connect the isolated networks with production networks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IsolatedNetworkOptions**
Specifies network settings of an isolated network. The cmdlet will create a virtual lab with the specified network settings.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRHvIsolatedNetworkOptions[]]`|false   |named   |False        |

#### **Name**
Specifies a name. The cmdlet will create a virtual lab with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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

#### **Server**
Specifies a Microsoft Hyper-V host. The cmdlet will create a virtual lab on this host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **StaticIPMappingRule**
Specifies static IP address mapping rules. The cmdlet will create a virtual lab with the specified mapping rules.

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[VBRHvVirtualLabStaticIPMappingRule[]]`|false   |named   |False        |

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
Add-VBRHvAdvancedVirtualLab [-Description <String>] [-EnableRoutingBetweenvNics] [-IsolatedNetworkOptions <VBRHvIsolatedNetworkOptions[]>] [-Name <String>] [-Path <String>] [-ProxyAppliance 
```
```PowerShell
<VBRHvVirtualLabProxyAppliance>] -Server <CHost> [-StaticIPMappingRule <VBRHvVirtualLabStaticIPMappingRule[]>] [<CommonParameters>]
```
