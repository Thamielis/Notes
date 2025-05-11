Set-VBRRPONotificationOption
----------------------------

### Synopsis
Modifies RPO notification settings.

---

### Description

This cmdlet modifies RPO notification settings.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRRPONotificationOptions](New-VBRRPONotificationOptions)

---

### Examples
> Modifying RPO Notification Settings

$rpo = New-VBRRPONotificationOptions -EnableRPOWarning -TimeUnit Hours -Value 1
Set-VBRRPONotificationOption -RPONotificationOption $rpo -TimeUnit Minutes -Value 15
This example shows how to modify the RPO notification settings. According to these options, Veeam Backup & Replication will mark a copy job with a warning if the newly created restore point is not copied within 15 minutes.
Perform the following steps:
1. Run the New-VBRRPONotificationOptions cmdlet. Specify the EnableRPOWarning, TimeUnit and Value parameter values. Save the result to the $rpo variable.
2. Run the Set-VBRRPONotificationOption cmdlet. Specify the following settings:
- Set the $rpo variable as the RPONotificationOption parameter value.
- Specify the TimeUnit parameter value.
- Specify the Value parameter value.

---

### Parameters
#### **EnableRPOWarning**
Defines that the cmdlet will enable an RPO warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RPONotificationOption**
Specifies the RPO notification settings that you want to modify.

|Type                        |Required|Position|PipelineInput |
|----------------------------|--------|--------|--------------|
|`[VBRRpoNotificationOption]`|true    |named   |True (ByValue)|

#### **RPOType**
Specifies the following type of an RPO warning:
* BackupJob: use this option to enable an RPO warning for a job.
* BackupLogJob: use this option to enable an RPO warning for job logs.
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
Veeam.Backup.PowerShell.Infos.VBRRpoNotificationOption

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRRPONotificationOption [-EnableRPOWarning] -RPONotificationOption <VBRRpoNotificationOption> [-RPOType {BackupJob | BackupLogJob}] [-TimeUnit {Minutes | Hours | Days}] [-Value <Int32>] [<CommonParameters>]
```
