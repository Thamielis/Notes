Set-VBRProtectionGroupNotificationOptions
-----------------------------------------

### Synopsis
Modifies notification options for protection groups.

---

### Description

This cmdlet modifies notification options for protection groups.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRProtectionGroupNotificationOptions](New-VBRProtectionGroupNotificationOptions)

---

### Examples
> Modifying Additional Notifications for Protection Groups

$options = New-VBRProtectionGroupNotificationOptions -EnableAdditionalNotification -AdditionalAddress admin@domain.com -SendTime 05:00
Set-VBRProtectionGroupNotificationOptions -NotificationOptions $options -EnableAdditionalNotification -UseNotificationOptions -NotifyOnError
This example shows how to modify additional notifications for protection groups.
Perform the following steps:
1. Run the New-VBRProtectionGroupNotificationOptions cmdlet. Provide the EnableAdditionalNotification parameter. Specify the AdditionalAddress and SendTime parameter values. Save the result to the $options variable.
2. Run the Set-VBRProtectionGroupNotificationOptions cmdlet. Specify the following settings:
- Set the $options variable as the NotificationOptions parameter value.
- Provide the EnableAdditionalNotification parameter.
- Provide the UseNotificationOptions parameter.
- Provide the NotifyOnError parameter.

---

### Parameters
#### **AdditionalAddress**
Specifies an array of email addresses. Veeam Backup & Replication will send notifications to this email address.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **EnableAdditionalNotification**
Enables custom custom email notifications for the protection group.
Default: Disabled.
Note: You must specify at least one email address to enable custom email notifications. Use the AdditionalAddress parameter to specify the email address.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NotificationOptions**
Specifies the notification options that you want to modify.

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[VBRProtectionGroupNotificationOptions]`|true    |named   |False        |

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

---

### Syntax
```PowerShell
Set-VBRProtectionGroupNotificationOptions [-AdditionalAddress <String[]>] [-EnableAdditionalNotification] -NotificationOptions <VBRProtectionGroupNotificationOptions> [-NotificationSubject <String>] 
```
```PowerShell
[-NotifyOnError] [-NotifyOnSuccess] [-NotifyOnWarning] [-SendTime <TimeSpan>] [-UseNotificationOptions] [<CommonParameters>]
```
