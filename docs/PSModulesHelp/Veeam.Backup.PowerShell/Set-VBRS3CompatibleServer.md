Set-VBRS3CompatibleServer
-------------------------

### Synopsis
Modifies settings of Amazon S3 storage added as unstructured data source to the inventory.

---

### Description

This cmdlet modifies settings of Amazon S3 storage added as unstructured data source to the inventory.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRNASProxyServer](Get-VBRNASProxyServer)

---

### Examples
> Modifying Settings of S3 Compatible Storage Added as Unstructured Data Source

$server = Get-VBRUnstructuredServer -Name "S3 compatible OS"
Set-VBRS3CompatibleServer -Server $server -BackupIOControlLevel High
This example shows how to set the high speed for Veeam Backup & Replication to read data from S3 compatible storage added as unstructured data source to the inventory.
Perform the following steps:
1. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter values. Save the result to the $server variable.
2. Run the Set-VBRS3CompatibleServer cmdlet. Set the $server variable as the Server parameter value. Specify the BackupIOControlLevel parameter value.

---

### Parameters
#### **Account**
Specifies an S3 credentials record. Veeam Backup & Replication will use this credentials record to connect to S3 compatible object storage.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[VBRAmazonAccount]`|false   |named   |True (ByValue)|

#### **BackupIOControlLevel**
Specifies a speed that Veeam Backup & Replication will use to read data from object storage. You can specify either of the following speed:
·	Lowest
·	Low
·	Medium
·	High
·	Highest
Valid Values:

* Lowest
* Low
* Medium
* High
* Highest

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupIOControlLevel]`|false   |named   |False        |

#### **BucketName**
Specifies a name of the S3 compatible bucket. The cmdlet will connect to this bucket.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **CacheRepository**
Specifies the cache repository. Veeam Backup & Replication will keep the .VCACHE files on this repository.
Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add S3 compatible object storage without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MetaMigrationType**
Specifies how the cmdlet will migrate metadata. You can use one of the following options:
* CheckExistence - use this option to check that metadata is available on the current cache repository.
* CopyMetaFromCache - use this option to migrate metadata from source cache repository to a new cache respository. Note: If metadata in a source cache repository is corruted, the cmdlet will copy data from the archive repository.
* DownloadMetaFromArchive - use this option to migrate metadata from archive repository or from replica metadata in archive repository.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupMetaMigrationType]`|false   |named   |False        |

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

#### **SelectedProxyServer**
For the SelectedProxy option of the ProxyMode parameter. Specifies the backup proxy. Veeam Backup & Replication will use this backup proxy to back up S3 compatible object storage.
Accepts the VBRNASProxyServer[] object.  To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **Server**
Specifies the S3 compatible storage that you want to modify. Accepts the VBRAmazonS3Server object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRS3CompatibleServer]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRS3CompatibleServer

Veeam.Backup.PowerShell.Infos.VBRAmazonAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRS3CompatibleServer [-Account <VBRAmazonAccount>] [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-BucketName <String>] [-CacheRepository <CBackupRepository>] [-Force] 
```
```PowerShell
[-MetaMigrationType {CheckExistence | CopyMetaFromCache | DownloadMetaFromArchive}] [-ProxyMode <VBRNASProxyMode>] [-SelectedProxyServer <VBRNASProxyServer[]>] -Server <VBRS3CompatibleServer> 
```
```PowerShell
[<CommonParameters>]
```
