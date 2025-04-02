Add-VBRNASSMBServer
-------------------

### Synopsis
Adds SMB network shared folders to the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet adds SMB network shared folders to the Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Adding SMB Network Shared Folder Without Authentication

$repository = Get-VBRBackupRepository -Name "Backup Repository 09"
Add-VBRNASSMBServer -Path "\\Server07\SharedDocuments" -CacheRepository $repository
This example shows how to add the SMB network shared folder without authentication.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Add-VBRNASSMBServer cmdlet. Specify the Path parameter value. Set the $repository variable as the CacheRepository parameter value.
> Example 2. Adding SMB Network Shared Folder with User Name and Password

$repository = Get-VBRBackupRepository -Name 'Backup Repository 05'
Add-VBRNASSMBServer -Path '\\Server08\SharedDocuments' -User Administrator -Password AdminCredentials -CacheRepository $repository
This example shows how to add the SMB network shared folder authenticated with user name and password.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Add-VBRNASSMBServer cmdlet. Specify the following settings:
- Specify the Path parameter value.
- Specify the User parameter value.
- Specify the Password parameter value.
- Set the $repository variable as the CacheRepository parameter value.
> Example 3. Adding SMB Network Shared Folder with Credentials

$repository = Get-VBRBackupRepository -Name "Backup Repository 05"
$credentials = Get-VBRCredentials
Add-VBRNASSMBServer -Path "\\Server04\SharedDocuments" -AccessCredentials $credentials -CacheRepository $repository
This example shows how to add SMB network shared folder authenticated with credentials.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBRCredentials cmdlet. Save the result to the $credentials variable.
3. Run the Add-VBRNASSMBServer cmdlet. Specify the following settings:
- Specify the Path parameter value.
- Set the $credentials variable as the AccessCredentials parameter value.
- Set the $repository variable as the CacheRepository parameter value.

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
Specifies the cache repository. Veeam Backup & Replication will keep the .VCACHE files on this repository. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **EnableDirectBackupFailover**
For the StorageSnapshot processing option. Defines that if the native storage snapshot fails while being processed, Veeam Backup & Replication will backup data directly from the file server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies the password. The cmdlet will use this password to authenticate against the SMB network shared folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Path**
Specifies a path to the SMB network shared folder. The cmdlet will add the SMB network shared folder located at the specified path to the Veeam Backup & Replication infrastructure. Note: Use the "\server\folder" format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **ProcessingMode**
Specifies processing options that define how Veeam Backup & Replication will back up data.
* Direct: use this option to back up directly from the SMB network shared folder. Note: This option does not back up locked files.
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

#### **SelectedProxyServer**
For the SelectedProxy option of the ProxyMode parameter. Specifies the backup proxy. Veeam Backup & Replication will use this backup proxy to back up the SMB network shared folder. Accepts the VBRNASProxyServer[] object. To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **StorageSnapshotPath**
For the StorageSnapshot processing option. Specifies the path to the folder where native storage snapshots are located. Veeam Backup & Replication will get data from these snapshots located at the specified folder.

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRNASSMBServer -AccessCredentials <CCredentials> [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] -CacheRepository <CBackupRepository> [-EnableDirectBackupFailover] -Path <String> 
```
```PowerShell
[-ProcessingMode {Direct | VSSSnapshot | StorageSnapshot}] [-ProxyMode {Automatic | SelectedProxy}] [-SelectedProxyServer <VBRNASProxyServer[]>] [-StorageSnapshotPath <String>] [<CommonParameters>]
```
```PowerShell
Add-VBRNASSMBServer [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] -CacheRepository <CBackupRepository> [-EnableDirectBackupFailover] -Password <String> -Path <String> [-ProcessingMode {Direct 
```
```PowerShell
| VSSSnapshot | StorageSnapshot}] [-ProxyMode {Automatic | SelectedProxy}] [-SelectedProxyServer <VBRNASProxyServer[]>] [-StorageSnapshotPath <String>] -User <String> [<CommonParameters>]
```
