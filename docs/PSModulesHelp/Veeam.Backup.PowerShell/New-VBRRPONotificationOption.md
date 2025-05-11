New-VBRRPONotificationOption
----------------------------

### Synopsis
Deffines RPO notification settings.

---

### Description

This cmdlet creates the VBRRPONotificationOptions object. This object defines recovery point objective (RPO) notification settings.
Veeam Backup & Replication will mark a copy job with a warning if the newly created restore point or transaction log is not copied within the desired recovery point objective.

---

### Examples
> Defining RPO Notification Settings

New-VBRRPONotificationOptions -EnableRPOWarning -Value 1 -TimeUnit Hours
This command defines the RPO notification settings. According to these options, Veeam Backup & Replication will mark a copy job with a warning if the newly created restore point is not copied within 1 hour.

---

### Parameters
#### **EnableRPOWarning**
Defines that the cmdlet will enable the RPO warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RPOType**
Specifies the following type of an RPO warning:
* BackupJob: Use this option is you want to enable an RPO warning for a job.
* BackupLogJob: Use this option is you want to enable an RPO warning for job logs.
Valid Values:

* BackupJob
* BackupLogJob

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[VBRRpoType]`|false   |named   |False        |

#### **TimeUnit**
Specifies a period of time when data must be copied from the source repository to the target repository.
You can set one of the following periods of time:
* Minutes
* Hours
* Days
Valid Values:

* Minutes
* Hours
* Days

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRRpoTimeUnit]`|false   |named   |False        |

#### **Value**
Specifies the number of minutes, hours or days when data must be copied from the source repository to the target repository.

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
New-VBRRPONotificationOption [-EnableRPOWarning] [-RPOType {BackupJob | BackupLogJob}] [-TimeUnit {Minutes | Hours | Days}] [-Value <Int32>] [<CommonParameters>]
```
