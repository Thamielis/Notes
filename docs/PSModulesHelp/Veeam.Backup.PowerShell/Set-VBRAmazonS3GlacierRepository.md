Set-VBRAmazonS3GlacierRepository
--------------------------------

### Synopsis
Modifies settings for Amazon S3 Glacier archive storage added as a backup repository.

---

### Description

This cmdlet modifies settings for Amazon S3 Glacier archive storage repository added as a backup repository.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRArchiveObjectStorageRepository](Get-VBRArchiveObjectStorageRepository)

---

### Examples
> Modifying Amazon S3 Glacier Storage Class

$amazon = Get-VBRArchiveObjectStorageRepository -Name "Repository 03"
Set-VBRAmazonS3GlacierRepository -Repository $amazon -UseDeepArchive
This example shows how to modify settings of the Repository 03 Amazon S3 Glacier object storage. The cmdlet will set the Glacier Deep Archive storage class to data blocks located in the object storage.
Perform the following steps:
1. Run the Get-VBRArchiveObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $amazon variable.
2. Run the Set-VBRAmazonS3GlacierRepository cmdlet. Set the $amazon variable as the Repository parameter value. Provide the UseDeepArchive parameter.

---

### Parameters
#### **AmazonProxySpec**
Specifies the archiver appliance that will transfer the data from Amazon S3 to Amazon S3 Glacier object storage.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRAmazonEC2ProxyAppliance]`|false   |named   |False        |

#### **ConnectionType**
Specifies how Veeam Backup & Replication will access the object storage repository:
Direct: Use this option if you want Veeam Backup & Replication to use a proxy server to transfer data from the processed VM to object storage repositories.
Gateway: Use this option if you want Veeam Backup & Replication to use a gateway server to transfer data from processed VM to object storage repositories.
Note: Provide the GatewayServer parameter to specify the server.
Default: Direct.
Valid Values:

* Direct
* Gateway

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRRepositoryConnectionType]`|false   |named   |False        |

#### **Description**
Specifies a description of an Amazon S3 Glacier object storage. The cmdlet will add object storage with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify object storage repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayServer**
Note: This parameter is deprecated. Use the AmazonProxySpec parameter instead. Specifies an array of gateway servers that you want to use to transfer data from processed VM to object storage repositories.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **Name**
Specifies a name of an Amazon S3 Glacier object storage. The cmdlet will add object storage with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies an Amazons S3 Glacier archive storage that you want to modify.

|Type                            |Required|Position|PipelineInput |
|--------------------------------|--------|--------|--------------|
|`[VBRAmazonS3GlacierRepository]`|true    |named   |True (ByValue)|

#### **UseDeepArchive**
Defines that the cmdlet will create a repository where blocks are marked with the Glacier Deep Archive storage class.
Note: If you do not provide the UseDeepArchive and UseInstantRetrieval parameters, the cmdlet will create a repository where blocks are marked as the Amazon S3 Glacier Flexible Retrieval storage class.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UseGatewayServer**
This parameter is deprecated and will be ignored. Use the GatewayServer parameter instead.
Defines that the cmdlet will use a gateway server to transfer data from processed VM to object storage repositories.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UseInstantRetrieval**
Defines that the cmdlet will create a repository where blocks are marked with the Amazon S3 Glacier Instant Retrieval storage class.
Note: If you do not provide the UseDeepArchive and UseInstantRetrieval parameters, the cmdlet will create a repository where blocks are marked as the Amazon S3 Glacier Flexible Retrieval storage class.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3GlacierRepository

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRAmazonS3GlacierRepository

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAmazonS3GlacierRepository [-AmazonProxySpec <VBRAmazonEC2ProxyAppliance>] [-ConnectionType {Direct | Gateway}] [-Description <String>] [-Force] [-GatewayServer <CHost[]>] [-Name <String>] -Repository 
```
```PowerShell
<VBRAmazonS3GlacierRepository> [-UseDeepArchive] [-UseGatewayServer] [-UseInstantRetrieval] [<CommonParameters>]
```
