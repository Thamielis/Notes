Set-VBRNASSMBServer
-------------------

### Synopsis
Modifies settings of SMB network shared folders added to the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet modifies settings of SMB network shared folders added to the Veeam Backup & Replication infrastructure.

---

### Related Links
* [Sync-VBRUnstructuredBackupState](Sync-VBRUnstructuredBackupState)

* [Get-VBRNASProxyServer](Get-VBRNASProxyServer)

* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Modifying Processing Options

$server = Sync-VBRUnstructuredBackupState -Name "\\WinSRV2049\Documents"
Set-VBRNASSMBServer -Server $server -ProcessingMode StorageSnapshot
This example shows how to modify the processing options of the \WinSRV2049\Documents SMB network shared folder. Veeam Backup & Replication will create backups of the \WinSRV2049\Documents SMB network shared folder from the native storage snapshots that have been created by the backup proxy.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Set-VBRNASSMBServer cmdlet. Set the $server variable as the Server parameter value. Specify the ProcessingMode parameter value.
> Example 2. Modifying User Name and Password

$server = Sync-VBRUnstructuredBackupState -Name "\\WinSRV2049\Reports"
Set-VBRNASSMBServer -Server $server -RequireAccessCredentials -User Administrator -Password Pa$$word
This example shows how to modify the user name and the password that are used to access the \WinSRV2049\Reports SMB network shared folder.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Set-VBRNASSMBServer cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Provide the RequireAccessCredentials parameter.
- Specify the User parameter.
- Specify the Password parameter.
> Example 3. Modifying Credentials

$server = Sync-VBRUnstructuredBackupState -Name "\\WinSRV2049\January"
$credentials = Get-VBRCredentials
Set-VBRNASSMBServer -Server $server -RequireAccessCredentials -Credentials $credentials
This example shows how to modify credentials that are used to access the \WinSRV2049\January SMB network shared folder.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRCredentials cmdlet. Save the result to the $credentials variable.
3. Run the Set-VBRNASSMBServer cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Set the $credentials variable as the Credentials parameter value.
- Provide the RequireAccessCredentials parameter.
> Example 4. Modifying Backup Proxy Options

$server = Sync-VBRUnstructuredBackupState -Name "\\WinSRV2049\October"
$proxy = Get-VBRNASProxyServer -Name "Proxy09"
Set-VBRNASSMBServer -Server $server -ProxyMode SelectedProxy -SelectedProxyServer $proxy
This example shows how to modify the backup proxy options of the \WinSRV2049\October SMB network shared folder. The SMB network shared folder will be processed by the Proxy09 backup proxy.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRNASProxyServer cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
3. Run the Set-VBRNASSMBServer cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Set the SelectedProxy option as the ProxyMode parameter value.
- Set the $proxy variable as the SelectedProxyServer parameter value.
> Example 5. Modifying Cache Repository Settings

$server = Sync-VBRUnstructuredBackupState -Name "\\WinSRV2049\Documents"
$repository = Get-VBRBackupRepository -Name Repository09
Set-VBRNASSMBServer -Server $server -CacheRepository $repository
This example shows how to modify cache repository settings of the \WinSRV2049\Documents SMB network shared folder. The \WinSRV2049\Documents SMB network shared folder will be processed by the Repository09 backup repository.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Set-VBRNASSMBServer cmdlet. Set the $server variable as the Server parameter value. Set the $repository variable as the CacheRepository parameter value.

---

