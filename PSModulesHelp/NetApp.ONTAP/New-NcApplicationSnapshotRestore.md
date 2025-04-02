New-NcApplicationSnapshotRestore
--------------------------------

### Synopsis
Restore an application snapshot.This cmdlet is supported with Rest Only.

---

### Description

Restore an application snapshot.This cmdlet is supported with Rest Only.

---

### Related Links
* 

* 

---

### Examples
> Example 1

```PowerShell
New-NcApplicationSnapshotRestore -Application app123 -Name abc1
```

---

### Parameters
#### **Application**
Name of Application

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Name**
Name of the Snapshot Copy

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |1       |true (ByPropertyName)|SnapshotCopyName|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Application.ApplicationSnapshotOutput

---

### Notes
Category: Application
Api: /application/applications/{application.uuid}/snapshots/{uuid}/restore
Family: NcController

---

### Syntax
```PowerShell
New-NcApplicationSnapshotRestore [-Application] <String> [-Name] <String> [<CommonParameters>]
```
