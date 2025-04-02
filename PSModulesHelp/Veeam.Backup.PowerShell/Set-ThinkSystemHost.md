Set-ThinkSystemHost
-------------------

### Synopsis
Modifies ThinkSystem storage system settings.

---

### Description

This cmdlet modifies settings of ThinkSystem storage systems. When you modify storage system settings, the cmdlet automatically rescans storage systems.

TIP: You can specify the scope of volumes that you want to rescan with the VBRVolumeScanType parameter.
Run the Get-ThinkSystemInfrastructureVolume cmdlet to get an array of volumes from ThinkSystem storage system.

---

### Related Links
* [Get-ThinkSystemHost](Get-ThinkSystemHost)

* [Get-ThinkSystemInfrastructureVolume](Get-ThinkSystemInfrastructureVolume)

---

### Examples
> Example 1. Changing NetApp Port Number and Protocol

$storage = Get-ThinkSystemHost -Name "ThinkSystem Store"
Set-ThinkSystemHost -Host $storage -IsHTTP:$true -Port 80
This example shows how to change the port number and protocol for connecting with NetApp storage system.

Perform the following steps:
1. Run the Get-ThinkSystemHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Set-ThinkSystemHost cmdlet. Specify the following settings:
- Set the $storage variable as the Host parameter value.
- Provide the IsHTTP parameter value.
- Provide the Port parameter value.
> Example 2. Excluding Storage Volumes from Rescan Session

$storage = Get-ThinkSystemHost -Name "ThinkSystem Store"
$volumes = Get-ThinkSystemInfrastructureVolume -Name "ISCSI Volume4", "ISCSI Volume5", "NFS Volume1"
Set-ThinkSystemHost -Host $storage -VolumeScanType Exclude -ExcludedVolume $volumes
This example shows how to exclude specified ThinkSystem storage volumes from the rescan session.

Perform the following steps:
1. Run the Get-ThinkSystemHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-ThinkSystemInfrastructureVolume cmdlet. Specify the Name parameter value. Save the result to the $volumes variable.
3. Run the Set-ThinkSystemHost cmdlet. Specify the following settings:
- Set the $storage variable as the Host parameter value.
- Set the Exclude option for the VolumeScanType parameter.
- Set the $volumes variable as the ExcludedVolume parameter value.
> Example 3. Rescanning All Storage Volumes

$storage = Get-ThinkSystemHost -Name "ThinkSystem Store"
$volumes = Get-ThinkSystemInfrastructureVolume -Host $storage
Set-ThinkSystemHost -Host $storage -VolumeScanType Include -Included $volumes
This example shows shows how to rescan all volumes added to a ThinkSystem storage system.

Perform the following steps:
1. Run the Get-ThinkSystemHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-ThinkSystemInfrastructureVolume cmdlet. Specify the Host parameter value. Save the result to the $volumes variable.
3. Run the Set-ThinkSystemHost cmdlet. Specify the following settings:
- Set the $storage variable as the Host parameter value.
- Set the Include option for the VolumeScanType parameter.
- Set the $volumes variable as the Included parameter value.

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
For the AgentVolumeScanType parameter with the include option. Specifies an array of storage volumes with wildcard characters. Veeam Backup & Replication will rescan only those volumes which names are specified with these wildcard characters.

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
Specifies the credentials record you want to use for authenticating with the storage.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CInternalCredentials]`|false   |named   |False        |

#### **Description**
Specifies a description of the storage.

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
Specifies an array of storage volumes with wildcard characters.
Veeam Backup & Replication will not rescan the volumes which names are specified with these wildcard characters

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a ThinkSystem storage system without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Host**
Specifies a storage that you want to modify.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CNaHost]`|true    |named   |True (ByPropertyName, ByValue)|

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

