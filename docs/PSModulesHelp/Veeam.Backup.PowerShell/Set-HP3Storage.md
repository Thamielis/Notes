Set-HP3Storage
--------------

### Synopsis
Modifies settings of HPE 3PAR StoreServ storage systems.

---

### Description

This cmdlet modifies settings of HPE 3PAR StoreServ storage systems. When you modify storage system settings, the cmdlet automatically rescans storage systems.

TIP: You can specify the scope of volumes that you want to rescan with the VBRVolumeScanType parameter.
Run the Get-HP3InfrastructureVolume cmdlet to get an array of volumes from HPE 3PAR StoreServ storage systems.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRViProxy](Get-VBRViProxy)

* [New-VBRStorageProtocolPolicy](New-VBRStorageProtocolPolicy)

* [Get-HP3InfrastructureVolume](Get-HP3InfrastructureVolume)

---

### Examples
> Example 1

$storage = Get-HP3Storage -Name "HPE 3PAR StoreServ"
Set-HP3Storage -Host $storage -EnableProxyAutoSelection
This example shows how to enable the automatic proxy selection for the HPE 3PAR StoreServ storage.

Perform the following steps:
1. Run the Get-HP3Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Set-HP3Storage cmdlet. Set the $storage variable as the Host parameter value. Provide the EnableProxyAutoSelection parameter.
> Example 2

$storage = Get-HP3Storage -Name "HPE 3PAR StoreServ"
$volumes = Get-HP3InfrastructureVolume -Name "ISCSI Volume4", "ISCSI Volume5", "NFS Volume1"
Set-HP3Storage -Host $storage -VolumeScanType Exclude -ExcludedVolume $volumes
This example shows how to exclude the specified volumes of the HPE 3PAR StoreServ storage from the rescan session.

Perform the following steps:
1. Run the Get-HP3Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP3InfrastructureVolume cmdlet. Specify the Name parameter value. Save the result to the $volumes variable.
3. Run the Set-HP3Storage cmdlet. Set the $storage variable as the Host parameter value. Set the Exclude option for the VolumeScanType parameter. Set the $volumes variable as the ExcludedVolume parameter value.
> Example 3

$storage = Get-HP3Storage -Name "HPE 3PAR StoreServ"
$volumes = Get-HP3InfrastructureVolume -Storage $storage
Set-HP3Storage -Host $storage -VolumeScanType Include -Included $volumes
This example shows how to rescan all volumes added to an HPE 3PAR StoreServ storage system.

Perform the following steps:
1. Run the Get-HP3Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP3InfrastructureVolume cmdlet. Set the $storage variable as the Storage parameter value. Save the result to the $volumes variable.
3. Run the Set-HP3Storage cmdlet. Set the $storage variable as the Host parameter value. Set the Include option for the VolumeScanType parameter. Set the $volumes variable as the Included parameter value.

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
NOTE: Veeam Backup & Replication will not show the excluded volumes in the backup infrastructure after the rescan.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **AgentExcludedWildcard**
For the AgentVolumeScanType parameter with the exclude option.
Specifies an array of storage volumes with wildcard characters. Veeam Backup & Replication will not rescan the volumes which names are specified with these wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **AgentIncludedVolume**
For the AgentVolumeScanType parameter with the include option.
Specifies an array of storage volumes that you want to rescan.
NOTE: Veeam Backup & Replication will show only rescanned volumes in the backup infrastructure.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **AgentIncludedWildcard**
For the AgentVolumeScanType parameter with the include option.
Specifies an array of storage volumes with wildcard characters. Veeam Backup & Replication will rescan only those volumes which names are specified with these wildcard characters.

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
NOTE: Veeam Backup & Replication will not show excluded volumes in the backup infrastructure after the rescan.
Use the ExcludedVolume parameter to specify the excluded volumes.
* Include - choose this option to scan only the specified storage volumes.    Use the IncludedVolume parameter to specify the included volumes.
Valid Values:

* All
* Exclude
* Include

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRVolumeScanType]`|false   |named   |False        |

#### **Credentials**
Specifies credentials you want to use for authenticating with the storage.

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
Defines that Veeam Backup & Replication will use automatic proxy selection.

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
Specifies an array of storage volumes with wildcard characters. Veeam Backup & Replication will not rescan these volumes.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add an HP3 storage system without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Host**
Specifies a storage that you want to modify.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CHp3PARHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **IncludedVolume**
For the VolumeScanType parameter with the include option.
Specifies an array of storage volumes that you want to rescan.
Note: Veeam Backup & Replication will show only rescanned volumes in the backup infrastructure.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **IncludedWildcard**
For the VolumeScanType parameter with the include option.
Specifies an array of storage volumes with wildcard characters. Veeam Backup & Replication will rescan these volumes.

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

#### **ProtocolPolicy**
For the EnableVMwareBackup parameter.
Specifies the protocol policy for the storage.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRStorageProtocolPolicy]`|false   |named   |False        |

#### **Proxy**
For the EnableVMwareBackup parameter.
Specifies the array of proxies you want to use with this storage.

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
Veeam.Backup.SanPlugin.Hp3PAR.CHp3PARHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-HP3Storage [-AgentEnableProxyAutoSelection] [-AgentExcludedVolume <CSanInfrastructureVolume[]>] [-AgentExcludedWildcard <String[]>] [-AgentIncludedVolume <CSanInfrastructureVolume[]>] 
```
```PowerShell
[-AgentIncludedWildcard <String[]>] [-AgentProtocolPolicy <VBRStorageProtocolPolicy>] [-AgentProxy <VBRComputerFileProxyServer[]>] [-AgentVolumeScanType {All | Exclude | Include}] [-Credentials 
```
```PowerShell
<CInternalCredentials>] [-Description <String>] [-EnableAgentBackup] [-EnableProxyAutoSelection] [-EnableVMwareBackup] [-ExcludedVolume <CSanInfrastructureVolume[]>] [-ExcludedWildcard <String[]>] [-Force] 
```
```PowerShell
-Host <CHp3PARHost> [-IncludedVolume <CSanInfrastructureVolume[]>] [-IncludedWildcard <String[]>] [-MountServer <CHost>] [-Password <String>] [-ProtocolPolicy <VBRStorageProtocolPolicy>] [-Proxy <IProxy[]>] 
```
```PowerShell
[-SkipRescan] [-UserName <String>] [-VolumeScanType {All | Exclude | Include}] [<CommonParameters>]
```
