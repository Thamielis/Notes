New-VSBJobOptions
-----------------

### Synopsis
Sets SureBackup job options.

---

### Description

This cmdlet lets you edit job settings of SureBackup jobs.

This cmdlet returns the CDRJobOptions object containing the default settings of the SureBackup job you want to edit. You can customize any setting that you want to apply. This object is then used in the Set-VSBJobOptions cmdlet.

---

### Examples
> Example 1

```PowerShell
$sureoptions = New-VSBJobOptions
C:\PS> $sureoptions.EmailNotification = "True"
C:\PS> $sureoptions.EmailNotificationAddresses = "mailto@veeam.com"
C:\PS> $sureoptions.RunningVmsNumber = 6

C:\PS> $sureoptions

RunManually                : True
ShutdownTestVms            : True
EmailNotification          : True
EmailNotificationAddresses : mailto@veeam.com
SnmpNotification           : False
LinkWithJobs               : False
RunningVmsNumber           : 6
Validation                 : False
SkipValidationForAppGroup  : True
This command creates a CDRJobOptions object with the following settings: - The EmailNotification is enabled,

- The EmailNotificationAddresses is set to mailto@veeam.com,

- The RunningVmsNumber is set to 6,

- The other settings are left by default.
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
New-VSBJobOptions [<CommonParameters>]
```
