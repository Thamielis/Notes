New-VBRCDPPolicyRetentionOptions
--------------------------------

### Synopsis
Defines retention setting of CDP policies.

---

### Description

This cmdlet creates the VBRCDPPolicyRetentionOptions object that specifies the following setting of CDP policies:
- Recovery point objective (RPO) - a setting that defines the maximum allowed time of the data loss in case the production VM is down.
- Retention policy - a setting that defines the schedule for the short-term and long-term retention policies.
- RPO reports settings - a setting that defines when CDP policies are marked with the RPO warning or error.
- Schedule - a setting that defines when a CDP policy must create crash-consistent and application-consistent backups.

---

### Related Links
* [New-VBRBackupWindowOptions](New-VBRBackupWindowOptions)

---

### Examples
> Example 1. Defining RPO Settings for CDP Policy

$windowoptions = New-VBRBackupWindowOptions -FromDay Friday -FromHour 22 -ToDay Saturday -ToHour 22 -Enabled
New-VBRCDPPolicyRetentionOptions -RPOFrequencyType Minutes -RPOFrequency 10 -BackupWindow $windowoptions
This example shows how to define the following RPO settings for a CDP policy:
- The cmdlet will create a replicated state of the source VMs during the following periods of time:
o From 22:00 to 22:59 on Friday.
o From 22:00 to 22:59 on Saturday.
- RPO is set to 10 minutes.
Perform the following steps:
1. Run the New-VBRBackupWindowOptions cmdlet. Specify the FromDay, FromHour, ToHour, Enabled parameter value. Save the result to the $vm variable.
2. Run the New-VBRCDPPolicyRetentionOptions cmdlet. Specify the following settings:
- Specify the RPOFrequencyType parameter value.
- Specify the RPOFrequency parameter value.
- Set the $windowoptions variable as the BackupWindow parameter value.
> Example 2. Defining Short-Term Retention for CDP Policy

```PowerShell
New-VBRCDPPolicyRetentionOptions -ShortTermRetentionIntervalType Hours -ShortTermRetentionInterval
This command schedules a CDP policy to keep only those VM replicated states that were created within last 2 hours.
```
> Example 3. Defining LongTerm Retention for CDP Policy

```PowerShell
New-VBRCDPPolicyRetentionOptions -LongTermRetentionFrequencyType Hours -LongTermRetentionNumber
This command schedules a CDP policy to create a long-term restore points every 3 hours.
```

---

### Parameters
#### **ApplicationProcessingBackupWindow**
Specifies a schedule that defines when a CDP policy must create crash-consistent and application-consistent backups.
Accepts the New-VBRBackupWindowOptions object. To get this object, run the New-VBRBackupWindowOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **BackupWindow**
Specifies a time interval within which a CDP policy is allowed to create a replicated state of the source VMs.
Accepts the VBRBackupWindowOptions object. To get this object, run the New-VBRBackupWindowOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **EnableRPOMarkAsError**
For RPO reports.
Enables RPO error reports for a CDP policy.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **EnableRPOMarkAsWarning**
For RPO reports.
Enables RPO warning reports for a CDP policy

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **HourlyOffset**
Used for adjusting the application processing backup window.
Specifies the number of minutes (1-59). The schedule will be shifted for the specified number of minutes.
For example, you schedule creation of crash-consistent restore points from 00:00 to 01:00, and set the offset value to 25. The schedule will be shifted forward, and the crash-consistent restore points will be created from 0:25 and to 01:25.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **LongTermRetentionFrequency**
For long-term retention settings.
Specifies how often a CDP policy must create a long-term restore point. The cmdlet will schedule the CDP policy to create a restore point every N hours.
Default: 8.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **LongTermRetentionFrequencyType**
For long-term retention settings.
Specifies a period when a CDP policy must create long-term restore points. You can set the period in one of the following units of time:
* Minutes: Use this option to create a long-term restore point every N minutes.
* Hours: Use this option to create a long-term restore point every N hours.
Default: Hours.
Valid Values:

* Minutes
* Hours

|Type                           |Required|Position|PipelineInput|Aliases                      |
|-------------------------------|--------|--------|-------------|-----------------------------|
|`[VBRCDPRetentionIntervalType]`|false   |named   |False        |LongTermRetentionIntervalType|

#### **LongTermRetentionNumber**
For long-term retention settings.
Specifies a number of days to keep a long-term restore point in a datastore. After this period is passed, Veeam Backup & Replication will delete a long-term restore point. Default: 7.