#### **IsHTTP**
Defines whether the cmdlet uses the HTTP protocol to connect to the ThinkSystem.
* True: The cmdlet will connect to the ThinkSystem through HTTP protocol.
* False: The cmdlet will connect to the ThinkSystem through HTTPS protocol.
Default: True

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **MountServer**
Specifies the mount server that you want to use to work with this storage.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Name**
Specifies the storage IP address or DNS name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NASEnableProxyAutoSelection**
For the EnableNASBackup parameter.
Defines that Veeam Backup & Replication will use automatic proxy selection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NASExcludedVolume**
For the NASVolumeScanType parameter with the exclude option.
Specifies an array of storage volumes that you do not want to rescan.
Note: Veeam Backup & Replication will not show the excluded volumes in the backup infrastructure after the rescan.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **NASExcludedWildcard**
For the NASVolumeScanType parameter with the exclude option.
Specifies an array of storage volumes with wildcard characters.
Veeam Backup & Replication will not rescan the volumes which names are specified with these wildcard characters

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **NASIncludedVolume**
For the NASVolumeScanType parameter with the include option.
Specifies an array of storage volumes that you want to rescan.
Note: Veeam Backup & Replication will show only rescanned volumes in the backup infrastructure.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **NASIncludedWildcard**
For the NASVolumeScanType parameter with the include option.
Specifies an array of storage volumes with wildcard characters.
Veeam Backup & Replication will rescan only those volumes which names are specified with these wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **NASProtocolPolicy**
For the EnableNASBackup parameter.
Specifies the protocol policy for the storage.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRStorageProtocolPolicy]`|false   |named   |False        |

#### **NASProxy**
For the EnableNASBackup parameter.
Specifies an array of proxies you want to use with this storage.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **NASVolumeScanType**
For the EnableNASBackup parameter.
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

#### **Password**
Specifies the password you want to use for authenticating with the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Port**
Specifies the port for connecting with the ThinkSystem storage.
Default: 443.

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
Specifies an array of proxies you want to use with this storage.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[IProxy[]]`|false   |named   |False        |

#### **SkipRescan**
Defines that the cmdlet will not start the storage rescan automatically after you add storage systems to the backup infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UserName**
Specifies a username that you want to use for authenticating with the storage.

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
Veeam.Backup.SanPlugin.NetApp.CNaHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-ThinkSystemHost [-AgentEnableProxyAutoSelection] [-AgentExcludedVolume <CSanInfrastructureVolume[]>] [-AgentExcludedWildcard <String[]>] [-AgentIncludedVolume <CSanInfrastructureVolume[]>] 
```
```PowerShell
[-AgentIncludedWildcard <String[]>] [-AgentProtocolPolicy <VBRStorageProtocolPolicy>] [-AgentProxy <VBRComputerFileProxyServer[]>] [-AgentVolumeScanType {All | Exclude | Include}] [-Credentials 
```
```PowerShell
<CInternalCredentials>] [-Description <String>] [-EnableAgentBackup] [-EnableNASBackup] [-EnableProxyAutoSelection] [-EnableVMwareBackup] [-ExcludedVolume <CSanInfrastructureVolume[]>] [-ExcludedWildcard 
```
```PowerShell
<String[]>] [-Force] -Host <CNaHost> [-IncludedVolume <CSanInfrastructureVolume[]>] [-IncludedWildcard <String[]>] [-IsHTTP <Boolean>] [-MountServer <CHost>] [-Name <String>] [-NASEnableProxyAutoSelection] 
```
```PowerShell
[-NASExcludedVolume <CSanInfrastructureVolume[]>] [-NASExcludedWildcard <String[]>] [-NASIncludedVolume <CSanInfrastructureVolume[]>] [-NASIncludedWildcard <String[]>] [-NASProtocolPolicy 
```
```PowerShell
<VBRStorageProtocolPolicy>] [-NASProxy <VBRNASProxyServer[]>] [-NASVolumeScanType {All | Exclude | Include}] [-Password <String>] [-Port <Int32>] [-ProtocolPolicy <VBRStorageProtocolPolicy>] [-Proxy <IProxy[]>] 
```
```PowerShell
[-SkipRescan] [-UserName <String>] [-VolumeScanType {All | Exclude | Include}] [<CommonParameters>]
```
