Add-VBRAzureComputeBackupCopyJob
--------------------------------

### Synopsis
Creates Azure IaaS backup copy jobs.

---

### Description

This cmdlet creates Azure IaaS backup copy jobs of Azure VMs that are stored on a Microsoft Azure Blob Storage repository. Azure IaaS backup copy jobs will copy the backups from Microsoft Azure Blob Storage external repositories to target repositories.

The cmdlet creates jobs in a disabled state. Run Enable-VBRJob to enable jobs.

---

### Related Links
* [Get-VBRAzureComputeBackup](Get-VBRAzureComputeBackup)

---

### Examples
> Creating Azure Backup Copy Job

$backup = Get-VBRAzureComputeBackup -Name "November report"
Add-VBRAzureComputeBackupCopyJob -Backup $backup
This example shows how to create an Azure backup copy job.

Perform the following steps:

1. Run the Get-VBRAzureComputeBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.   2. Run the Add-VBRAzureComputeBackupCopyJob cmdlet. Set the $backup variable as the Backup parameter value.

---

### Parameters
#### **Backup**
Specifies an array of Azure backups that you want to copy.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[VBRAzureComputeBackup[]]`|true    |named   |True (ByValue)|

#### **BackupWindowOptions**
Specifies a number of restore points to keep on a target backup repository.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Description**
Specifies a description of a backup copy job. The cmdlet will create the job with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies a name of a backup copy job. The cmdlet will create the job with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RecoveryPointObjective**
Specifies the period of time when a backup copy job is allowed to run.

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
Veeam.Backup.PowerShell.Infos.VBRAzureComputeBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAzureComputeBackupCopyJob -Backup <VBRAzureComputeBackup[]> [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] [-Name <String>] [-RecoveryPointObjective <VBRRecoveryPointObjective>] 
```
```PowerShell
[-Repository <CBackupRepository>] [-RetentionPolicy <VBRRetentionPolicy>] [<CommonParameters>]
```
