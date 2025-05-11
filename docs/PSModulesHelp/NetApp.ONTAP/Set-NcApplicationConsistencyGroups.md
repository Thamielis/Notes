Set-NcApplicationConsistencyGroups
----------------------------------

### Synopsis
Updates a consistency group.

---

### Description

Updates a consistency group. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcApplicationConsistencyGroups](Get-NcApplicationConsistencyGroups)

* [New-NcApplicationConsistencyGroups](New-NcApplicationConsistencyGroups)

---

### Examples
> Example 1

$a = New-Object DataONTAP.C.Types.Application.Namespace
$a[0].Name = "/vol/VolumeCg3511/namespace_new"
$a[0].OsType = "windows"
$a[0].Space = New-Object DataONTAP.C.Types.Application.Space
$a[0].Space.Size = "5mb"
$a[0].ProvisioningOptions = New-Object DataONTAP.C.Types.Application.ProvisioningOptions
$a[0].ProvisioningOptions.Action = "create"
$a[0].SubsystemMap = New-Object DataONTAP.C.Types.Application.SubsystemMap
$a[0].SubsystemMap.Subsystem = New-Object DataONTAP.C.Types.Application.Subsystem
$a[0].SubsystemMap.Subsystem.Name = "mysub"
$a[0].SubsystemMap.Subsystem.Hosts = New-Object DataONTAP.C.Types.Application.Host
$a[0].SubsystemMap.Subsystem.Hosts[0].Nqn = "nqn.1992-08.com.netapp:sn.d04594ef915b4c73b642169e72e4c0b1:subsystem.host1"
Set-NcApplicationConsistencyGroups -Namespaces $a -Vserver vs1 -Name CgName3511
Modifying existing consistemcy group.

Name                   : CgName3511
Namespaces             : {/vol/VolumeCg3511/namespace_new, /vol/VolumeCg3511/namespace_new_2}
NcController           : 10.236.128.181
ConsistencyGroups      :
Luns                   :
ParentConsistencyGroup :
ProvisioningOptions    :
Qos                    : DataONTAP.C.Types.Application.Qos
Replicated             : False
ReplicationSource      :
RestoreTo              :
SnapshotPolicy         :
Space                  : DataONTAP.C.Types.Application.Space
Svm                    : DataONTAP.C.Types.Application.Svm
Tiering                : DataONTAP.C.Types.Application.Tiering
Uuid                   : 2110f871-b0c4-11ec-a668-005056acd8a8
Volumes                : {VolumeCg3511}

---

### Parameters
#### **Name**
Name of Consistency group

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
Name of Svm

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |2       |true (ByPropertyName)|SvmName|

#### **Luns**
The LUNs array can be used to create or modify LUNs in a consistency group on a new or existing volume that is a member of the consistency group. To instantiate, use New-Object DataONTAP.C.Types.Application.Lun

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.Lun]`|false   |named   |false        |

#### **Namespaces**
An NVMe namespace located within a Volume. To instantiate, use New-Object DataONTAP.C.Types.Application.Namespaces

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.Namespace]`|false   |named   |false        |

#### **Qos**
The QoS policy. To instantiate, use New-Object DataONTAP.C.Types.Application.Qos

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.Qos]`|false   |named   |false        |

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
* DataONTAP.C.Types.Application.ConsistencyGroupOutput

---

### Notes
Category: application
Api: /api/application/consistency-groups/{uuid}
Family: cluster

---

### Syntax
```PowerShell
Set-NcApplicationConsistencyGroups [[-Name] <String>] [[-Vserver] <String>] [-Luns <DataONTAP.C.Types.Application.Lun>] [-Namespaces <DataONTAP.C.Types.Application.Namespace>] [-Qos 
```
```PowerShell
<DataONTAP.C.Types.Application.Qos>] [-Tiering <DataONTAP.C.Types.Application.Tiering>] [-Async] [<CommonParameters>]
```
