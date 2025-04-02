Add-NimbleHost
--------------

### Synopsis
Adds HPE Nimble storage systems to Veeam Backup & Replication.

---

### Description

This cmdlet adds selected HPE Nimble storage systems to backup infrastructure.
When you add storage systems to your backup infrastructure, Veeam Backup & Replication performs a rescan of storage systems. During the rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
For more information about the rescan, see the Adding Storage Systems section of the User Guide for VMware vSphere.

TIP:  Use the SkipRescan parameter to skip the automatic rescan.
To rescan storage systems manually, use the following cmdlets:
- Run the Sync-NimbleHost cmdlet to rescan of the entire storage system.
- Run the Sync-NimbleVolume cmdlet to rescan selected HPE Nimble volumes added to backup infrastructure.

---

### Related Links
* [Get-VBRViProxy](Get-VBRViProxy)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1

$credentials = Get-VBRCredentials -Name "HPE Nimble Administrator"
$proxy = Get-VBRViProxy -Name 172.17.53.5
Add-NimbleHost -Name 172.17.53.38 -Credentials $credentials -Description "HPE Nimble Storage iSCSI" -Proxy $proxy -iSCSI
This example shows how to add an HPE Nimble storage system to the backup infrastructure using credentials.

Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $credentials variable.
2. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
3. Run the Add-NimbleHost cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $credentials variable as the Credentials parameter value.
- Specify the Description parameter value.
- Set the $proxy variable as the Proxy parameter value.
- Provide the iSCSI parameter.

---

### Parameters
#### **AgentFC**
For the EnableAgentBackup parameter.
Defines that the storage works over FC protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AgentISCSI**
For the EnableAgentBackup parameter.
Defines that the storage works over iSCSI protocol.

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
Defines that Veeam Backup & Replication will connect to the HPE Nimble storage over the FibreChannel protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a Nimble storage system without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **iSCSI**
For the EnableVMwareBackup parameter.
Defines that Veeam Backup & Replication will connect to the HPE Nimble storage over the iSCSI protocol.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MountServer**
Specifies the mount server that you want to use to work with this storage.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Name**
Specifies a storage IP address or DNS name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Proxy**
For the EnableVMwareBackup parameter.
Specifies the array of proxies you want to use to work with this storage.
If set, Veeam Backup & Replication will use the selected proxies. If not set, Veeam Backup & Replication will use automatic proxy selection.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[IProxy[]]`|false   |named   |False        |

#### **RESTAPIPort**
For HPE Nimble OS 2.3 and later.
Specifies the port for HPE Nimble RESTful API to communicate with storage.
Default: 5392.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
Add-NimbleHost [-AgentFC] [-AgentISCSI] [-AgentProxy <VBRComputerFileProxyServer[]>] -Credentials <CInternalCredentials> [-Description <String>] [-EnableAgentBackup] [-EnableVMwareBackup] [-FibreChannel] 
```
```PowerShell
[-Force] [-iSCSI] [-MountServer <CHost>] -Name <String> [-Proxy <IProxy[]>] [-RESTAPIPort <Int32>] [-SkipRescan] [<CommonParameters>]
```
```PowerShell
Add-NimbleHost [-AgentFC] [-AgentISCSI] [-AgentProxy <VBRComputerFileProxyServer[]>] [-Description <String>] [-EnableAgentBackup] [-EnableVMwareBackup] [-FibreChannel] [-Force] [-iSCSI] [-MountServer <CHost>] 
```
```PowerShell
-Name <String> -Password <String> [-Proxy <IProxy[]>] [-RESTAPIPort <Int32>] [-SkipRescan] -UserName <String> [<CommonParameters>]
```
