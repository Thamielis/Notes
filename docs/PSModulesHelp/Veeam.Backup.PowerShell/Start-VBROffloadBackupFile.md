Start-VBROffloadBackupFile
--------------------------

### Synopsis
Moves backup files to the capacity tier.

---

### Description

This cmdlet starts to move backup files to the capacity tier. You can use the following scenarios for moving the backup files:
- Move full backup files only.
- Move full backup files with all increments.
- Move increment backup files with all other increments related to it and a full backup file.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRBackupFile](Get-VBRBackupFile)

---

### Examples
> Example 1. Moving Full Backup File to Capacity Tier

$backup = Get-VBRBackup -Name "Exchange backups"
$files = Get-VBRBackupFile -Backup $backup
Start-VBROffloadBackupFile -BackupFile $files -ThisBackup
This example shows how to move a full backup file to the capacity tier.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRBackupFile cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $files variable.
3. Run the Start-VBROffloadBackupFile cmdlet. Set the $files variable as the BackupFile parameter value. Provide the ThisBackup parameter.
> Example 2. Moving Full Backup File with Increments to Capacity Tier

$backup = Get-VBRBackup -Name "Exchange backups"
$files = Get-VBRBackupFile -Backup $backup
Start-VBROffloadBackupFile -BackupFile $files -ThisBackupAndIncrements
This example shows how to move a full backup file with all increments related to it to the capacity tier.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRBackupFile cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $files variable.
3. Run the Start-VBROffloadBackupFile cmdlet. Set the $files variable as the BackupFile parameter value. Provide the ThisBackupAndIncrements parameter.

---

### Parameters
#### **BackupFile**
Specifies an array of backup files that you want to move to the capacity tier.

|Type               |Required|Position|PipelineInput |
|-------------------|--------|--------|--------------|
|`[VBRBackupFile[]]`|true    |named   |True (ByValue)|

#### **MoveAlreadyCopiedBackupsToSealedExtent**
Defines that the cmdlet will move backup files if the capacity extent is sealed and backups files already copied.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ThisBackup**
Defines that the cmdlet will move only full backup files to the capacity tier.
Note: This parameter is not applicable for the backups created with Veeam Plug-in for SAP HANA and Veeam Plug-in for Oracle RMAN. If you provide this parameter, the cmdlet will download full backup files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ThisBackupAndIncrements**
Defines that the cmdlet will move full backup files and all backup files that are related to it to the capacity tier.
Note: This parameter is not applicable for the backups created with Veeam Plug-in for SAP HANA and Veeam Plug-in for Oracle RMAN. If you provide this parameter, the cmdlet will download full backup files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRBackupFile[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBROffloadBackupFile -BackupFile <VBRBackupFile[]> [-MoveAlreadyCopiedBackupsToSealedExtent] [-RunAsync] [-ThisBackup] [<CommonParameters>]
```
```PowerShell
Start-VBROffloadBackupFile -BackupFile <VBRBackupFile[]> [-MoveAlreadyCopiedBackupsToSealedExtent] [-RunAsync] [-ThisBackupAndIncrements] [<CommonParameters>]
```
