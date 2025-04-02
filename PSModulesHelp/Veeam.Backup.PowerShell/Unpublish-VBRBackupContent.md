Unpublish-VBRBackupContent
--------------------------

### Synopsis
Unpublishes disks.

---

### Description

This cmdlet unpublishes disks.

---

### Related Links
* [Get-VBRPublishedBackupContentSession](Get-VBRPublishedBackupContentSession)

---

### Examples
> Unmounting Content of Backup Files

$session = Get-VBRPublishedBackupContentSession
Unpublish-VBRBackupContent -Session $session -RunAsync
This example shows how to unmount the content of backup files from the iSCSI target server.

Perform the following steps:
1. Run the Get-VBRPublishedBackupContentSession cmdlet. Save the result to the $session variable.
2. Run the Unpublish-VBRBackupContent cmdlet. Set the $session variable as the Session parameter value. Provide the RunAsync parameter.

---

### Parameters
#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies a session that is running to publish disks.

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[VBRBackupContentPublicationSession]`|true    |0       |False        |

---

### Inputs
None

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes

---

### Syntax
```PowerShell
Unpublish-VBRBackupContent [-Session] <VBRBackupContentPublicationSession> [-RunAsync] [<CommonParameters>]
```
