Set-VBRComputerDestinationOptions
---------------------------------

### Synopsis
Modifies the target location for Veeam Agent backup policies.

---

### Description

This cmdlet modifies the target location settings for the backup policy that Veeam Agent job applies to the protected computers.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Modifying Target Location Settings for Veeam Agent Backup Policy

$job = Get-VBRComputerBackupJob -Name "WinPolicy"
$destination = $job.DestinationOptions
$repository = Get-VBRBackupRepository -Name "Repository"
Set-VBRComputerDestinationOptions -Options $destination -BackupRepository $repository
This example shows how to modify target location settings for the backup policy that Veeam Agent job applies to the protected computers.
The job will save the backups to the backup repository managed by the Veeam backup server.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Get the DestinationOptions property of the $job variable. Save the result to the $destination variable.
3. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
4. Run the Set-VBRComputerDestinationOptions cmdlet. Set the $destination variable as the Options parameter value. Set the $repository variable as the BackupRepository parameter value.

---

### Parameters
#### **BackupRepository**
Use this option if you want to save a backup on either of the following types of a backup repository:
* Backup repository managed by the Veeam backup server.
* Veeam Cloud Connect repository.
Note: Cloud repositories added from Cloud Director tenant are not supported.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

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
|`[String]`|false   |named   |False        |

#### **Options**
Specifies the target location settings that you want to modify.

|Type                             |Required|Position|PipelineInput |
|---------------------------------|--------|--------|--------------|
|`[VBRComputerDestinationOptions]`|true    |named   |True (ByValue)|

#### **TargetShareType**
Specifies the protocol that you will use to keep backups on shared folders.
* SMB
* NFS
Note: The NFS protocol type does not work for Windows computers.
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
Veeam.Backup.PowerShell.Infos.VBRComputerDestinationOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerDestinationOptions [-BackupRepository <CBackupRepository>] [-BackupServerName <String>] -Options <VBRComputerDestinationOptions> [<CommonParameters>]
```
```PowerShell
Set-VBRComputerDestinationOptions -LocalPath <String> -Options <VBRComputerDestinationOptions> [<CommonParameters>]
```
```PowerShell
Set-VBRComputerDestinationOptions [-NetworkCredentials <CCredentials>] [-NetworkFolderPath <String>] -Options <VBRComputerDestinationOptions> [-TargetShareType {Smb | Nfs}] [-UseNetworkCredentials] 
```
```PowerShell
[<CommonParameters>]
```
