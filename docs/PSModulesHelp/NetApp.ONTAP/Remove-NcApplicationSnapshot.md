Remove-NcApplicationSnapshot
----------------------------

### Synopsis
Delete a Snapshot copy of an application.This cmdlet is supported with Rest Only.

---

### Description

Delete a Snapshot copy of an application.

---

### Related Links
* [Get-NcApplicationSnapshot](Get-NcApplicationSnapshot)

* [New-NcApplicationSnapshot](New-NcApplicationSnapshot)

---

### Examples
> Example 1

```PowerShell
Remove-NcApplicationSnapshot -Name a
Remove Application Snapshot.
```

---

### Parameters
#### **Name**
Name of snapshot copy

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|true    |0       |false        |SnapshotCopyName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: application
Api: /api//application/applications/{application.uuid}/snapshots/{uuid}
Family: NcController

---

### Syntax
```PowerShell
Remove-NcApplicationSnapshot [-Name] <String> [<CommonParameters>]
```
