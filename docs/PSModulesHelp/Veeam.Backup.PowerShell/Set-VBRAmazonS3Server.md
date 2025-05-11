Set-VBRAmazonS3Server
---------------------

### Synopsis
Modifies settings of Amazon S3 storage added as unstructured data source to the inventory.

---

### Description

This cmdlet mofidies settings of Amazon S3 storage added as unstructured data source to the inventory.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Get-VBRNASProxyServer](Get-VBRNASProxyServer)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

---

### Examples
> Modifying Settings of Amazon S3 Storage Added as Unstructured Data Source

$server = Get-VBRUnstructuredServer -Name "Amazon S3 OS"
Set-VBRAmazonS3Server -Server $server -BackupIOControlLevel High
This example shows how to set the high speed for Veeam Backup & Replication to read data from Amazon S3 storage added as unstructured data source to the inventory. Perform the following steps:
1. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter values. Save the result to the $server variable.
2. Run the Set-VBRAmazonS3Server cmdlet. Set the $server variable as the Server parameter value. Specify the BackupIOControlLevel parameter value.

---

### Parameters
#### **Account**
Specifies an Amazon S3 credentials record. Veeam Backup & Replication will use this credentials record to connect to Amazon S3 storage. Accepts the VBRAmazonAccount object.  To get this object, run the Get-VBRAmazonAccount cmdlet.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[VBRAmazonAccount]`|false   |named   |True (ByValue)|

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

#### **BucketName**
Specifies a name of the Amazon S3 bucket. The cmdlet will connect to this bucket.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **CacheRepository**
Specifies the cache repository. Veeam Backup & Replication will keep the .VCACHE files on this repository. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **MetaMigrationType**
Specifies how the cmdlet will migrate metadata. You can use one of the following options:
* CheckExistence - use this option to check that metadata is available on the current cache repository.
* CopyMetaFromCache - use this option to migrate metadata from source cache repository to a new cache respository.
Note: If metadata in a source cache repository is corrupted, the cmdlet will copy data from the archive repository.
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
For the SelectedProxy option of the ProxyMode parameter. Specifies the backup proxy. Veeam Backup & Replication will use this backup proxy to back up Amazon S3 object storage. Accepts the VBRNASProxyServer[] object.  To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **Server**
Specifies the Amazon S3 storage that you want to modify. Accepts the VBRAmazonS3Server object.  To create this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRAmazonS3Server]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3Server

Veeam.Backup.PowerShell.Infos.VBRAmazonAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAmazonS3Server [-Account <VBRAmazonAccount>] [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-BucketName <String>] [-CacheRepository <CBackupRepository>] [-MetaMigrationType 
```
```PowerShell
{CheckExistence | CopyMetaFromCache | DownloadMetaFromArchive}] [-ProxyMode {Automatic | SelectedProxy}] [-SelectedProxyServer <VBRNASProxyServer[]>] -Server <VBRAmazonS3Server> [<CommonParameters>]
```
