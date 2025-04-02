Get-VSBTaskSession
------------------

### Synopsis
Returns tasks performed during the specified SureBackup session.

---

### Description

This cmdlet returns the list of tasks performed during the specified SureBackup session.

Run Get-VBRTaskSession to get the tasks for backup, replication and backup copy sessions.

---

### Examples
> Example 1

```PowerShell
Get-VSBSession -Name "Exchange SureJob" | Get-VBRTaskSession -Name "DC", "DNS"
This command gets the list of tasks performed for the VMs named "DC" and "DNS" in the SureBackup job session named "Exchange SureJob". The SureBackup session is obtained with Get-VSBSession and piped down.
```
> Example 2

```PowerShell
Get-VSBTaskSession -Session $"Exchange SureJob" -Name "DC", "DNS"
This command gets the list of tasks performed for the VMs named "DC" and "DNS" in the SureBackup job session represented by the $"Exchange SureJob" variable. The SureBackup session is obtained with Get-VSBSession and assigned to the variable beforehand.
```

---

### Parameters
#### **Name**
Specifies the name of the SureBackup job within the session you indicated in the Session parameter the tasks for which you want to get. You can specify multiple names separated by commas.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Session**
Specifies the SureBackup session the tasks of which you want to get.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CSbSession]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.SureBackup.CSbSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VSBTaskSession [-Session] <CSbSession> [-Name <String[]>] [<CommonParameters>]
```
