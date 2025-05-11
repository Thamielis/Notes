Add-VBRvCloudJob
----------------

### Synopsis
Creates a Cloud Director backup job.

---

### Description

This cmdlet creates a new Cloud Director backup job.
You should always use Cloud Director backup jobs to back up VMs managed by Cloud Director. If you back up VMs managed by Cloud Director using a regular backup job, Veeam Backup & Replication will perform backup at the level of the underlying vCenter Server and will not capture vApp metadata. As a result, it will not let you restore a fully functioning VM to Cloud Director.

Note that when you create a backup job, you need to run it manually unless you enable a job schedule.

Run the Start-VBRJob cmdlet to start the created job. Run the Set-VBRJobSchedule cmdlet to set schedule for the job.

---

### Related Links
* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1

$vm = Find-VBRvCloudEntity -Name "vCloud Server"
$brepository = Get-VBRBackupRepository -Name "Backups Vol2"
Add-VBRvCloudJob -Entity $vm -Name "vCD Backup Job" -BackupRepository $brepository -Description "Cloud Director Backup Job"
This example shows how to create a new Cloud Director backup job.

Perform the following steps:
1. Run the Find-VBRvCloudEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $brepository variable.
3. Run the Add-VBRvCloudJob cmdlet. Specify the following settings:
- Set the $vm variable as the Entity parameter value.
- Specify the Name parameter value.
- Set the $brepository variable as the BackupRepository parameter value.
- Specify the Description parameter value.
> Example 2

Find-VBRvCloudEntity -Name "vCloud Server" | Add-VBRvCloudJob -Name "vCD Backup Job 2" -Description "Cloud Director Backup Job"
This example shows how to create a new Cloud Director backup job. The target is the default backup repository.

Perform the following steps:
1. Run the Find-VBRvCloudEntity cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Add-VBRvCloudJob cmdlet. Specify the Name and the Description parameter values.

---

### Parameters
#### **BackupRepository**
Specifies the target backup repository.
Default: default backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Description**
Specifies the description of the new Cloud Director backup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Entity**
Specifies the array of VMs.
The cmdlet will add these VMs to the Cloud Director backup job.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[IVcdItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the Cloud Director backup job.

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
Veeam.Backup.Core.Infrastructure.IVcdItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRvCloudJob [-BackupRepository <CBackupRepository>] [-Description <String>] -Entity <IVcdItem[]> [-HighPriority] [-Name <String>] [-TargetBackup <CBackup>] [<CommonParameters>]
```
