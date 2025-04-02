Add-VBRPluginBackupCopyJob
--------------------------

### Synopsis
Creates plug-in backup copy jobs.

---

### Description

This cmdlet creates plug-in backup copy jobs.
To create plug-in backup copy jobs, you must specify at least one source that contains the data you want to add to the copy job. Plug-in backup copy jobs use one of the following sources:
- The existing plug-in backup job created to back up Oracle RMAN or SAP HANA. Run the Get-VBRPluginJob cmdlet to get the plug-in backup job.
- Backup files that are stored in the source repositories. Run the Get-VBRBackupRepository cmdlet to get the source repository.
NOTE: The backup copy job is created in the disabled state. Run the Enable-VBRPluginJob cmdlet to run the job manually.

---

### Related Links
* [Get-VBRPluginJob](Get-VBRPluginJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Creating Plug-In Backup Copy Job Using Existing Plug-In Backup Job

$pluginjob = Get-VBRPluginJob -Name "SAP backint backup 07"
$targetrepository = Get-VBRBackupRepository -Name "TR05"
Add-VBRPluginBackupCopyJob -SourceJob $pluginjob -Name "Plug-in backup 03" -TargetRepository $targetrepository
This example shows how to create a plug-in backup copy job using the existing plug-in backup job.
Perform the following steps:
1. Run the Get-VBRPluginJob cmdlet. Specify the Name parameter value. Save the result to the $pluginjob variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $targetrepository variable.
3. Run the Add-VBRPluginBackupCopyJob cmdlet. Specify the following settings:
- Set the $pluginjob variable as the SourceJob parameter value.
- Specify the Name parameter value.
- Set the $targetrepository as the TargetRepository parameter value.
> Example 2. Creating Plug-In Backup Copy Job Using Source Repository

$sourcerepository = Get-VBRBackupRepository -Name "SR09"
$targetrepository = Get-VBRBackupRepository -Name "TR07"
Add-VBRPluginBackupCopyJob -Name "Plug-in backup 05" -SourceRepository $sourcerepository -TargetRepository $targetrepository
This example shows how to create a plug-in backup copy job using the source repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $sourcerepository variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $targetrepository variable.
3. Run the Add-VBRPluginBackupCopyJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $sourcerepository variable as the SourceRepository parameter value.
- Set the $targetrepository as the TargetRepository parameter value.
> Example 3. Creating Plug-In Backup Copy Job using Job and Source Repository

$pluginjob = Get-VBRPluginJob -Name "SAP backint backup 11"
$sourcerepository = Get-VBRBackupRepository -Name "SR013"
$targetrepository = Get-VBRBackupRepository -Name "TR015"
Add-VBRPluginBackupCopyJob -SourceJob $pluginjob -Name "Plug-in backup 17" -SourceRepository $sourcerepository -TargetRepository $targetrepository
This example shows how to create a plug-in backup copy job using the existing backup copy job and a source repository.
Perform the following steps:
1. Run the Get-VBRPluginJob cmdlet. Specify the Name parameter value. Save the result to the $pluginjob variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $sourcerepository variable.
3. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $targetrepository variable.
4. Run the Add-VBRPluginBackupCopyJob cmdlet. Specify the following settings:
- Set the $pluginjob variable as the SourceJob parameter value.
- Specify the Name parameter value.
- Set the $sourcerepository variable as the SourceRepository parameter value.
- Set the $targetrepository variable as the TargetRepository parameter value.

---

### Parameters
#### **ApplicationDataRetention**
Specifies the number of days. The cmdlet will create a plug-in backup copy job with the specified amount of days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **BackupWindowOptions**
Specifies backup window settings for a job. The cmdlet will create the plug-in backup copy job with these settings.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Description**
Specifies a description of a plug-in backup copy job. The cmdlet will create the job with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ExcludedJob**
Specifies a plug-in backup job that you do not want to process by a plug-in backup copy job.
The cmdlet will not add databases processed by this job to the plug-in backup copy job.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRPluginBackupJob[]]`|false   |named   |False        |

#### **Force**
Defines that the job will be created even if the source repository is located in the different geographic location than the target repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a name of a plug-in backup copy job. The cmdlet will create the job with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings. The cmdlet will create the plug-in backup copy job with these settings.

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
Specifies a plug-in backup job. The cmdlet will add databases processed by this job to the plug-in backup copy job.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRPluginBackupJob[]]`|false   |named   |False        |

#### **SourceRepository**
Specifies a backup repository that contains backups of databases, created by a plug-in backup job.
The cmdlet will add backups located on this repository to the plug-in backup copy job.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **StorageOptions**
Specifies settings for compression and storage optimization of the target backup repository.
The cmdlet will create the plug-in backup copy job with these settings.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRPluginCopyJobStorageOptions]`|false   |named   |False        |

#### **TargetRepository**
Specifies a target backup repository. The cmdlet will copy plug-in backups to this repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRPluginBackupCopyJob [-ApplicationDataRetention <Int32>] [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] [-ExcludedJob <VBRPluginBackupJob[]>] [-Force] [-Name <String>] 
```
```PowerShell
[-NotificationOptions <VBRNotificationOptions>] [-RPOWarningOptions <VBRRpoNotificationOption[]>] [-SourceJob <VBRPluginBackupJob[]>] [-SourceRepository <CBackupRepository[]>] [-StorageOptions 
```
```PowerShell
<VBRPluginCopyJobStorageOptions>] -TargetRepository <CBackupRepository> [<CommonParameters>]
```
