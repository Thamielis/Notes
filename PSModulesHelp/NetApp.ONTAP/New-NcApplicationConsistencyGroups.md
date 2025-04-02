New-NcApplicationConsistencyGroups
----------------------------------

### Synopsis
Creates a consistency group

---

### Description

Creates a consistency group with one or more consistency groups having:
new SAN volumes,
existing SAN, NVMe or NAS FlexVol volumes in a new or existing consistency group. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcApplicationConsistencyGroups](Get-NcApplicationConsistencyGroups)

---

### Examples
> Example 1

```PowerShell
$b = New-Object DataONTAP.C.Types.Application.ConsistencyGroup
$b[0].Name = "child_a"
$b[0].Volumes = New-Object DataONTAP.C.Types.Application.Volume
$b[0].Volumes[0].Name = "BigVol1"
$b[0].Volumes[0].ProvisioningOptions = New-Object DataONTAP.C.Types.Application.ProvisioningOptions
$b[0].Volumes[0].ProvisioningOptions.Action = "create"
$b[0].Volumes[0].Space =  New-Object DataONTAP.C.Types.Application.Space
$b[0].Volumes[0].Space.Size = "50mb"
New-NcApplicationConsistencyGroups -Name Cg_test1 -ConsistencyGroups $b -Vserver vs1
Create new Consistency Group.

Name                   : Cg_test1
ConsistencyGroups      : {child_a}
NcController           : 10.236.128.181
Luns                   :
Namespaces             :
ParentConsistencyGroup :
ProvisioningOptions    :
Qos                    :
Replicated             : False
ReplicationSource      :
RestoreTo              :
SnapshotPolicy         :
Space                  : DataONTAP.C.Types.Application.Space
Svm                    : DataONTAP.C.Types.Application.Svm
Tiering                :
Uuid                   : 108af508-aff9-11ec-a668-005056acd8a8
Volumes                :

```

---

### Parameters
#### **Name**
Name of Consistency group

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|false   |named   |true (ByPropertyName)|ConsistencyGroupName|

#### **Vserver**
Name of Svm

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |true (ByPropertyName)|SvmName|

#### **Volumes**
Volume details associated with Consistency group. To instantiate, use New-Object DataONTAP.C.Types.Application.Volume

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.Volume]`|false   |named   |false        |

#### **Luns**
The LUNs array can be used to create or modify LUNs in a consistency group on a new or existing volume that is a member of the consistency group. To instantiate, use New-Object DataONTAP.C.Types.Application.Lun

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.Lun]`|false   |named   |false        |

#### **ConsistencyGroups**
A consistency group can only be associated with one direct parent consistency group. To instantiate, use New-Object DataONTAP.C.Types.Application.ConsistencyGroup

|Type                                              |Required|Position|PipelineInput|
|--------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.ConsistencyGroup]`|false   |named   |false        |

#### **Namespaces**
An NVMe namespace located within a Volume. To instantiate, use New-Object DataONTAP.C.Types.Application.Namespaces

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.Namespace]`|false   |named   |false        |

#### **ParentConsistencyGroup**
The parent consistency group. To instantiate, use New-Object DataONTAP.C.Types.Application.ParentConsistencyGroup

|Type                                                    |Required|Position|PipelineInput|
|--------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.ParentConsistencyGroup]`|false   |named   |false        |

#### **ProvisioningOptions**
Options that are applied to the operation. To instantiate, use New-Object DataONTAP.C.Types.Application.ProvisioningOptions

|Type                                                 |Required|Position|PipelineInput|
|-----------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.ProvisioningOptions]`|false   |named   |false        |

#### **Qos**
The QoS policy. To instantiate, use New-Object DataONTAP.C.Types.Application.Qos

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.Qos]`|false   |named   |false        |

#### **SnapshotPolicy**
This is a reference to the Snapshot copy policy. To instantiate, use New-Object DataONTAP.C.Types.Application.SnapshotPolicy

|Type                                            |Required|Position|PipelineInput|
|------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.SnapshotPolicy]`|false   |named   |false        |

#### **Space**
Space information for the consistency group.To instantiate, use New-Object DataONTAP.C.Types.Application.Space

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.Space]`|false   |named   |false        |

#### **Tiering**
The tiering placement and policy definitions for volumes in this consistency group.To instantiate, use New-Object DataONTAP.C.Types.Application.Tiering

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.Tiering]`|false   |named   |false        |

#### **Async**
Specify to perform consistency group creation asynchronously

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Application.ApplicationConsistencyGroups

---

### Notes
Category: application
Api: /api/application/consistency-groups
Family: cluster

---

### Syntax
```PowerShell
New-NcApplicationConsistencyGroups [-Name <String>] -Vserver <String> [-Volumes <DataONTAP.C.Types.Application.Volume>] [-Luns <DataONTAP.C.Types.Application.Lun>] [-ConsistencyGroups 
```
```PowerShell
<DataONTAP.C.Types.Application.ConsistencyGroup>] [-Namespaces <DataONTAP.C.Types.Application.Namespace>] [-ParentConsistencyGroup <DataONTAP.C.Types.Application.ParentConsistencyGroup>] 
```
```PowerShell
[-ProvisioningOptions <DataONTAP.C.Types.Application.ProvisioningOptions>] [-Qos <DataONTAP.C.Types.Application.Qos>] [-SnapshotPolicy <DataONTAP.C.Types.Application.SnapshotPolicy>] [-Space 
```
```PowerShell
<DataONTAP.C.Types.Application.Space>] [-Tiering <DataONTAP.C.Types.Application.Tiering>] [-Async] [<CommonParameters>]
```
