Get-VBRJob
----------

### Synopsis
Returns existing jobs.

---

### Description

This cmdlet returns jobs stored in Veeam Backup & Replication database.
With this cmdlet, you can get the following jobs:
- Backup jobs
- Replication jobs
- Backup copy jobs
- File copy jobs
- VM Copy jobs
- Object storage backup jobs
You can get the list of all jobs or look for instances directly by name.
Run the Get-VBRBackupSession or Get-VBRTaskSession cmdlets to get the information on job session or session tasks.
Run the Get-VBRTapeJob cmdlet to get tape jobs.
Run the Get-VBRSureBackupJob cmdlet to get SureBackup jobs.
Run the Get-VBREPJob cmdlet to get Veeam Agent for Microsoft Windows backup jobs.
Important:
The Get-VBRJob cmdlet is deprecated for Veeam Agent jobs and policies. Run the Get-VBRComputerBackupJob cmdlet instead.

---

### Examples
> Example 1. Getting List of Backup Copy Jobs

```PowerShell
Get-VBRJob -Name "Backup Copy Job"
This command gets the list of backup copy jobs.
```

---

### Parameters
#### **Name**
Specifies the array of job names. The cmdlet will return jobs with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
Get-VBRJob [-Name <String[]>] [<CommonParameters>]
```
