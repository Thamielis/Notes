Add-VBRViBackupCopyJob
----------------------

### Synopsis
Creates a VMware backup copy job.

---

### Description

This cmdlet creates a new VMware backup copy job.

The backup copy job is copying backup files from the source backup repository to the target backup repository. The backup copy job runs continuously synchronizing the backup repositories in user-defined time periods.

To set the VM(s) or VM containers as source to the job, you can use the following source to browse to VMs:    From infrastructure: use the Entity parameter to get the VMs.    From backup: use the Backup parameter to select the VMs from available backup files.    From jobs: use the BackupJob parameter to select the VMs from available backup jobs. In this case the Backup Copy job will process all VMs added to the source backup job.

The cmdlet provides two scenarios that can be used for on-site and off-site modes:

To transfer the data efficiently to to the off-site location, you can use the WAN accelerator technology. WAN accelerator is a backup infrastructure component that optimizes file transfer via WAN by means of data deduplication. The role of a WAN accelerator can be assigned to a dedicated Windows-based machine (physical or virtual). You should always use a pair of WAN accelerators set on source and target sides. This mode is recommended for off-site backups. To create and run a backup copy job using WAN accelerators you need to have source and target WAN accelerators created.

Run Add-VBRWANAccelerator to create a WAN accelerator. WAN optimization is available only in Veeam Backup & Replication Enterprise Plus Edition.

You can create a backup copy job using direct operation. With this method, the job sends the data directly to the target backup repository without performing data deduplication. This mode is recommended for on-site backups, or off-site backups using fast connections.

Note that the backup copy job is created in disabled state. Run Enable-VBRJob to start the job running on the defined schedule.

Starting from Veeam Backup & Replication version 9.5 Update 3, the cmdlet checks if the data of the VMs added to the job changes its geographical location. NOTE: The cmdlet will not run if the geographical location of the VMs added to the job and the job target repository location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Examples
> Example 1

```PowerShell
Add-VBRViBackupCopyJob -SourceAccelerator $wansource -TargetAccelerator $wantarget -Name CopyJob1 -Entity $vms -Repository $repository
This command creates a backup copy job named "CopyJob1" with the following parameters: - The source and target WAN accelerators are obtained with Get-VBRWANAccelerator and assigned to $wansource and $wantarget variables accordingly beforehand,

- The  VMs to copy are obtained with Find-VBRViEntity and assigned to the $vms variable beforehand,

- The repository to where the VM data will be copied is obtained with Get-VBRBackupRepository and assigned to the $repository variable beforehand.
```
> Example 2

```PowerShell
Get-VBRBackup -Name "DC Backup" | Add-VBRViBackupCopyJob -DirectOperation -Name "DC CopyJob"
This command creates a direct backup copy job with the following parameters: - The name of the job is "DC CopyJob",

- The backup job named "DC Backup" with the VMs to be copied is obtained with Get-VBRBackup and piped down,

- The -Repository parameter is not set to copy the VMs to the default backup repository.
```

---

### Parameters
#### **Backup**
Specifies the existing backup(s) to set the VMs you want to copy.  You can assign multiple backups to this object.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[CBackup[]]`|false   |named   |True (ByPropertyName)|

#### **BackupJob**
Specifies the existing backup job(s) to set the VMs you want to copy.  You can assign multiple backup jobs to this object.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies the description of the backup copy job.  If not set, Veeam Backup & Replication will enter date and time of creation by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DirectOperation**
Enables direst operation method sending the data directly to the target backup repository without performing data deduplication. If you select the direct operation mode, the -TargetAccelerator and -SourceAccelerator parameters should be omitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **EnableImmediateCopy**
Defines that the cmdlet will enable the immediate copy mode. If you specify this parameter, Veeam Backup & Replication will copy new restore points and logs as soon as they appear. Otherwise, Veeam Backup & Replication will copy data from backups once per backup copy interval.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies the VM you want to copy. You can assign multiple VMs to this object.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[IViItem[]]`|false   |named   |True (ByPropertyName)|

#### **Force**
Indicates that the cmdlet will create a job even if the geographical location of the VMs added to the job and the target backup repository location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the backup copy job. You can input string up to 255 symbols.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies the backup repository to where you want to copy the VM data.  If not set, Veeam Backup & Replication will use the default backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **SourceAccelerator**
Specifies the WAN accelerator on the source side. If you select the mode using WAN accelerators, the -DirectOperation parameter should be omitted.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|true    |named   |False        |

#### **SourceRepository**
Specifies an array of source backup repositories. Accepts the CBackupRepository[] object. To create this object, run the Get-VBRBackupRepository cmdlet.

|Type                   |Required|Position|PipelineInput        |
|-----------------------|--------|--------|---------------------|
|`[CBackupRepository[]]`|false   |named   |True (ByPropertyName)|

#### **TargetAccelerator**
Specifies the WAN accelerator on the target side. If you select the mode using WAN accelerators, the -DirectOperation parameter should be omitted.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Infrastructure.IViItem[]

Veeam.Backup.Core.CBackup[]

Veeam.Backup.Core.CBackupJob[]

Veeam.Backup.Core.CBackupRepository[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRViBackupCopyJob [-Backup <CBackup[]>] [-BackupJob <CBackupJob[]>] [-Description <String>] -DirectOperation [-EnableImmediateCopy] [-Entity <IViItem[]>] [-Force] [-Name <String>] [-Repository 
```
```PowerShell
<CBackupRepository>] [-SourceRepository <CBackupRepository[]>] [<CommonParameters>]
```
```PowerShell
Add-VBRViBackupCopyJob [-Backup <CBackup[]>] [-BackupJob <CBackupJob[]>] [-Description <String>] [-EnableImmediateCopy] [-Entity <IViItem[]>] [-Force] [-Name <String>] [-Repository <CBackupRepository>] 
```
```PowerShell
-SourceAccelerator <CWanAccelerator> [-SourceRepository <CBackupRepository[]>] [-TargetAccelerator <CWanAccelerator>] [<CommonParameters>]
```
