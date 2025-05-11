New-VBRGFSRetentionPolicy
-------------------------

### Synopsis
Defines GFS retention settings for Veeam Agent backup copy jobs.

---

### Description

This cmdlet creates the VBRGFSRetentionPolicy object. This object contains GFS retention settings for Veeam Agent backup copy jobs. Veeam Backup & Replication will keep the copied restore points on the target backup repository according to these settings.

---

### Examples
> Creating GFS Retention Policy for Backup Copy Job

New-VBRGFSRetentionPolicy -RestorePoints 2 -GFSWeeklyBackups 3 -GFSMonthlyBackups 4 -GFSQuarterlyBackups 5 -GFSYearlyBackups 9
This command creates a GFS retention policy for a backup copy job with the following settings:
- The number of regular backups is set to 2.
- The number of weekly backups is set to 3.
- The number of monthly backups is set to 4.
- The number of quarterly backups is set to 5.
- The number of yearly backups is set to 9.

---

### Parameters
#### **GFSMonthlyBackups**
Specifies the number of monthly backups that you want to keep on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **GFSQuarterlyBackups**
Specifies the number of quarterly backups that you want to keep on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **GFSWeeklyBackups**
Specifies the number of weekly backups that you want to keep on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **GFSYearlyBackups**
Specifies the number of yearly backups that you want to keep on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RestorePoints**
Specifies the number of restore points that you want to keep in the backup chain on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
New-VBRGFSRetentionPolicy [-GFSMonthlyBackups <Int32>] [-GFSQuarterlyBackups <Int32>] [-GFSWeeklyBackups <Int32>] [-GFSYearlyBackups <Int32>] [-RestorePoints <Int32>] [<CommonParameters>]
```
