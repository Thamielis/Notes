Get-VBRAmazonRestoreSession
---------------------------

### Synopsis
Returns active restore sessions to Amazon EC2

---

### Description

This cmdlet returns active restore to Amazon EC2 sessions.

---

### Examples
> Example 1

```PowerShell
Get-VBRAmazonRestoreSession -Session "New session"
This command gets the active restore session to Amazon EC2.
```

---

### Parameters
#### **Id**
Specifies the ID of the restore to Amazon EC2 active session you want to get.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[Guid]`|false   |named   |True (ByPropertyName)|

#### **Session**
Specifies the restore to Amazon EC2 active session that you want to get.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRAmazonRestoreSession]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonRestoreSession

System.Guid

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAmazonRestoreSession [-Id <Guid>] [<CommonParameters>]
```
```PowerShell
Get-VBRAmazonRestoreSession [-Session <VBRAmazonRestoreSession>] [<CommonParameters>]
```
