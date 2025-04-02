Get-VBRGlobalNotificationOptions
--------------------------------

### Synopsis
Returns global notification settings.

---

### Description

This cmdlet returns the global notification settings on the following events:
- Low disk space
- Support contract expiration
- New product versions, available updates and patches

---

### Examples
> Getting Global Notification Settings

```PowerShell
Get-VBRGlobalNotificationOptions
StorageSpaceThresholdEnabled   : True
StorageSpaceThreshold          : 10
DatastoreSpaceThresholdEnabled : True
DatastoreSpaceThreshold        : 10
SkipVMSpaceThresholdEnabled    : True
SkipVMSpaceThreshold           : 5
NotifyOnSupportExpiration      : True
NotifyOnUpdates                : True
This command returns global notification settings. The cmdlet output will contain information on these settings.
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
Get-VBRGlobalNotificationOptions [<CommonParameters>]
```
