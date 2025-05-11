Set-VBRNotificationOptions
--------------------------

### Synopsis
Modifies job notification settings.

---

### Description

This cmdlet modifies notification settings for backup or replication jobs.
Note: To modify settings, enter the necessary parameters with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRNotificationOptions](New-VBRNotificationOptions)

---

### Examples
> Modifying Notification Settings for Backup Job

$notifications = New-VBRNotificationOptions -EnableAdditionalNotification -AdditionalAddress "admin@domain.com" -UseNotificationOptions -NotifyOnSuccess -NotifyOnWarning
Set-VBRNotificationOptions -NotificationOptions $notifications -EnableAdditionalNotification -UseNotificationOptions -NotifyOnError
This example shows how to modify notification settings for the backup job. Veeam Backup & Replication will send a notification when the backup job completes with the error, warning or when it completes successfully.
Perform the following steps:
1. Run the New-VBRNotificationOptions cmdlet. Specify the following settings:
- Provide the EnableAdditionalNofitication parameter.
- Specify the AdditionalAddress parameter value.
- Provide the UseNotificationOptions parameter.
- Provide the NotifyOnSuccess parameter.
- Provide the NotifyOnWarning parameter.
Save the result to the $notifications variable.
2. Run the Set-VBRNotificationOptions cmdlet. Specify the following settings:
- Set the $notifications variable as the NotificationOptions parameter value.
- Provide the EnableAdditionalNotification parameter.
- Provide the UseNotificationOptions parameter.
- Provide the NotifyOnError parameter.

---

### Parameters
#### **AdditionalAddress**
Specifies the email address for job notifications.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **EnableAdditionalNotification**
Enables the email notification option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableDailyNotification**
Defines that the cmdlet will send email notification daily.
Use the SendTime parameter to specify the time when the cmdlet must send the email notification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSnmpNotification**
Defines that the cmdlet will send the SNMP traps when the job completes successfully.
NOTE: This parameter is not available for the following types of jobs:
* Backup policies that Veeam Agent backup jobs use to back up computers.
* Veeam Agent backup jobs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings that you want to modify.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|true    |named   |False        |

#### **NotificationSubject**
Specifies the subject of the email notifications.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotifyOnError**
Defines that the cmdlet will send the email when the job finished with an error.

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
Defines that the cmdlet will send the email when the job finished successfully.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnWarning**
Defines that the cmdlet will send the email when the job finished with a warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyWhenWaitingForTape**
Defines that the cmdlet will send the email if the tape job cannot start because there are no available tapes.
NOTE: This parameter is not available for the following types of jobs:
* Backup policies that Veeam Agent backup jobs use to back up computers.
* Veeam Agent backup jobs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SendTime**
Specifies the time when the cmdlet must send the email notification.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

#### **UseNotificationOptions**
Defines that the cmdlet will use custom or global settings. You can set it to True (custom settings) or False (global settings).
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
Set-VBRNotificationOptions [-AdditionalAddress <String[]>] [-EnableAdditionalNotification] [-EnableDailyNotification] [-EnableSnmpNotification] -NotificationOptions <VBRNotificationOptions> 
```
```PowerShell
[-NotificationSubject <String>] [-NotifyOnError] [-NotifyOnLastRetryOnly] [-NotifyOnSuccess] [-NotifyOnWarning] [-NotifyWhenWaitingForTape] [-SendTime <TimeSpan>] [-UseNotificationOptions] [<CommonParameters>]
```
