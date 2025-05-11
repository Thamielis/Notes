Remove-VBRUnstructuredBackup
----------------------------

### Synopsis
Removes backup files created by the file backup jobs and object storage backup jobs.

---

### Description

This cmdlet removes backup files created by the file backup jobs and object storage backup jobs.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Get-VBRUnstructuredBackupRestorePoint](Get-VBRUnstructuredBackupRestorePoint)

---

### Examples
> Example 1. Removing Backup Files from Veeam Backup & Replication Infrastructure

$backupfile = Get-VBRUnstructuredBackup -Name "Reports backup"
Remove-VBRUnstructuredBackup -Backup $backupfile
This example shows how to remove the Reports backup backup files from the Veeam Backup & Replication infrastructure.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
2. Run the Remove-VBRUnstructuredBackup cmdlet. Set the $backupfile variable as the Backup parameter value.
> Example 2. Removing Backup Files of Specific Object Storage from Disk

$backupfile = Get-VBRUnstructuredBackup -Name "Reports"
$server = Get-VBRUnstructuredServer -Name "MinioSrv"
Remove-VBRUnstructuredBackup -Backup $backupfile -Server $server
This example shows how to remove the Reports backup of the MinioSrv object storage from a disk.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Remove-VBRUnstructuredBackup cmdlet. Set the $backupfile variable as the Backup parameter value. Set the $server variable as the Server parameter value.
> Example 3. Removing Backup Files From Disk

$backupfile = Get-VBRUnstructuredBackup -Name "Reports"
Remove-VBRUnstructuredBackup -Backup $backupfile
This example shows how to remove the Reports backup file from a disk.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
2. Run the Remove-VBRUnstructuredBackup cmdlet. Set the $backupfile variable as the Backup parameter value.
> Example 4. Removing Restore Points of File Backups for Specific File Share

$backupfile = Get-VBRUnstructuredBackup -Name "NFS03"       
$server = Get-VBRUnstructuredServer -Name "\\WinSRV2049\Documents"      
$restorepoint = Get-VBRUnstructuredBackupRestorePoint -Server $server -Backup $backupfile       
Remove-VBRUnstructuredBackup -RestorePoint $restorepoint -RunAsync
This example shows how to remove restore points of the NFS03 backup file created to back up the \WinSRV2049\Documents file share.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Set the $server variable as the Server parameter value. Set the $backupfile variable as the Backup parameter value.
4. Run the Remove-VBRUnstructuredBackup cmdlet. Set the $restorepoint as the RestorePoint parameter value. Provide the RunAsync parameter.

---

### Parameters
#### **Backup**
Specifies an array of backup files created by the file backup jobs and object storage backup jobs. The cmdlet will remove these backup files.
Accepts the VBRUnstructuredBackup[] object. To create this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **FromDisk**
Defines that the cmdlet will remove backup files from disk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **RestorePoint**
Specifies an array of restore points. The cmdlet will remove backups that have restore points specified in the array.
NOTE: If the Backup parameter is also specified, the cmdlet will remove backup files for specified file shares.
Accepts the VBRUnstructuredBackupRestorePoint[] object. To create this object, run the Get-VBRUnstructuredBackupRestorePoint cmdlet.

|Type                                   |Required|Position|PipelineInput                 |
|---------------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupRestorePoint[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies an array of file shares and object storage. The cmdlet will remove backup files of the specified file shares from the disk.
Accepts the VBRUnstructuredServer[] object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRUnstructuredServer[]]`|true    |named   |False        |

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
Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackup[]

Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackupRestorePoint[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRUnstructuredBackup -Backup <VBRUnstructuredBackup[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-VBRUnstructuredBackup -Backup <VBRUnstructuredBackup[]> [-RunAsync] -Server <VBRUnstructuredServer[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-VBRUnstructuredBackup -Backup <VBRUnstructuredBackup[]> -FromDisk [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-VBRUnstructuredBackup -RestorePoint <VBRUnstructuredBackupRestorePoint[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
