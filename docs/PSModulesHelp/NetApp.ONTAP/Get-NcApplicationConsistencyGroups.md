Get-NcApplicationConsistencyGroups
----------------------------------

### Synopsis
Retrieve details of a collection or a specific consistency group.

---

### Description

Retrieve details of a collection or a specific consistency group. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcApplicationConsistencyGroups](New-NcApplicationConsistencyGroups)

---

### Examples
> Example 1

Get-NcApplicationConsistencyGroups
Get all ConsistencyGroup.

ConsistencyGrou ParentConsisten Volume          VserverContext
p               cyGroup
--------------- --------------- ------          --------------
Volume1                         Volume1         vs1
parent_cg                                       vs1
child_1         parent_cg       {SourceVol4261… vs1
child_2         parent_cg       {SourceVol2261… vs1

---

### Parameters
#### **ConsistencyGroup**
Consistency-group name.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |1       |true (ByPropertyName)|Name   |

#### **ParentConsistencyGroup**
Parent Consistency-group name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Volume**
Name of Volume

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Vserver**
"Name of Svm

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|SvmName|

#### **Attributes**
For improved scalability in large clusters, provide an ApplicationConsistencyGroups object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcApplicationConsistencyGroups -Template" to get the initially empty ApplicationConsistencyGroups object.  If not specified, all data is returned for each object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ApplicationConsistencyGroups]`|false   |named   |false        |

#### **Template**
Specify to get an empty ApplicationConsistencyGroups object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Query**
For advanced queries, provide an ApplicationConsistencyGroups object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcApplicationConsistencyGroups -Template" to get the initially empty ApplicationConsistencyGroups object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ApplicationConsistencyGroups]`|true    |named   |false        |

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
Get-NcApplicationConsistencyGroups [[-ConsistencyGroup] <String>] [-ParentConsistencyGroup <String>] [-Volume <String>] [-Vserver <String>] [<CommonParameters>]
```
```PowerShell
Get-NcApplicationConsistencyGroups -Template [-Fill] [<CommonParameters>]
```
```PowerShell
Get-NcApplicationConsistencyGroups -Query <ApplicationConsistencyGroups> [-Attributes <ApplicationConsistencyGroups>] [<CommonParameters>]
```
