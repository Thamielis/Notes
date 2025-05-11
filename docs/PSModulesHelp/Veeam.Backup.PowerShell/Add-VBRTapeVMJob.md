Add-VBRTapeVMJob
----------------

### Synopsis
Creates a new backup to tape copy job.

---

### Description

This cmdlet creates a new job that copies VM backups to tape. To be able to create a backup to tape copy job, you need to have existing backups available.

You can copy VM backups in two ways:

From backup jobs: the tape job looks for backup files that have been produced by the specified backup job from the moment of the last tape job run,

From backup repository: the tape job looks for all VM backups that have written to the specified backup repository from the moment of the last tape job run.

Note that when you create a copy job, you need to run it manually.

Run Start-VBRJob to start the created job.

---

### Examples
> Example 1

```PowerShell
Get-VBRJob -Name "CRM Backup" | Add-VBRTapeVMJob -Name "CRM Backup Copy to Tape" - MediaPool $full -MediaPoolIncremental $increment -Description "CRM Backup Copy to Tape"
This command creates a job named "CRM Backup Copy to Tape" copying files from the backup job named "CRM Backup" to tape. The backup job is obtained with Get-VBRJob and piped down. The target media pools for full backups and incremental backups are obtained with Get-VBRTapeMediaPool and assigned to $full and $increment variables beforehand accordingly. The job description is "CRM Backup Copy to Tape".
```
> Example 2

```PowerShell
Get-VBRBackupRepository -Name "Local Repository 01" | Add-VBRTapeVMJob -Name "Local Backup Copy to Tape" - MediaPool $full -DisableIncremental -HardwareCompression
This command creates a job named "Local Backup Copy to Tape" copying files from the backup repository named "Local Repository 01" to tape. The backup repository is obtained with Get-VBRBackupRepository and piped down. The target media pools for full backups is obtained with Get-VBRTapeMediaPool and assigned to $full variable beforehand. The incremental backups are not written to tape. The hardware compression option is enabled.
```

---

### Parameters
#### **BackupJob**
Specifies the backup job you want to use as the source for the VM backups.  You can assign multiple backup jobs to this object.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies the description of the new VM to tape copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DisableIncremental**
If set, the tape job will copy only the full backup files. Otherwise, the incremental backups will be written to the media pool set in the -MediaPoolIncremental. Please be careful to set this parameter in case you do not  want to store the incremental backups on tape. If it is not set, the incremental backups will be written to the media pool you set for the full backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HardwareCompression**
Enables hardware compression option. Please note that if you plan to use hardware compression when recording backups to tape, consider that although it decreases traffic, this option affects performance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MediaPool**
Specifies the target media pool you want to use for full backups. You can input string up to 255 symbols.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CTapeMediaPool]`|true    |named   |False        |

#### **MediaPoolIncremental**
Specifies the target media pool you want to use for incremental backups.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CTapeMediaPool]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the VM to tape copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies the source backup repository you want to use as the source for the VM backups. You can assign multiple backup repositories to this object.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[CBackupRepository[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CBackupRepository[]

Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRTapeVMJob [-BackupJob <CBackupJob[]>] [-Description <String>] [-DisableIncremental] [-HardwareCompression] -MediaPool <CTapeMediaPool> [-MediaPoolIncremental <CTapeMediaPool>] [-Name <String>] 
```
```PowerShell
[-Repository <CBackupRepository[]>] [<CommonParameters>]
```
