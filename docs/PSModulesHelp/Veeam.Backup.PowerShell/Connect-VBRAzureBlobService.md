Connect-VBRAzureBlobService
---------------------------

### Synopsis
Connects to Microsoft Azure Blob storage.

---

### Description

This cmdlet connects to Microsoft Azure Blob storage. It creates the VBRAzureBlobConnection object that contains connection settings that Veeam Backup & Replication will use to connect to Microsoft Azure Blob storage.
You can use these settings to add Microsoft Azure Blob storage to the backup infrastructure as the following types of repositories:
- An object storage repository.
- An external repository. Run the Add-VBRAzureExternalRepository cmdlet to add to add Azure Blob storage as an external repository.
- A capacity extent of a scale-out backup repository.
- An archive extent of a scale-out backup repository.
NOTE:
- It is recommended to disconnect the Microsoft Azure Blob session at the end. Otherwise, the information that you get within the session will not be refreshed when you connect again, and outdated data will be used then. Run the Disconnect-VBRAzureBlobService cmdlet to stop the session.
- To get the current session, save the result that you get after you run the Connect-VBRAzureBlobService cmdlet to a variable.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Connecting to Microsoft Azure Blob Storage [External Repository Scenario]

$account = Get-VBRAzureBlobAccount -Name "Microsoft Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType ExternalRepository
This example shows how to connect to Microsoft Azure Blob storage. Veeam Backup & Replication will use this connection to configure an external repository.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Set the Global option for the RegionType parameter.
- Set the ExternalRepository option for the ServiceType parameter.
- Save the result to the $connect variable.
> Example 2. Connecting to Microsoft Azure Blob Storage [Capacity Extent Scenario]

$account = Get-VBRAzureBlobAccount -Name "Microsoft Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType CapacityTier
This example shows how to connect to Microsoft Azure Blob storage. Veeam Backup & Replication will use this connection type to configure a capacity extent of a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Set the Global option for the RegionType parameter.
- Set the CapacityTier option for the ServiceType parameter.
- Save the result to the $connect variable.
> Example 3. Connecting to Microsoft Azure Blob Storage Using Specific Gateway Server

$account = Get-VBRAzureBlobAccount -Name "Microsoft Azure Blob"
$gate = Get-VBRServer -Name "North.tech.local"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -GatewayServer $gate
This example shows how to connect to Microsoft Azure Blob storage. Veeam Backup & Replication will use the North.tech.local gateway server to connect to Microsoft Azure Blob storage.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $gate variable.
3. Run the Connect-VBRAzureBlobService cmdlet. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Set the Global option for the RegionType parameter.
- Set the $gate variable as the GatewayServer parameter value.
- Save the result to the $connect variable.
> Example 4. Connecting to Microsoft Azure Blob Storage [Archive Extent Scenario]

$account = Get-VBRAzureBlobAccount -Name "Microsoft Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType ArchiveTier
This example shows how to connect to Microsoft Azure Blob storage. Veeam Backup & Replication will use this connection type to configure an archive extent of a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Set the Global option for the RegionType parameter.
- Set the ArchiveTier option for the ServiceType parameter.
- Save the result to the $connect variable.
> Example 5. Connecting to Microsoft Azure Blob Storage [Object Storage Repository Scenario]

$account = Get-VBRAzureBlobAccount -Name "Microsoft Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType CapacityTier
This example shows how to connect to Microsoft Azure Blob storage. Veeam Backup & Replication will use this connection type to configure an object storage repository.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Set the Global option for the RegionType parameter.
- Set the CapacityTier option for the ServiceType parameter.
- Save the result to the $connect variable.

---

### Parameters
#### **Account**
Specifies a Microsoft Azure Blob credentials record. The cmdlet will use this credentials record to connect to Microsoft Azure Blob storage.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[VBRAzureBlobAccount]`|true    |named   |True (ByValue)|

#### **ConnectionType**
Specifies how Veeam Backup & Replication will access the object storage repository:
* Direct: Use this option if you want Veeam Backup & Replication to use a proxy server to transfer data from the processed VM to object storage repositories.
* Gateway: Use this option if you want Veeam Backup & Replication to use a gateway server to transfer data from processed VM to object storage repositories. Note: Provide the GatewayServer parameter to specify the server.
Default: Direct.
Valid Values:

* Direct
* Gateway

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRRepositoryConnectionType]`|false   |named   |False        |

#### **GatewayServer**
Specifies an array of gateway servers that you want to use to transfer data from processed VM to object storage repositories.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **RegionType**
Specifies the region type of Microsoft Azure Blob storage. The cmdlet will connect to the selected region type and will set up a connection with Microsoft Azure Blob storage.
You can select the following types of regions:
* Global
* Government
* China
Note: If you use Microsoft Azure Blob storage to connect to Veeam Data Cloud Vault, you must provide the Global region.
Valid Values:

* Global
* China
* Government

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRAzureBlobRegionType]`|true    |named   |False        |

#### **ServiceType**
Specifies the type of the backup repository. The cmdlet will add the object storage as the specified type of the backup repository to backup infrastructure.
* ExternalRepository: Use this option to add object storage as an external backup repository.
* CapacityTier: Use this option to add object storage as a capacity extent or an object storage repository.
* ArchiveTier: Use this option to add object storage as an archive extent.
Valid Values:

* ExternalRepository
* CapacityTier
* ArchiveTier

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRAzureServiceType]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureBlobAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Connect-VBRAzureBlobService -Account <VBRAzureBlobAccount> [-ConnectionType {Direct | Gateway}] [-GatewayServer <CHost[]>] -RegionType {Global | China | Government} -ServiceType {ExternalRepository | 
```
```PowerShell
CapacityTier | ArchiveTier} [<CommonParameters>]
```
