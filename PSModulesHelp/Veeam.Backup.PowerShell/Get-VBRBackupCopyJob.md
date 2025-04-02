Get-VBRBackupCopyJob
--------------------

### Synopsis
Returns backup copy jobs.

---

### Description

This cmdlet returns backup copy jobs.

---

### Examples
> Example 1. Getting All Backup Copy Jobs

```PowerShell
Get-VBRBackupCopyJob
This command returns all backup copy jobs.
```
> Example 2. Getting Backup Copy Job by Name

```PowerShell
Get-VBRBackupCopyJob -Name "Copy Job05"
This command returns the Copy Job05 backup copy job.
```
> Example 3. Getting Backup Copy Job by ID

```PowerShell
Get-VBRBackupCopyJob -Id "c4bb4625-7158-43d7-ab63-beaee75d2cff"
This command returns the c4bb4625-7158-43d7-ab63-beaee75d2cff backup copy job.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for backup copy jobs. The cmdlet will return jobs with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies an array of names for backup copy jobs. The cmdlet will return jobs with these names.

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
Get-VBRBackupCopyJob [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRBackupCopyJob [-Name <String[]>] [<CommonParameters>]
```
