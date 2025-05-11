Add-VBREpBackupCopyJob
----------------------

### Synopsis
Creates backup copy jobs for Endpoint backups.

---

### Description

This cmdlet creates a backup copy job for Endpoint backups. Note that the backup copy job is created in disabled state. Run Enable-VBRJob to start the job running on the defined schedule.

---

### Examples
> Example 1

```PowerShell
$EPbackup = Get-VBRBackup -Name "Backup Job Mediaserver"
$repository = Get-VBRBackupRepository -Name "WinLocal"
Add-VBREpBackupCopyJob -Name "Mediaserver Endpoint Backup Copy" -Description "Mediaserver Endpoint Backup Copy Job" -Backup $EPbackup -DirectOperation -Repository $repository
This command creates a backup copy job with the direct data transfer. Run Get-VBRBackup to get the source backup and save it to the $EPbackup variable. Run Get-VBRBackupRepository to get the repository and save it to the $repository variable. Run Add-VBREPBackupCopyJob with the $EPbackup and $repository variables. Use the -DirectOperation parameter.
```
> Example 2

```PowerShell
$EPbackup = Get-VBRBackup -Name "Backup Job Mediaserver"
$repository = Get-VBRBackupRepository -Name "WinLocal"
$wansource = Get-VBRWANAccelerator -Name "Backup WAN Sydney"
$wantarget = Get-VBRWANAccelerator -Name "Backup WAN London"
Add-VBREPBackupCopyJob -Name "Mediaserver Endpoint Backup Copy" -Description "Mediaserver Endpoint Backup Copy Job" -Repository $repository -SourceAccelerator $wansource -TargetAccelerator $wantarget
This command creates a backup copy job using WAN accelerators. Run Get-VBRBackup to get the source backup and save it to the $EPbackup variable. Run Get-VBRBackupRepository to get the repository and save it to the $repository variable. Run Get-VBRWANAccelerator to get a source and a target Wan accelerators. Save them to the $wansource and $wantarget variables accordingly.
```

---

### Parameters
#### **Backup**
Specifies the array of Endpoint backups you want to copy.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **BackupJob**
Specifies the Veeam Agent for Microsoft Windows backup job. The cmdlet will add this job to a backup copy job.

|Type          |Required|Position|PipelineInput        |
|--------------|--------|--------|---------------------|
|`[VBREPJob[]]`|false   |named   |True (ByPropertyName)|

#### **Description**
Specifies the description of the backup copy job.  If not set, Veeam Backup & Replication will enter date and time of creation by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DirectOperation**
Used for the direct data transfer. Enables direct data transfer sending the data directly to the target backup repository without performing data deduplication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **EnableImmediateCopy**
Defines that the cmdlet will enable the immediate copy mode. If you specify this parameter, Veeam Backup & Replication will copy new restore points and logs as soon as they appear. Otherwise, Veeam Backup & Replication will copy data from backups once per backup copy interval.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will create backup copy jobs without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the backup copy job. You can input string up to 255 symbols. If not set, Veeam Backup & Replication will assign a default backup copy job name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **OSPlatform**
Specifies the OS of the  computers where <%VA%> will operate: ·	Windows: for Windows computers.
·	Linux: for Linux computers.
·	Mac: for macOS computers.
·	Unix: for Unix computers.
Valid Values:

* Windows
* Linux
* Mac
* Unix

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRAgentType]`|true    |named   |False        |

#### **Repository**
Specifies the backup repository to where you want to copy the data. Accepts the backup repository object or string type (repository name). Default: default backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **SourceAccelerator**
Used for the data transfer using WAN accelerators. Specifies the WAN accelerator on the source side. Remember to set the pair of source and target WAN accelerators.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|true    |named   |False        |

#### **SourceRepository**
Specifies an array of source backup repositories. Accepts the CBackupRepository[] object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                   |Required|Position|PipelineInput        |
|-----------------------|--------|--------|---------------------|
|`[CBackupRepository[]]`|false   |named   |True (ByPropertyName)|

#### **TargetAccelerator**
Used for the data transfer using WAN accelerators. Specifies the WAN accelerator on the target side. Remember to set the pair of source and target WAN accelerators.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackup[]

Veeam.Backup.PowerShell.Infos.VBREPJob[]

Veeam.Backup.Core.CBackupRepository[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBREpBackupCopyJob [-Backup <CBackup[]>] [-BackupJob <VBREPJob[]>] [-Description <String>] -DirectOperation [-EnableImmediateCopy] [-Force] [-Name <String>] -OSPlatform {Windows | Linux | Mac | Unix} 
```
```PowerShell
[-Repository <CBackupRepository>] [-SourceRepository <CBackupRepository[]>] [<CommonParameters>]
```
```PowerShell
Add-VBREpBackupCopyJob [-Backup <CBackup[]>] [-BackupJob <VBREPJob[]>] [-Description <String>] [-EnableImmediateCopy] [-Force] [-Name <String>] -OSPlatform {Windows | Linux | Mac | Unix} [-Repository 
```
```PowerShell
<CBackupRepository>] -SourceAccelerator <CWanAccelerator> [-SourceRepository <CBackupRepository[]>] [-TargetAccelerator <CWanAccelerator>] [<CommonParameters>]
```
