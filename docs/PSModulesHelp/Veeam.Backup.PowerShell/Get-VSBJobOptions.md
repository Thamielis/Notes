Get-VSBJobOptions
-----------------

### Synopsis
Returns settings of a selected SureBackup job.

---

### Description

This cmdlet returns the list of job settings for the specified SureBackup job.

---

### Examples
> Example 1

```PowerShell
Get-VSBJob -Name "SureJob 02" | Get-VSBJobOptions
This command looks for the list of job settings for the SureBackup job named "SureJob 02". The SureBackup job is obtained with Get-VSBJob and piped down.
```
> Example 2

```PowerShell
Get-VSBJobOptions -Job $SureJob
This command looks for the list of job settings for the SureBackup job represented by the $SureJob variable. The SureBackup job is obtained with Get-VSBJob and assigned to the variable beforehand.
```

---

### Parameters
#### **Job**
Specifies the SureBackup job you want to get the settings of.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[CSbJob]`|false   |0       |True (ByPropertyName, ByValue)|

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
Get-VSBJobOptions [[-Job] <CSbJob>] [<CommonParameters>]
```
