Set-VBRGoogleCloudRepository
----------------------------

### Synopsis
Modifies settings for Google Cloud object storage added to the backup infrastructure.

---

### Description

This cmdlet modifies settings for Google Cloud object storage added to the backup infrastructure.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Modifying Gateway Server of Google Cloud Object Storage

$repository = Get-VBRObjectStorageRepository -Name "google"
$gateserv = Get-VBRServer -Name "north.tech.local, north2.tech.local"
Set-VBRGoogleCloudRepository -Repository $repository -ConnectionType Gateway -GatewayServer $gateserv
This example shows how to modify settings for a Google Cloud object storage added to the backup infrastructure. The cmdlet will use custom gateway servers to connect to Google Cloud object storage.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $gateserv variable.
3. Run the Set-VBRGoogleCloudRepository cmdlet. Set the $repository variable as the Repository parameter value. Set the Gateway value for the ConnectionType parameter. Set the $gateserv variable as the GatewayServer parameter value.

---

### Parameters
#### **ConnectionType**
Specifies how Veeam Backup & Replication will access the object storage repository:
* Direct: Use this option if you want Veeam Backup & Replication to use a proxy server to transfer data from the processed VM to object storage repositories.
* Gateway: Use this option if you want Veeam Backup & Replication to use a gateway server to transfer data from processed VM to object storage repositories.
Note: Provide the GatewayServer parameter to specify the server.
Default: Direct.
Valid Values:

* Direct
* Gateway

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRRepositoryConnectionType]`|false   |named   |False        |

#### **Description**
Specifies a description of Google Cloud object storage. The cmdlet will assign this description to Google Cloud object storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableColdlineStorageClass**
Assigns the Coldline storage class to data blocks that you want to keep in Google Cloud object storage. Use this option if you plan to access your backup data rarely (for example, once a quarter) and plan to store data minimum 90 days.
Default: False.
Note: If you do not provide the EnableNearlineStorageClass or EnableColdlineStorageClass parameters, the cmdlet will assing the Standard storage class to data blocks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableConcurrentTasksLimit**
Enables limits for concurrent tasks that can be processed by Google Cloud object storage.
Use the MaxConcurrentTasks paramter to specify the number of tasks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableNearlineStorageClass**
Assigns the Nearline storage class to data blocks that you want to keep in Google Cloud object storage. Use this option if you want to access data rarely (for example, once in a month or less) and plan to store data minimum 30 days.
Default: False.
Note: If you do not provide the EnableNearlineStorageClass or EnableColdlineStorageClass parameters, the cmdlet will assing the Standard storage class to data blocks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSizeLimit**
Enables size limits for Google Cloud object storage that you want to add as an object storage.
Default: False.
Note: Use the SizeLimit parameter to specify the size limits.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add Google Cloud object storage without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayServer**
Specifies an array of gateway servers that you want to use to transfer data from processed VM to object storage repositories.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **GoogleProxySpec**
Specifies proxy appliance settings. The cmdlet will use these settings to add Google Cloud object storage.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeProxyAppliance]`|false   |named   |False        |

#### **MaxConcurrentTasks**
Specifies a maximum number of concurrent tasks that can be processed at once by Google Cloud object storage.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MountServerOptions**
Specifies settings of a mount server for object storage repositories.
Note: This parameter is required for object storage repositories that you want to add as performance extents to a scale-out backup repository.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRRepositoryMountServerOptions]`|false   |named   |False        |

#### **Name**
Specifies a name of Google Cloud object storage. The cmdlet will assign this name to Google Cloud object storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies the Google Cloud object storage that you want to modify.

|Type                        |Required|Position|PipelineInput                 |
|----------------------------|--------|--------|------------------------------|
|`[VBRGoogleCloudRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SizeLimit**
For the EnableSizeLimit parameter.
Specifies the size limits in GB for data blocks that you want to store in Google Cloud object storage added as an object storage repository.
Permitted value: 1024 - 1073741824.
Default: 10240 GB.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **UseGatewayServer**
Note: This parameter is deprecated and will be ignored. Use the GatewayServer parameter instead.
Defines that the cmdlet will use a gateway server to transfer data from processed VM to object storage repositories.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRGoogleCloudRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRGoogleCloudRepository [-ConnectionType {Direct | Gateway}] [-Description <String>] [-EnableColdlineStorageClass] [-EnableConcurrentTasksLimit] [-EnableNearlineStorageClass] [-EnableSizeLimit] [-Force] 
```
```PowerShell
[-GatewayServer <CHost[]>] [-GoogleProxySpec <VBRGoogleCloudComputeProxyAppliance>] [-MaxConcurrentTasks <Int32>] [-MountServerOptions <VBRRepositoryMountServerOptions>] [-Name <String>] -Repository 
```
```PowerShell
<VBRGoogleCloudRepository> [-SizeLimit <Int32>] [-UseGatewayServer] [<CommonParameters>]
```
