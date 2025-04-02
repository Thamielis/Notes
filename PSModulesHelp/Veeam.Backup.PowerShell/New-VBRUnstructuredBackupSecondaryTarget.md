New-VBRUnstructuredBackupSecondaryTarget
----------------------------------------

### Synopsis
Creates secondary backup repositories for file backup jobs and object storage backup jobs.

---

### Description

This cmdlet creates secondary backup repositories. These repositories will keep copies of backup files that were created by file backup jobs and object storage backup jobs.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRBackupWindowOptions](New-VBRBackupWindowOptions)

---

### Examples
> Example 1. Creating Backup Repository

$repository = Get-VBRBackupRepository -Name "Backup Repository 07"
New-VBRUnstructuredBackupSecondaryTarget -BackupRepository $repository
This example shows how to create a secondary backup repository with the following settings:
- Veeam Backup & Replication will apply a retention policy that is set to the file backup job or object storage backup job.
- Veeam Backup & Replication will apply an encryption key that is set to the file backup job or object storage backup job.
- Veeam Backup & Replication will copy data to the repository continuously.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the New-VBRUnstructuredBackupSecondaryTarget cmdlet. Set the $repository variable as the BackupRepository parameter value.
> Example 2. Creating Backup Repository with Custom Retention Policy

$repository = Get-VBRBackupRepository -Name "Backup Repository 07"          
New-VBRUnstructuredBackupSecondaryTarget -BackupRepository $repository -CustomRetentionType Daily -CustomRetentionPeriod 7
This example shows how to create a secondary backup repository with the custom retention policy. Veeam Backup & Replication will keep versions of backup files on the secondary backup repository for 7 days.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the New-VBRUnstructuredBackupSecondaryTarget cmdlet. Specify the following settings:
- Set the $repository variable as the BackupRepository parameter value.
- Set the Daily option for the CustomRetentionType parameter.
- Specify the value for the CustomRetentionPeriod parameter.

---

### Parameters
#### **BackupRepository**
Specifies the backup repository that you want to add as a secondary backup repository to a file backup job or an object storage job.
Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **BackupWindow**
Specifies backup window settings. Veeam Backup & Replication will create copies of backups that were created by file backup jobs or an object storage job according to these settings. Accepts the VBRBackupWindowOptions object.  To create this object, run the New-VBRBackupWindowOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **CustomEncryptionKey**
Specifies an encryption key. Veeam Backup & Replication will use this key to encrypt data that is stored on the secondary repository.
Note: If you do not specify this parameter, Veeam Backup & Replication will apply an encryption key that is set to the file backup job or an object storage job to the secondary repository.
Accepts the VBREncryptionKey object.  To get this object, run the Get-VBREncryptionKey cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **CustomRetentionPeriod**
For the ShortTermRetentionType option. Specifies the period of time to keep data on the secondary repository. When this period is passed, Veeam Backup & Replication will move data to the long-term repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **CustomRetentionType**
Specifies a retention policy for the secondary repository. You can set retention policy to either of the following periods:
* Daily: use this option if you want Veeam Backup & Replication to apply retention policy daily.
* Monthly: use this option if you want Veeam Backup & Replication to apply retention policy monthly.
Use the ShortTermRetentionPeriod to specify the number of days or months. Note: If you do not specify this parameter, Veeam Backup & Replication will apply the retention policy of the file backup job or an object storage job to the secondary repository.
Valid Values:

* Daily
* Monthly

|Type                                           |Required|Position|PipelineInput|
|-----------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupShortTermRetentionType]`|false   |named   |False        |

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
New-VBRUnstructuredBackupSecondaryTarget -BackupRepository <CBackupRepository> [-BackupWindow <VBRBackupWindowOptions>] [-CustomEncryptionKey <VBREncryptionKey>] [-CustomRetentionPeriod <Int32>] 
```
```PowerShell
[-CustomRetentionType {Daily | Monthly}] [<CommonParameters>]
```
