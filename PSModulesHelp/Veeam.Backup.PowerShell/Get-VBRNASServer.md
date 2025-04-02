Get-VBRNASServer
----------------

### Synopsis
Returns file shares that are added to the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet return backup files created by the file backup job.

---

### Related Links
* [Get-VBRNASBackup](Get-VBRNASBackup)

---

### Examples
> Example 1. Getting All File Shares

Get-VBRNASServer
Type                : SMB
Path                : \\WinSRV2049\Documents
AccessCredentials   :
ProcessingMode      : Direct
StorageSnapshotPath :
ProxyMode           : Automatic
SelectedProxyServer : {}
Id                  : 4916c13e-08bf-488f-ab1b-1624d02189c5
CacheRepository     : Veeam.Backup.Core.CBackupRepository

Type                : NFS
Path                : \\LinuxSRV2049\Reports
AccessCredentials   :
ProcessingMode      : Direct
StorageSnapshotPath :
ProxyMode           : Automatic
SelectedProxyServer : {}
Id                  : 678eafe4-ad76-4878-8230-561b4226333c
CacheRepository     : Veeam.Backup.Core.CBackupRepository
This command gets all file shares added to the <%VBR%> infrastructure. The cmdlet output will contain settings of these file shares.
> Example 2. Getting File Shares by Name

```PowerShell
Get-VBRNASServer -Name "\\WinSRV2049\Documents"
Type                : SMB
Path                : \\WinSRV2049\Documents
AccessCredentials   :
ProcessingMode      : Direct
StorageSnapshotPath :
ProxyMode           : Automatic
SelectedProxyServer : {}
Id                  : 4916c13e-08bf-488f-ab1b-1624d02189c5
CacheRepository     : Veeam.Backup.Core.CBackupRepository
This command gets the WinSRV2049\Documents file share. The cmdlet output will contain settings of these file shares.
```
> Example 3. Getting File Share by ID

```PowerShell
Get-VBRNASServer -Id "678eafe4-ad76-4878-8230-561b4226333c"
Type                : NFS
Path                : \\LinuxSRV2049\Reports
AccessCredentials   :
ProcessingMode      : Direct
StorageSnapshotPath :
ProxyMode           : Automatic
SelectedProxyServer : {}
Id                  : 678eafe4-ad76-4878-8230-561b4226333c
CacheRepository     : Veeam.Backup.Core.CBackupRepository
This command gets file share by the file share ID. The cmdlet output will contain settings of these file shares.
```
> Example 4. Getting File Share by Backup

```PowerShell
$nasbackup = Get-VBRNASBackup -Name "Fileserv05 (SMB) DB"
Get-VBRNASServer -Backup $nasbackup
Type                        : SMB
Path                        : \\fileserv05\Documents
AccessCredentials           : fileserv05\Administrator
ProcessingMode              : Direct
StorageSnapshotPath         :
ProxyMode                   : Automatic
SelectedProxyServer         : {}
DirectBackupFailoverEnabled : True
Id                          : a830d2ab-a879-44ed-8107-7e76b8d4b817
CacheRepository             : Veeam.Backup.Core.CBackupRepository
BackupIOControlLevel        : Medium
This example shows how to get the Fileserv05 (SMB) DB file shares by the backup that protects them. The cmdlet output will contain settings of these file shares.
```

---

### Parameters
#### **Backup**
Specifies a backup. The cmdlet will return an array of file shares protected with this backup. Accepts the VBRNASBackup object. To create this object, run the Get-VBRNASBackup cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRNASBackup]`|false   |named   |False        |

#### **Id**
Specifies an ID of a file share. The cmdlet will return an array of file shares with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies a name of a file share. The cmdlet will return an array of file shares with the specified name.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **SANEntity**
Specifies a name of an enterprise NAS system. The cmdlet will return an array of file shares residing on this NAS system. Accepts the VBRSANEntity[] object. To create this object, run the Get-NetAppHost cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRSANEntity[]]`|true    |named   |False        |

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
Get-VBRNASServer [-Backup <VBRNASBackup>] [<CommonParameters>]
```
```PowerShell
Get-VBRNASServer -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNASServer -Name <String[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNASServer -SANEntity <VBRSANEntity[]> [<CommonParameters>]
```
