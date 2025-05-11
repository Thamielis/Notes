Set-VBRAzureComputeBackupCopyJob
--------------------------------

### Synopsis
Modifies Azure IaaS backup copy jobs.

---

### Description

This cmdlet modifies Azure IaaS backup copy jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Modifying Backup Repository of Azure Backup Copy Job

$copyjob = Get-VBRJob -Name "Azure backup copy"
$repository = Get-VBRBackupRepository
Set-VBRAzureComputeBackupCopyJob -Job $copyjob -Repository $repository
This example shows how to modify a backup repository of an Azure backup copy job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $copyjob variable.
2. Run the Get-VBRBackupRepository cmdlet. Save the result to the $repository variable.
3. Run the Set-VBRAzureComputeBackupCopyJob cmdlet. Set the $copyjob variable as the Job parameter value. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Backup**
Specifies an array of Azure backups that you want to copy.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRAzureComputeBackup[]]`|false   |named   |False        |

#### **BackupWindowOptions**
Specifies the period of time when a backup copy job is allowed to run.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Description**
Specifies a description of a backup copy job. The cmdlet will create the job with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Job**
Specifies an Azure backup copy job. The cmdlet will modify this job.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[CBackupJob]`|true    |named   |True (ByValue)|

#### **Name**
Specifies a name of a backup copy job. The cmdlet will create the job with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RecoveryPointObjective**
Specifies a backup copy interval. The cmdlet will copy new restore points of Azure IaaS backup copy jobs to the target backup repository.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRRecoveryPointObjective]`|false   |named   |False        |

#### **Repository**
Specifies a target backup repository. The cmdlet will copy Azure backups to this repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RetentionPolicy**
Specifies a number of restore points to keep on a target backup repository.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRRetentionPolicy]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAzureComputeBackupCopyJob [-Backup <VBRAzureComputeBackup[]>] [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] -Job <CBackupJob> [-Name <String>] [-RecoveryPointObjective 
```
```PowerShell
<VBRRecoveryPointObjective>] [-Repository <CBackupRepository>] [-RetentionPolicy <VBRRetentionPolicy>] [<CommonParameters>]
```
