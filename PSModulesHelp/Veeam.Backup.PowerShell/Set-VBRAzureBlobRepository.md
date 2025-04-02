Set-VBRAzureBlobRepository
--------------------------

### Synopsis
Modifies Azure Blob storage added as a backup repository to the backup infrastructure.

---

### Description

This cmdlet modifies settings for an Azure Blob storage added as a backup repository to the backup infrastructure.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Modifying Gateway Server Settings for Azure Blob Storage

$azure = Get-VBRObjectStorageRepository -Name "Azure Blob"
$gateserv = Get-VBRServer -Name "north.tech.local, north2.tech.local"
Set-VBRAzureBlobRepository -Repository $azure -ConnectionType Gateway -GatewayServer $gateserv
This example shows how to modify settings for a existing Azure Blob storage added as a backup repository. The cmdlet will use custom gateway servers to transfer data to Azure Blob storage.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $azure variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value Save the result to the $gateserv variable.
3. Run the Set-VBRAzureBlobRepository cmdlet. Set the $azure variable as the Repository parameter value. Set the Gateway value for the ConnectionType parameter. Set the $gateserv variable as the GatewayServer parameter value.

---

### Parameters
#### **AzureProxySpec**
Specifies a helper appliance. Veeam Backup & Replication will use this appliance to perform a health check of backup files and apply retention to NAS backup files.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRAzureComputeProxyAppliance]`|false   |named   |False        |

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
Specifies a description of Azure Blob storage. The cmdlet will add Azure Blob storage to the backup infrastructure with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableConcurrentTasksLimit**
Enables limits for concurrent tasks that can be processed by the object storage repository.
Use the MaxConcurrentTasks paramter to specify the number of tasks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCoolAccessTier**
Defines that Veeam Backup & Replication will keep blocks of data in the Cool access tier.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSizeLimit**
Defines that the cmdlet will enable size limits for an Azure Blob storage that you want to add as a backup repository.
Use the SizeLimit parameter to specify the size limits.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify an storage repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayServer**
Specifies an array of gateway servers that you want to use to transfer data from processed VM to object storage repositories.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **ImmutabilityPeriod**
Defines the immutability period in days.
Default: 30 days.
Maximum: 999 days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MaxConcurrentTasks**
Specifies a maximum number of concurrent tasks that can be processed at once by the object storage repository.

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
Specifies a name of object storage. The cmdlet will add Azure Blob storage to the backup infrastructure with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies an Azure Blob storage that you want to modify.

|Type                      |Required|Position|PipelineInput |
|--------------------------|--------|--------|--------------|
|`[VBRAzureBlobRepository]`|true    |named   |True (ByValue)|

#### **SizeLimit**
For the EnableSizeLimit parameter.
Specifies size limits in GB for data blocks that you want to store in Azure Blob storage added as an object storage repository.
Permitted value: 1024 - 1073741824.
Default: 10240.

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
Veeam.Backup.PowerShell.Infos.VBRAzureBlobRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAzureBlobRepository [-AzureProxySpec <VBRAzureComputeProxyAppliance>] [-ConnectionType {Direct | Gateway}] [-Description <String>] [-EnableConcurrentTasksLimit] [-EnableCoolAccessTier] [-EnableSizeLimit] 
```
```PowerShell
[-Force] [-GatewayServer <CHost[]>] [-ImmutabilityPeriod <Int32>] [-MaxConcurrentTasks <Int32>] [-MountServerOptions <VBRRepositoryMountServerOptions>] [-Name <String>] -Repository <VBRAzureBlobRepository> 
```
```PowerShell
[-SizeLimit <Int32>] [-UseGatewayServer] [<CommonParameters>]
```
