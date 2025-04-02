Set-VBRAzureDataBoxRepository
-----------------------------

### Synopsis
Modifies settings of Azure Data Box storage as an object storage repository to the backup infrastructure.

---

### Description

This cmdlet modifies Azure Data Box storage that is added as an object storage repository to the backup infrastructure.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRObjectStorageRepository](Get-VBRObjectStorageRepository)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Modifying Gateway Server for Azure Data Box Storage

$repository = Get-VBRObjectStorageRepository -Name "Azure Data Box"
$gateway = Get-VBRServer -Name "north.tech.local, north2.tech.local"
Set-VBRAzureDataBoxRepository -Repository $repository -ConnectionType Gateway -GatewayServer $gateway
This example shows how to modify Azure Data Box storage added as an object storage repository to the Veeam Backup & Replication infrastructure. The cmdlet will use custom gateway servers to connect to Azure Data Box storage.
Perform the following steps:
1. Run the Get-VBRObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $gateway variable.
3. Run the Set-VBRAzureDataBoxRepository cmdlet. Set the $repository variable as the Repository parameter value. Set the Gateway value for the ConnectionType parameter. Set the $gateway variable as the GatewayServer parameter value.

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
Specifies a description of Azure Data Box storage. The cmdlet will add Azure Data Box storage to Veeam Backup & Replication with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableConcurrentTasksLimit**
Enables limits for concurrent tasks that can be processed by the object storage repository. Use the MaxConcurrentTasks paramter to specify the number of tasks.

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

#### **MaxConcurrentTasks**
To set maximum value for the LimitConcurrentJobs parameter.
Specifies the maximum allowed number of concurrent tasks for a repository.
Permitted values: 1 to 99.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies a name of Azure Data Box storage. The cmdlet will add Azure Data Box storage to Veeam Backup & Replication with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies Azure Data Box storage that you want to modify.

|Type                         |Required|Position|PipelineInput |
|-----------------------------|--------|--------|--------------|
|`[VBRAzureDataBoxRepository]`|true    |named   |True (ByValue)|

#### **UseGatewayServer**
Note: This parameter is deprecated and will be ignored. Use the GatewayServer parameter instead.
Defines that the cmdlet will use a gateway server to transfer data from processed VM to object storage repositories.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureDataBoxRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAzureDataBoxRepository [-ConnectionType {Direct | Gateway}] [-Description <String>] [-EnableConcurrentTasksLimit] [-Force] [-GatewayServer <CHost[]>] [-MaxConcurrentTasks <Int32>] [-Name <String>] 
```
```PowerShell
-Repository <VBRAzureDataBoxRepository> [-UseGatewayServer] [<CommonParameters>]
```
