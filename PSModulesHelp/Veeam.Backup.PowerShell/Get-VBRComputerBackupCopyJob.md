Get-VBRComputerBackupCopyJob
----------------------------

### Synopsis
Returns Veeam Agent backup copy jobs.

---

### Description

This cmdlet returns Veeam Agent backup copy jobs.

---

### Examples
> Example 1. Getting all Veeam Agent Backup Copy Jobs

```PowerShell
Get-VBRComputerBackupCopyJob
This command returns all Veeam Agent backup copy jobs.
```
> Example 2. Getting Veeam Agent Backup Copy Job by Name

```PowerShell
Get-VBRComputerBackupCopyJob -Name "Windows Copy Job05"
This command returns the Windows Copy Job05 Veeam Agent backup copy job.
```
> Example 3. Getting Veeam Agent Backup Copy Job by ID

```PowerShell
Get-VBRComputerBackupCopyJob -Id "c4bb4625-7158-43d7-ab63-beaee75d2cff"
This command returns the c4bb4625-7158-43d7-ab63-beaee75d2cff Veeam Agent backup copy job.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for Veeam Agent backup copy jobs. The cmdlet will return jobs with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies an array of names for Veeam Agent backup copy jobs. The cmdlet will return jobs with these names.

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
Get-VBRComputerBackupCopyJob [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRComputerBackupCopyJob [-Name <String[]>] [<CommonParameters>]
```
