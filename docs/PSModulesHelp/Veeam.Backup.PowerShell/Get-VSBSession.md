Get-VSBSession
--------------

### Synopsis
Returns SureBackup sessions that have been run.

---

### Description

This cmdlet returns the list of all SureBackup sessions that have been run.

Run Get-VSBTaskSession to get the list of all tasks performed during the specific SureBackup session. Run Get-VBRBackupSession to get list of backup sessions that have been run.

---

### Examples
> Example 1

```PowerShell
Get-VSBSession
This command looks for the list of all backup sessions.
```
> Example 2

```PowerShell
Get-VSBSession -Name *Winserver SureJob*
This command looks for the SureBackup session named "Winserver SureJob".
```

---

### Parameters
#### **Name**
Specifies the name of the SureBackup session you want to get, or search conditions. The name of the SureBackup session is a name of the SureBackup job. You can specify multiple names separated by commas.

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
Get-VSBSession [-Name <String[]>] [<CommonParameters>]
```
