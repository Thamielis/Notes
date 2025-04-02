Connect-VBRAzureDataBoxService
------------------------------

### Synopsis
Connects to Azure Data Box storage.

---

### Description

This cmdlet connects to Azure Data Box storage.
IMPORTANT! This cmdlet connects only the Azure Data Box storage that can be used as a capacity extent of the scale-out backup repository.
Note:
- It is recommended to disconnect the Microsoft Azure Blob session at the end. Otherwise, the information that you get within the session will not be refreshed when you connect again, and outdated data will be used then. Run the Disconnect-VBRAzureBlobService cmdlet to stop the session.
- To get the current session, save the result that you get after you run the Connect-VBRAzureDataBoxService cmdlet to a variable.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Connect-VBRAzureBlobService](Connect-VBRAzureBlobService)

---

### Examples
> Connecting to Azure Data Box Storage

$account = Get-VBRAzureBlobAccount -Name "Microsoft Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType CapacityTier
Connect-VBRAzureDataBoxService -Account $connect -ServicePoint "ZTX15910049.microsoftdatabox.com"
This example shows how to connect to Azure Data Box storage.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and the ServiceType parameter values. Save the result to the $connect variable.
3. Run the Connect-VBRAzureDataBoxService cmdlet. Set the $connect variable as the Account parameter value. Specify the ServicePoint parameter value.

---

### Parameters
#### **Account**
Specifies an Microsoft Azure Blob credentials record. The cmdlet will use this credentials record to connect to Azure Data Box storage.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[VBRAzureBlobAccount]`|true    |named   |True (ByValue)|

#### **ConnectionType**
Specifies how Veeam Backup & Replication will access the object storage repository:
* Direct: Use this option if you want Veeam Backup & Replication to use a proxy server to transfer data from the processed VM to object storage repositories.
* Use this option if you want Veeam Backup & Replication to use a gateway server to transfer data from processed VM to object storage repositories. Note: Provide the GatewayServer parameter to specify the server.
Default: Direct.
Valid Values:

* Direct
* Gateway

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRRepositoryConnectionType]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will skip the certificate check.
If you do not provide this parameter, Veeam Backup & Replication will check that the Azure Data Box certificate is valid.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayServer**
Specifies an array of gateway servers that you want to use to transfer data from processed VM to object storage repositories.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **ServicePoint**
Specifies the endpoint. The cmdlet will use this endpoint to connect to Azure Data Box object storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Connect-VBRAzureDataBoxService -Account <VBRAzureBlobAccount> [-ConnectionType {Direct | Gateway}] [-Force] [-GatewayServer <CHost[]>] -ServicePoint <String> [<CommonParameters>]
```
