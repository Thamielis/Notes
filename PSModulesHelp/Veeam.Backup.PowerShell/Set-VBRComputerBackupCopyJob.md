Set-VBRComputerBackupCopyJob
----------------------------

### Synopsis
Modifies Veeam Agent backup copy jobs.

---

### Description

This cmdlet modifies Veeam Agent backup copy jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerBackupCopyJob](Get-VBRComputerBackupCopyJob)

* [New-VBRBackupWindowOptions](New-VBRBackupWindowOptions)

---

### Examples
> Modifying Backup Window Settings for Veeam Agent Backup Copy Job

$job = Get-VBRComputerBackupCopyJob -Name "Windows Copy Job05"
$windowoptions = New-VBRBackupWindowOptions -FromDay Monday -FromHour 08 -ToDay Friday -ToHour 20
Set-VBRComputerBackupCopyJob -Job $job -BackupWindowOptions $windowoptions
The following example shows how to modify backup window settings for a Veeam Agent Backup Copy job.
Perform the following steps:
1. Run the Get-VBRComputerBackupCopyJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRBackupWindowOptions cmdlet. Specify the necessary parameters. Save the result to the $windowoptions variable.
3. Run the Set-VBRComputerBackupCopyJob cmdlet. Set the $job variable as the Job parameter value. Set the $windowoptions variable as the BackupWindowOptions parameter value.

---

### Parameters
#### **AnyTime**
Defines that Veeam Backup & Replication will run a Veeam Agent backup copy job at any time according to its schedule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Backup**
Specifies an array of backups. The cmdlet will add machines from these backups to a Veeam Agent backup copy.
Note: This parameter is available for a Veeam Agent backup copy job that is created with the periodic backup copy mode.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **BackupJob**
Specifies an array of backup jobs. The cmdlet will add machines processed by these jobs to a Veeam Agent backup copy job.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRComputerBackupJob[]]`|false   |named   |True (ByPropertyName)|

#### **BackupWindowOptions**
Specifies backup window settings for a Veeam Agent backup copy job. The cmdlet will create the job with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Description**
Specifies a description of a Veeam Agent backup copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DirectOperation**
Defines that the cmdlet will create a Veeam Agent backup copy job that will transfer data directly from the source backup repository to the target backup repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableTransactionLogCopy**
Defines that the Veeam Agent backup copy job will process transaction logs of the source job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify Veeam Agent backup copy jobs without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GFSOptions**
Specifies a GFS retention. The cmdlet will create Veeam Agent backup copy job with the specified policy.
Note: This option is not available for Veeam Agent policies.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRComputerGFSOptions]`|false   |named   |False        |

#### **HealthCheckOptions**
Specifies the health check schedule for a Veeam Agent backup copy job. The cmdlet will create the job with these settings.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRHealthCheckOptions]`|false   |named   |False        |

#### **Job**
Specifies a Veeam Agent backup copy job that you want to modify.

|Type                        |Required|Position|PipelineInput |
|----------------------------|--------|--------|--------------|
|`[VBRComputerBackupCopyJob]`|true    |named   |True (ByValue)|

#### **Name**
Specifies a name that you want to assign to a Veeam Agent backup copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings for a Veeam Agent backup copy job. The cmdlet will create the job with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **RecoveryPointObjective**
Specifies a schedule for a Veeam Agent backup copy job with the periodic backup copy mode.
The cmdlet will create the job with these settings.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRRecoveryPointObjective]`|false   |named   |False        |

#### **Repository**
Specifies the backup repository. The cmdlet will copy the machine data to this repository.
Default: Default backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RetentionNumber**
For the RetentionType set to the RestoreDays property.
Specifies a number of days for which you want to store backup files in the target location.
Default: 7 days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionPolicy**
Specifies a retention policy for a Veeam Agent backup copy job. The cmdlet will create the job with these settings. You can specify the following types of retention policies:
* Simple retention policy: use this option for short-time archiving. To create a job with this type of the policy, provide the VBRSimpleRetentionPolicy object. Run the New-VBRSimpleRetentionPolicy cmdlet to create this object.
* GFS retention policy: use this option for long-term archiving. To create a job with this type of the policy, provide the VBRRetentionPolicy object. Run the New-VBRGFSRetentionPolicy cmdlet to create this object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRRetentionPolicy]`|false   |named   |False        |

#### **RetentionType**
Specifies retention type for Veeam Agent copy jobs managed by the Veeam Backup server. You can specify one of the following types:
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
Default: 1 hour.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRRpoNotificationOption[]]`|false   |named   |False        |

#### **ScriptOptions**
Specifies pre-job and post-job script options for a Veeam Agent backup copy job. The cmdlet will create the job with these settings.

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
Specifies the storage settings of the backup repository. The cmdlet will create the Veeam Agent backup copy job with these settings.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRBackupCopyJobStorageOptions]`|false   |named   |False        |

#### **TargetAccelerator**
Specifies the WAN accelerator on the target side.
Remember to set the pair of source and target WAN accelerators.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerBackupCopyJob

Veeam.Backup.Core.CBackup[]

Veeam.Backup.PowerShell.Infos.VBRComputerBackupJob[]

Veeam.Backup.Core.CBackupRepository[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerBackupCopyJob [-AnyTime] [-Backup <CBackup[]>] [-BackupJob <VBRComputerBackupJob[]>] [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] [-DirectOperation] 
```
```PowerShell
[-EnableTransactionLogCopy] [-Force] [-GFSOptions <VBRComputerGFSOptions>] [-HealthCheckOptions <VBRHealthCheckOptions>] -Job <VBRComputerBackupCopyJob> [-Name <String>] [-NotificationOptions 
```
```PowerShell
<VBRNotificationOptions>] [-RecoveryPointObjective <VBRRecoveryPointObjective>] [-Repository <CBackupRepository>] [-RetentionNumber <Int32>] [-RetentionPolicy <VBRRetentionPolicy>] [-RetentionType 
```
```PowerShell
{RestorePoints | RestoreDays}] [-RPOWarningOptions <VBRRpoNotificationOption[]>] [-ScriptOptions <VBRJobScriptOptions>] [-SourceAccelerator <CWanAccelerator>] [-SourceRepository <CBackupRepository[]>] 
```
```PowerShell
[-StorageOptions <VBRBackupCopyJobStorageOptions>] [-TargetAccelerator <CWanAccelerator>] [<CommonParameters>]
```
