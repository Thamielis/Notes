Connect-VBRGoogleCloudService
-----------------------------

### Synopsis
Connects to Google Cloud object storage.

---

### Description

This cmdlet connects to Google Cloud object storage. You can use these settings to add Google Cloud object storage into your backup infrastructure an object storage repository.
Run the Add-VBRGoogleCloudRepository cmdlet to add Google Cloud as an object storage repository.
Note:
- It is recommended to disconnect from the Google Cloud object storage at the end of the PowerShell session. Otherwise, the information that you get within the session will not be refreshed when you connect again, and outdated data will be used then. Run the Disconnect-VBRGoogleCloudService cmdlet to stop the session.
- To get an active session, save the result that you get after you run the Connect-VBRGoogleCloudService cmdlet to a variable.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

* [Add-VBRGoogleCloudRepository](Add-VBRGoogleCloudRepository)

---

### Examples
> Connecting to Google Cloud Service

$account = Get-VBRGoogleCloudAccount -AccessKey "ABCDEFGHIGKLMNOP"
Connect-VBRGoogleCloudService -Account $account -ServiceType ExternalRepository
This example shows how to connect to Google Cloud object storage.
Perform the following steps:
1. Run the Get-VBRGoogleCloudAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $account variable.
2. Run the Connect-VBRGoogleCloudService cmdlet. Set the $account variable as the Account parameter value. Set the ExternalRepository value for the ServiceType parameter value.

---

### Parameters
#### **Account**
Specifies a Google Cloud credentials record. Veeam Backup & Replication will use this credentials record to connect to Google Cloud object storage.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRGoogleCloudAccount]`|true    |named   |False        |

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

#### **ServiceType**
Specifies the type of the backup repository. The cmdlet will add the object storage as the specified type of the backup repository to backup infrastructure.
* ExternalRepository: Use this option to add object storage as an external backup repository.
* CapacityTier: Use this option to add object storage as a capacity extent or an object storage repository.
* ArchiveTier: Use this option to add object storage as an archive extent.
Valid Values:

* ExternalRepository
* CapacityTier

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRGoogleCloudServiceType]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Connect-VBRGoogleCloudService -Account <VBRGoogleCloudAccount> [-ConnectionType {Direct | Gateway}] [-GatewayServer <CHost[]>] -ServiceType {ExternalRepository | CapacityTier} [<CommonParameters>]
```
