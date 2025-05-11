Start-VBRConfigurationBackupJob
-------------------------------

### Synopsis
Starts the configuration backup job.

---

### Description

This cmdlet starts the configuration backup job.

---

### Examples
> Starting Configuration Backup Job in RunAsync Mode

```PowerShell
Start-VBRConfigurationBackupJob -RunAsync
This command starts the configuration backup job in the RunAsync mode.
```

---

### Parameters
#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

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
Start-VBRConfigurationBackupJob [-RunAsync] [<CommonParameters>]
```
