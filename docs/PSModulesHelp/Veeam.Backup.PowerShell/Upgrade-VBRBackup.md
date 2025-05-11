Upgrade-VBRBackup
-----------------

### Synopsis
Upgrades the backup chain format of backups from per-machine (split machine) to true per-machine.

---

### Description

This cmdlet upgrades the backup chain format of backups from per-machine (split machine) to true per-machine. Note that the cmdlet does not upgrade single storage backups.
If you want to change the backup chain format for other backups, you need to use the Detach-VBRBackup cmdlet to detach backups from the job. Ensure that the job is targeted to the repository that creates backups of the required backup chain format. Then launch the job.
For more information on backup chain formats and how to change them, see the Changing Backup Chain Formats section in the Veeam Backup & Replication User Guide.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Upgrading Backups in Specific Repository

$repository = Get-VBRBackupRepository
Upgrade-VBRBackup -BackupRepository $repository
This example shows how to upgrade backups located in specific repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Save the result to the $repository variable.
2. Run the Upgrade-VBRBackup cmdlet. Set the $repository variable as the BackupRepository parameter value.

---

### Parameters
#### **Backup**
Specifies an array of backups that you want to upgrade. Note: Backups must be stored on one repository.

|Type         |Required|Position|PipelineInput |
|-------------|--------|--------|--------------|
|`[CBackup[]]`|false   |named   |True (ByValue)|

#### **BackupRepository**
Specifies the repository whose backups you want to upgrade.

|Type                 |Required|Position|PipelineInput |
|---------------------|--------|--------|--------------|
|`[CBackupRepository]`|false   |named   |True (ByValue)|

#### **Force**
Defines that the cmdlet will upgrade backups without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupRepository

Veeam.Backup.Core.CBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Upgrade-VBRBackup [-Backup <CBackup[]>] [-Force] [-RunAsync] [<CommonParameters>]
```
```PowerShell
Upgrade-VBRBackup [-BackupRepository <CBackupRepository>] [-Force] [-RunAsync] [<CommonParameters>]
```
