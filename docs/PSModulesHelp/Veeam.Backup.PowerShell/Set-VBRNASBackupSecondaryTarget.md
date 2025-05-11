Set-VBRNASBackupSecondaryTarget
-------------------------------

### Synopsis
Modifies settings of secondary backup repositories.

---

### Description

This cmdlet modifies settings of secondary backup repositories.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBREncryptionKey](Get-VBREncryptionKey)

---

### Examples
> Example 1. Enabling Custom Retention Policy

$repository = Get-VBRBackupRepository -Name "SecondaryBackupRepository08"
Set-VBRNASBackupSecondaryTarget -SecondaryTarget $repository -EnableCustomRetention -CustomRetentionType Daily -CustomRetentionPeriod 7
This example shows how to enable custom retention policy for the "SecondaryBackupRepository08" secondary backup repository. The custom retention policy will be enabled with the following settings:
- Veeam Backup & Replication will apply retention policy daily.
- Veeam Backup & Replication will keep data on the secondary repository for 7 days.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Set-VBRNASBackupSecondaryTarget cmdlet. Specify the following settings:
- Set the $repository variable as the SecondaryTarget parameter value.
- Specify the EnableCustomRetention parameter value.
- Set the Daily option as the CustomRetentionType parameter value.
- Specify the CustomRetentionPeriod parameter value.
> Example 2. Enabling Custom Encryption Key

$repository = Get-VBRBackupRepository -Name "SecondaryBackupRepository08"
$key = Get-VBREncryptionKey -Description NasEncryption
Set-VBRNASBackupSecondaryTarget -SecondaryTarget $repository -UseCustomEncryptionKey -CustomEncryptionKey $key
This example shows how to enable custom encryption key for the "SecondaryBackupRepository08" secondary backup repository.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value.
3. Run the Set-VBRNASBackupSecondaryTarget cmdlet. Specify the following settings:
- Set the $repository as the SecondaryTarget parameter value.
- Specify the UseCustomEncryptionKey parameter.
- Set the $key variable as the CustomEncryptionKey parameter value.

---

### Parameters
#### **BackupRepository**
Specifies the backup repository that you want to add as a secondary backup repository to a file backup job. Accepts the CBackupRepository object.  To create this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **BackupWindow**
Specifies backup window settings.  Veeam Backup & Replication will create copies of backups that were created by file backup jobs according to these settings. Accepts the VBRBackupWindowOptions object.  To create this object, run the New-VBRBackupWindowOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **CustomEncryptionKey**
Specifies an encryption key. Veeam Backup & Replication will use this key to encrypt data that is stored on the secondary repository. Note: If you do not specify this parameter, Veeam Backup & Replication will apply an encryption key that is set to the file backup job to the secondary repository. Accepts the VBREncryptionKey object.  To create this object, run the Get-VBREncryptionKey cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **CustomRetentionPeriod**
For the ShortTermRetentionType option. Specifies the period of time to keep data on the secondary repository.  When this period is passed, Veeam Backup & Replication will move data to the long-term repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **CustomRetentionType**
Specifies a retention policy for the secondary repository. You can set retention policy to either of the following periods:
* Daily: use this option if you want Veeam Backup & Replication to apply retention policy daily.
* Monthly: use this option if you want Veeam Backup & Replication to apply retention policy monthly.
Use the ShortTermRetentionPeriod to specify the number of days or months. Note: If you do not specify this parameter, Veeam Backup & Replication will apply the retention policy of the file backup job to the secondary repository.
Valid Values:

* Daily
* Monthly

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[VBRNASBackupShortTermRetentionType]`|false   |named   |False        |

#### **EnableBackupWindow**
Enables the backup window option. If you provide this parameter, Veeam Backup & Replication will create copies of backups that were created by file backup jobs according to these settings. Otherwise, Veeam Backup & Replication will copy data to the repository continuously.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCustomRetention**
Enables the custom retention policy. If you provide this parameter, Veeam Backup & Replication will apply this policy for backups located on the secondary backup repository.  Otherwise, Veeam Backup & Replication will apply the retention policy of the file backup job to the secondary repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SecondaryTarget**
Specifies the secondary backup repository.  The cmdlet will modify this repository. Accepts the VBRNASBackupSecondaryTarget object.  To create this object, run the Get-VBRBackupRepository cmdlet.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRNASBackupSecondaryTarget]`|true    |named   |True (ByPropertyName, ByValue)|

#### **UseCustomEncryptionKey**
Defines that the cmdlet will enable the custom encryption key option. If you provide this parameter, Veeam Backup & Replication will use the encryption key to encrypt data that is stored on the secondary repository. Otherwise, Veeam Backup & Replication will apply an encryption key that is set to the file backup job to the secondary repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackupSecondaryTarget

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNASBackupSecondaryTarget [-BackupRepository <CBackupRepository>] [-BackupWindow <VBRBackupWindowOptions>] [-CustomEncryptionKey <VBREncryptionKey>] [-CustomRetentionPeriod <Int32>] [-CustomRetentionType 
```
```PowerShell
{Daily | Monthly}] [-EnableBackupWindow] [-EnableCustomRetention] -SecondaryTarget <VBRNASBackupSecondaryTarget> [-UseCustomEncryptionKey] [<CommonParameters>]
```
