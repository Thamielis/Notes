Get-VBRUnstructuredBackupJob
----------------------------

### Synopsis
Returns file backup jobs and object storage backup jobs.

---

### Description

This cmdlet returns file backup jobs and object storage backup jobs.

---

### Examples
> Example 1. Getting File Backup Job by Name

```PowerShell
Get-VBRUnstructuredBackupJob -Name "SMB Backup"
This command returns the SMB Backup file backup job.
```
> Example 2. Getting Object Storage Backup Job by ID

```PowerShell
Get-VBRUnstructuredBackupJob -ID "0789b522-c02c-4d05-a619-dee26520495d"
This command returns the 0789b522-c02c-4d05-a619-dee26520495d object storage backup job.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for file backup jobs and object storage backup jobs. The cmdlet will return an array of jobs with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of names for file backup jobs and object storage backup jobs. The cmdlet will return an array of jobs with the specified name.

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
Get-VBRUnstructuredBackupJob -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredBackupJob -Name <String[]> [<CommonParameters>]
```
