Add-VBRAzureBlobServer
----------------------

### Synopsis
Adds Microsoft Azure Blob storage as unstructured data source to the inventory.

---

### Description

This cmdlet adds Microsoft Azure Blob storage as unstructured data source to the inventory.

---

### Related Links
* [Add-VBRAzureBlobAccount](Add-VBRAzureBlobAccount)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRNASProxyServer](Get-VBRNASProxyServer)

---

### Examples
> Example - Adding Microsoft Azure Blob as Unstructured Data Source

$creds = Add-VBRAzureBlobAccount -Name "string" -SharedKey "string"
$cacherepository = Get-VBRBackupRepository -Name "WinSrv"
Add-VBRAzureBlobServer -FriendlyName "Azure Blob" -Account $creds -RegionType Global -CacheRepository $cacherepository
This example shows how to add Microsoft Azure Blob as unstructured data source to the inventory.

Perform the following steps:
1. Run the Add-VBRAzureBlobAccount cmdlet. Specify the Name and the SharedKey parameters values. Save the result to the $creds variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $cacherepository variable.
3. Run the Add-VBRAzureBlobServer cmdlet. Specify the following settings:
- Specify the FriendlyName parameter value.
- Set the $creds variable as the Account parameter value.
- Specify the RegionType parameter value.
- Set the $cacherepository variable as the CacheRepository parameter value.

---

### Parameters
#### **Account**
Specifies Microsoft Azure Blob credentials records. The cmdlet will use these credentials record to connect to object storage. Accepts the VBRAzureBlobAccount object.  To get this object, run the Get-VBRAzureBlobAccount cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRAzureBlobAccount]`|true    |named   |False        |

#### **BackupIOControlLevel**
Specifies a speed that Veeam Backup & Replication will use to read data from object storage. You can specify either of the following speed:
* Lowest
* Low
* Medium
* High
* Highest
Valid Values:

* Lowest
* Low
* Medium
* High
* Highest

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupIOControlLevel]`|false   |named   |False        |

#### **CacheRepository**
Specifies the cache repository. Veeam Backup & Replication will keep the .VCACHE files on this repository. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **FriendlyName**
Specify a name that you want to assign to the object storage.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |True (ByValue)|

#### **ProxyMode**
Specifies the backup proxy options:
* Automatic: use this option if you want Veeam Backup & Replication to choose the backup proxy that will process object storage.
* SelectedProxy: use this option if you want to specify the backup proxy that will process object storage. Use the SelectedProxyServer parameter to specify the backup proxy.
Valid Values:

* Automatic
* SelectedProxy

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRNASProxyMode]`|false   |named   |False        |

#### **RegionType**
Specifies the region type of Microsoft Azure Blob storage. The cmdlet will connect to the selected region type and will set up a connection with Microsoft Azure Blob storage. You can select the following types of regions:
* Global
* Government
* China
Valid Values:

* Global
* China
* Government

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRAzureBlobRegionType]`|true    |named   |False        |

#### **SelectedProxyServer**
For the SelectedProxy option of the ProxyMode parameter. Specifies the backup proxy. Veeam Backup & Replication will use this backup proxy to back up Microsoft Azure Blob object storage. Accepts the VBRNASProxyServer[] object.  To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

---

### Inputs
System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAzureBlobServer -Account <VBRAzureBlobAccount> [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] -CacheRepository <CBackupRepository> -FriendlyName <String> [-ProxyMode {Automatic | 
```
```PowerShell
SelectedProxy}] -RegionType {Global | China | Government} [-SelectedProxyServer <VBRNASProxyServer[]>] [<CommonParameters>]
```
