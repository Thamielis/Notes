Get-VBRMailNotificationConfiguration
------------------------------------

### Synopsis
Returns global email notification settings.

---

### Description

This cmdlet returns global email notification settings.

---

### Examples
> Getting Global Email Notification Settings

```PowerShell
Get-VBRMailNotificationConfiguration
Enabled               : False
SmtpServer            :
Sender                :
Recipient             :
Subject               : [%JobResult%] %JobName% (%ObjectCount% objects) %Issues%
DailyReportsTime      : 3/8/2021 10:00:00 PM
Port                  : 25
Timeout               : 100000
SSLEnabled            : False
AuthEnabled           : False
Credentials           :
NotifyOnSuccess       : True
NotifyOnWarning       : True
NotifyOnFailure       : True
NotifyOnLastRetryOnly : True
This command returns global email notification settings. The cmdlet output will contain details on notification settings.
```

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
Get-VBRMailNotificationConfiguration [<CommonParameters>]
```
