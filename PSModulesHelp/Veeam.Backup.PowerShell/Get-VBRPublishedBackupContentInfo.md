Get-VBRPublishedBackupContentInfo
---------------------------------

### Synopsis
Returns details on the published disks.

---

### Description

This cmdlet returns details on the published disks.

---

### Related Links
* [Get-VBRPublishedBackupContentSession](Get-VBRPublishedBackupContentSession)

---

### Examples
> Getting Details about Content of Backup Files

```PowerShell
$session = Get-VBRPublishedBackupContentSession
Get-VBRPublishedBackupContentInfo -Session $session
This example shows how to get details on the published disks.

Perform the following steps: 1. Run the Get-VBRPublishedBackupContentSession cmdlet. Save the result to the $session variable. 2. Run the Get-VBRPublishedBackupContentInfo cmdlet. Set the $session variable as the Session parameter value.   The cmdlet output will contain the following details on the mounted content of backup files: Mode, ServerIps, ServerPort and the Disks.
```

---

### Parameters
#### **Session**
Specifies a session that is running to publish disks.
The cmdlet will return details on the disks published during this session.

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[VBRBackupContentPublicationSession]`|true    |0       |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRBackupContentPublicationInfo

---

### Notes

---

### Syntax
```PowerShell
Get-VBRPublishedBackupContentInfo [-Session] <VBRBackupContentPublicationSession> [<CommonParameters>]
```
