Set-VBRNutanixHost
------------------

### Synopsis
Modifies Nutanix Files storage system settings.

---

### Description

This cmdlet modifies settings of Nutanix Files storage systems. When you modify storage system settings, the cmdlet automatically rescans storage systems.

---

### Related Links
* [Get-VBRNutanixHost](Get-VBRNutanixHost)

---

### Examples
> Example 1

$host = Get-VBRNutanixHost -Name "Nutanix Files_host"
Set-VBRNutanixHost -Host $host -Port 80
This example shows how to modify the port number of Nutanix Files Storage Systems.

Perform the following steps:
1. Run the Get-VBRNutanixHost cmdlet to create a credential object. Specify the Name parameter value. Save the result to the $host variable.
2. Run the Set-VBRNutanixHost cmdlet. Set the $host variable as the Host parameter value.Specify the Port parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials that you want to use for authentication to the storage system.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CInternalCredentials]`|false   |named   |False        |

#### **Description**
Specifies the description of the storage system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify the storage system settings without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Host**
Specifies the storage system you want to modify.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CNutanixHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name of the storage system that you want to modufy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NASEnableProxyAutoSelection**
Defines that automatic proxy selection will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NASExcludedVolume**
For the NASVolumeScanType parameter set to Exclude.
Specifies an array of storage volumes that you do not want to rescan.
Note: Veeam Backup & Replication will not show the excluded volumes in the backup infrastructure after the rescan.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **NASExcludedWildcard**
For the NASVolumeScanType parameter set to Exclude.
Specifies an array of storage volumes with wildcard characters. Veeam Backup & Replication will not rescan the volumes which names are specified with these wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **NASIncludedVolume**
For the NASVolumeScanType parameter set to Include.
Specifies an array of storage volumes that you want to rescan.
Note: Veeam Backup & Replication will show only rescanned volumes in the backup infrastructure.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[CSanInfrastructureVolume[]]`|false   |named   |False        |

#### **NASIncludedWildcard**
For the NASVolumeScanType parameter set to Include.
Specifies an array of storage volumes with wildcard characters. Veeam Backup & Replication will rescan only those volumes which names are specified with these wildcard characters.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **NASProtocolPolicy**
Specifies the protocol policy for the storage system.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRStorageProtocolPolicy]`|false   |named   |False        |

#### **NASProxy**
Specifies the array of proxies you want to use.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **NASVolumeScanType**
Specifies the scope of volumes that you want to rescan.
You can use the following options to rescan the volumes:
* All: choose this option to rescan all volumes that were added to your backup infrastructure with the initial rescan.
* Exclude: choose this option to exclude volumes from rescan.
Note: Veeam Backup & Replication will not show excluded volumes in the backup infrastructure after the rescan.
Use the ExcludedVolume parameter to specify the excluded volumes.
* Include: choose this option to rescan only the specified storage volumes.
Use the IncludedVolume parameter to specify the included volumes.
Valid Values:

* All
* Exclude
* Include

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRVolumeScanType]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authentication to the storage system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Port**
Specifies the port used to connect to the  storage system.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SkipRescan**
Defines that the cmdlet will not start rescan automatically setting of the storage system are modified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UserName**
Specifies the user name that you want to use for authentication to the storage system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.Nutanix.CNutanixHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNutanixHost [-Credentials <CInternalCredentials>] [-Description <String>] [-Force] -Host <CNutanixHost> [-Name <String>] [-NASEnableProxyAutoSelection] [-NASExcludedVolume <CSanInfrastructureVolume[]>] 
```
```PowerShell
[-NASExcludedWildcard <String[]>] [-NASIncludedVolume <CSanInfrastructureVolume[]>] [-NASIncludedWildcard <String[]>] [-NASProtocolPolicy <VBRStorageProtocolPolicy>] [-NASProxy <VBRNASProxyServer[]>] 
```
```PowerShell
[-NASVolumeScanType {All | Exclude | Include}] [-Password <String>] [-Port <Int32>] [-SkipRescan] [-UserName <String>] [<CommonParameters>]
```
