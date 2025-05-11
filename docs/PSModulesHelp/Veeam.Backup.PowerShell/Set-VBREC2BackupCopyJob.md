Set-VBREC2BackupCopyJob
-----------------------

### Synopsis
Modifies backup copy jobs for backups of Amazon EC2 instances.

---

### Description

This cmdlet modifies backup copy jobs that copy backups of Amazon EC2 instances.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBREC2Backup](Get-VBREC2Backup)

* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Adding Amazon EC2 Instance to Backup Copy Job

$copyjob = Get-VBRJob -Name "VMEC2 Instance SRV10"
$instance = Get-VBREC2Backup -Name "VMEC2 Instance SRV10 01"
Set-VBREC2BackupCopyJob -Job $copyjob -Backup $instance
This example shows how to add an Amazon EC2 instance to a backup copy job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $copyjob variable.
2. Run the Get-VBREC2Backup cmdlet. Specify the Name parameter value. Save the result to the $instance variable.
3. Run the Set-VBREC2BackupCopyJob cmdlet. Set the $copyjob variable as the Job parameter value. Set the $instance variable as the Backup parameter value.

---

### Parameters
#### **Backup**
Specifies an array of EC2 instance backups that you want to copy.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBREC2Backup[]]`|false   |named   |False        |

#### **BackupWindowOptions**
Specifies the period of time when a backup copy job is allowed to run.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Description**
Specifies a description of a backup copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Job**
Specifies a backup copy job that you want to modify.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[CBackupJob]`|true    |named   |True (ByValue)|

#### **Name**
Specifies a name of a backup copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RecoveryPointObjective**
Specifies a backup copy interval. The cmdlet will copy new restore points of EC2 instance backups to the target backup repository.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRRecoveryPointObjective]`|false   |named   |False        |

#### **Repository**
Specifies a target backup repository. The cmdlet will copy EC2 instance backups to this repository.

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
Set-VBREC2BackupCopyJob [-Backup <VBREC2Backup[]>] [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] -Job <CBackupJob> [-Name <String>] [-RecoveryPointObjective 
```
```PowerShell
<VBRRecoveryPointObjective>] [-Repository <CBackupRepository>] [-RetentionPolicy <VBRRetentionPolicy>] [<CommonParameters>]
```
