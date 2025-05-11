New-NcConsistencyGroupSnapshots
-------------------------------

### Synopsis
Creates a Snapshot copy of an existing consistency group.

---

### Description

Creates a Snapshot copy of an existing consistency group. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcConsistencyGroupSnapshots](Get-NcConsistencyGroupSnapshots)

---

### Examples
> Example 1

```PowerShell
New-NcConsistencyGroupSnapshots -ConsistencyGroup CgName3464 -Name Snapshot_4 -Comment "Snapshot copy 4" -ConsistencyType application -SnapmirrorLabel smlabel_4 -Vserver vs1
Create new snapsht copy for Consistency Group.

ConsistencyGroup : DataONTAP.C.Types.Application.ConsistencyGroup
Name             : Snapshot_4
Comment          : Snapshot copy 4
ConsistencyType  : application
SnapmirrorLabel  : smlabel_4
NcController     : 10.236.128.181
CreateTime       : 2022-04-13T05:36:09-04:00
IsPartial        : False
MissingVolumes   :
Svm              : DataONTAP.C.Types.Application.Svm
Uuid             : 266f2227-bb0d-11ec-a668-005056acd8a8

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

#### **Comment**
Comment for the Snapshot copy

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConsistencyType**
Consistency type. This is for categorization purposes only. Possible values are [ crash, application ]
Valid Values:

* application
* crash

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SnapmirrorLabel**
Snapmirror Label for the snapshot copy

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Vserver**
Name of the Svm

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |VS<br/>SvmName|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Application.ConsistencyGroupSnapshots

---

### Notes
Category: application
Api: /api/application/consistency-groups/{consistency_group.uuid}/snapshots
Family: cluster

---

### Syntax
```PowerShell
New-NcConsistencyGroupSnapshots [-ConsistencyGroup] <String> [-Name] <String> [-Comment <String>] [-ConsistencyType <String>] [-SnapmirrorLabel <String>] [-Vserver <String>] 
```
```PowerShell
[<CommonParameters>]
```
