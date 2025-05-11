Add-VBRViSimpleVirtualLab
-------------------------

### Synopsis
Creates a VMware basic virtual lab.

---

### Description

This cmdlet creates a VMware basic virtual lab.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViDatastore](Find-VBRViDatastore)

---

### Examples
> Example 1. Creating Basic Virtual Lab

$ESXi = Get-VBRServer -Name "esx09.tech.local"
Add-VBRViSimpleVirtualLab -Server $ESXi -Name "Exchange Lab" -Description "Virtual Lab for Exchange VMs"
This example shows how to create a basic virtual lab with default settings. The cmdlet will create the virtual lab on the esx09.tech.local ESXi host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $ESXi variable.
2. Run the Add-VBRViSimpleVirtualLab cmdlet. Set the $ESXi variable as the Server parameter value. Specify the Name parameter value. Specify the Description parameter value.
> Example 2. Creating Virtual Lab with Custom Datastore

$ESXi = Get-VBRServer -Name "esx09.tech.local"
$datastore = Find-VBRViDatastore -Server $ESXi -Name "esx09-das6"
Add-VBRViSimpleVirtualLab -Server $ESXi -Name "SQL Database Lab" -Description "Virtual Lab for SQL Databases" -DesignatedResourcePoolName "SQL test" -DesignatedVMFolderName "SQL" -CacheDatastore $datastore
This example shows how to create a basic virtual lab with a custom datastore. The virtual lab will be created with the following settings:
- Veeam Backup & Replication will keep redo logs on the esx09-das6 datastore.
- The virtual lab will be located on the SQL test resource pool with the SQL folder.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $ESXi variable.
2. Run the Find-VBRViDatastore cmdlet. Set the $ESXi variable as the Server parameter value. Specify the Name parameter value. Save the result to the $datastore variable.
3. Run the Add-VBRViSimpleVirtualLab cmdlet. Specify the following settings:
- Set the $ESXi variable as the Server parameter value.
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
Default: Same name as the virtual lab.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DesignatedVMFolderName**
Specifies a name of the dedicated folder. The cmdlet will create the folder in a resource pool with the specified name.
Default: Same name as the virtual lab.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies a name. The cmdlet will create a virtual lab with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Add-VBRViSimpleVirtualLab [-CacheDatastore <VBRViDatastore>] [-Description <String>] [-DesignatedResourcePoolName <String>] [-DesignatedVMFolderName <String>] [-Name <String>] [-ProxyAppliance 
```
```PowerShell
<VBRViVirtualLabProxyAppliance>] -Server <CHost> [<CommonParameters>]
```
