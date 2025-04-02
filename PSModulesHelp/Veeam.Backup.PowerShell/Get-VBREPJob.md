Get-VBREPJob
------------

### Synopsis
Returns backup jobs run by Veeam Agent operating in a standalone mode.

---

### Description

This cmdlet returns backup jobs run by Veeam Agent operating in a standalone mode.

---

### Examples
> Example 1. Getting All Backup Jobs by Veeam Agent in Standalone Mode

```PowerShell
Get-VBREPJob
This command returns all backup jobs run by Veeam Agent operating in a standalone mode.
```
> Example 2. Getting Specific Backup Job by Veeam Agent in Standalone Mode

```PowerShell
Get-VBREPJob -Name "Backup Job Mediaserver"
This command gets a backup job run by Veeam Agent operating in a standalone mode by the job name.
```

---

### Parameters
#### **Id**
Specifies the array of job IDs. The cmdlet will return the backup jobs with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies the array of  backup job names. The cmdlet will return jobs with these names.

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
Get-VBREPJob [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBREPJob [-Name <String[]>] [<CommonParameters>]
```
