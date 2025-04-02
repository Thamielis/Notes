Add-VBRBackupCopyJob
--------------------

### Synopsis
Creates a backup copy job.

---

### Description

This cmdlet creates a new backup copy job.
You can use backups, backup jobs, repositories or backup infrastructure as a source for the backup copy job.
You can transfer data in the following ways:
- Using WAN accelerators. This mode is recommended for off-site backups.
To create and run a backup copy job using WAN accelerators you need to have source and target WAN accelerators created. Run the Add-VBRWANAccelerator cmdlet to create a WAN accelerator. WAN optimization is available only in Veeam Backup & Replication Enterprise Plus, Veeam Universal License Edition.
- Directly. With this method, the job sends the data directly to the target backup repository without performing data deduplication. This mode is recommended for on-site backups, or off-site backups using fast connections.
Use an appropriate parameter set for each way.

---

### Related Links
* [Get-VBRWANAccelerator](Get-VBRWANAccelerator)

---

### Examples
> Example 1. Creating Backup Copy Job Which Transfers Data Directly

```PowerShell
Add-VBRBackupCopyJob -Mode Immediate -DirectOperation -Name CopyJob1
This command creates a backup copy job that will transfer data directly.
```
> Example 2. Creating Backup Copy Job Which Transfers Data Using WAN Accelerators

$wansource = Get-VBRWANAccelerator
$wantarget = Get-VBRWANAccelerator
Add-VBRBackupCopyJob -Mode Immediate -SourceAccelerator $wansource -TargetAccelerator $wantarget -Name CopyJob1
This example shows how to create a backup copy job that will transfer data over WAN accelerators.
Perform the following steps:
1. Run the Get-VBRWANAccelerator cmdlet. Save the result to the $wansource variable.
2. Run the Get-VBRWANAccelerator cmdlet. Save the result to the $wantarget variable.
3. Run the Add-VBRBackupCopyJob cmdlet. Specify the following settings:
- Set the Immediate value as the Mode parameter value.
- Set the $wansource variable as the SourceAccelerator parameter value.
- Set the $wansource variable as the TargetAccelerator parameter value.
- Specify the Name parameter value.

---

### Parameters
#### **Backup**
Specifies the array of backups. The cmdlet will add these backups as source to the backup copy job.
You can specify only the array of the following backups:
* EC2 instance backups.
* Azure backups.
* Google Cloud VM instance backups.

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[VBRBackup[]]`|false   |named   |True (ByPropertyName)|

#### **BackupJob**
Specifies an array of jobs. The cmdlet will add these jobs as source to the backup copy job.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CBackupJob[]]`|false   |named   |True (ByPropertyName)|

#### **BackupWindowOptions**
Specifies a time interval within which a backup copy job can start.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Description**
Specifies a description for a backup copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DirectOperation**
Defines that a backup copy job will send  the data directly to the target backup repository without performing data deduplication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **EnableTransactionLogCopy**
Defines that a backup copy job will process transaction logs of the source job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GFSOptions**
Specifies a GFS retention. The cmdlet will create a backup copy job with the specified policy.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRComputerGFSOptions]`|false   |named   |False        |

#### **HealthCheckOptions**
Specifies the healthcheck schedule. The cmdlet will create a file backup job with this healthcheck schedule.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRHealthCheckOptions]`|false   |named   |False        |

#### **IgnoreLocation**
Defines that the job will be created even if original and target computer locations do not match.
If you do not specify this parameter and locations are different, the job will not start.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Mode**
Specifies a backup copy job mode: Periodic or Immediate.
Valid Values:

