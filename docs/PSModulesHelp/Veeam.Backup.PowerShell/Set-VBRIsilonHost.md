Set-VBRIsilonHost
-----------------

### Synopsis
Modifies Dell PowerScale (formerly Isilon) storage settings.

---

### Description

This cmdlet modifies settings of Dell PowerScale storage systems. When you modify storage system settings, the cmdlet automatically rescans storage systems.
To modify settings, enter the necessary parameters with new values. The parameters that you omit will remain unchanged.
Tip:
You can specify the scope of volumes that you want to rescan with the VBRVolumeScanType parameter.
Run the Get-VBRIsilonInfrastructureVolume cmdlet to get an array of volumes from Dell PowerScale storage systems.

---

### Related Links
* [Get-VBRIsilonHost](Get-VBRIsilonHost)

* [Get-VBRIsilonInfrastructureVolume](Get-VBRIsilonInfrastructureVolume)

---

### Examples
> Example 1. Excluding Dell PowerScale Volumes from Rescan

$storage = Get-VBRIsilonHost -Name "Isilon Storage"
$volumes = Get-VBRIsilonInfrastructureVolume -Name "Volume4", "Volume5"
Set-VBRIsilonHost -Host $storage -NASVolumeScanType Exclude -NASExcludedVolume $volumes
This example shows how to exclude the Dell PowerScale storage volumes from rescan.

Perform the following steps:
1. Run the Get-VBRIsilonHost cmdlet. Provide the Name parameter value. Save the result to the $storage variable.
2. Run the Get-VBRIsilonInfrastructureVolume cmdlet. Provide the Name parameter value. Save the result to the $volumes variable.
3. Run the Set-VBRIsilonHost cmdlet. Specify the following settings:
- Set the $storage variable as the Host parameter value.
- Set the Exclude option for the NASVolumeScanType parameter.
- Set the $volumes variable as the NASExcludedVolume parameter value.
> Example 2. Rescanning All Dell PowerScale Volumes

$storage = Get-VBRIsilonHost -Name "Isilon Storage"
$volumes = Get-VBRIsilonInfrastructureVolume -Host $storage
Set-VBRIsilonHost -Host $storage -VolumeScanType Include -Included $volumes
This example shows how to rescan all volumes added to the Dell PowerScale storage system.

Perform the following steps:
1. Run the Get-VBRIsilonHost cmdlet. Provide the Name parameter value. Save the result to the $storage variable.
2. Run the Get-VBRIsilonInfrastructureVolume cmdlet. Provide the Host parameter value. Save the result to the $volumes variable.
3. Run the Set-VBRIsilonHost cmdlet. Specify the following settings:
- Set the $storage variable as the Host parameter value.
- Set the Include option for the VolumeScanType parameter value.
- Set the $volumes variable as the Included parameter value.

---

### Parameters
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

#### **Force**
Defines that the cmdlet will add Dell PowerScale without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Host**
Specifies the storage you want to modify.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CIsilonHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name of the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NASEnableProxyAutoSelection**
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
Veeam Backup & Replication will not rescan the volumes which names are specified with these wildcard characters.

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
Specifies the protocol policy for the storage.

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
Sets a port used to connect to the PowerScale storage.

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
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.Isilon.CIsilonHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRIsilonHost [-Credentials <CInternalCredentials>] [-Description <String>] [-Force] -Host <CIsilonHost> [-Name <String>] [-NASEnableProxyAutoSelection] [-NASExcludedVolume <CSanInfrastructureVolume[]>] 
```
```PowerShell
[-NASExcludedWildcard <String[]>] [-NASIncludedVolume <CSanInfrastructureVolume[]>] [-NASIncludedWildcard <String[]>] [-NASProtocolPolicy <VBRStorageProtocolPolicy>] [-NASProxy <VBRNASProxyServer[]>] 
```
```PowerShell
[-NASVolumeScanType {All | Exclude | Include}] [-Password <String>] [-Port <Int32>] [-SkipRescan] [-UserName <String>] [<CommonParameters>]
```
