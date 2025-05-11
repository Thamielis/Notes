Import-VBRBackup
----------------

### Synopsis
Imports Veeam backups to Veeam Backup & Replication.

---

### Description

This cmdlet imports Veeam backups to Veeam Backup & Replication database. You can import Veeam backups that were, for example, created on other Veeam backup servers or stored on a repository that is newly added to the Veeam Backup & Replication console.
The imported backups are registered in Veeam Backup database. You can use them for any restore operation.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Importing Backup from Server

$server = Get-VBRServer -Name "Fileserver"
Import-VBRBackup -Server $server -FileName "C:\Backups\SureBackups\SureBackups.vbm"
This example shows how to import a backup from the server.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Import-VBRBackup cmdlet. Set the $server variable as the Server parameter value. Specify the FileName parameter value.
> Example 2. Importing Backup from Repository

$repository = Get-VBRBackupRepository -Name "StoreOnce"
Import-VBRbackup -FileName "storeonce://10.0.0.1:Backup_Store@/Backup_Job/Backup_Job.vbk" -Repository $repository
This example shows how to import a backup from the repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Import-VBRBackup cmdlet. Specify the Filename parameter value. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **FileName**
Specifies the path to the backup you want to import.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |False        |

#### **Repository**
Specifies the repository where backups are located.
You can use the parameter for all types of repositories, including CIFS (SMB) Share and deduplicating storage appliance (Dell EMS Data Domain, ExaGrid, HPE StoreOnce).

|Type                 |Required|Position|PipelineInput        |
|---------------------|--------|--------|---------------------|
|`[CBackupRepository]`|true    |2       |True (ByPropertyName)|

#### **Server**
Specifies the target server where you want to store the imported backups.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

Veeam.Backup.Core.CBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Import-VBRBackup [-FileName] <String> [-Repository] <CBackupRepository> [<CommonParameters>]
```
```PowerShell
Import-VBRBackup [-Server] <CHost> [-FileName] <String> [<CommonParameters>]
```
