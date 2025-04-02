Add-VBREC2BackupCopyJob
-----------------------

### Synopsis
Creates backup copy jobs for backups of Amazon EC2 instances.

---

### Description

This cmdlet creates backup copy jobs for backups of Amazon EC2 instances. Backup copy jobs copy the backups from Amazon S3 external repositories to target repositories.

Note: The cmdlet creates jobs in a disabled state. Run Enable-VBRJob to enable jobs.

---

### Related Links
* [Get-VBREC2Backup](Get-VBREC2Backup)

---

### Examples
> Example 1

```PowerShell
$instance = Get-VBREC2Backup -Name "VMEC2 Instance SRV10"
Add-VBREC2BackupCopyJob -Backup $instance
This example shows how to create a backup copy job.   1. Run Get-VBREC2Backup to get a backup of EC2 instances that you want to copy. Save the result to the $instance variable.   2. Run Add-VBREC2BackupCopyJob with the $instance variable.
```

---

### Parameters
#### **Backup**
Specifies an array of EC2 instance backups that you want to copy. Accepts the VBREC2Backup[] object. To get this object, run the Get-VBREC2Backup cmdlet.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[VBREC2Backup[]]`|true    |named   |True (ByValue)|

#### **BackupWindowOptions**
Specifies the period of time when a backup copy job is allowed to run. Accepts the VBRBackupWindowOptions type.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **Description**
Specifies a description of a backup copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies a name of a backup copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RecoveryPointObjective**
Specifies a backup copy interval. The cmdlet will copy new restore points of EC2 instance backup to the target backup repository. Accepts the VBRRecoveryPointObjective type.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRRecoveryPointObjective]`|false   |named   |False        |

#### **Repository**
Specifies a target backup repository. The cmdlet will copy EC2 instance backups to this repository. Accepts the CBackupRepository type.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RetentionPolicy**
Specifies a number of restore points to keep on a target backup repository. Accepts the VBRRetentionPolicy type.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRRetentionPolicy]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBREC2Backup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBREC2BackupCopyJob -Backup <VBREC2Backup[]> [-BackupWindowOptions <VBRBackupWindowOptions>] [-Description <String>] [-Name <String>] [-RecoveryPointObjective <VBRRecoveryPointObjective>] [-Repository 
```
```PowerShell
<CBackupRepository>] [-RetentionPolicy <VBRRetentionPolicy>] [<CommonParameters>]
```
