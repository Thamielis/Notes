Get-VBRUnstructuredBackup
-------------------------

### Synopsis
Returns backup files created by file backup jobs and object storage backup jobs.

---

### Description

This cmdlet returns backup files created by file backup jobs and object storage backup jobs.

---

### Examples
> Example 1. Getting Backup Files Created by File Backup Job

```PowerShell
Get-VBRUnstructuredBackup -Name "Reports backup"
This command gets backup files that are created by the Reports backup file backup job. The cmdlet output will contain settings of the backup file created by the Reports backup file backup job.
```
> Example 2. Getting Backup Files by Object Storage Backup Job

```PowerShell
Get-VBRUnstructuredBackup -ID e5559d89-ca63-48dc-a53b-d9c54b7f2482
This command gets backup files that are created by the e5559d89-ca63-48dc-a53b-d9c54b7f2482 object storage backup job. The cmdlet output will contain settings of the backup file crated by the e5559d89-ca63-48dc-a53b-d9c54b7f2482 object storage backup job.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for file backup jobs and object storage backup jobs. The cmdlet will return an array of backup files that are created by these jobs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of names for file backup jobs and object storage backup jobs. The cmdlet will return an array of backup files that are created by these jobs.

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
Get-VBRUnstructuredBackup -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredBackup -Name <String[]> [<CommonParameters>]
```
