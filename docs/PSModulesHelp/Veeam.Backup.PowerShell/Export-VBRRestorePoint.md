Export-VBRRestorePoint
----------------------

### Synopsis
Exports backup files of a specific restore point.

---

### Description

This cmdlet exports backup files of a specific restore point.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Exporting Backup Files of Specific Restore Point

$restorepoint = Get-VBRRestorePoint         
Export-VBRRestorePoint -RestorePoint $restorepoint[2]
This example shows how to export backup files of a specific restore point.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Export-VBRRestorePoint cmdlet. Set the third $restorepoint as the RestorePoint parameter value.

---

### Parameters
#### **Reason**
Specifies the reason of the export.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies the repository to which you want to export the restore point.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point. The cmdlet will export backup files of this restore point.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RetentionNumber**
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).
For the RetentionPeriodType option.
Specifies the period of time to keep the exported data. After this period finishes, Veeam Backup & Replication will remove data.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionPeriod**
Specifies a retention period of exported backup files. The cmdlet will delete exported backup files within one of the following retention periods:
* Never
* In1Month
* In3Months
* In6Months
* In1Year
* In2Years
* In3Years
* In5Years
Note: Use this parameter if the RetentionPeriodType and RetentionNumber parameters are not specified.
Valid Values:

* Never
* In1Month
* In3Months
* In6Months
* In1Year
* In2Years
* In3Years
* In5Years
* In7Years

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRExportRetentionPeriod]`|false   |named   |False        |

#### **RetentionPeriodType**
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).
Specifies the type of the retention policy. You can set the following types:
* Days: use this option if you want Veeam Backup & Replication to apply retention policy daily.
* Months: use this option if you want Veeam Backup & Replication to apply retention policy monthly.
* Years: use this option if you want Veeam Backup & Replication to apply retention policy yearly.
Use the RetentionNumber to specify the number of days, months or years.
Note: Use this parameter if the RetentionPeriod parameter is not specified.
Valid Values:

* Days
* Months
* Years

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRRetentionPeriodType]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Export-VBRRestorePoint [-RestorePoint] <COib> [-Reason <String>] [-Repository <CBackupRepository>] [-RetentionNumber <Int32>] [-RetentionPeriod {Never | In1Month | In3Months | In6Months | In1Year | In2Years | 
```
```PowerShell
In3Years | In5Years | In7Years}] [-RetentionPeriodType {Days | Months | Years}] [<CommonParameters>]
```
