Get-VBRRestoreSession
---------------------

### Synopsis
Returns restore sessions.

---

### Description

This cmdlet returns restore sessions stored in Veeam Backup & Replication database.
You can get the list of all restore sessions or get the restore sessions of a specific VM or VMs.

---

### Examples
> Example 1. Getting All Restore Sessions in Database

```PowerShell
Get-VBRRestoreSession
This command looks for all restore sessions stored in the database.
```
> Example 2. Getting Restore Sessions of Specific VMs

```PowerShell
Get-VBRRestoreSession -Name "Hv_DNS", "Hv_DC"
This command looks for the restore sessions of the Hv_DNS and Hv_DC VMs.
```

---

### Parameters
#### **Id**
Specifies the array of the restore sessions IDs. The cmdlet will return the restore sessions with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies the array of VM names. The cmdlet will return the restore sessions of these VMs.

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
Get-VBRRestoreSession [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRRestoreSession [-Name <String[]>] [<CommonParameters>]
```
