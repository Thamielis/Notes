Get-VBRPluginJob
----------------

### Synopsis
Returns plug-in jobs.

---

### Description

This cmdlet returns the VBRPluginBackupJob and VBRPluginBackupCopyJob objects that contains settings of the following types of jobs:
- A plug-in backup job that was created to back up Oracle RMAN, SAP HANA or SAP on Oracle.
- A plug-in backup copy job.

---

### Examples
> Example 1. Getting All Plug-In Jobs

Get-VBRPluginJob
This command returns all plug-in backup and plug-in backup copy jobs that are created in the Veeam Backup & Replication infrastructure.
> Example 2. Getting Plug-In Backup Copy Job by Name

```PowerShell
Get-VBRPluginJob -Name "Plug-in backup 17"
This command returns the plug-in backup 17 plug-in backup copy job.
```
> Example 3. Getting Plug-in Backup Copy Job by ID

```PowerShell
Get-VBRPluginJob -Id "35d7b6cc-5726-4ec9-a954-f58109f3ff28"
This command returns the 35d7b6cc-5726-4ec9-a954-f58109f3ff28 plug-in backup copy job.
```

---

### Parameters
#### **Id**
Specifies an ID of a job. The cmdlet will return the job with this ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies a name of a job. The cmdlet will return the job with this name.

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
Get-VBRPluginJob [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRPluginJob [-Name <String[]>] [<CommonParameters>]
```
