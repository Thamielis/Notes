Disable-VSBJob
--------------

### Synopsis
Puts a selected SureBackup job on hold.

---

### Description

This cmdlet puts a selected SureBackup job on hold. The job and its settings are not deleted from Veeam Backup & Replication. You can enable the job at any time by running Enable-VSBJob. Run Stop-VSBJob to stop the job once without disabling it.

---

### Examples
> Example 1

---

### Parameters
#### **Job**
Specifies the SureBackup job you want to disable.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[CSbJob[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.SureBackup.CSbJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VSBJob [-Job <CSbJob[]>] [<CommonParameters>]
```