* Periodic
* Immediate

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRBackupCopyJobMode]`|true    |named   |False        |

#### **Name**
Specifies the name you want to assign to the backup copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification options of a backup copy job.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **ProcessLatestAvailablePoint**
Defines that the most recent restore point will be processed instead of waiting for the most current backup file to become available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RetentionNumber**
For the RetentionType set to the RestoreDays property.
Specifies a number of days for which you want to store backup files in the target location.
Default: 7 days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionType**
Specifies the retention type for a backup copy job managed by the Veeam Backup server. You can specify one of the following types:
* RestorePoints
* RestoreDays
Valid Values:

* RestorePoints
* RestoreDays

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRRetentionType]`|false   |named   |False        |

#### **RPOWarningOptions**
Specifies an array of the number of hours when data must be copied from the source repository to the target repository.
Default: 1.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRRpoNotificationOption[]]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies schedule options. The cmdlet will create a backup job with these schedule options.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRServerScheduleOptions]`|false   |named   |False        |

#### **ScriptOptions**
Specifies pre-job and post-job script options for a backup copy job. The cmdlet will create the job with these settings.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|false   |named   |False        |

#### **SourceAccelerator**
Specifies the WAN accelerator on the source side.
Remember to set the pair of source and target WAN accelerators.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|true    |named   |False        |

#### **SourceRepository**
Specifies an array of source backup repositories.

|Type                   |Required|Position|PipelineInput        |
|-----------------------|--------|--------|---------------------|
|`[CBackupRepository[]]`|false   |named   |True (ByPropertyName)|

#### **StorageOptions**
Specifies the storage settings of the backup repository. The cmdlet will create a backup copy job with these settings.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRBackupCopyJobStorageOptions]`|false   |named   |False        |

#### **TargetAccelerator**
Specifies the WAN accelerator on the target side.
Remember to set the pair of source and target WAN accelerators.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

#### **TargetBackup**
WARNING! THIS PARAMETER IS INTERNAL.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CBackup]`|false   |named   |False        |

#### **TargetRepository**
Specifies a target backup repository. The cmdlet will copy backups to this repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRBackup[]

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
Add-VBRBackupCopyJob [-Backup <VBRBackup[]>] [-BackupJob <CBackupJob[]>] [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] -DirectOperation [-EnableTransactionLogCopy] [-GFSOptions 
```
```PowerShell
<VBRComputerGFSOptions>] [-HealthCheckOptions <VBRHealthCheckOptions>] [-IgnoreLocation] -Mode {Periodic | Immediate} [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] 
```
```PowerShell
[-ProcessLatestAvailablePoint] [-RetentionNumber <Int32>] [-RetentionType {RestorePoints | RestoreDays}] [-RPOWarningOptions <VBRRpoNotificationOption[]>] [-ScheduleOptions <VBRServerScheduleOptions>] 
```
```PowerShell
[-ScriptOptions <VBRJobScriptOptions>] [-SourceRepository <CBackupRepository[]>] [-StorageOptions <VBRBackupCopyJobStorageOptions>] [-TargetBackup <CBackup>] [-TargetRepository <CBackupRepository>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Add-VBRBackupCopyJob [-Backup <VBRBackup[]>] [-BackupJob <CBackupJob[]>] [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] [-EnableTransactionLogCopy] [-GFSOptions <VBRComputerGFSOptions>] 
```
```PowerShell
[-HealthCheckOptions <VBRHealthCheckOptions>] [-IgnoreLocation] -Mode {Periodic | Immediate} [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-ProcessLatestAvailablePoint] [-RetentionNumber 
```
```PowerShell
<Int32>] [-RetentionType {RestorePoints | RestoreDays}] [-RPOWarningOptions <VBRRpoNotificationOption[]>] [-ScheduleOptions <VBRServerScheduleOptions>] [-ScriptOptions <VBRJobScriptOptions>] -SourceAccelerator 
```
```PowerShell
<CWanAccelerator> [-SourceRepository <CBackupRepository[]>] [-StorageOptions <VBRBackupCopyJobStorageOptions>] [-TargetAccelerator <CWanAccelerator>] [-TargetBackup <CBackup>] [-TargetRepository 
```
```PowerShell
<CBackupRepository>] [<CommonParameters>]
```
