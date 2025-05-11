Get-VBRApplicationBackupJobSession
----------------------------------

### Synopsis
Returns job sessions.

---

### Description

This cmdlet returns job sessions of application backup policies that are managed by Veeam Backup & Replication.

---

### Examples
> Example 1. Getting Application Policy Sessions by Name

```PowerShell
Get-VBRApplicationBackupJobSession -Name "Database backup policy"
This command returns the Database backup policy application policy session.
```
> Example 2. Get Application Policy Sessions by ID

```PowerShell
Get-VBRApplicationBackupJobSession -Id 1137c678-e79d-48c4-8d30-b921a612ba1e
This command returns the 1137c678-e79d-48c4-8d30-b921a612ba1e application policy session.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for application policy sessions. The cmdlet will return the sessions with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies an array of names for application policy sessions. The cmdlet will return sessions with these names.

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
Get-VBRApplicationBackupJobSession [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRApplicationBackupJobSession [-Name <String[]>] [<CommonParameters>]
```
