Stop-VBRNASBackupFLRSession
---------------------------

### Synopsis
Stops restore sessions started to recover backups created by file backup jobs.

---

### Description

This cmdlet stops restore sessions started to recover backups created by file backup jobs.

---

### Related Links
* [Get-VBRNASBackupFLRSession](Get-VBRNASBackupFLRSession)

---

### Examples
> Stopping Restore Sessions

$session = Get-VBRNASBackupFLRSession
Stop-VBRNASBackupFLRSession -Session $session
This example shows how to stop a restore session that is started to recover backups created by file backup jobs.

Perform the following steps:
1. Run the Get-VBRNASBackupFLRSession cmdlet. Save the result to the $session variable.
2. Run the Stop-VBRNASBackupFLRSession cmdlet. Set the $session variable as the Session parameter value.

---

### Parameters
#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies a restore session.  The cmdlet will stop this restore session. Accepts the VBRNASBackupFLRSession object.  To get this object, run the Get-VBRNASBackupFLRSession cmdlet.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRNASBackupFLRSession]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackupFLRSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRNASBackupFLRSession [-RunAsync] -Session <VBRNASBackupFLRSession> [<CommonParameters>]
```
