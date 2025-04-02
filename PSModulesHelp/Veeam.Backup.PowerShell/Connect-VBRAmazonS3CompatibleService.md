Connect-VBRAmazonS3CompatibleService
------------------------------------

### Synopsis
Connects to S3 compatible object storage.

---

### Description

This cmdlet connects to S3 compatible object storage. It creates the IVBRAmazonS3Connection object that contains the connection settings for the following types of storage:
- S3 compatible object storage
- S3 compatible object storage with data archiving
- AWS Snowball Edge device
- Wasabi Cloud Object Storage
You can use these settings to add S3 compatible devices to the backup infrastructure as the following types of repositories:
- An object storage repository. Run the Add-VBRAmazonS3CompatibleRepository cmdlet to add S3 compatible object storage as an object storage repository.
- An external repository. Run the Add-VBRAmazonS3ExternalRepository cmdlet to add S3 compatible as an external repository.
- A capacity extent of a scale-out backup repository.
- An archive extent of a scale-out backup repository.
NOTE
- It is recommended to disconnect the S3 compatible session at the end. Otherwise, the information that you get within the session will not be refreshed when you connect again, and outdated data will be used then. Run the Disconnect-VBRAmazonS3Service cmdlet to stop the session.
- To get an active session, save the result that you get after you run the Connect-VBRAmazonS3CompatibleService cmdlet to a variable.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

---

### Examples
> Example 1. Connecting to S3 Compatible Object Storage

$account = Get-VBRAmazonAccount -AccessKey "XXXXXXXXXXXXXXX"
Connect-VBRAmazonS3CompatibleService -Account $account -CustomRegionId "us-east-1" -ServicePoint "http://123.45.67.89:9000"
This example shows how to connect to S3 compatible object storage.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Save the result to the $connect variable. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Specify the CustomRegionId parameter value.
- Specify the ServicePoint parameter value.
> Example 2. Connecting to AWS Snowball Edge

$account = Get-VBRAmazonAccount -AccessKey "XXXXXXXXXXXXXXX"
Connect-VBRAmazonS3CompatibleService -Account $account -CustomRegionId "snow" -ServicePoint "http://123.45.67.89:9000"
This example shows how to connect to AWS Snowball Edge.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Save the result to the $connect variable. Specify the following settings:
- Set the $account variable as the Account parameter value.
- Specify the CustomRegionId parameter value.
- Specify the ServicePoint parameter.

---

### Parameters
#### **Account**
Specifies an S3 compatible service credentials record.
Veeam Backup & Replication will use this credentials record to connect to S3 compatible object storage or S3 compatible object storage with data archiving.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[VBRAmazonAccount]`|true    |named   |True (ByValue)|

#### **ConnectionType**
Specifies how Veeam Backup & Replication will access the object storage repository:
* Direct: Use this option if you want Veeam Backup & Replication to use a proxy server to transfer data from the processed VM to object storage repositories.
* Gateway: Use this option if you want Veeam Backup & Replication to use a gateway server to transfer data from processed VM to object storage repositories.Note: Provide the GatewayServer parameter to specify the server.
Default: Direct.
Valid Values:

* Direct
* Gateway

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRRepositoryConnectionType]`|false   |named   |False        |

#### **CustomRegionId**
Specifies an Amazon S3 region where your S3 compatible object storage or or S3 compatible object storage with data archiving are located.
Note: To connect to the AWS Snowball Edge device, you must provide the snow value for the CustomRegionId parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Force**
Defines that the cmdlet will set up a connection to S3 compatible object storage even if Veeam Backup & Replication or Veeam Agent cannot validate that the certificate is issued from the trusted authorities.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayServer**
Specifies an array of gateway servers that you want to use to transfer data from processed VM to object storage repositories.
Note: If you use S3 compatible service credentials records to connect to S3 compatible object storage with data archiving, the cmdlet will ignore these gateway server settings. It will use the settings that you specify for an archiver appliance.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **ServicePoint**
Specifies the endpoint. The cmdlet will use this endpoint to connect to S3 compatible object storage or S3 compatible object storage with data archiving.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
|`[VBRAmazonServiceType]`|false   |named   |False        |

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
Connect-VBRAmazonS3CompatibleService -Account <VBRAmazonAccount> [-ConnectionType {Direct | Gateway}] -CustomRegionId <String> [-Force] [-GatewayServer <CHost[]>] -ServicePoint <String> [-ServiceType 
```
```PowerShell
{ExternalRepository | CapacityTier | ArchiveTier}] [<CommonParameters>]
```
