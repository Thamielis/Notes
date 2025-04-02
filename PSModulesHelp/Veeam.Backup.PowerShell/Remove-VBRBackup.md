Remove-VBRBackup
----------------

### Synopsis
Removes selected backups. Note: If the four-eyes authorization is enabled, you cannot run this cmdlet. For more information, see the Four-Eyes Authorization section in the User Guide for VMware vSphere.

---

### Description

This cmdlet removes selected backups. When you remove backups, you can use the following options:
- Remove from database. When you remove backup from database, you remove records about the backup from Veeam database. The backup files remain in repository. You can import such backups later with the Import-VBRBackup cmdlet.
- Remove from disk. With this option, the backup is removed from database and from disk. This removal is complete and non-reversible.
IMPORTANT! You must use this option if you remove backups from archive extents and capacity extents.
To remove replicated VM, run the Remove-VBRReplica cmdlet.
To remove a backup job, run the Remove-VBRJob cmdlet.
IMPORTANT! This cmdlet removes all restore points associated with backups of all VMs processed by the job. You should remove backups carefully considering the subsequent backup jobs that may fail to produce valid backup. To remove backup of individual VMs, run the Remove-VBRRestorePoint cmdlet.
With this cmdlet, you can remove backups created by all types of jobs: backup jobs, backup copy jobs, vCD jobs and Veeam Agent for Microsoft Windows backup jobs.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRSOBRObjectStorageBackup](Get-VBRSOBRObjectStorageBackup)

---

### Examples
> Example 1. Removing Specific Backups from Database [Using Pipeline]

Get-VBRBackup -Name "Backup Job 01", "Backup Job 02" | Remove-VBRBackup
This example shows how to remove the backups named Backup Job 01 and Backup Job 02 from database.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRBackup cmdlet.
> Example 2. Removing Backups from Disk with Specified Names [Using Pipeline]

Get-VBRBackup -Name *2012 | Remove-VBRBackup -FromDisk
This example shows how to remove the backups with names ending with 2012 from disk.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRBackup cmdlet. Provide the FromDisk parameter.
> Example 3. Removing Backup from Disk [Using Variable]

$backup = Get-VBRBackup -Name "Backups"
Remove-VBRBackup -Backup $backup -FromDisk
This example shows how to delete backups from disk.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Remove-VBRBackup cmdlet. Set the $backup variable as the Backup parameter value. Provide the FromDisk parameter.
> Example 4. Removing Backups from Capacity Extents

$backup = Get-VBRSOBRObjectStorageBackup -CapacityTier
Remove-VBRBackup -Backup $backup -FromDisk
This example shows how to delete backups from capacity extents of a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRSOBRObjectStorageBackup cmdlet. Provide the CapacityTier parameter value. Save the result to the $backup variable.
2. Run the Remove-VBRBackup cmdlet. Set the $backup variable as the Backup parameter value. Provide the FromDisk parameter.
> Example 5. Removing Backups from Archive Extents

$backup = Get-VBRSOBRObjectStorageBackup -ArchiveTier
Remove-VBRBackup -Backup $backup -FromDisk
This example shows how to delete backups from archive extents of a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRSOBRObjectStorageBackup cmdlet. Provide the ArchiveTier parameter value. Save the result to the $backup variable.
2. Run the Remove-VBRBackup cmdlet. Set the $backup variable as the Backup parameter value. Provide the FromDisk parameter.

---

### Parameters
#### **Backup**
Specifies the array of backups you want to remove.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **FromDBIfSPUnavailable**
Defines that the cmdlet will remove backups from a database if a cloud provider is not available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FromDisk**
Defines that the cmdlet will delete backups from disk. If you do not provide this parameter, the cmdlet will delete only the information about the backups.
Note: You must provide this parameter to remove backups from archive extents and capacity extents.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IncludeGFS**
Defines that the cmdlet will remove backups with GFS flags (weekly, monthly and yearly).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Veeam.Backup.Core.CBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRBackup [-Backup] <CBackup[]> [-FromDBIfSPUnavailable] [-FromDisk] [-IncludeGFS] [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
