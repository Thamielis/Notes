Get-VBRHistoryOptions
---------------------

### Synopsis
Returns job sessions history settings.

---

### Description

This cmdlet returns sessions history settings for jobs that are available on a backup server.

---

### Examples
> Getting Job Sessions History Settings

Get-VBRHistoryOptions
KeepAllSessions RetentionLimitWeeks
--------------- -------------------
          False                  13
This command returns history settings for jobs that are available on a backup server.
The cmdlet output will contain the following details on the sessions history settings: KeepAllSessions and RetentionLimitWeeks.

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
Get-VBRHistoryOptions [<CommonParameters>]
```
