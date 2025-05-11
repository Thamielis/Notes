Set-VBRCDPPolicyRetentionOptions
--------------------------------

### Synopsis
Modifies retention settings of CDP policies.

---

### Description

This cmdlet modifies retention setting of CDP policies.

---

### Related Links
* [New-VBRCDPPolicyRetentionOptions](New-VBRCDPPolicyRetentionOptions)

---

### Examples
> Example 1. Modifying ShortTerm Retention for CDP Policy

$options = New-VBRCDPPolicyRetentionOptions -ShortTermRetentionIntervalType Hours -ShortTermRetentionInterval 2
Set-VBRCDPPolicyRetentionOptions -Options $options -ShortTermRetentionInterval 5
This example shows how to modify short-term retention for CDP policy to keep keep only those replicated states of the source VMs that were created within last 5 hours.

Perform the following steps:
1. Run the New-VBRCDPPolicyRetentionOptions cmdlet. Specify the ShortTermRetentionIntervalType and ShortTermRetentionInterval parameters. Save the result to the  $options variable.
2. Run the Set-VBRCDPPolicyRetentionOptions cmdlet. Set the $options variable as the Options parameter value. Specify the ShortTermRetentionInterval parameter value.
> Example 2. Modifying LongTerm Retention for CDP Policy

$options = New-VBRCDPPolicyRetentionOptions -LongTermRetentionFrequencyType Hours -LongTermRetentionNumber 3
Set-VBRCDPPolicyRetentionOptions -Options $options -LongTermRetentionNumber 9
This example shows how to modify long-term retention for CDP policy to create a long-term restore point every 9 hours.

Perform the following steps:
1. Run the New-VBRCDPPolicyRetentionOptions cmdlet. Specify the LongTermRetentionFrequencyType and LongTermRetentionNumber parameters. Save the result to the $options variable.
2. Run the Set-VBRCDPPolicyRetentionOptions cmdlet. Set the $options variable as the Options parameter value. Specify the LongTermRetentionNumber parameter value.

---

### Parameters
#### **ApplicationProcessingBackupWindow**
Specifies a schedule that defines when a CDP policy must create crash-consistent and application-consistent backups.  Accepts the New-VBRBackupWindowOptions object.
To get this object, run the New-VBRBackupWindowOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupWindowOptions]`|false   |named   |False        |

#### **BackupWindow**
Specifies a time interval within which a CDP policy is allowed to create a replicated state of the source VMs.
Accepts the VBRBackupWindowOptions object.
To get this object, run the New-VBRBackupWindowOptions cmdlet.

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
Enables RPO warning reports for a CDP policy.

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
For a long-term retention option.
Specifies how often a CDP policy must create a long-term restore point.
The cmdlet will schedule the CDP policy to create a restore point every N hours.
Default: 8.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **LongTermRetentionFrequencyType**
For a long-term retention settings.
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
Specifies a number of days to keep a long-term restore point in a datastore. After this period is passed,Veeam Backup & Replication will delete a long-term restore point.
Default: 7.

|Type     |Required|Position|PipelineInput|Aliases                  |
|---------|--------|--------|-------------|-------------------------|
|`[Int32]`|false   |named   |False        |LongTermRetentionInterval|

#### **MarkJobAsErrorIntervalType**
For RPO reports.
Specifies a time interval of the exceeded RPO.
You can set the period in one of the following units of time:
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
Veeam Backup & Replication will send notification with a warning if this time limit is reached.
Defaule: 3.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MarkJobAsWarningIntervalType**
For RPO reports.
Specifies a time interval of the exceeded RPO.
You can set the period in one of the following units of time:
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
Defaule: 2.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Options**
Specifies retention settings of CDP policies that you want to modify.
Accepts the VBRCDPPolicyRetentionOptions object.
To create this object, run the New-VBRCDPPolicyRetentionOptions cmdlet.

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRCDPPolicyRetentionOptions]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RPOFrequency**
Specifies a number of minutes or seconds for the RPO settings.
The cmdlet will schedule the CDP policy to create a replicated state of the source VMs every N seconds or minutes.
Default: 15

|Type     |Required|Position|PipelineInput|Aliases    |
|---------|--------|--------|-------------|-----------|
|`[Int32]`|false   |named   |False        |RPOInterval|

#### **RPOFrequencyType**
Specifies RPO settings. The cmdlet will schedule the CDP policy to create a replicated state of the source VMs. You can set one of the following units of time:
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
For a short-term retention settings.
Specifies a number of minutes or hours to store a replicated state of the source VMs.
The cmdlet will schedule a CDP policy to store a replicated state of the source VMs only for last N minutes or hours.
Default: 4

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ShortTermRetentionIntervalType**
For a short-term retention policy.
Specifies a period during which Veeam Backup & Replication will store a replicated state of the source VMs on a target datastore.
You can set the period in one of the following units of time:
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
Veeam.Backup.PowerShell.Infos.VBRCDPPolicyRetentionOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCDPPolicyRetentionOptions [-ApplicationProcessingBackupWindow <VBRBackupWindowOptions>] [-BackupWindow <VBRBackupWindowOptions>] [-EnableRPOMarkAsError <Boolean>] [-EnableRPOMarkAsWarning <Boolean>] 
```
```PowerShell
[-HourlyOffset <Int32>] [-LongTermRetentionFrequency <Int32>] [-LongTermRetentionFrequencyType {Minutes | Hours}] [-LongTermRetentionNumber <Int32>] [-MarkJobAsErrorIntervalType {Minutes | Seconds}] 
```
```PowerShell
[-MarkJobAsErrorThreshold <Int32>] [-MarkJobAsWarningIntervalType {Minutes | Seconds}] [-MarkJobAsWarningThreshold <Int32>] -Options <VBRCDPPolicyRetentionOptions> [-RPOFrequency <Int32>] [-RPOFrequencyType 
```
```PowerShell
{Minutes | Seconds}] [-ShortTermRetentionInterval <Int32>] [-ShortTermRetentionIntervalType {Minutes | Hours}] [<CommonParameters>]
```
