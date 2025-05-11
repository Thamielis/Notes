Add-VBRNASNFSServer
-------------------

### Synopsis
Adds NFS network shared folders to the inventory.

---

### Description

This cmdlet adds NFS network shared folders to the inventory.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Adding NFS Network Shared Folder

$repository = Get-VBRBackupRepository -Name "Backup Repository 08"
Add-VBRNASNFSServer -Path "Server06:/SharedDocuments" -CacheRepository $repository
This example shows how to add the NFS shared folder to the inventory.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Add-VBRNASNFSServer cmdlet. Specify the Path parameter value. Set the $repository variable as the CacheRepository parameter value.
> Example 2. Adding NFS Network Shared Folder With Direct Processing

$repository = Get-VBRBackupRepository -Name "Backup Repository 02"
Add-VBRNASNFSServer -Path "Server06:/SharedDocuments" -CacheRepository $repository -ProcessingMode Direct
This example shows how to add the NFS shared folder to the Veeam Backup & Replication infrastructure. Veeam Backup & Replication will back up data directly from the SMB network shared folder.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Add-VBRNASNFSServer cmdlet. Specify the following settings:
- Specify the Path parameter value.
- Set the $repository variable as the CacheRepository parameter value.
- Set the Direct option as the ProcessingMode parameter value.

---

### Parameters
#### **BackupIOControlLevel**
Specifies a speed that <%VBR%> will use to read data from the file server. You can specify either of the following speed:
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
Specifies the cache repository. Veeam Backup & Replication will keep the .VCACHE files on this repository. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **EnableDirectBackupFailover**
For the StorageSnapshot processing option. Defines that if the native storage snapshot fails while being processed, Veeam Backup & Replication will back up data directly from the file server.

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

#### **Path**
This cmdlet adds NFS network shared folders to the Veeam Backup & Replication infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **ProcessingMode**
Specifies processing options that define how Veeam Backup & Replication will back up data:
* Direct: use this option to back up directly from the SMB network shared folder. Note: This option does not back up locked files.
* VSSSnapshot: use this option to back up from VSS snapshots that have been created by the backup proxy.
* StorageSnapshot: use this option to back up from the native storage snapshots.
Use the StorageSnapshotPath parameter to specify the path to the folder where native storage snapshots are located.
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

#### **StorageSnapshotPath**
For the StorageSnapshot processing options. Specifies the path to the folder where native storage snapshots are located. Veeam Backup & Replication will get data from these snapshots located at the specified folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Add-VBRNASNFSServer [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] -CacheRepository <CBackupRepository> [-EnableDirectBackupFailover] [-Encoding {utf | ansi}] -Path <String> [-ProcessingMode 
```
```PowerShell
{Direct | VSSSnapshot | StorageSnapshot}] [-ProxyMode {Automatic | SelectedProxy}] [-SelectedProxyServer <VBRNASProxyServer[]>] [-StorageSnapshotPath <String>] [<CommonParameters>]
```
