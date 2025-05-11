Get-VBRTaskSession
------------------

### Synopsis
Returns tasks performed during job sessions.

---

### Description

This cmdlet returns tasks performed during the specified session. The tasks are VMs processed during one job session.
Run the Get-VBRSureBackupTaskSession cmdlet to get the tasks for SureBackup jobs session.

---

### Related Links
* [Get-VBRBackupSession](Get-VBRBackupSession)

---

### Examples
> Example 1. Getting List of Tasks Performed for VMs [Using Pipeline]

Get-VBRBackupSession -Name "Exchange Backup (Incremental)" | Get-VBRTaskSession -Name "DC", "DNS"
This example shows how to get the list of tasks performed for the DC and DNS VMs in the backup job session with incremental backups named Exchange Backup.
Perform the following steps:
1. Run the Get-VBRBackupSession cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRTaskSession cmdlet. Specify the Name parameter value.
> Example 2. Getting List of Tasks Performed for VMs [Using Variable]

$ExchangeSession = Get-VBRBackupSession -Name "Exchange Backup (Incremental)"
Get-VBRTaskSession -Session $ExchangeSession -Name "DC", "DNS"
This example shows how to get the list of tasks performed for the DC and DNS VMs in the backup job session with incremental backups named Exchange Backup.
Perform the following steps:
1. Run the Get-VBRBackupSession cmdlet. Specify the Name parameter value. Save the result to the $ExchangeSession variable.
2. Run the Get-VBRTaskSession cmdlet. Set the $ExchangeSession variable as the Session parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies the array of job object names (for example, VMs in job).
The cmdlet will return tasks performed for these objects during the selected session.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Session**
Specifies the session tasks which you want to get.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[VBRSession]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRTaskSession [-Session] <VBRSession> [-Name <String[]>] [<CommonParameters>]
```
