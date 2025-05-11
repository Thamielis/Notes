Start-VBRDownloadBackupFile
---------------------------

### Synopsis
Downloads backup files from capacity tier to the performance tier.

---

### Description

This cmdlet starts the rehydration procedure. Veeam Backup & Replication will download the backup files from the capacity tier to the performance tier.
You can use the following scenarios for downloading the backup files:
- Download full backup files only.
- Download full backup files with all incremental backup files.
- Download the incremental backup files with all other increments related to it and the full backup file.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRBackupFile](Get-VBRBackupFile)

---

### Examples
> Example 1. Downloading Full Backup File from Capacity Tier

$backup = Get-VBRBackup -Name "Exchange backups"
$files = Get-VBRBackupFile -Backup $backup
Start-VBRDowloadBackupFile -BackupFile $files -ThisBackup
This example shows how to download a full backup file from the capacity tier.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRBackupFile cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $files variable.
3. Run the Start-VBRDownloadBackupFile cmdlet. Set the $files variable as the BackupFile parameter value. Provide ThisBackup parameter.
> Example 2. Downloading Full Backup File with all Increments

$backup = Get-VBRBackup -Name "Exchange backups"
$files = Get-VBRBackupFile -Backup $backup
Start-VBRDowloadBackupFile -BackupFile $files -ThisBackupAndIncrements
This example shows how to download a full backup file with all increments related to it from the capacity tier.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRBackupFile cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $files variable.
3. Run the Start-VBRDownloadBackupFile cmdlet. Set the $files variable as the BackupFile parameter value. Provide the ThisBackupAndIncrements parameter.

---

### Parameters
#### **BackupFile**
Specifies an array of backup files that you want to download.

|Type               |Required|Position|PipelineInput |
|-------------------|--------|--------|--------------|
|`[VBRBackupFile[]]`|true    |named   |True (ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ThisBackup**
Defines that the cmdlet will download full backup files only.
Note: This parameter is not applicable for the backups created with Veeam Plug-in for SAP HANA and Veeam Plug-in for Oracle RMAN. If you provide this parameter, the cmdlet will download full backup files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ThisBackupAndIncrements**
Defines that the cmdlet will download full backup files and all backup files that are related to it.
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
Start-VBRDownloadBackupFile -BackupFile <VBRBackupFile[]> [-RunAsync] [-ThisBackup] [<CommonParameters>]
```
```PowerShell
Start-VBRDownloadBackupFile -BackupFile <VBRBackupFile[]> [-RunAsync] [-ThisBackupAndIncrements] [<CommonParameters>]
```
