Get-VBRNASBackupJob
-------------------

### Synopsis
Returns file backup jobs.

---

### Description

This cmdlet returns file backup jobs.

---

### Examples
> Example 1. Getting all File Backup Jobs

Get-VBRNASBackupJob
This command returns all file backup jobs that are added to the Veeam Backup & Replication infrastructure.
> Example 2. Getting File Backup Job by Name

```PowerShell
Get-VBRNASBackupJob -Name "SMB Backup"
This command returns the "SMB Backup" file backup job.
```
> Example 3. Getting File Backup Job by ID

```PowerShell
Get-VBRNASBackupJob -ID "0789b522-c02c-4d05-a619-dee26520495d"
This command returns the 0789b522-c02c-4d05-a619-dee26520495d file backup job.
```

---

### Parameters
#### **Id**
Specifies an ID of a file backup job. The cmdlet will return an array of jobs with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies a name of a file backup job. The cmdlet will return an array of jobs with the specified name.

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
Get-VBRNASBackupJob -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNASBackupJob -Name <String[]> [<CommonParameters>]
```
