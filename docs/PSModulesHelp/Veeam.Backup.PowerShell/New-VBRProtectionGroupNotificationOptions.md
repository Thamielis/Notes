New-VBRProtectionGroupNotificationOptions
-----------------------------------------

### Synopsis
Creates notification options for protection groups.

---

### Description

This cmdlet creates the VBRProtectionGroupNotificationOptions object. This object contains notification options for protection groups.
IMPORTANT!
Email notification can be configured for the protection groups only in case the global email notifications are enabled. Note that you cannot enable the global email notifications with Veeam PowerShell. To learn more about notification settings, see Specifying Email Notification Settings of the Veeam Backup & Replication User Guide.

---

### Examples
> Creating Notification Options for Protection Group

$options = New-VBRProtectionGroupNotificationOptions -EnableAdditionalNotification -AdditionalAddress admin@domain.com -SendTime 05:00
The example shows how to create notifications options for the protection group. Veeam Backup & Replication will send notifications at 5:00 PM.
Save the result to the $options variable to use it when you create a protection group and to get it in case you need to modify notification options.

---

### Parameters
#### **AdditionalAddress**
Specifies an array of email addresses. Veeam Backup & Replication will send notifications to this email address.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **EnableAdditionalNotification**
Enables custom email notifications for the protection group.
Default: Disabled.
Note: You must specify at least one email address to enable custom email notifications. Use the AdditionalAddress parameter to specify the email address.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotificationSubject**
Specifies the subject for the email notifications.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotifyOnError**
Defines that an email will be sent if the job finishes with error.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnSuccess**
Defines that an email will be sent if the job finishes successfully.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotifyOnWarning**
Defines that an email will be sent if the job finishes with warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SendTime**
Specifies the time when notifications will be sent.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |False        |

#### **UseNotificationOptions**
Enables custom notification setting.
Use the following parameters to set the custom settings:
* NotifyOnSuccess
* NotifyOnWarning
* NotifyOnError
Default: Disabled.

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
Email notification can be configured for the protection groups only in case the global email notifications are enabled. Note that you cannot enable the global email notifications with Veeam PowerShell. To learn 
more about notification settings, see Veeam Backup & Replication user guide at http://www.veeam.com/vmware-backup/help-center.

---

### Syntax
```PowerShell
New-VBRProtectionGroupNotificationOptions [-AdditionalAddress <String[]>] [-EnableAdditionalNotification] [-NotificationSubject <String>] [-NotifyOnError] [-NotifyOnSuccess] [-NotifyOnWarning] [-SendTime 
```
```PowerShell
<TimeSpan>] [-UseNotificationOptions] [<CommonParameters>]
```
