Get-VBRUnstructuredBackupSession
--------------------------------

### Synopsis
Returns backup sessions for file backup jobs and object storage backup jobs.

---

### Description

This cmdlet returns backup sessions for file backup jobs and object storage backup jobs.

---

### Examples
> Example - Getting All Backup Sessions for File Backup Job

```PowerShell
Get-VBRUnstructuredBackupSession -Name "New backup session*"
This command returns all backup sessions for the New backup session file backup job.
```

---

### Parameters
#### **Id**
Specifies an array of IDs of backup sessions for file backup jobs and object storage backup jobs. The cmdlet will return backup sessions with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of names of backup sessions for file backup jobs and object storage backup jobs. The cmdlet will return backup sessions with these names.
Note: Veeam Backup & Replication adds (Full) at the end of the job name for full backup sessions. Depending on the type of the backup session you may specify the job name in one of the following ways:
* To get incremental backup sessions, specify the job name as it was specified when creating the job.
* To get full backup sessions, add (Full) at the end of the Name parameter.
* To get both full and incremental backup sessions for the job, add * at the end of the Name parameter.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

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
Get-VBRUnstructuredBackupSession -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredBackupSession -Name <String[]> [<CommonParameters>]
```
