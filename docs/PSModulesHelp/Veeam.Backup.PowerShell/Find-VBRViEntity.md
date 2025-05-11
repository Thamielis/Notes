Find-VBRViEntity
----------------

### Synopsis
Looks for VMware objects.

---

### Description

This cmdlet returns VMware objects connected to a specified ESXi host.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Getting List of Hosts and Clusters Connected to Specific ESXI Hosts

$server = Get-VBRServer -Name "ESXiHost 01", "ESXiHost 02"
Find-VBRViEntity -HostsAndClusters -Server $server
This examples shows how to get a list of  hosts and clusters that are connected to the following ESXi hosts: ESXiHost 01 and ESXiHost 02.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViEntity cmdlet. Set the $server variable as the Server parameter value. Provide the HostsAndClusters parameter.
> Example 2. Getting Specific Cluster from ESXI Host

$server = Get-VBRServer -Name "ESX01"
Find-VBRViEntity -Server $server -HostsAndClusters -Name vSAN
This examples shows how to get the vSAN ESXi cluster named located on the ESX01 ESXiHost.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViEntity cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Provide the HostsAndClusters parameter.
- Specify the Name parameter value.
> Example 3. Getting List of Resource Pools

$server = Get-VBRServer -Name "ESX01"
Find-VBRViEntity -Server $server -ResourcePools -Name Veeam*
This examples shows how to get a list of resource pools with names starting with Veeam. The resource pools are located on the ESX01 ESXi host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViEntity cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Provide the ResourcePools parameter.
- Specify the Name parameter value.
> Example 4. Getting List of VMware Tags

$server = Get-VBRServer -Name vcenter05.tech.global
Find-VBRViEntity -Server $server -Tags -Name "Mac OS"
This examples shows how to get a list of the Mac OS VMware tags within the vcenter05.tech.global vCenter.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViEntity cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Provide the Tags parameter.
- Specify the Name parameter value.

---

### Parameters
#### **DatastoresAndVMs**
Defines that the cmdlet will return only datastores and VMs.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HostsAndClusters**
Defines that the cmdlet will return only hosts and clusters.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HostsAndDatastores**
Defines that the cmdlet will return only hosts and datastores.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies an array of VMware object names. The cmdlet will return entities with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **ResourcePools**
Defines that the cmdlet will return only resource pools.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies an array of ESXi hosts. The cmdlet will return entities created on these hosts.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Servers**
Defines that the cmdlet will return only VMware hosts.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Tags**
Defines that the cmdlet will return only tags.
Default: False.
Note:
* To get the necessary tags of the VMware objects, you must specify the vCenter Server in the Server parameter. If you specify ESXi hosts, the cmdlet will not return any data. If you don't provide the Server parameter, the cmdlet will return tags for all servers, added to a backup infrastructure.
* To specify the tag name, use the Name parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **VMsAndTemplates**
Defines that the cmdlet will return only VMs, folders and templates.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Common.CHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRViEntity [-DatastoresAndVMs] [-Name <String[]>] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRViEntity [-HostsAndClusters] [-Name <String[]>] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRViEntity [-HostsAndDatastores] [-Name <String[]>] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRViEntity [-Name <String[]>] [-ResourcePools] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRViEntity [-Name <String[]>] [-Server <CHost[]>] [-Servers] [<CommonParameters>]
```
```PowerShell
Find-VBRViEntity [-Name <String[]>] [-Server <CHost[]>] [-Tags] [<CommonParameters>]
```
```PowerShell
Find-VBRViEntity [-Name <String[]>] [-Server <CHost[]>] [-VMsAndTemplates] [<CommonParameters>]
```
