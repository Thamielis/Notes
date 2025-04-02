Remove-NcConsistencyGroupSnapshots
----------------------------------

### Synopsis
Deletes a snapshot copy for consistency group.

---

### Description

Deletes a snapshot copy for consistency group. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcConsistencyGroupSnapshots](Get-NcConsistencyGroupSnapshots)

* [New-NcConsistencyGroupSnapshots](New-NcConsistencyGroupSnapshots)

---

### Examples
> Example 1

```PowerShell
Remove-NcConsistencyGroupSnapshots -ConsistencyGroup CgName3464 -Name snapshot_copy_patch -Vserver vs1
Deletes snapshot copy 'snapshot_copy_patch' for  consistency group 'CgName3464'.
```

---

### Parameters
#### **ConsistencyGroup**
Name of Consistency group

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[String]`|true    |1       |false        |ConsistencyGroupName|

#### **Name**
Name of snapshot copy

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|true    |2       |false        |SnapshotCopyName|

#### **Vserver**
Name of Svm

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |VS<br/>SvmName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: application
Api: /api/application/consistency-groups/{consistency_group.uuid}/snapshots
Family: cluster

---

### Syntax
```PowerShell
Remove-NcConsistencyGroupSnapshots [-ConsistencyGroup] <String> [-Name] <String> [-Vserver <String>] [<CommonParameters>]
```
