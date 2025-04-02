Set-VBRNasFilerNFSServer
------------------------

### Synopsis
Modifies settings of NFS shared folders located on an enterprise NAS system and added to the inventory.

---

### Description

This cmdlet modifies settings of NFS shared folders located on an enterprise NAS system and added to the inventory. You can either specify the cache repository manually or make the file share to inherit cache repository settings from the enterprise NAS system.

To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRIsilonHost](Get-VBRIsilonHost)

* [Get-VBRIsilonVolume](Get-VBRIsilonVolume)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Setting Cache Repository of SMB Share Manually

$isilonhost = Get-VBRIsilonHost -Name "HostName"
$volume = Get-VBRIsilonVolume -Name "NFS Share" -Host $isilonhost
$isi = Sync-VBRUnstructuredBackupState -SANEntity $volume
$cacherepo = Get-VBRBackupRepository -Name "Cache repository 1"
Set-VBRNasFilerNFSServer -Server $isi -CacheRepository $cacherepo -Encoding ansi
The following request modifies NFS share: a cache repository is specified manually, ANSI encoding will be used for the share.
Perform the following steps:
1. Run the Get-VBRIsilonHost cmdlet. Specify the Name parameter value. Save the result to the $isilonhost variable.
2. Run the Get-VBRIsilonVolume cmdlet. Specify the Name parameter value. Set the $isilonhost variable as the Host parameter value. Save the result to the $volume variable.
3. Run the Sync-VBRUnstructuredBackupState cmdlet. Set the $volume variable as the SANEntity parameter value. Save the result to the $volume variable.
4. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $cacherepo variable.
5. Run the Set-VBRNasFilerNFSServer cmdlet. Specify the following settings:
- Set the $isi variable as the Server parameter value.
- Set the $cacherepo variable as the CacheRepository parameter value.
- Specify the Encodng parameter value.
> Example 2. Setting Cache Repository Settings Inherited from NAS System for NFS Share

$isilonhost = Get-VBRIsilonHost -Name "HostName"
$volume = Get-VBRIsilonVolume -Name "NFS Share" -Host $isilonhost
$isi = Sync-VBRUnstructuredBackupState -SANEntity $volume
Set-VBRNasFilerNFSServer -Server $isi -InheritSettingsFromFiler -Encoding utf
The following request modifies NFS share: a cache repository settings are inherited from the enterprise NAS system on which the share is located, UTF encoding will be used for the share.
Perform the following steps:
1. Run the Get-VBRIsilonHost cmdlet. Specify the Name parameter value. Save the result to the $isilonhost variable.
2. Run the Get-VBRIsilonVolume cmdlet. Specify the Name parameter value. Set the $isilonhost variable as the Host parameter value. Save the result to the $volume variable.
3. Run the Sync-VBRUnstructuredBackupState cmdlet. Set the $volume variable as the SANEntity parameter value. Save the result to the $volume variable.
4. Run the Set-VBRNasFilerNFSServer cmdlet. Specify the following settings:
- Set the $isi variable as the Server parameter value.
- Provide the InheritSettingsFromFiler parameter.
- Specify the Encodng parameter value.

---

### Parameters
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
Specifies a cache repository. The cmdlet will set this repository as a cache repository for the NFS file share. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Encoding**
Specifies encoding for the NFS file share. You can specify one of the following values:
* utf
* ansi
Valid Values:

* utf
* ansi

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRNASEncoding]`|false   |named   |False        |

#### **InheritSettingsFromFiler**
Defines that the NFS file share will inherit settings of the enterprise NAS system. If you provide this parameter, the cmdlet will inherit cache settings, throttling settings and credentials. Note: You must provide the MetaMigrationType to inherit cache repository settings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **MetaMigrationType**
Specifies how the cmdlet will migrate metadata. You can use one of the following options:
* CheckExistence - use this option to check that metadata is available on the current cache repository.
* CopyMetaFromCache - use this option to migrate metadata from source cache repository to a new cache respository.
* Note: If metadata in a source cache repository is corruted, the cmdlet will copy data from the archive repository.
* DownloadMetaFromArchive - use this option to migrate metadata from archive repository or from replica metadata in archive repository.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRNASBackupMetaMigrationType]`|false   |named   |False        |

#### **Server**
Specifies an NFS file share. The cmdlet will modify settings for this file share. Accepts the VBRSANNASNFSServer (VBRNASServer) object. To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRSANNASNFSServer]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSANNASNFSServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNasFilerNFSServer [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-CacheRepository <CBackupRepository>] [-Encoding {utf | ansi}] [-MetaMigrationType {CheckExistence | CopyMetaFromCache 
```
```PowerShell
| DownloadMetaFromArchive}] -Server <VBRSANNASNFSServer> [<CommonParameters>]
```
```PowerShell
Set-VBRNasFilerNFSServer [-Encoding {utf | ansi}] -InheritSettingsFromFiler [-MetaMigrationType {CheckExistence | CopyMetaFromCache | DownloadMetaFromArchive}] -Server <VBRSANNASNFSServer> [<CommonParameters>]
```
