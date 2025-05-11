Reset-VSBJobOptions
-------------------

### Synopsis
Sets SureBackup job settings to default.

---

### Description

This cmdlet clears the custom settings of the specified SureBackup job and restores their default values.

---

### Examples
> Example 1

```PowerShell
Get-VSBJob -Name "SureBackup Job 1", "SureBackup Job 2" | Reset-VSBJobOptions
This command sets default settings to SureBackup jobs named "SureBackup Job 1" and "SureBackup Job 2". The jobs object is obtained with Get-VSBJob and piped down.
```
> Example 2

```PowerShell
Reset-VSBJobOptions -Job $SureJob
This command sets default settings to the SureBackup job represented by the $SureJob variable. The job object is obtained with Get-VSBJob and assigned to the variable beforehand.
```

---

### Parameters
#### **Job**
Specifies the SureBackup job you want to edit.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[CSbJob]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.SureBackup.CSbJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Reset-VSBJobOptions [-Job <CSbJob>] [<CommonParameters>]
```
