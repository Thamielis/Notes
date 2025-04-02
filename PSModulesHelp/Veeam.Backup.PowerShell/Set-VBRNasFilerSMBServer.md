Set-VBRNasFilerSMBServer
------------------------

### Synopsis
Modifies settings of SMB shares located on an enterprise NAS system and added to the inventory.

---

### Description

This cmdlet modifies settings of SMB shares located on an enterprise NAS system and added to the inventory. You can either specify the cache repository manually or make the file share to inherit cache repository settings from the enterprise NAS system. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRIsilonHost](Get-VBRIsilonHost)

* [Get-VBRIsilonVolume](Get-VBRIsilonVolume)

* [Sync-VBRUnstructuredBackupState](Sync-VBRUnstructuredBackupState)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Setting Cache Repository for SMB Share Manually

$isilonhost = Get-VBRIsilonHost -Name "HostName"
$volume = Get-VBRIsilonVolume -Name "SMB Share" -Host $isilonhost
$isi = Sync-VBRUnstructuredBackupState -SANEntity $volume
$cacherepo = Get-VBRBackupRepository -Name "Cache repository 1"
Set-VBRNasFilerSMBServer -Server $isi -CacheRepository $cacherepo
This example shows how to modify SMB share: a cache repository is specified manually.

Perform the following steps:
1. Run the Get-VBRIsilonHost cmdlet. Specify the Name parameter value. Save the result to the $isilonhost variable.
2. Run the Get-VBRIsilonVolume cmdlet. Specify the Name parameter value. Set the $isilonhost variable as the Host parameter value. Save the result to the $volume variable.
3. Run the Sync-VBRUnstructuredBackupState cmdlet. Set the $volume variable as the SANEntity parameter value. Save the result to the $volume variable.
4. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $cacherepo variable.
5. Run the Set-VBRNasFilerSMBServer cmdlet. Specify the following settings:
- Set the $isi variable as the Server parameter value.
- Set the $cacherepo variable as the CacheRepository parameter value.
> Example 2. Setting Cache Repository Settings Inherited from NAS System for SMB Share

$isilonhost = Get-VBRIsilonHost -Name "HostName"
$volume = Get-VBRIsilonVolume -Name "SMB Share" -Host $isilonhost
$isi = Sync-VBRUnstructuredBackupState -SANEntity $volume
Set-VBRNasFilerSMBServer -Server $isi -InheritSettingsFromFiler
This example shows how to modify SMB share: a cache repository settings are inherited from the enterprise NAS system on which the share is located.

Perform the following steps:
1. Run the Get-VBRIsilonHost cmdlet. Specify the Name parameter value. Save the result to the $isilonhost variable.
2. Run the Get-VBRIsilonVolume cmdlet. Specify the Name parameter value. Set the $isilonhost variable as the Host parameter value. Save the result to the $volume variable.
3. Run the Sync-VBRUnstructuredBackupState cmdlet. Set the $volume variable as the SANEntity parameter value. Save the result to the $volume variable.
4. Run the Set-VBRNasFilerSMBServer cmdlet. Specify the following settings:
- Set the $isi variable as the Server parameter value.
- Specify the InheritSettingsFromFiler parameter.

---

### Parameters
#### **AccessCredentials**
Specifies credentials that the cmdlet will use to authenticate against the enterprise NAS system. Accepts the CCredentials object. To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **BackupIOControlLevel**
Specifies a speed that Veeam Backup & Replication will use to read data from the file server. You can specify either of the following speed:
* Lowest
* Low
* Medium
* High
* Highest

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRNASBackupIOControlLevel]`|false   |named   |False        |

#### **CacheRepository**
Specifies a cache repository. The cmdlet will set this repository as a cache repository for the SMB file share. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **InheritSettingsFromFiler**
Defines that the SMB file share will inherit cache repository settings from the settings of the enterprise NAS system that it is located on.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **MetaMigrationType**
Specifies how the cmdlet will migrate metadata. You can use one of the following options:
* CheckExistence - use this option to check that metadata is available on the current cache repository.
* CopyMetaFromCache - use this option to migrate metadata from source cache repository to a new cache respository. Note: If metadata in a source cache repository is corruted, the cmdlet will copy data from the archive repository.
* DownloadMetaFromArchive - use this option to migrate metadata from archive repository or from replica metadata in archive repository.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRNASBackupMetaMigrationType]`|false   |named   |False        |

#### **Password**
Specifies the password. The cmdlet will use this password to authenticate against the enterprise NAS system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Server**
Specifies an SMB file share. The cmdlet will modify settings for this file share. Accepts the VBRSANNASSMBServer object. To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRSANNASSMBServer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **User**
Specifies the user name. The cmdlet will apply this user name to authenticate against the enterprise NAS system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSANNASSMBServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNasFilerSMBServer [-AccessCredentials <CCredentials>] [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-CacheRepository <CBackupRepository>] [-MetaMigrationType {CheckExistence | 
```
```PowerShell
CopyMetaFromCache | DownloadMetaFromArchive}] -Server <VBRSANNASSMBServer> [<CommonParameters>]
```
```PowerShell
Set-VBRNasFilerSMBServer [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-CacheRepository <CBackupRepository>] [-MetaMigrationType {CheckExistence | CopyMetaFromCache | 
```
```PowerShell
DownloadMetaFromArchive}] -Server <VBRSANNASSMBServer> [<CommonParameters>]
```
```PowerShell
Set-VBRNasFilerSMBServer [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-CacheRepository <CBackupRepository>] [-MetaMigrationType {CheckExistence | CopyMetaFromCache | 
```
```PowerShell
DownloadMetaFromArchive}] [-Password <String>] -Server <VBRSANNASSMBServer> [-User <String>] [<CommonParameters>]
```
```PowerShell
Set-VBRNasFilerSMBServer -InheritSettingsFromFiler [-MetaMigrationType {CheckExistence | CopyMetaFromCache | DownloadMetaFromArchive}] -Server <VBRSANNASSMBServer> [<CommonParameters>]
```
