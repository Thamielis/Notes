Add-VBRHvBackupJob
------------------

### Synopsis
Creates Hyper-V backup jobs.

---

### Description

Creates Hyper-V backup jobs.

Note that when you create a backup job, you need to run it manually unless you enable a job schedule.

Run the Start-VBRJob cmdlet to run the job manually.

Run the Set-VBRJobSchedule cmdlet to set schedule for the job.

NOTE: The cmdlet will not run if the geographic location of the VMs added to the job and the job target repository location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Find-VBRHvEntity](Find-VBRHvEntity)

---

### Examples
> Example 1. Creating Backup Job [Using Pipeline]

$Repository = Get-VBRBackupRepository
Find-VBRHvEntity -Name Exchange* | Add-VBRHvBackupJob -Name "Exchange Backup" -BackupRepository $Repository -Description "Hyper-V Exchange Backup"
This example shows how to create a backup job named Exchange Backup.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Save the result to the $Repository variable.
2. Run the Find-VBRHvEntity cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Add-VBRHvBackupJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Specify the Description parameter value.
- Set the $Repository variable as the BackupRepository parameter value.
> Example 2. Creating Backup Job [Using Variable]

$Repository = Get-VBRBackupRepository
$Vm = Find-VBRHvEntity
Add-VBRHvBackupJob -BackupRepository $Repository -Entity $Vm
This example shows how to create a backup job for the VM represented by the $Vm variable.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Save the result to the $Repository variable.
2. Run the Find-VBRHvEntity cmdlet. Save the result to the $Vm variable.
3. Run the Add-VBRHvBackupJob cmdlet. Set the $Repository variable as the BackupRepository parameter value. Set the $Vm variable as the Entity parameter value.

---

### Parameters
#### **BackupRepository**
Specifies the backup repository where the created backup will be stored. Default: default backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Description**
Specifies the description of the backup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Entity**
Specifies the array of Hyper-V VMs you want to add to the job.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IHvItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will create a backup job even if the geographic location of the VMs added to the job and the target backup repository location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the backup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetBackup**
WARNING! THIS PARAMETER IS INTERNAL.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CBackup]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.HyperV.Infrastructure.IHvItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRHvBackupJob [-BackupRepository <CBackupRepository>] [-Description <String>] -Entity <IHvItem[]> [-Force] [-HighPriority] [-Name <String>] [-TargetBackup <CBackup>] [<CommonParameters>]
```
