Set-StoragePluginHost
---------------------

### Synopsis
Modifies settings of Universal Storage API integrated systems.

---

### Description

This cmdlet modifies settings of Universal Storage API storage systems.
When you modify storage system settings, the cmdlet automatically rescans storage systems.

TIP: You can specify the scope of volumes that you want to rescan with the VBRVolumeScanType parameter.
Run the Get-StoragePluginInfrastructureVolume cmdlet to get an array of volumes from Universal Storage API integrated systems.

---

### Related Links
* [Get-StoragePluginHost](Get-StoragePluginHost)

* [Get-VBRViProxy](Get-VBRViProxy)

* [Get-VBRCredentials](Get-VBRCredentials)

* [New-VBRStorageProtocolPolicy](New-VBRStorageProtocolPolicy)

---

### Examples
> Example 1

$storage = Get-StoragePluginHost -Name "IBM Spectrum"
$proxy = Get-VBRViProxy -Name "LocalProxy"
Set-StoragePluginHost -Host $storage -Proxy $proxy
This example shows how to assign a new backup proxy to the storage.

Perform the following steps:
1. Run the Get-StoragePluginHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
3. Run the Set-StoragePluginHost cmdlet. Set the $storage variable as the Host parameter value. Set the $proxy variable as the Proxy parameter value.
> Example 2

$storage = Get-VNXHost -Name "VNX Storage"
$volumes = Get-StoragePluginInfrastructureVolume -Name "ISCSI Volume4", "ISCSI Volume5", "NFS Volume1"
Set-StoragePluginHost -Host $storage -VolumeScanType Exclude -ExcludedVolume $volumes
This example shows how to exclude volumes from of a Universal Storage API integrated system from rescan.

Perform the following steps:
1. Run the Get-VNXHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-StoragePluginInfrastructureVolume cmdlet. Specify the Name parameter value. Save the result to the $volumes variable.
3. Run the Set-StoragePluginHost cmdlet. Set the $storage variable as the Host parameter value. Set the Exclude option for the VolumeScanType parameter. Set the $volumes variable as the ExcludedVolume parameter value.

---

### Parameters
#### **AgentEnableProxyAutoSelection**
For the EnableAgentBackup parameter.
Defines that Veeam Backup & Replication will use automatic proxy selection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AgentExcludedVolume**
For the AgentVolumeScanType parameter with the exclude option.
Specifies an array of storage volumes that you do not want to rescan.
Note: Veeam Backup & Replication will not show the excluded volumes in the backup infrastructure after the rescan.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **AgentExcludedWildcard**
For the AgentVolumeScanType parameter with the exclude option.
Specifies an array of storage volumes with wildcard characters.
Veeam Backup & Replication will not rescan the volumes which names are specified with these wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **AgentIncludedVolume**
For the AgentVolumeScanType parameter with the include option.
Specifies an array of storage volumes that you want to rescan.
Note: Veeam Backup & Replication will show only rescanned volumes in the backup infrastructure.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **AgentIncludedWildcard**
For the AgentVolumeScanType parameter with the include option.
Specifies an array of storage volumes with wildcard characters.
Veeam Backup & Replication will rescan only those volumes which names are specified with these wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **AgentProtocolPolicy**
For the EnableAgentBackup parameter.
Specifies the protocol policy for the storage.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRStorageProtocolPolicy]`|false   |named   |False        |

#### **AgentProxy**
For the EnableAgentBackup parameter.
Specifies an array of proxies you want to use with this storage.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRComputerFileProxyServer[]]`|false   |named   |False        |

#### **AgentVolumeScanType**
For the EnableAgentBackup parameter.
Specifies the scope of volumes that you want to rescan.
You can use the following options to rescan the volumes:
* All - choose this option to scan all volumes that were added to your backup infrastructure with the initial scan.
* Exclude - choose this option to exclude volumes from scan.
Note: Veeam Backup & Replication will not show excluded volumes in the backup infrastructure after the rescan.
Use the ExcludedVolume parameter to specify the excluded volumes.
* Include - choose this option to scan only the specified storage volumes.
Use the IncludedVolume parameter to specify the included volumes.
Valid Values:

