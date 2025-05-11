New-VBRNotificationOptions
--------------------------

### Synopsis
Creates new job notification options.

---

### Description

This cmdlet creates the VBRNotificationOptions object. This object contains email notification settings for backup or replication jobs. You can use this object later to apply these settings to a job.

IMPORTANT! Email notification can be configured for jobs only in case that the global email notifications are enabled. Note that you cannot enable the global email notifications with Veeam PowerShell.  Read more about job notification settings in Veeam Backup & Replication user guide at https://helpcenter.veeam.com/docs/backup/vsphere/general_email_notifications.html?ver=120.

---

### Examples
> Creating Notification Options for Backup Job

New-VBRNotificationOptions -EnableAdditionalNotification -AdditionalAddress admin@domain.com -UseNotificationOptions -NotifyOnSuccess -NotifyOnWarning
This command creates notification options for the backup job.
Veeam Backup & Replication will send notifications about the job warning and when the job completes successfully.

---

### Parameters
#### **AdditionalAddress**
Specifies the email address for job notifications.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **EnableAdditionalNotification**
Enables the email notification. You can set it to True (enabled) or False (disabled).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableDailyNotification**
Defines that the cmdlet will send email notification daily. Use the SendTime parameter to specify the time when the cmdlet must send the email notification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSnmpNotification**
Defines that the SNMP traps will be sent when the job completes successfully.
NOTE: This parameter is not available for the following types of jobs:
-Backup policies that Veeam Agent backup jobs use to back up computers.
-Veeam Agent backup jobs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotificationSubject**
Specifies the subject of the email notifications.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotifyOnError**
Defines that the cmdlet will send the email if the job finished with error.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnLastRetryOnly**
Defines that the cmdlet will send the email about the final job status.  If you do not enable this option, Veeam Backup & Replication will send one notification per every job retry.
NOTE: This parameter is not available for backup policies that Veeam Agent backup jobs use to back up computers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnSuccess**
Defines that the cmdlet will send the email if the job finished successfully.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnWarning**
Defines that the cmdlet will send the email if the job finished with warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyWhenWaitingForTape**
Defines that the cmdlet will send the email if the tape job cannot start because there are no available tapes.
NOTE: This parameter is not available for the following types of jobs:
-Backup policies that Veeam Agent backup jobs use to back up computers.
-Veeam Agent backup jobs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SendTime**
Specifies the time when the cmdlet must send the email notification.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

#### **UseNotificationOptions**
Defines that the notifications must use custom or global settings. You can set it to True (custom settings) or False (global settings).
Use the following parameters to set the custom settings:
* NotifyOnSuccess
* NotifyOnWarning
* NotifyOnError
* NotifyOnLastRetryOnly

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
New-VBRNotificationOptions [-AdditionalAddress <String[]>] [-EnableAdditionalNotification] [-EnableDailyNotification] [-EnableSnmpNotification] [-NotificationSubject <String>] [-NotifyOnError] 
```
```PowerShell
[-NotifyOnLastRetryOnly] [-NotifyOnSuccess] [-NotifyOnWarning] [-NotifyWhenWaitingForTape] [-SendTime <TimeSpan>] [-UseNotificationOptions] [<CommonParameters>]
```