### Parameters
#### **AccessCredentials**
Specifies credentials that the cmdlet will use to authenticate against the SMB network shared folder. Accepts the CCredentials object. To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

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
Specifies the cache repository. Veeam Backup & Replication will keep the cached data of the SMB network shared folder on this repository. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **EnableDirectBackupFailover**
For the StorageSnapshot processing option. Defines that if the native storage snapshot fails while being processed, Veeam Backup & Replication will backup data directly from the file server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MetaMigrationType**
Specifies how the cmdlet will migrate metadata. You can use one of the following options:
* CheckExistence - use this option to check that metadata is available on the current cache repository.
* CopyMetaFromCache - use this option to migrate metadata from source cache repository to a new cache respository. Note: If metadata in a source cache repository is corruted, the cmdlet will copy data from the archive repository.
* DownloadMetaFromArchive - use this option to migrate metadata from archive repository or from replica metadata in archive repository.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRNASBackupMetaMigrationType]`|false   |named   |False        |

#### **Password**
Specifies the password. The cmdlet will use this password to authenticate against the SMB network shared folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **ProcessingMode**
Specifies processing options that define how Veeam Backup & Replication will back up data. - Direct: use this option to back up directly from the SMB network shared folder. Note: This option does not back up locked files.
* VSSSnapshot: use this option to back up from VSS snapshots that have been created by the backup proxy.
* StorageSnapshot: use this option to back up from the native storage snapshots. Use the StorageSnapshotPath parameter to specify the path to the folder where native storage snapshots are located.
Valid Values:

* Direct
* VSSSnapshot
* StorageSnapshot

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRNASProcessingMode]`|false   |named   |False        |

#### **ProxyMode**
Specifies the backup proxy options:
* Automatic: use this option if you want Veeam Backup & Replication to choose the backup proxy that will process the SMB network shared folder.
* SelectedProxy: use this option if you want to specify the backup proxy that will process the SMB network shared folder. Use the SelectedProxyServer parameter to specify the backup proxy.
Valid Values:

* Automatic
* SelectedProxy

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRNASProxyMode]`|false   |named   |False        |

#### **RequireAccessCredentials**
Defines that the cmdlet will check whether Veeam Backup & Replication uses authentication to access the SMB network shared folder. If you do not provide this parameter, the cmdlet will not check credentials that are used to access the SMB network shared folder. To remove credentials, specify the RequireAccessCredentials parameter with the :$False value. Note: If credentials are not provided, the cmdlet will return an error. To avoid the error, you must specify credentials using either of the following parameters:
* User and Password
* AccessCredentials

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SelectedProxyServer**
For the SelectedProxy option of the ProxyMode parameter. Specifies the backup proxy. Veeam Backup & Replication will use this backup proxy to back up the SMB network shared folder. Accepts the VBRNASProxyServer[] object. To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **Server**
Specifies an array of SMB network shared folders that you want to modify. Accepts the VBRNASSMBServer object. To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRNASSMBServer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **StorageSnapshotPath**
For the StorageSnapshot processing options. Specifies the path to the folder where native storage snapshots are located. Veeam Backup & Replication will get data from these snapshots located at the specified folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **User**
Specifies the user name. The cmdlet will apply this user name to authenticate against the SMB network shared folder. Note: The user name must be in the "DOMAIN\USERNAME" format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASSMBServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNASSMBServer -AccessCredentials <CCredentials> [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-CacheRepository <CBackupRepository>] [-EnableDirectBackupFailover] [-MetaMigrationType 
```
```PowerShell
{CheckExistence | CopyMetaFromCache | DownloadMetaFromArchive}] [-ProcessingMode {Direct | VSSSnapshot | StorageSnapshot}] [-ProxyMode {Automatic | SelectedProxy}] [-RequireAccessCredentials] 
```
```PowerShell
[-SelectedProxyServer <VBRNASProxyServer[]>] -Server <VBRNASSMBServer> [-StorageSnapshotPath <String>] [<CommonParameters>]
```
```PowerShell
Set-VBRNASSMBServer [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-CacheRepository <CBackupRepository>] [-EnableDirectBackupFailover] [-MetaMigrationType {CheckExistence | CopyMetaFromCache 
```
```PowerShell
| DownloadMetaFromArchive}] -Password <String> [-ProcessingMode {Direct | VSSSnapshot | StorageSnapshot}] [-ProxyMode {Automatic | SelectedProxy}] [-RequireAccessCredentials] [-SelectedProxyServer 
```
```PowerShell
<VBRNASProxyServer[]>] -Server <VBRNASSMBServer> [-StorageSnapshotPath <String>] -User <String> [<CommonParameters>]
```
