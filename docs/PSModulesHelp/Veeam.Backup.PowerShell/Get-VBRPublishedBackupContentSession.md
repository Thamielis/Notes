Get-VBRPublishedBackupContentSession
------------------------------------

### Synopsis
Returns sessions that are running to publish disks from a backup or replica.

---

### Description

This cmdlet returns an array of sessions that are running to publish disks.

---

### Examples
> Getting Sessions That are Running to Mount Content of Backup Files

```PowerShell
Get-VBRPublishedBackupContentSession
This command returns an array of sessions that are running to publish disks.
```

---

### Parameters
#### **Id**
Specifies an array of session IDs. The cmdlet will return sessions that have the specified IDs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Guid[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRBackupContentPublicationSession[]

---

### Notes

---

### Syntax
```PowerShell
Get-VBRPublishedBackupContentSession [-Id <Guid[]>] [<CommonParameters>]
```
