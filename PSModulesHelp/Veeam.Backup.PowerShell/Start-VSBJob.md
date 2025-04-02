Start-VSBJob
------------

### Synopsis
Starts a created SureBackup job.

---

### Description

This cmdlet allows you to start a created SureBackup job.

When you create a job, you need to run it manually unless you enable a job schedule. Run Set-VSBJobSchedule to schedule the SureBackup job to run automatically.

Run Stop-VSBJob to stop a running SureBackup job. Run Start-VBRJob to start a backup, replication or copy job.

---

### Examples
> Example 1

```PowerShell
Get-VSBJob -Name "SharePoint SureJob 01", "SharePoint SureJob 02" | Start-VSBJob
This command starts the SureBackup jobs named "SharePoint SureJob 01" and "SharePoint SureJob 02". The jobs are obtained with Get-VSBJob and piped down.
```
> Example 2

```PowerShell
Start-VSBJob -Job $SureJob
This command starts the SureBackup job represented by the $SureJob variable. The job object is obtained with Get-VSBJob and assigned to the variable beforehand.
```

---

### Parameters
#### **Job**
Specifies the SureBackup job you want to run. You can assign multiple jobs to this object.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[CSbJob[]]`|false   |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Indicates that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Start-VSBJob [[-Job] <CSbJob[]>] [-RunAsync] [<CommonParameters>]
```
