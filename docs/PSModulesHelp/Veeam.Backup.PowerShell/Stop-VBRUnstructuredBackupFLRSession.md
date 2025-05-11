Stop-VBRUnstructuredBackupFLRSession
------------------------------------

### Synopsis
Stops restore sessions started to recover backups created by file backup jobs or object storage backup jobs.

---

### Description

This cmdlet stops restore sessions started to recover backups created by file backup jobs or object storage backup jobs.

---

### Related Links
* [Get-VBRUnstructuredBackupFLRItemVersion](Get-VBRUnstructuredBackupFLRItemVersion)

---

### Examples
> Stopping Restore Session Runnug to Recover Unstructured Data

$session = Get-VBRUnstructuredBackupFLRItemVersion          
Stop-VBRUnstructuredBackupFLRSession -Session $session
This example shows how to stop a restore session that is started to recover backups created by file backup jobs and object storage backup jobs.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupFLRItemVersion cmdlet. Save the result to the $session variable.
2. Run the Stop-VBRUnstructuredBackupFLRSession cmdlet. Set the $session variable as the Session parameter value.

---

### Parameters
#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies a restore session. The cmdlet will stop this restore session. Accepts the VBRUnstructuredBackupFLRSession object.  To get this object, run the Get-VBRUnstructuredBackupFLRItemVersion cmdlet.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupFLRSession]`|true    |named   |True (ByPropertyName, ByValue)|

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
Stop-VBRUnstructuredBackupFLRSession [-RunAsync] -Session <VBRUnstructuredBackupFLRSession> [<CommonParameters>]
```
