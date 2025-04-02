Set-VBRNASNFSServer
-------------------

### Synopsis
Modifies settings of NFS shared folders added to the inventory.

---

### Description

This cmdlet modifies settings of NFS network shared folders added to the inventory. This cmdlet modifies an existing VMware replication job.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Modifying Processing Options

$server = Sync-VBRUnstructuredBackupState -Name "\\LinuxSRV2049\November"
Set-VBRNASNFSServer -Server $server -ProcessingMode VSSSnapshot
This example shows how to modify the processing options of the \\LinuxSRV2049\November NFS network shared folder. Veeam Backup & Replication will create backups of the \\LinuxSRV2049\November NFS network shared folder from VSS snapshots that have been created by the backup proxy.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Set-VBRNASNFSServer cmdlet. Set the $server variable as the Server parameter value. Specify the ProcessingMode parameter value.
> Example 2. Modifying Backup Proxy Options

$server = Sync-VBRUnstructuredBackupState -Name "\\LinuxSRV2049\November"
Set-VBRNASNFSServer -Server $server -ProxyMode Automatic
This example shows how to modify the backup proxy options of the \\LinuxSRV2049\November NFS network shared folder. Veeam Backup & Replication will select the backup proxy to process the \\LinuxSRV2049\November NFS network shared folder automatically.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Set-VBRNASSMBServer cmdlet. Set the $server variable as the Server parameter value. Specify the ProxyMode parameter value.
> Example 3. Modifying Cache Repository Settings

$server = Sync-VBRUnstructuredBackupState -Name "\\LinuxSRV2049\November"
$repository = Get-VBRBackupRepository -Name Repository07
Set-VBRNASSMBServer -Server $server -CacheRepository $repository
This example shows how to modify cache repository settings of the \\LinuxSRV2049\November NFS network shared folder. The \\LinuxSRV2049\November NFS network shared folder will be processed by the Repository07 backup repository.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Set-VBRNASSMBServer cmdlet. Set the $server variable as the Server parameter value. Set the $repository variable as the CacheRepository parameter value.

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
Specifies the cache repository. Veeam Backup & Replication will keep the cached data of the NFS network shared folder on this repository. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **EnableDirectBackupFailover**
For the StorageSnapshot processing option. Defines that if the native storage snapshot fails while being processed, Veeam Backup & Replication will backup data directly from the file server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Encoding**
Specifies encoding for NFS share. You can specify either of the following values:
* utf
* ansi
Valid Values:

* utf
* ansi

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRNASEncoding]`|false   |named   |False        |

#### **MetaMigrationType**
Specifies how the cmdlet will migrate metadata. You can use one of the following options:
* CheckExistence - use this option to check that metadata is available on the current cache repository.
* CopyMetaFromCache - use this option to migrate metadata from source cache repository to a new cache respository. Note: If metadata in a source cache repository is corruted, the cmdlet will copy data from the archive repository.
* DownloadMetaFromArchive - use this option to migrate metadata from archive repository or from replica metadata in archive repository.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRNASBackupMetaMigrationType]`|false   |named   |False        |

#### **ProcessingMode**
Specifies processing options that define how Veeam Backup & Replication will back up data:
* Direct: use this option to back up directly from the SMB network shared folder. Note: This option does not back up locked files.
* VSSSnapshot: use this option to back up from VSS snapshots that have been created by the backup proxy.
* StorageSnapshot: use this option to back up from the native storage snapshots that have been created by the backup proxy.
Valid Values:

* Direct
* VSSSnapshot
* StorageSnapshot

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRNASProcessingMode]`|false   |named   |False        |

#### **ProxyMode**
Specifies the backup proxy options:
* Automatic: use this option if you want Veeam Backup & Replication to choose the backup proxy that will process the NFS network shared folder.
* SelectedProxy: use this option if you want to specify the backup proxy that will process the NFS network shared folder.
Use the SelectedProxyServer parameter to specify the backup proxy.
Valid Values:

* Automatic
* SelectedProxy

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRNASProxyMode]`|false   |named   |False        |

#### **SelectedProxyServer**
For the SelectedProxy option of the ProxyMode parameter. Specifies the backup proxy. Veeam Backup & Replication will use this backup proxy to process the NFS network shared folder. Accepts the VBRNASProxyServer[] object. To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **Server**
Specify an NFS network shared folder. The cmdlet will modify settings of this network shared folder. Accepts the VBRNASNFSServer object. To get this object, run the Sync-VBRUnstructuredBackupState cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRNASNFSServer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **StorageSnapshotPath**
For the StorageSnapshot processing options. Specifies the path to the folder where native storage snapshots are located. Veeam Backup & Replication will get data from these snapshots located at the specified folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASNFSServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNASNFSServer [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-CacheRepository <CBackupRepository>] [-EnableDirectBackupFailover] [-Encoding {utf | ansi}] [-MetaMigrationType 
```
```PowerShell
{CheckExistence | CopyMetaFromCache | DownloadMetaFromArchive}] [-ProcessingMode {Direct | VSSSnapshot | StorageSnapshot}] [-ProxyMode {Automatic | SelectedProxy}] [-SelectedProxyServer <VBRNASProxyServer[]>] 
```
```PowerShell
-Server <VBRNASNFSServer> [-StorageSnapshotPath <String>] [<CommonParameters>]
```
