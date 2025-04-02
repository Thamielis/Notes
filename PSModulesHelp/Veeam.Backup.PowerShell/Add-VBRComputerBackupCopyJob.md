Add-VBRComputerBackupCopyJob
----------------------------

### Synopsis
Creates Veeam Agent backup copy jobs.

---

### Description

This cmdlet creates Veeam Agent backup copy jobs.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRWANAccelerator](Get-VBRWANAccelerator)

* [Get-VBRBackup](Get-VBRBackup)

---

### Examples
> Example 1. Creating Veeam Agent Backup Copy Job to Transfer Data Directly

$repository = Get-VBRBackupRepository -Name Repository 05
$job = Get-VBRComputerBackupJob -Name "Agent backup job 05"
Add-VBRComputerBackupCopyJob -OSPlatform Windows -DirectOperation -Name "Agent Backup Copy 05" -BackupJob $job -Repository $repository
This example shows how to create a Veeam Agent backup copy job that will transfer data directly from the source backup repository to the target backup repository.

Perform the following steps:

1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.   2. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.   3. Run the Add-VBRComputerBackupCopyJob cmdlet. Specify the following settings:      o Specify the OSPlatform parameter value.       o Provide the DirectOperation parameter.      o Specify the Name parameter value.      o Set the $job variable as the BackupJob parameter value.      o Set the $repository variable as the Repository parameter value.
> Example 2. Creating Veeam Agent Backup Copy Job to Transfer Data over WAN Accelerators

$wansource = Get-VBRWANAccelerator -Name "WAN Source"
$wantarget = Get-VBRWANAccelerator -Name "WAN02 Target"
$backup = Get-VBRBackup -Name "Windows Server Backup"
$repository = Get-VBRBackupRepository -Name Repository 05
Add-VBRComputerBackupCopyJob -OSPlatform Windows -SourceAccelerator $wansource -TargetAccelerator $wantarget -Backup $backup -Repository $repository
This example shows how to create a Veeam Agent backup copy job that will transfer data over WAN accelerators.

Perform the following steps:

1. Run the Get-VBRWANAccelerator cmdlet. Specify the Name parameter value. Save the result to the $wansource variable.   2. Run the Get-VBRWANAccelerator cmdlet. Specify the Name parameter value. Save the result to the $wantarget variable   3. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.   4. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.   5. Run the Add-VBRComputerBackupCopyJob cmdlet. Specify the following settings:      o Specify the OSPlatform parameter value.

o Set the $wansource variable as the SourceAccelerator parameter value.      o Set the $wantarget variable as the TargetAccelerator parameter value.      o Set the $backup variable as the Backup parameter value.      o Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Backup**
Specifies an array of backups. The cmdlet will add VMs from these backups to a Veeam Agent backup copy. Accepts the CBackup[] object. To create this object, run the Get-VBRBackup cmdlet.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **BackupJob**
Specifies an array of backup jobs. The cmdlet will add VMs processed by these jobs to a Veeam Agent backup copy job. Accepts the VBRComputerBackupJob[] object. To create this object, run the Get-VBRComputerBackupJob cmdlet.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRComputerBackupJob[]]`|false   |named   |True (ByPropertyName)|

#### **BackupWindowOptions**
Specifies backup window settings for a Veeam Agent backup copy job. The cmdlet will create the job with these settings. Accepts the VBRBackupWindowOptions object. To create this object, run the New-VBRBackupWindowOptions cmdlet.

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
|`[Switch]`|true    |named   |False        |

#### **EnableImmediateCopy**
Defines that the cmdlet will enable the immediate copy mode. If you specify this parameter, Veeam Backup & Replication will copy new restore points and logs as soon as they appear. Otherwise, Veeam Backup & Replication will copy data from backups once per backup copy interval. Note: This parameter requires the BackupJob parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableTransactionLogCopy**
Defines that the Veeam Agent backup copy job will process transaction logs of the source job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will ADD INFO without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GFSOptions**
Specifies a GFS retention. The cmdlet will create Veeam Agent backup copy job with the specified policy. Note: This option is not available for Veeam Agent policies. Accepts the VBRComputerGFSOptions object. To get this object, run the New-VBRComputerGFSOptions cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRComputerGFSOptions]`|false   |named   |False        |

#### **HealthCheckOptions**
Specifies the healthcheck schedule for a Veeam Agent backup copy job. The cmdlet will create the job with these settings. Accepts the VBRFullBackupOptions object. To create this object, run the New-VBRFullBackupOptions cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRHealthCheckOptions]`|false   |named   |False        |

#### **Name**
Specifies a name that you want to assign to a Veeam Agent backup copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings for a Veeam Agent backup copy job. The cmdlet will create the job with these settings. Accepts the VBRNotificationOptions object. To create this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OSPlatform**
Specifies the OS of the protected computers:
o Linux   o Mac   o Unix   o Windows
Valid Values:

* Windows
* Linux
* Mac
* Unix

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRAgentType]`|true    |named   |False        |

