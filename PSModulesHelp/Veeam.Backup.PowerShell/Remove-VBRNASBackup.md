Remove-VBRNASBackup
-------------------

### Synopsis
Removes backup files created by the file backup job.

---

### Description

This cmdlet removes backup files created by the file backup job.

---

### Related Links
* [Get-VBRNASBackup](Get-VBRNASBackup)

* [Get-VBRNASServer](Get-VBRNASServer)

* [Get-VBRNASBackupRestorePoint](Get-VBRNASBackupRestorePoint)

---

### Examples
> Example 1. Removing Backup Files from Veeam Backup & Replication Infrastructure

$backupfile = Get-VBRNASBackup -Name "Reports backup"
Remove-VBRNASBackup -NASBackup $backupfile
This example shows how to remove the Reports backup backup files from the Veeam Backup & Replication infrastructure.

Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
2. Run the Remove-VBRNASBackup cmdlet. Set the $backupfile variable as the NASBackup parameter value.
> Example 2. Removing Backup Files of Specific File Shares from Disk

$backupfile = Get-VBRNASBackup -Name "Reports"
$server = Get-VBRNASServer -Name "\\WinSRV2049\Documents"
Remove-VBRNASBackup -NASBackup $backupfile -NASServer $server
This example shows how to remove the Reports backup of the \\WinSRV2049\Documents file share from a disk.

Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
2. Run the Get-VBRNASServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Remove-VBRNASBackup cmdlet. Set the $backupfile variable as the NASBackup parameter value. Set the $server variable as the NASServer parameter value.
> Example 3. Removing Backup Files From Disk

$backupfile = Get-VBRNASBackup -Name "Reports"
Remove-VBRNASBackup -NASBackup $backupfile -FromDisk
This example shows how to remove the Reports backup file from a disk.

Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
2. Run the Remove-VBRNASBackup cmdlet. Set the $backupfile variable as the NASBackup parameter value. Set the $server variable as the NASServer parameter value.
> Example 4. Removing Restore Points of File Backups for Specific File Share

$backupfile = Get-VBRNASBackup -Name "NFS03"
$server = Get-VBRNASServer -Name "\\WinSRV2049\Documents"
$restorepoint = Get-VBRNASBackupRestorePoint -NASServer $server -NASBackup $backupfile
Remove-VBRNASBackup -RestorePoint $restorepoint -RunAsync
This example shows how to remove restore points of the NFS03 backup file created to back up the \\WinSRV2049\Documents file share.

Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
2. Run the Get-VBRNASServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Get-VBRNASBackupRestorePoint cmdlet. Set the $server variable as the NASServer parameter value. Set the $backupfile variable as the NASBackup parameter value.
4. Run the Remove-VBRNASBackup cmdlet. Set the $restorepoint as the RestorePoint parameter value. Provide the RunAsync parameter.

---

### Parameters
#### **FromDisk**
Defines that the cmdlet will remove backup files from disk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **NASBackup**
Specifies an array of backup files created by the file backup job.  The cmdlet will remove these backup files. Accepts the VBRNASBackup[] object.  To create this object, run the Get-VBRNASBackup cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRNASBackup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **NASServer**
Specifies an array of file shares.  The cmdlet will remove backup files of the specified file shares. Accepts the VBRNASServer[] object.  To create this object, run the Get-VBRNASServer cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRNASServer[]]`|true    |named   |False        |

#### **RestorePoint**
Specifies an array of restore points. The cmdlet will remove backups that have restore points specified in the array. If the NASBackup parameter is also specified, the cmdlet will remove backup files for specified file shares. Accepts the VBRNASBackupRestorePoint[] object.  To create this object, run the Get-VBRNASBackupRestorePoint cmdlet.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRNASBackupRestorePoint[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackup[]

Veeam.Backup.PowerShell.Infos.VBRNASBackupRestorePoint[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRNASBackup -FromDisk -NASBackup <VBRNASBackup[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-VBRNASBackup -NASBackup <VBRNASBackup[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-VBRNASBackup -NASBackup <VBRNASBackup[]> -NASServer <VBRNASServer[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-VBRNASBackup -RestorePoint <VBRNASBackupRestorePoint[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
