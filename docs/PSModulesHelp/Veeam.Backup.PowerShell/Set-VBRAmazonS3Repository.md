Set-VBRAmazonS3Repository
-------------------------

### Synopsis
Modifies settings for Amazon S3 object storage added as a backup repository.

---

### Description

This cmdlet modifies settings for Amazon S3 object storage repository added added as a backup repository.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Modifying Gateway Server Settings of Amazon S3 Object Storage

$amazon = Get-VBRObjectStorageRepository -Name "Amazon S3"
$gateserv = Get-VBRServer -Name "north.tech.local, north2.tech.local"
Set-VBRAmazonS3Repository -Repository $amazon -ConnectionType Gateway -GatewayServer $gateserv
This example shows how to modify settings for an Amazon S3 object storage added as a backup repository. The cmdlet will use custom gateway servers to connect to Amazon S3 object storage.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $amazon variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $gateserv variable.
3. Run the Set-VBRAmazonS3Repository cmdlet. Set the $amazon variable as the Repository parameter value. Set the Gateway value for the ConnectionType parameter. Set the $gateserv variable as the GatewayServer parameter value.

---

### Parameters
#### **AmazonProxySpec**
Specifies a helper appliance. Veeam Backup & Replication will use this appliance to perform a health check of backup files and apply retention to NAS backup files.

|Type                          |Required|Position|PipelineInput        |
|------------------------------|--------|--------|---------------------|
|`[VBRAmazonEC2ProxyAppliance]`|false   |named   |True (ByPropertyName)|

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
Specifies a description of an Amazon S3 object storage. The cmdlet will add object storage with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableConcurrentTasksLimit**
Enables limits for concurrent tasks that can be processed by the object storage repository.
Use the MaxConcurrentTasks paramter to specify the number of tasks.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableIAStorageClass**
Defines that the cmdlet will enable the infrequent access storage class for data blocks that are stored in an Amazon S3 object storage.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableOZIAStorageClass**
Defines that the cmdlet will enable the One Zone-IA storage class for data blocks that are stored in an Amazon S3 object storage.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSizeLimit**
Enables size limits for data blocks that you want to store in an Amazon S3 object storage.
Use the SizeLimit parameter to specify the size limits.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify an object storage repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayServer**
Specifies an array of gateway servers that you want to use to transfer data from processed VM to object storage repositories.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **ImmutabilityPeriod**
For the EnableBackupImmutability parameter.
Defines the immutability period in days.
Default: 30.

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
Specifies a name of an Amazon S3 object storage. The cmdlet will add object storage with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies an Amazon S3 object storage that you want to modify.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRAmazonS3Repository]`|true    |named   |True (ByValue)|

#### **SizeLimit**
For the EnableSizeLimit parameter. Specifies size limits in GB for data blocks that you want to store in an Amazon S3 object storage. Permitted value: 1024 - 1073741824. Default: 10240 GB.

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
Veeam.Backup.PowerShell.Infos.VBRAmazonS3Repository

Veeam.Backup.PowerShell.Infos.VBRAmazonEC2ProxyAppliance

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAmazonS3Repository [-AmazonProxySpec <VBRAmazonEC2ProxyAppliance>] [-ConnectionType {Direct | Gateway}] [-Description <String>] [-EnableConcurrentTasksLimit] [-EnableIAStorageClass] 
```
```PowerShell
[-EnableOZIAStorageClass] [-EnableSizeLimit] [-Force] [-GatewayServer <CHost[]>] [-ImmutabilityPeriod <Int32>] [-MaxConcurrentTasks <Int32>] [-MountServerOptions <VBRRepositoryMountServerOptions>] [-Name 
```
```PowerShell
<String>] -Repository <VBRAmazonS3Repository> [-SizeLimit <Int32>] [-UseGatewayServer] [<CommonParameters>]
```
