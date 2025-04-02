Add-ThinkSystemHost
-------------------

### Synopsis
Adds ThinkSystem storage systems to the backup infrastructure.

---

### Description

This cmdlet adds selected ThinkSystem storage systems to the backup infrastructure.
When you add storage systems to your backup infrastructure, Veeam Backup & Replication performs a rescan of these storage systems.
During the rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
For more information about the rescan, see the Adding Storage Systems section of the User Guide for VMware vSphere.

TIP: Provide the SkipRescan parameter to skip the automatic rescan.
To rescan storage systems manually, use the following cmdlets:
- Run the Sync-NetAppHost cmdlet to rescan of the entire storage system.
- Run the Sync-NetAppVolume cmdlet to rescan selected NetApp volumes added to backup infrastructure.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRViProxy](Get-VBRViProxy)

---

### Examples
> Example 1. Adding a ThinkSystem Storage System by Username and Password

```PowerShell
Add-ThinkSystemHost -Name 167.16.2.134 -UserName "Lenovo Administrator" -Password "SecurePa$$w0rd"
This command adds a ThinkSystem storage system to the backup infrastructure using username and password.
```
> Example 2. Adding a ThinkSystem Storage System by Credentials

$credentials = Get-VBRCredentials -Name "Lenovo Administrator"
$proxy = Get-VBRViProxy -Name 167.16.21.25
Add-ThinkSystemHost -Name 167.16.2.134 -Credentials $credentials -Proxy $proxy -Description "Lenovo Storage"
This example shows how to add a ThinkSystem storage system to the backup infrastructure using credentials.

Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
2. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
3. Run the Add-ThinkSystemHost cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $credentials variable as the Credentials parameter value.
- Set the $proxy variable as the Proxy parameter value.
- Specify the Description parameter value.

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

#### **CreateRulesAutomatically**
For the EnableVMwareBackup parameter.
Defines that the cmdlet will allow Veeam Backup & Replication to automatically create required SMB and NFS export rules on the storage system.
If you provide this parameter, the rules will be created automatically in case the proxies are unavailable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
If you provide this parameter, you will be able to integrate your storage systems with Veeam Agent for Microsoft Windows installed on computers in your infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableNASBackup**
Enables the NAS backup option.
If you provide this parameter, you will be able to integrate your storage systems with NAS file shares added to your infrastructure.

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
Defines that the storage works over FibreChannel protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a HPE 3PAR StoreServ storage system without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **iSCSI**
For the EnableVMwareBackup parameter.
Defines that the storage works over iSCSI protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IsHTTP**
If set to TRUE, HTTP protocol will be used to connect to the ThinkSystem storage.  Otherwise, HTTPS protocol will be selected.
Defaul: HTTPS.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **MountServer**
Specifies an array of proxies you want to use with this storage.
Veeam Backup & Replication will use this proxy to rescan and Backup from Storage Snapshots.
If not set, Veeam Backup & Replication will use automatic proxy selection.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Name**
Specifies the storage IP address or DNS name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **NASCreateRulesAutomatically**
For the EnableNASBackup parameter.
Defines that the cmdlet will allow Veeam Backup & Replication to automatically create required SMB and NFS export rules on the storage system.
If you provide this parameter, the rules will be created automatically in case the proxies are unavailable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NASNFS**
For the EnableNASBackup parameter.
Defines that the storage works over the NFS protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NASProxy**
For the EnableNASBackup parameter.
Specifies an array of proxies you want to use with this storage.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **NASSMB**
For the EnableNASBackup parameter.
Defines that the storage works over the SMB protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NFS**
For the EnableVMwareBackup parameter.
Defines that the storage works over NFS protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Port**
Specifies a port used to connect to the ThinkSystem storage.
By default, port 443 is used.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Proxy**
For the EnableVMwareBackup parameter.
Specifies an array of proxies you want to use with this storage. Veeam Backup & Replication will use this proxy to rescan and Backup from Storage Snapshots.
Note: If you do not provide this parameter,  Veeam Backup & Replication  will use the automatic proxy selection.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[IProxy[]]`|false   |named   |False        |

#### **SkipRescan**
Specifies the mount server that you want to use to work with this storage.
Veeam Backup & Replication will use this server for file-level and application items restore.

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
Add-ThinkSystemHost [-AgentFC] [-AgentISCSI] [-AgentProxy <VBRComputerFileProxyServer[]>] [-CreateRulesAutomatically] -Credentials <CInternalCredentials> [-Description <String>] [-EnableAgentBackup] 
```
```PowerShell
[-EnableNASBackup] [-EnableVMwareBackup] [-FibreChannel] [-Force] [-iSCSI] [-IsHTTP <Boolean>] [-MountServer <CHost>] -Name <String> [-NASCreateRulesAutomatically] [-NASNFS] [-NASProxy <VBRNASProxyServer[]>] 
```
```PowerShell
[-NASSMB] [-NFS] [-Port <Int32>] [-Proxy <IProxy[]>] [-SkipRescan] [<CommonParameters>]
```
```PowerShell
Add-ThinkSystemHost [-AgentFC] [-AgentISCSI] [-AgentProxy <VBRComputerFileProxyServer[]>] [-CreateRulesAutomatically] [-Description <String>] [-EnableAgentBackup] [-EnableNASBackup] [-EnableVMwareBackup] 
```
```PowerShell
[-FibreChannel] [-Force] [-iSCSI] [-IsHTTP <Boolean>] [-MountServer <CHost>] -Name <String> [-NASCreateRulesAutomatically] [-NASNFS] [-NASProxy <VBRNASProxyServer[]>] [-NASSMB] [-NFS] -Password <String> [-Port 
```
```PowerShell
<Int32>] [-Proxy <IProxy[]>] [-SkipRescan] -UserName <String> [<CommonParameters>]
```
