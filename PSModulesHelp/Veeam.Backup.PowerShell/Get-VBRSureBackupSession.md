Get-VBRSureBackupSession
------------------------

### Synopsis
Returns SureBackup sessions that have been run.

---

### Description

This cmdlet returns the list of all SureBackup sessions that have been run.
Run the Get-VBRSureBackupTaskSession cmdlet to get the list of all tasks performed during the specific SureBackup session.
Run the Get-VBRBackupSession cmdlet to get list of backup sessions that have been run.

---

### Examples
> Example 1. Getting List of All SureBackup Sessions

```PowerShell
Get-VBRSureBackupSession
This command returns the list of all SureBackup sessions.
```
> Example 2. Getting SureBackup Session by Name

```PowerShell
Get-VBRSureBackupSession -Name "Winserver SureBackupJob"
This command returns the SureBackup sessions named Winserver SureBackupJob.
```

---

### Parameters
#### **Id**
Specifies the array of SureBackup sessions IDs. The cmdlet will return sessions with these IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of SureBackup session names. The cmdlet will return sessions with these names.
The name of a SureBackup session is the name of the SureBackup job.

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
Get-VBRSureBackupSession [-Id <Guid[]>] [-Name <String[]>] [<CommonParameters>]
```