* All
* Exclude
* Include

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRVolumeScanType]`|false   |named   |False        |

#### **Credentials**
Specifies the credentials you want to use for authenticating with the storage.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CInternalCredentials]`|false   |named   |False        |

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

#### **EnableProxyAutoSelection**
For the EnableVMwareBackup parameter.
Defines that Veeam Backup & Replication will select a proxy automatically.
If you want to select proxies for the storage yourself, use the Proxy parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableVMwareBackup**
Enables the VMware backup option.
If you provide this parameter, you will be able to use storage snapshots to backup and restore VMware vSphere VMs hosted on storage systems.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludedVolume**
For the VolumeScanType parameter with the exclude option.
Specifies an array of storage volumes that you do not want to rescan.
Note: Veeam Backup & Replication will not show the excluded volumes in the backup infrastructure after the rescan.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **ExcludedWildcard**
For the VolumeScanType parameter with the exclude option.
Specifies an array of storage volumes with wildcard characters.
Veeam Backup & Replication will not rescan the volumes which names are specified with these wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a storage system without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Host**
Specifies the storage you want to modify.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CPublicPluginHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **IncludedVolume**
For the VolumeScanType parameter with the include option.
Specifies an array of storage volumes that you want to rescan.
Note: Veeam Backup & Replication will show only rescanned volumes in the backup infrastructure.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **IncludedWildcard**
For the VolumeScanType parameter with the include option.
Specifies an array of storage volumes with wildcard characters.
Veeam Backup & Replication will rescan only those volumes which names are specified with these wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **MountServer**
Specifies the mount server that you want to use to work with this storage.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Port**
Specifies the port number. The cmdlet will use this port number to set up connection with a storage system.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ProtocolPolicy**
For the EnableVMwareBackup parameter.
Specifies the protocol policy for the storage.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRStorageProtocolPolicy]`|false   |named   |False        |

#### **Proxy**
For the EnableVMwareBackup parameter.
Specifies the array of proxies you want to use to work with this storage.
Note: All previously used proxies will be unassigned from the storage.
If you want Veeam to choose a proxy for your storage automatically, use the EnableProxyAutoSelection parameter.

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
|`[String]`|false   |named   |False        |

#### **VolumeScanType**
For the EnableVMwareBackup parameter.
Specifies the scope of volumes that you want to rescan.
You can use the following options to rescan the volumes:
* All - choose this option to scan all volumes that were added to your backup infrastructure with the initial scan.
* Exclude - choose this option to exclude volumes from scan.
Note: Veeam Backup & Replication will not show excluded volumes in the backup infrastructure after the rescan.
Use the ExcludedVolume parameter to specify the excluded volumes.
* Include - choose this option to scan only the specified storage volumes.
Use the IncludedVolume parameter to specify the included volumes.
Valid Values:

* All
* Exclude
* Include

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRVolumeScanType]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.PublicStorage.CPublicPluginHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-StoragePluginHost [-AgentEnableProxyAutoSelection] [-AgentExcludedVolume <CSanInfrastructureVolume[]>] [-AgentExcludedWildcard <String[]>] [-AgentIncludedVolume <CSanInfrastructureVolume[]>] 
```
```PowerShell
[-AgentIncludedWildcard <String[]>] [-AgentProtocolPolicy <VBRStorageProtocolPolicy>] [-AgentProxy <VBRComputerFileProxyServer[]>] [-AgentVolumeScanType {All | Exclude | Include}] [-Credentials 
```
```PowerShell
<CInternalCredentials>] [-Description <String>] [-EnableAgentBackup] [-EnableProxyAutoSelection] [-EnableVMwareBackup] [-ExcludedVolume <CSanInfrastructureVolume[]>] [-ExcludedWildcard <String[]>] [-Force] 
```
```PowerShell
-Host <CPublicPluginHost> [-IncludedVolume <CSanInfrastructureVolume[]>] [-IncludedWildcard <String[]>] [-MountServer <CHost>] [-Password <String>] [-Port <Int32>] [-ProtocolPolicy <VBRStorageProtocolPolicy>] 
```
```PowerShell
[-Proxy <IProxy[]>] [-SkipRescan] [-UserName <String>] [-VolumeScanType {All | Exclude | Include}] [<CommonParameters>]
```