#### **RecoveryPointObjective**
Specifies a schedule for a Veeam Agent backup copy job. The cmdlet will create the job with these settings. Accepts the VBRRecoveryPointObjective object. To create this object, run the Get-VBRRecoveryPointObjective cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRRecoveryPointObjective]`|false   |named   |False        |

#### **Repository**
Specifies the backup repository. The cmdlet will copy the VM data to this repository. Default: Default backup repository. Accepts the CBackupRepository object. To create this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RetentionNumber**
For the RetentionType set to the RestoreDays property. Specifies a number of days for which you want to store backup files in the target location. Default: 7 days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionPolicy**
Specifies a retention policy for a Veeam Agent backup copy job. The cmdlet will create the job with these settings. Accepts the VBRRetentionPolicy object. To create this object, run the Get-VBRRetentionPolicy cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRRetentionPolicy]`|false   |named   |False        |

#### **RetentionType**
Specifies retention type for Veeam Agent copy jobs managed by the Veeam Backup server. You can specify one of the following types:
· RestorePoints   · RestoreDays
Valid Values:

* RestorePoints
* RestoreDays

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRRetentionType]`|false   |named   |False        |

#### **RPOWarningOptions**
Specifies a number of hours when data must be copied from the source repository to the target repository. Default: 1. Accepts the VBRRPONotificationOptions object. To create this object, run the New-VBRRPONotificationOptions cmdlet.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRRpoNotificationOption[]]`|false   |named   |False        |

#### **ScriptOptions**
Specifies pre-job and post-job script options for a Veeam Agent backup copy job. The cmdlet will create the job with these settings. Accepts the VBRJobScriptOptions object. To create this object, run the New-VBRJobScriptOptions cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|false   |named   |False        |

#### **SourceAccelerator**
Specifies the WAN accelerator on the source side. Remember to set the pair of source and target WAN accelerators. Accepts the CWanAccelerator object. To create this object, run the Get-VBRWANAcceleratorcmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|true    |named   |False        |

#### **SourceRepository**
Specifies an array of source backup repositories.

|Type                   |Required|Position|PipelineInput        |
|-----------------------|--------|--------|---------------------|
|`[CBackupRepository[]]`|false   |named   |True (ByPropertyName)|

#### **StorageOptions**
Specifies the settings for compression and storage optimization of the target backup repository. The cmdlet will create the Veeam Agent backup copy job with these settings. Accepts the VBRBackupCopyJobStorageOptions object. To create this object, run the New-VBRStorageOptions cmdlet.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRBackupCopyJobStorageOptions]`|false   |named   |False        |

#### **TargetAccelerator**
Specifies the WAN accelerator on the target side. Remember to set the pair of source and target WAN accelerators. Accepts the CWanAccelerator object. To create this object, run the Get-VBRWANAcceleratorcmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

---

### Inputs
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
Add-VBRComputerBackupCopyJob [-Backup <CBackup[]>] [-BackupJob <VBRComputerBackupJob[]>] [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] -DirectOperation [-EnableImmediateCopy] 
```
```PowerShell
[-EnableTransactionLogCopy] [-Force] [-GFSOptions <VBRComputerGFSOptions>] [-HealthCheckOptions <VBRHealthCheckOptions>] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] -OSPlatform {Windows | 
```
```PowerShell
Linux | Mac | Unix} [-RecoveryPointObjective <VBRRecoveryPointObjective>] [-Repository <CBackupRepository>] [-RetentionNumber <Int32>] [-RetentionPolicy <VBRRetentionPolicy>] [-RetentionType {RestorePoints | 
```
```PowerShell
RestoreDays}] [-RPOWarningOptions <VBRRpoNotificationOption[]>] [-ScriptOptions <VBRJobScriptOptions>] [-SourceRepository <CBackupRepository[]>] [-StorageOptions <VBRBackupCopyJobStorageOptions>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Add-VBRComputerBackupCopyJob [-Backup <CBackup[]>] [-BackupJob <VBRComputerBackupJob[]>] [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] [-EnableImmediateCopy] 
```
```PowerShell
[-EnableTransactionLogCopy] [-Force] [-GFSOptions <VBRComputerGFSOptions>] [-HealthCheckOptions <VBRHealthCheckOptions>] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] -OSPlatform {Windows | 
```
```PowerShell
Linux | Mac | Unix} [-RecoveryPointObjective <VBRRecoveryPointObjective>] [-Repository <CBackupRepository>] [-RetentionNumber <Int32>] [-RetentionPolicy <VBRRetentionPolicy>] [-RetentionType {RestorePoints | 
```
```PowerShell
RestoreDays}] [-RPOWarningOptions <VBRRpoNotificationOption[]>] [-ScriptOptions <VBRJobScriptOptions>] -SourceAccelerator <CWanAccelerator> [-SourceRepository <CBackupRepository[]>] [-StorageOptions 
```
```PowerShell
<VBRBackupCopyJobStorageOptions>] [-TargetAccelerator <CWanAccelerator>] [<CommonParameters>]
```
