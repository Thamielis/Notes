Remove-VBRBackupFile
--------------------

### Synopsis
Removes missing backup files from the Veeam Backup & Replication configuration database.
Note: If the four-eyes authorization is enabled, you cannot run this cmdlet. For more information, see the Four-Eyes Authorization section in the User Guide for VMware vSphere.

---

### Description

This cmdlet removes missing backup files from the Veeam Backup & Replication configuration database.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRBackupFile](Get-VBRBackupFile)

---

### Examples
> Example 1. Removing Missing Backup File

$backup = Get-VBRBackup -Name "Daily backups"
$missingfile = Get-VBRBackupFile -Backup $backup[4]
Remove-VBRBackupFile -BackupFile $missingfile -Confirm
This example shows how to remove a missing backup file and all backup files related to it from Veeam Backup & Replication configuration database.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRBackupFile cmdlet. Set the $backup[4] variable as the Backup parameter value. Save the result to the $missingfile variable.
3. Run the Remove-VBRBackupFile cmdlet. Set the $missingfile variable as the BackupFile parameter value. Provide the Confirm parameter.
> Example 2. Removing all Missing Backup Files from Backup

$backup = Get-VBRBackup -Name "Daily backups"
Remove-VBRBackupFile -Backup $backup -FromDisk
This example shows how to remove all backup files that are missing from a backup. The cmdlet will remove the files from the configuration database and from disk.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Remove-VBRBackupFile cmdlet. Set the $backup variable as the Backup parameter value. Provide the FromDisk parameter.

---

### Parameters
#### **Backup**
Specifies a backup from which you want to remove missing backup files.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CBackup]`|true    |named   |False        |

#### **BackupFile**
Specifies a missing backup file that you want to remove.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRBackupFile]`|true    |named   |False        |

#### **FromDisk**
Defines that the cmdlet will remove the missing backup files from the configuration database and from disk (if these backup files are still available).
If you do not provide this parameter, the cmdlet will remove missing backup files from the configuration database only.

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRBackupFile -Backup <CBackup> [-FromDisk] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Remove-VBRBackupFile -BackupFile <VBRBackupFile> [-FromDisk] [-Confirm] [-WhatIf] [<CommonParameters>]
```
