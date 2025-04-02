Set-VBRHistoryOptions
---------------------

### Synopsis
Modifies job sessions history settings.

---

### Description

This cmdlet modifies job sessions history settings.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Examples
> Example 1. Modifying Session History Settings to Keep all Sessions

Set-VBRHistoryOptions -KeepAllSessions
KeepAllSessions RetentionLimitWeeks
--------------- -------------------
           True                  -1
This command modifies history settings. According to these settings, Veeam Backup & Replication will keep all sessions information in the database.
> Example 2. Modifying Session History Settings to Keep Sessions for Several Weeks

Set-VBRHistoryOptions -RetentionLimitWeeks 7
KeepAllSessions RetentionLimitWeeks
--------------  -------------------
         False                    8
This command modifies history settings.  According to these settings, Veeam Backup & Replication will keep session information in the database for 7 weeks.

---

### Parameters
#### **KeepAllSessions**
Defines that Veeam Backup & Replication will not delete the session information from the database.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RetentionLimitWeeks**
Specifies a period in weeks.
Veeam Backup & Replication will keep the session information from the database for this period of time. Default: 13.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
Set-VBRHistoryOptions [-KeepAllSessions] [<CommonParameters>]
```
```PowerShell
Set-VBRHistoryOptions [-RetentionLimitWeeks <Int32>] [<CommonParameters>]
```
