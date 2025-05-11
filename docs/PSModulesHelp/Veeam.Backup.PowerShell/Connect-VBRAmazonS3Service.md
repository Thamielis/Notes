Connect-VBRAmazonS3Service
--------------------------

### Synopsis
Connects to Amazon S3 object storage.

---

### Description

This cmdlet connects to Amazon S3 object storage. It creates the IVBRAmazonS3Connection object that contains connection settings that Veeam Backup & Replication will use to connect to Amazon S3 object storage.
You can use these settings to add Amazon S3 object storage to the backup infrastructure as the following types of repositories:
- An object storage repository.
- An external repository. Run the Add-VBRAmazonS3ExternalRepository cmdlet to add Amazon S3 as an external repository.
- A capacity extent of a scale-out backup repository.
- An archive extent of a scale-out backup repository.
NOTE:
- It is recommended to disconnect the Amazon S3 session at the end of the PowerShell session. Otherwise, the information that you get within the session will not be refreshed when you connect again, and outdated data will be used then. Run the Disconnect-VBRAmazonS3Service cmdlet to stop the session.
- To get an active session, save the result that you get after you run the Connect-VBRAmazonS3Service cmdlet to a variable.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

---

### Examples
> Example 1. Connecting to Amazon S3 Object Storage [Capacity Extent Scenario]

$account = Get-VBRAmazonAccount -AccessKey "XXXXXXXXXXXXXXX"
$connect = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
This example shows how to connect to Amazon S3 object storage. Veeam Backup & Replication will use this connection type to configure a capacity extent of a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Specify the RegionType parameter value.
- Specify the ServiceType parameter value.
Save the result to the $connect variable.
> Example 2. Connecting to Amazon S3 Object Storage [External Repository Scenario]

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4ddc-9895-c7485ef4bb2c"
$connect = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType ExternalRepository
This example shows how to connect to Amazon S3 object storage. Veeam Backup & Replication will use this connection type to configure an external repository.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Set the Global option for the RegionType parameter.
- Set the ExternalRepository option for the ServiceType parameter.
Save the result to the $connect variable.
> Example 3. Connecting to Amazon S3 Object Storage [Archive Extent Scenario]

$account = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4ddc-9895-c7485ef4bb2c"
$connect = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType ArchiveTier
This example shows how to to connect to Amazon S3 object storage. Veeam Backup & Replication will use this connection type to set up an archive extent of a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Set the Global option for the RegionType parameter.
- Set the ArchiveTier option for the ServiceType parameter.
Save the result to the $connect variable.
> Example 4. Connecting to Amazon S3 Object Storage [Object Storage Repository Scenario]

$account = Get-VBRAmazonAccount -AccessKey "XXXXXXXXXXXXXXX"
$connect = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType CapacityTier
This example shows how to connect to Amazon S3 object storage. Veeam Backup & Replication will use this connection type to configure an object storage repository.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Set the Global option for the RegionType parameter.
- Set the CapacityTier option for the ServiceType parameter.
Save the result to the $connect variable.

---

### Parameters
#### **Account**
Specifies an Amazon S3 credentials record. Veeam Backup & Replication will use this credentials record to connect to Amazon S3 object storage.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[VBRAmazonAccount]`|true    |named   |True (ByValue)|

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
Specifies the region type of Amazon S3 object storage. Veeam Backup & Replication will connect to the selected region type to set up a connection with Amazon S3 object storage.
You can select the following types of regions:
* Global
* Government
* China
Valid Values:

* Global
* Government
* China

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRAmazonRegionType]`|true    |named   |False        |

#### **ServiceType**
Specifies the type of the backup repository. The cmdlet will add the object storage as the specified type of the backup repository to backup infrastructure.
* ExternalRepository: Use this option to add object storage as an external backup repository.
* CapacityTier: Use this option to add object storage as a capacity extent or an object storage repository.
* ArchiveTier: Use this option to add object storage as an archive extent.
Valid Values:

* ExternalRepository
* CapacityTier
* ArchiveTier

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRAmazonServiceType]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Connect-VBRAmazonS3Service -Account <VBRAmazonAccount> [-ConnectionType {Direct | Gateway}] [-GatewayServer <CHost[]>] -RegionType {Global | Government | China} -ServiceType {ExternalRepository | CapacityTier | 
```
```PowerShell
ArchiveTier} [<CommonParameters>]
```
