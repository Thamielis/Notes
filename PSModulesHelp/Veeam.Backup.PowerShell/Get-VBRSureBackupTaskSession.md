Get-VBRSureBackupTaskSession
----------------------------

### Synopsis
Returns tasks performed during the specified SureBackup session.

---

### Description

This cmdlet returns the list of tasks performed during the specified SureBackup session.
Run the Get-VBRTaskSession cmdlet to get the tasks for backup, replication and backup copy sessions.

---

### Related Links
* [Get-VBRSureBackupSession](Get-VBRSureBackupSession)

---

### Examples
> Getting List of SureBackup Sessions by Name

$job = Get-VBRSureBackupSession -Name "Winserver SureBackupJob"
Get-VBRSureBackupTaskSession -Session $job -Name "srv1"
This example shows how to get the list of tasks performed for the VM named srv1 in the SureBackup job session named Winserver SureBackupJob.
Perform the following steps:
1. Run the Get-VBRSureBackupSession cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRSureBackupTaskSession cmdlet. Set the $job variable as the Session parameter value. Specify the Name parameter value.

---

### Parameters
#### **Id**
Specifies the array of SureBackup sessions ID. The cmdlet will return sessions with this ID.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of SureBackup job names. The cmdlet will return tasks performed for VMs in these jobs during the selected job session.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Session**
Specifies the array of SureBackup sessions. The cmdlet will return tasks performed during these sessions.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[IVBRSureBackupSession]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
System.String[]

System.Guid[]

Veeam.Backup.PowerShell.Infos.IVBRSureBackupSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRSureBackupTaskSession [-Session] <IVBRSureBackupSession> [-Id <Guid[]>] [-Name <String[]>] [<CommonParameters>]
```
