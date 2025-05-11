Add-StoragePluginHost
---------------------

### Synopsis
Adds Universal Storage API integrated systems to Veeam Backup & Replication.

---

### Description

This cmdlet adds selected Universal Storage API integrated systems to backup infrastructure.
When you add storage systems to your backup infrastructure, Veeam Backup & Replication performs a rescan of storage systems. During the rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
For more information about the rescan, see the Adding Storage Systems section of the User Guide for VMware vSphere.

TIP: Use the SkipRescan parameter to skip the automatic rescan.
To rescan storage systems manually, use the following cmdlets:
- Run Sync-StoragePluginHost to rescan of the entire storage system.
- Run Sync-StoragePluginVolume to rescan selected integrated systems volumes added to backup infrastructure.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRViProxy](Get-VBRViProxy)

* [Get-VBRStoragePlugin](Get-VBRStoragePlugin)

---

### Examples
> Example 1

Get-VBRStoragePlugin
$credentials = Get-VBRCredentials -Name "IBM Administrator"
$proxy = Get-VBRViProxy -Name 172.17.41.34
Add-StoragePluginHost -PluginType Ibm -Name 172.17.41.3 -Credentials $credentials -Description "IBM iSCSI" -Proxy $proxy
This example shows how to add an IBM Spectrum Virtualize storage system to Veeam Backup & Replication.

Perform the following steps:
1. Run the Get-VBRStoragePlugin cmdlet. To add the IBM Spectrum Virtualize storage system to Veeam Backup & Replication, you will need the IBM Plug-in.
2. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
3. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
4. Run the Add-StoragePluginHost cmdlet. Specify the following settings:
- Set the Ibm option for the PluginType parameter value.
- Specify the Name parameter value.
- Set the $credentials variable as the Credentials parameter value.
- Specify the Description parameter value.
- Set the $proxy variable as the Proxy parameter value.

---

### Parameters
#### **AgentFC**
For the EnableAgentBackup parameter.
Defines that the storage works over the FS protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AgentISCSI**
For the EnableAgentBackup parameter.
Defines that the storage works over the iSCSI protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AgentProxy**
For the EnableAgentBackup parameter.
Specifies an array of proxies you want to use with this storage.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRComputerFileProxyServer[]]`|false   |named   |False        |

#### **Credentials**
Specifies the credentials you want to use for authenticating with the storage.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CInternalCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableAgentBackup**
Enables the Veeam Agent backup option.
Defines that the cmdlet will allow backup of Veeam Agents.
If you provide this parameter, you will be able to integrate your storage systems with Veeam Agent for Microsoft Windows installed on computers in your infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableVMwareBackup**
Enables the VMware backup option.
If you provide this parameter, you will be able to use storage snapshots to backup and restore VMware vSphere VMs hosted on storage systems.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FibreChannel**
For the EnableVMwareBackup parameter.
Defines that the storage works over the FibreChannel protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a ThinkSystem storage system without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **iSCSI**
For the EnableVMwareBackup parameter.
Defines that the storage works over the iSCSI protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MountServer**
Specifies the mount server that you want to use to work with this storage.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Name**
Specifies the storage IP address or DNS name of the storage you want to add.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Nfs**
For the EnableVMwareBackup parameter.
Defines that the storage works over the NFS protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PluginType**
Specifies the storage plug-in.
The cmdlet will use this plug-in for adding the associated storage to Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Port**
Sets a port used to connect to the storage.
By default, port 443 is used.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Proxy**
For the EnableVMwareBackup parameter.
Specifies an array of proxies you want to use with this storage.
If not set, Veeam Backup & Replication will use automatic proxy selection.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[IProxy[]]`|false   |named   |False        |

#### **SkipRescan**
Defines that the cmdlet will not start the storage rescan automatically after you add storage systems to the backup infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UserName**
Specifies the user name that you want to use for authenticating with the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Add-StoragePluginHost [-AgentFC] [-AgentISCSI] [-AgentProxy <VBRComputerFileProxyServer[]>] -Credentials <CInternalCredentials> [-Description <String>] [-EnableAgentBackup] [-EnableVMwareBackup] [-FibreChannel] 
```
```PowerShell
[-Force] [-iSCSI] [-MountServer <CHost>] -Name <String> [-Nfs] -PluginType <String> [-Port <Int32>] [-Proxy <IProxy[]>] [-SkipRescan] [<CommonParameters>]
```
```PowerShell
Add-StoragePluginHost [-AgentFC] [-AgentISCSI] [-AgentProxy <VBRComputerFileProxyServer[]>] [-Description <String>] [-EnableAgentBackup] [-EnableVMwareBackup] [-FibreChannel] [-Force] [-iSCSI] [-MountServer 
```
```PowerShell
<CHost>] -Name <String> [-Nfs] -Password <String> -PluginType <String> [-Port <Int32>] [-Proxy <IProxy[]>] [-SkipRescan] -UserName <String> [<CommonParameters>]
```
