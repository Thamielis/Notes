Get-VBRComputerBackupJobSession
-------------------------------

### Synopsis
Returns jobs sessions.

---

### Description

This cmdlet returns job sessions. You can get sessions of Veeam Agent jobs that are managed by Veeam Backup & Replication and Veeam Agent backup policies.

---

### Examples
> Example 1. Getting Agent Jobs Sessions by Name

```PowerShell
Get-VBRComputerBackupJobSession -Name "Windows backup policy"
This command returns the Windows backup policy Agent job session.
```
> Example 2. Get Agent Jobs Sessions by ID

```PowerShell
Get-VBRComputerBackupJobSession -Id 1137c678-e79d-48c4-8d30-b921a612ba1e
This command returns the 1137c678-e79d-48c4-8d30-b921a612ba1e Agent job session.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for Veeam Agent job sessions. The cmdlet will return the sessions with these IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for Veeam Agent jobs. The cmdlet will return sessions with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String[]

System.Guid[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRComputerBackupJobSession [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRComputerBackupJobSession [-Name <String[]>] [<CommonParameters>]
```
