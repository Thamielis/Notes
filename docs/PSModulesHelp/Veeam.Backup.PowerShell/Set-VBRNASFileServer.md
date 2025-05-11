Set-VBRNASFileServer
--------------------

### Synopsis
Modifies managed Windows or Linux file serves added to the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet modifies managed Windows or Linux file serves added to the Veeam Backup & Replication infrastructure. This cmdlet modifies an existing VMware replication job.

To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters you omit will remain unchanged.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Modifying Cache Repository

$server = Get-VBRUnstructuredServer -Name "File server 09"
$cacherepository = Get-VBRBackupRepository -Name "Repository 04"
Set-VBRNASFileServer -Server $server -CacheRepository $cacherepository
This example shows how to modify a cache repository of the file server. The cmdlet will set the Repository 04 repository as the cache repository on this server.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $cacherepository variable.
3. Run the Set-VBRNASFileServer cmdlet. Set the $server variable as the Server parameter value. Specify the $cacherepository variable as the CacheRepository parameter value.

---

### Parameters
#### **BackupIOControlLevel**
Specifies a speed that Veeam Backup & Replication will use to read data from the file server. You can specify either of the following speed:
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

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRNASBackupIOControlLevel]`|false   |named   |False        |

#### **CacheRepository**
Specifies the cache repository that you want to modify. Veeam Backup & Replication will keep the cached data of the file server on this repository. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **MetaMigrationType**
Specifies how the cmdlet will migrate metadata. You can use one of the following options:
* CheckExistence - use this option to check that metadata is available on the current cache repository.
* CopyMetaFromCache - use this option to migrate metadata from source cache repository to a new cache respository. Note: If metadata in a source cache repository is corruted, the cmdlet will copy data from the archive repository.
* DownloadMetaFromArchive - use this option to migrate metadata from archive repository or from replica metadata in archive repository.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRNASBackupMetaMigrationType]`|false   |named   |False        |

#### **Server**
Specify a file server. The cmdlet will modify settings of this file server. Accepts the VBRNASNFSServer object. To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRNASFileServer]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASFileServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNASFileServer [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-CacheRepository <CBackupRepository>] [-MetaMigrationType {CheckExistence | CopyMetaFromCache | DownloadMetaFromArchive}] 
```
```PowerShell
-Server <VBRNASFileServer> [<CommonParameters>]
```
