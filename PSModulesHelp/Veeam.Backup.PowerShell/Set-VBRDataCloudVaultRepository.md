Set-VBRDataCloudVaultRepository
-------------------------------

### Synopsis
Modifies a Veeam Data Cloud Vault added to the backup infrastructure.

---

### Description

This cmdlet modifies a Veeam Data Cloud Vault added to the backup infrastructure.

---

### Examples
> Modifying Gateway Server Settings for Veeam Data Cloud Vault

$azure = Get-VBRObjectStorageRepository -Name "Azure Blob"
$gateserv = Get-VBRServer -Name "north.tech.local, north2.tech.local"
Set-VBRDataCloudVaultRepository -Repository $azure -ConnectionType Gateway -GatewayServer $gateserv
This example shows how to modify settings for an existing Veeam Data Cloud Vault. The cmdlet will use custom gateway servers to transfer data to Veeam Data Cloud Vault.

Perform the following steps:
1.	Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $azure variable.
2.	Run the Get-VBRServer cmdlet. Specify the Name parameter value Save the result to the $gateserv variable.
3.	Run the Set-VBRAzureBlobRepository cmdlet. Set the $azure variable as the Repository parameter value. Set the Gateway value for the ConnectionType parameter. Set the $gateserv variable as the GatewayServer parameter value.

---

### Parameters
#### **ConnectionType**
Specifies how <%VBR%> will access the object storage repository:
Direct: Use this option if you want <%VBR%> to use a proxy server to transfer data from the processed VM to object storage repositories.
Gateway: Use this option if you want <%VBR%> to use a gateway server to transfer data from processed VM to object storage repositories.
Note: Provide the GatewayServer parameter to specify the server.
Default: Direct.
Valid Values:

* Direct
* Gateway

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRRepositoryConnectionType]`|false   |named   |False        |

#### **Description**
Specifies a description of an object repository. The cmdlet will assign this description to a Veeam Data Cloud Vault.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableConcurrentTasksLimit**
Enables limits for concurrent tasks that can be processed by the object storage repository. Use the MaxConcurrentTasks paramter to specify the number of tasks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSizeLimit**
Defines that the cmdlet will enable size limits for a Veeam Data Cloud Vault that you want to add as a backup repository. Use the SizeLimit parameter to specify the size limits.

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
Defines the immutability period in days. Default: 30. Maximum: 999.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MaxConcurrentTasks**
Specifies a maximum number of concurrent tasks that can be processed at once by the object storage repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MountServerOptions**
Specifies settings of a mount server for object storage repositories. Note: This parameter is required for object storage repositories that you want to add as performance extents to a scale-out backup repository.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRRepositoryMountServerOptions]`|false   |named   |False        |

#### **Name**
Specifies a name of an object storage repository. The cmdlet will assign this name to a Veeam Data Cloud Vault.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies a Veeam Data Cloud Vault that you want to modify.

|Type                           |Required|Position|PipelineInput |
|-------------------------------|--------|--------|--------------|
|`[VBRDataCloudVaultRepository]`|true    |named   |True (ByValue)|

#### **SizeLimit**
For the EnableSizeLimit parameter. Specifies size limits in GB for data blocks that you want to store in an object storage repository. Permitted value: 1024 - 1073741824. Default: 10240.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRDataCloudVaultRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRDataCloudVaultRepository [-ConnectionType {Direct | Gateway}] [-Description <String>] [-EnableConcurrentTasksLimit] [-EnableSizeLimit] [-Force] [-GatewayServer <CHost[]>] [-ImmutabilityPeriod <Int32>] 
```
```PowerShell
[-MaxConcurrentTasks <Int32>] [-MountServerOptions <VBRRepositoryMountServerOptions>] [-Name <String>] -Repository <VBRDataCloudVaultRepository> [-SizeLimit <Int32>] [<CommonParameters>]
```