|Type     |Required|Position|PipelineInput|Aliases                  |
|---------|--------|--------|-------------|-------------------------|
|`[Int32]`|false   |named   |False        |LongTermRetentionInterval|

#### **MarkJobAsErrorIntervalType**
For RPO reports.
Specifies a time interval of the exceeded RPO. You can set the period in one of the following units of time:
* Seconds: Use this option to get an error notification after a time interval of the exceeded RPO reaches N seconds.
* Minutes: Use this option to get an error notification after a time interval of the exceeded RPO reaches N minutes.
Default: Seconds.
Valid Values:

* Minutes
* Seconds

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRCDPRPOIntervalType]`|false   |named   |False        |

#### **MarkJobAsErrorThreshold**
For RPO reports.
Specifies an allowed time limit of the exceeded RPO.
Veeam Backup & Replication will send notification with a warning if this time limit is reached. Defaule: 3.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MarkJobAsWarningIntervalType**
For RPO reports.
Specifies a time interval of the exceeded RPO. You can set the period in one of the following units of time:
* Seconds: Use this option to get a warning notification after a time interval of the exceeded RPO reaches N seconds.
* Minutes: Use this option to get a warning notification after a time interval of the exceeded RPO reaches N minutes.
Default: Seconds.
Valid Values:

* Minutes
* Seconds

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRCDPRPOIntervalType]`|false   |named   |False        |

#### **MarkJobAsWarningThreshold**
For RPO reports.
Specifies an allowed time limit of the exceeded RPO.
Veeam Backup & Replication will send notification with a warning if this time limit is reached.
Default: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RPOFrequency**
Specifies a number of minutes or seconds for the RPO settings.
The cmdlet will schedule the CDP policy to create a replicated state of the source VMs every N seconds or minutes.
Default: 15

|Type     |Required|Position|PipelineInput|Aliases    |
|---------|--------|--------|-------------|-----------|
|`[Int32]`|false   |named   |False        |RPOInterval|

#### **RPOFrequencyType**
Specifies RPO settings.
The cmdlet will schedule the CDP policy to create a replicated state of the source VMs. You can set one of the following units of time:
* Minutes: Use this option to schedule a CDP policy to create a replicated state of the source VMs every N minutes.
* Seconds: Use this option to schedule a CDP policy to create a replicated state of the source VMs every N seconds.
Default: Seconds.
Valid Values:

* Minutes
* Seconds

|Type                     |Required|Position|PipelineInput|Aliases        |
|-------------------------|--------|--------|-------------|---------------|
|`[VBRCDPRPOIntervalType]`|false   |named   |False        |RPOIntervalType|

#### **ShortTermRetentionInterval**
For short-term retention settings.
Specifies a number of minutes or hours to store a replicated state of the source VMs. The cmdlet will schedule a CDP policy to store a replicated state of the source VMs only for last N minutes or hours.  Default: 4

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ShortTermRetentionIntervalType**
For a short-term retention policy.
Specifies a period during which Veeam Backup & Replication will store a replicated state of the source VMs on a target datastore. You can set the period in one of the following units of time:
* Minutes: Use this option to store a replicated state of the source VMs for last N minutes.
* Hours: Use this option to store a replicated state of the source VMs for last N hours.
Default: Hours.
Valid Values:

* Minutes
* Hours

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRCDPRetentionIntervalType]`|false   |named   |False        |

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
New-VBRCDPPolicyRetentionOptions [-ApplicationProcessingBackupWindow <VBRBackupWindowOptions>] [-BackupWindow <VBRBackupWindowOptions>] [-EnableRPOMarkAsError <Boolean>] [-EnableRPOMarkAsWarning <Boolean>] 
```
```PowerShell
[-HourlyOffset <Int32>] [-LongTermRetentionFrequency <Int32>] [-LongTermRetentionFrequencyType {Minutes | Hours}] [-LongTermRetentionNumber <Int32>] [-MarkJobAsErrorIntervalType {Minutes | Seconds}] 
```
```PowerShell
[-MarkJobAsErrorThreshold <Int32>] [-MarkJobAsWarningIntervalType {Minutes | Seconds}] [-MarkJobAsWarningThreshold <Int32>] [-RPOFrequency <Int32>] [-RPOFrequencyType {Minutes | Seconds}] 
```
```PowerShell
[-ShortTermRetentionInterval <Int32>] [-ShortTermRetentionIntervalType {Minutes | Hours}] [<CommonParameters>]
```
