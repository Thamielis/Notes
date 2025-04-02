Get-NcConsistencyGroupSnapshots
-------------------------------

### Synopsis
Retrieves Snapshot copies for a consistency group.

---

### Description

Retrieves Snapshot copies for a consistency group. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcConsistencyGroupSnapshots](New-NcConsistencyGroupSnapshots)

---

### Examples
> Example 1

```PowerShell
Get-NcConsistencyGroupSnapshots CgName3464
Retrieve Snapshot copies of a consistency group.

NcController     : 10.236.128.181
Comment          : My Snapshot copy comment
ConsistencyGroup : DataONTAP.C.Types.Application.ConsistencyGroup
ConsistencyType  : crash
CreateTime       : 2022-04-07T05:53:30-04:00
IsPartial        : False
MissingVolumes   :
Name             : snapshot_copy
SnapmirrorLabel  : sm_label
Svm              : DataONTAP.C.Types.Application.Svm
Uuid             : 94429c1b-b658-11ec-a668-005056acd8a8

NcController     : 10.236.128.181
Comment          : My Snapshot copy comment
ConsistencyGroup : DataONTAP.C.Types.Application.ConsistencyGroup
ConsistencyType  : application
CreateTime       : 2022-04-07T05:56:12-04:00
IsPartial        : False
MissingVolumes   :
Name             : snapshot_copy1
SnapmirrorLabel  : sm_label1
Svm              : DataONTAP.C.Types.Application.Svm
Uuid             : f4b0b3f1-b658-11ec-a668-005056acd8a8

```

---

### Parameters
#### **ConsistencyGroup**
Consistency-group name.

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|true    |1       |true (ByPropertyName)|ConsistencyGroupName|

#### **Name**
Name of the Snapshot copy.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|false   |2       |true (ByPropertyName)|SnapshotCopyName|

#### **ConsistencyType**
Consistency type. This is for categorization purposes only. Possible values are [ crash, application ]
Valid Values:

* application
* crash

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Vserver**
"Name of Svm

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |VS<br/>SvmName|

#### **Attributes**
For improved scalability in large clusters, provide a ConsistencyGroupSnapshots object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcConsistencyGroupSnapshots -Template" to get the initially empty ConsistencyGroupSnapshots object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[ConsistencyGroupSnapshots]`|false   |named   |false        |

#### **Template**
Specify to get an empty ConsistencyGroupSnapshots object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ConsistencyGroupSnapshots object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcConsistencyGroupSnapshots -Template" to get the initially empty ConsistencyGroupSnapshots object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[ConsistencyGroupSnapshots]`|true    |named   |false        |

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
Get-NcConsistencyGroupSnapshots [-ConsistencyGroup] <String> [[-Name] <String>] [-ConsistencyType <String>] [-Vserver <String>] [<CommonParameters>]
```
```PowerShell
Get-NcConsistencyGroupSnapshots [-ConsistencyGroup] <String> -Template [<CommonParameters>]
```
```PowerShell
Get-NcConsistencyGroupSnapshots [-ConsistencyGroup] <String> -Query <ConsistencyGroupSnapshots> [-Attributes <ConsistencyGroupSnapshots>] [<CommonParameters>]
```
