Move-VBRBackup
--------------

### Synopsis
Moves all backups of a job to another repository or specific workloads and their backups to another job.

---

### Description

This cmdlet moves backups to another repository or to another job. For more information on the move operation and its considerations, see the Moving Backups section in the Veeam Backup and Replication User Guide.

When you move backups to another repository, the cmdlet reconfigures the job to target to the new location. When you move workload and their backups to another job, backups are moved to the repository which the specified job is targeted to.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Moving Backups

$backup = Get-VBRBackup
$repository =  Get-VBRBackupRepository
Move-VBRBackup -Backup $backup -Repository $repository
This example shows how to move all backups to another repository.
Perform the following steps:
1.	Run the Get-VBRBackup cmdlet. Save the result to the $backup variable.
2.  Run the Get-VBRBackupRepository cmdlet. Save the result to the $repository variable.
3.  Run the Move-VBRBackup cmdlet. Set the $backup variable as the Backup parameter value. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Backup**
Specifies backups that will be moved.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CBackup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will move backups without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the job to which you want to move workloads and their backups.
Note: This parameter applies only if backups are per-machine with metadata for each workload. This parameter is required if the Name parameter is set.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names of the workloads that you want to move.
Note: This parameter applies only if backups are true per-machine (with metadata for each workload). This parameter is required if the Job parameter is set.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Repository**
Specifies the repository to which backups will be moved.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.CBackup

System.String[]

Veeam.Backup.Core.CBackupRepository

Veeam.Backup.Core.CBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Move-VBRBackup -Backup <CBackup> [-Force] -Job <CBackupJob> -Name <String[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Move-VBRBackup -Backup <CBackup> [-Force] -Repository <CBackupRepository> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
