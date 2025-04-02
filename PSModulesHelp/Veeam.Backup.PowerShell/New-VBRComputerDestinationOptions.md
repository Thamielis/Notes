New-VBRComputerDestinationOptions
---------------------------------

### Synopsis
Creates the target location settings for backup policies.

---

### Description

This cmdlet creates the VBRComputerDestinationOptions object that contains the target location settings for the backup policy. Veeam Backup & Replication applies this policy to the protected computers.
Run the Get-VBRBackupRepository cmdlet to get the repository.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Creating Target Location Settings for Veeam Agent Backup Policy (Local Drive)

```PowerShell
New-VBRComputerDestinationOptions -LocalPath "D:\Backup" -OSPlatform Windows
This command creates target location settings for the backup policy that Veeam Agent job applies to the protected computers.
The job will save the backups to a local drive of the protected computer. Use the LocalPath parameter to specify the local drive path settings.
```
> Example 2. Creating Target Location Settings for Veeam Agent Backup Policy (Network Shared Folder)

$creds = Get-Credential
New-VBRComputerDestinationOptions -NetworkFolderPath "172.17.53.14:/Veeam" -OSPlatform Linux -TargetShareType NFS -UseNetworkCredentials -NetworkCredentials $creds
This example shows how to create target location settings for the backup policy that Veeam Agent job applies to the protected computers. The job will save the backups to the network shared folder.
Perform the following steps:
1. Run the Get-Credential cmdlet. Save the result to the $creds variable.
2. Run the New-VBRComputerDestinationOptions cmdlet. Specify the following settings:
- Specify the NetworkFolderPath parameter value.
- Set the Linux value for the OSPlatform parameter.
- Set the NFS value for the TargetShareType parameter.
- Provide the UseNetworkCredentials parameter.
- Set the $creds variable as the NetworkCredentials parameter value.
> Example 3. Creating Target Location Settings for Veeam Agent Backup Policy (Backup Repository)

$repository = Get-VBRBackupRepository -Name "Default Backup Repository"
New-VBRComputerDestinationOptions -OSPlatform Windows -BackupRepository $repository -BackupServerName "Repository 01"
This example shows how to create target location settings for the backup policy that Veeam Agent job applies to the protected computers.
The job will save the backups to the backup repository managed by the Veeam backup server.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the New-VBRComputerDestinationOptions cmdlet. Set the Windows option for the OSPlatform parameter. Set the $repository variable as the BackupRepository parameter value. Specify the BackupServerName parameter value.

---

### Parameters
#### **BackupRepository**
Use this option if you want to save a backup on either of the following types of a backup repository:
* Backup repository managed by the Veeam backup server.
* Veeam Cloud Connect repository.
Note: Cloud repositories added from Cloud Director tenant are not supported.

|Type                 |Required|Position|PipelineInput |
|---------------------|--------|--------|--------------|
|`[CBackupRepository]`|true    |named   |True (ByValue)|

#### **BackupServerName**
Specifies the DNS name or an external IP address of the Veeam backup server that manages the target backup repository.
Note: You can use only the Veeam backup server where the Veeam Agent backup job is configured.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **LocalPath**
Use this parameter if you want to keep backups on the following target locations:
* On a removable storage device attached to a protected computer.
* On a local drive of a protected computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **NetworkCredentials**
Specifies the credentials which Veeam Agent will use to authenticate to the network shared folder.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **NetworkFolderPath**
Use this option if you want to keep backups in a network shared folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **OSPlatform**
Specifies the OS of the protected computers:
* Windows: for Windows computers.
* Linux: for Linux computers.
* Mac: for macOS computers.
Note: Indexing for macOS computers is not supported in current version of Veeam PowerShell.
Valid Values:

* Windows
* Linux
* Mac
* Unix

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRAgentType]`|true    |named   |False        |

#### **TargetShareType**
Specifies the protocol that you will use to keep backups on shared folders.
* SMB
* NFS
Note: The NFS protocol type does not work for Windows computers.
Default: SMB
Valid Values:

* Smb
* Nfs

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRDestinationTargetShareType]`|false   |named   |False        |

#### **UseNetworkCredentials**
Defines that the network shared folder requires authentication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRComputerDestinationOptions -BackupRepository <CBackupRepository> [-BackupServerName <String>] -OSPlatform {Windows | Linux | Mac | Unix} [<CommonParameters>]
```
```PowerShell
New-VBRComputerDestinationOptions -LocalPath <String> -OSPlatform {Windows | Linux | Mac | Unix} [<CommonParameters>]
```
```PowerShell
New-VBRComputerDestinationOptions [-NetworkCredentials <CCredentials>] -NetworkFolderPath <String> -OSPlatform {Windows | Linux | Mac | Unix} [-TargetShareType {Smb | Nfs}] [-UseNetworkCredentials] 
```
```PowerShell
[<CommonParameters>]
```
