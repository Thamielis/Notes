New-VBRRecoveryPointObjective
-----------------------------

### Synopsis
Creates an interval for backup copy jobs that process backups stored on external repositories.

---

### Description

This cmdlet creates the VBRRecoveryPointObjective object. This object contains settings for backup copy interval of backup copy jobs that process backups stored on external repositories.
Veeam Backup & Replication will copy new restore points of these backups to the target backup repository according to these settings.

---

### Examples
> Creating Backup Copy Interval

```PowerShell
New-VBRRecoveryPointObjective -Value 3 -Unit Day -StartTime 22:00
This command creates a backup copy interval. According to this interval the backup copy job will start at 22:00 PM and will run every three days.
```

---

### Parameters
#### **StartTime**
For the daily option.
Specifies the start time for a backup copy job to run.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

#### **Unit**
Specifies the period of time for a backup copy job to run:
* Minute
* Hour
* Day
Valid Values:

* Minute
* Hour
* Day

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRRecoveryPointObjectiveUnit]`|false   |named   |False        |

#### **Value**
Specifies the number of times the backup copy job will copy new restore points.

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
New-VBRRecoveryPointObjective [-StartTime <TimeSpan>] [-Unit {Minute | Hour | Day}] [-Value <Int32>] [<CommonParameters>]
```
