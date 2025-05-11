Set-VBRBackupCopyJob
--------------------

### Synopsis
Modifies backup copy jobs.

---

### Description

This cmdlet modifies Veeam Agent backup copy jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRBackupCopyJob](Get-VBRBackupCopyJob)

* [New-VBRBackupWindowOptions](New-VBRBackupWindowOptions)

---

### Examples
> Modifying Backup Window Settings for Backup Copy Job

$job = Get-VBRBackupCopyJob -Name "Copy Job05"
$windowoptions = New-VBRBackupWindowOptions -FromDay Monday -FromHour 08 -ToDay Friday -ToHour 20
Set-VBRBackupCopyJob  -Job $job -BackupWindowOptions $windowoptions
This example shows how to modify backup window settings for a backup copy job named Copy Job05.
Perform the following steps:
1. Run the Get-VBRBackupCopyJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRBackupWindowOptions cmdlet. Specify the FromDay, FromHour, ToDay and ToHour parameter values. Save the result to the $windowoptions variable.
3. Run the Set-VBRBackupCopyJob cmdlet. Set the $job variable as the Job parameter value. Set the $windowoptions variable as the BackupWindowOptions parameter value.

---

### Parameters
#### **AnyTime**
Defines that Veeam Backup & Replication will run a backup copy job at any time according to its schedule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Backup**
Specifies an array of backups. The cmdlet will add these backups as source to the backup copy job.
You can specify only the array of the following backups:
* EC2 instance backups.
* Azure backups.
* Google Cloud VM instance backups.

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[VBRBackup[]]`|false   |named   |True (ByPropertyName)|

#### **BackupJob**
Specifies an array of backup jobs. The cmdlet will add backups processed by these jobs to this backup copy job.

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
|`[Switch]`|false   |named   |False        |

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
Defines that the job will start even if original and target computer locations do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies an array of backup copy jobs that you want to modify.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[VBRBackupCopyJob]`|true    |named   |True (ByValue)|

#### **Mode**
Specifies a backup copy job mode: Periodic or Immediate.
Valid Values:

* Periodic
* Immediate

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRBackupCopyJobMode]`|false   |named   |False        |

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
|`[CWanAccelerator]`|false   |named   |False        |

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
Veeam.Backup.PowerShell.Infos.VBRBackupCopyJob

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
Set-VBRBackupCopyJob [-AnyTime] [-Backup <VBRBackup[]>] [-BackupJob <CBackupJob[]>] [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] [-DirectOperation] [-EnableTransactionLogCopy] 
```
```PowerShell
[-GFSOptions <VBRComputerGFSOptions>] [-HealthCheckOptions <VBRHealthCheckOptions>] [-IgnoreLocation] -Job <VBRBackupCopyJob> [-Mode {Periodic | Immediate}] [-Name <String>] [-NotificationOptions 
```
```PowerShell
<VBRNotificationOptions>] [-ProcessLatestAvailablePoint] [-RetentionNumber <Int32>] [-RetentionType {RestorePoints | RestoreDays}] [-RPOWarningOptions <VBRRpoNotificationOption[]>] [-ScheduleOptions 
```
```PowerShell
<VBRServerScheduleOptions>] [-ScriptOptions <VBRJobScriptOptions>] [-SourceAccelerator <CWanAccelerator>] [-SourceRepository <CBackupRepository[]>] [-StorageOptions <VBRBackupCopyJobStorageOptions>] 
```
```PowerShell
[-TargetAccelerator <CWanAccelerator>] [-TargetBackup <CBackup>] [-TargetRepository <CBackupRepository>] [<CommonParameters>]
```
