Set-VBRAzureArchiveRepository
-----------------------------

### Synopsis
Modifies settings for Azure Archive repository added to the backup infrastructure.

---

### Description

This cmdlet modifies the settings for an Azure Archive repository added to the backup infrastructure.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRArchiveObjectStorageRepository](Get-VBRArchiveObjectStorageRepository)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Modifying Gateway Server of Azure Archive Repository

$azure = Get-VBRArchiveObjectStorageRepository -Name "Azure"
$gateserv = Get-VBRServer -Name "north.tech.local, north2.tech.local"
Set-VBRAzureArchiveRepository -Repository $azure -ConnectionType Gateway -GatewayServer $gateserv
This example shows how to modify Azure Archive repository added to the backup infrastructure. The cmdlet will use custom gateway servers server to connect to Azure Archive repository.
Perform the following steps:
1. Run the Get-VBRArchiveObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $azure variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $gateserv variable.
3. Run the Set-VBRAzureArchiveRepository cmdlet. Set the $azure variable as the Repository parameter value. Set the Gateway value for the ConnectionType parameter. Set the $gateserv variable as the GatewayServer parameter value.

---

### Parameters
#### **AzureProxySpec**
Specifies a proxy appliance for transferring the data.

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
Specifies a new description of the Azure Archive repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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

#### **Name**
Specifies a new name for the Azure Archive repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies an Azure Archive repository that you want to modify.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRAzureArchiveRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **UseGatewayServer**
Note: This parameter is deprecated and will be ignored. Use the GatewayServer parameter instead.
Defines that the cmdlet will use a gateway server to transfer data from processed VM to object storage repositories.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UseInstantRetrieval**
Defines that the cmdlet will create a repository where data blocks are marked with the cool access tier.
Note: If you do not provide the UseInstantRetrieval parameter, the cmdlet will create a repository where blocks are marked as the archive access tier.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureArchiveRepository

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRAzureArchiveRepository

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAzureArchiveRepository [-AzureProxySpec <VBRAzureComputeProxyAppliance>] [-ConnectionType {Direct | Gateway}] [-Description <String>] [-Force] [-GatewayServer <CHost[]>] [-Name <String>] -Repository 
```
```PowerShell
<VBRAzureArchiveRepository> [-UseGatewayServer] [-UseInstantRetrieval] [<CommonParameters>]
```
