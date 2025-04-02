Set-VBRPluginBackupCopyJob
--------------------------

### Synopsis
Modifies plug-in backup copy jobs.

---

### Description

This example modifies plug-in backup copy jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRPluginJob](Get-VBRPluginJob)

* [New-VBRStorageOptions](New-VBRStorageOptions)

---

### Examples
> Example 1. Modifying Target Repository of Plug-In Backup Copy Job

$pluginjob = Get-VBRPluginJob -Name "Plug-in backup 04"
$targetrepository = Get-VBRBackupRepository -Name "TR08"
Set-VBRPluginBackupCopyJob -Job $pluginjob -TargetRepository $targetrepository
This example shows how to change the target repository for a plug-in backup copy job.
Perform the following steps:
1. Run the Get-VBRPluginJob cmdlet. Specify the Name parameter value. Save the result to the $pluginjob variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $targetrepository variable.
3. Run the Set-VBRPluginBackupCopyJob cmdlet. Set the $pluginjob variable as the Job parameter value. Set the $targetrepository variable as the TargetRepository parameter value.
> Example 2. Excluding Jobs from Plug-In Backup Copy Job

$pluginjob = Get-VBRPluginJob -Name "Plug-in backup 09"
$excludedjob = Get-VBRPluginJob -Name "SAP backint backup 09"
Set-VBRPluginBackupCopyJob -Job $pluginjob -ExcludedJob $excludedjob
This example shows how to exclude the SAP backint backup 09 plug-in backup job from processing by the Plug-in backup 09 plug-in backup copy job.
Perform the following steps:
1. Run the Get-VBRPluginJob cmdlet. Specify the Name parameter value. Save the result to the $pluginjob variable.
2. Run the Get-VBRPluginJob cmdlet. Specify the Name parameter value. Save the result to the $excludedjob variable.
3. Run the Set-VBRPluginBackupCopyJob cmdlet. Set the $pluginjob variable as the Job parameter value. Set the $excludedjob variable as the ExcludedJob parameter value.
> Example 3. Modifying Storage Optimization Settings of Plug-In Backup Copy Job

$pluginjob = Get-VBRPluginJob -Name "Plug-in backup 09"
$storage = New-VBRStorageOptions -CompressionLevel Optimal -StorageOptimizationType LocalTarget
Set-VBRPluginBackupCopyJob -Job $pluginjob -StorageOptions $storage
This example shows how to modify storage optimization settings for a plug-in backup copy job. The plug-in backup copy job will run with the following storage optimization settings:
- The compression level is set to optimal.
- The backup target storage type is set to LocalTarget.
Perform the following steps:
1. Run the Get-VBRPluginJob cmdlet. Specify the Name parameter value. Save the result to the $pluginjob variable.
2. Run the New-VBRStorageOptions cmdlet. Set the Optimal value for the CompressionLevel parameter. Set the LocalTarget option for the StorageOptimizationType parameter.
3. Run the Set-VBRPluginBackupCopyJob cmdlet. Set the $pluginjob variable as the Job parameter value. Set the $storage variable as the StorageOptions parameter value.

---

### Parameters
#### **AnyTime**
Defines that the job will run continuously. If you provide this parameter, the job will run at any time. Otherwise, the job will run only during permitted hours.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ApplicationDataRetention**
Specifies the number of days. The cmdlet will create a plug-in backup copy job with the specified amount of days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **BackupWindowOptions**
Specifies backup window settings for a job. The cmdlet will modify the plug-in backup copy job with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Description**
Specifies a description of a plug-in backup copy job. The cmdlet will assign this description to the job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ExcludedJob**
Specifies an array of plug-in backup jobs that you do not want to process by a plug-in backup copy job.
The cmdlet will replace an existing list of excluded plug-in backup jobs with the array of specified excluded plug-in backup jobs.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRPluginBackupJob[]]`|false   |named   |False        |

#### **Force**
Defines that the job will be created even if the source repository is located on the different from the target repository host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies a plug-in backup copy job. The cmdlet will modify this job.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRPluginBackupCopyJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies a name of a plug-in backup copy job. The cmdlet will assign this name to the job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings. The cmdlet will modify a plug-in backup job with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **RPOWarningOptions**
Specifies an array of the number of hours when data must be copied from the source repository to the target repository.
Default: 1.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRRpoNotificationOption[]]`|false   |named   |False        |

#### **SourceJob**
Specifies a plug-in backup job. The cmdlet will replace the existing source plug-in backup job with the specified plug-in backup job.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRPluginBackupJob[]]`|false   |named   |False        |

#### **SourceRepository**
Specifies a backup repository that contains backups of databases, created by a plug-in backup job.
The cmdlet replace the existing source repository with the specified backup repository.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **StorageOptions**
Specifies settings for compression and storage optimization of the target backup repository.
The cmdlet will modify a plug-in backup job with these settings.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRPluginCopyJobStorageOptions]`|false   |named   |False        |

#### **TargetRepository**
Specifies a target backup repository. The cmdlet will copy plug-in backups to this repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRPluginBackupCopyJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRPluginBackupCopyJob [-AnyTime] [-ApplicationDataRetention <Int32>] [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] [-ExcludedJob <VBRPluginBackupJob[]>] [-Force] -Job 
```
```PowerShell
<VBRPluginBackupCopyJob> [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-RPOWarningOptions <VBRRpoNotificationOption[]>] [-SourceJob <VBRPluginBackupJob[]>] [-SourceRepository 
```
```PowerShell
<CBackupRepository[]>] [-StorageOptions <VBRPluginCopyJobStorageOptions>] [-TargetRepository <CBackupRepository>] [<CommonParameters>]
```
