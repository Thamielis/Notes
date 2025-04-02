Get-NcClusterCounterTableRow
----------------------------

### Synopsis
Returns a collection of counter rows..

---

### Description

Returns a collection of counter rows. This cmdlet is supported with Rest

---

### Related Links
* 

---

### Examples
> Example 1

Get-NcClusterCounterTableRow -CounterTableName copy_manager
Aggregation  : DataONTAP.C.Types.Cluster.Aggregation
CounterTable : DataONTAP.C.Types.Cluster.CounterTable
Counters     : {copy_requests, abort_requests, status_requests, copy_notify_requests…}
Id           : vs1:049aab9d-b988-11ec-8637-005056ac6956
NcController : 172.21.170.194
Properties   : {node.name, node.uuid, svm.name, svm.uuid…}

---

### Parameters
#### **CounterTableName**
Name of Counter Object.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Id**
Unique row idenfier

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcClusterCounterTableRow  -Template, to get an empty ClusterCounterTableRow object for use with advanced queries involving the Attributes like $b = Get-NcClusterCounterTableRow  -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcClusterCounterTableRow  -Template, to get an empty ClusterCounterTableRow object for use with advanced queries involving the Attributes like $b = Get-NcClusterCounterTableRow  -Query $a.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ClusterCounterTableRow]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Cluster.ClusterCounterTableRow, to get an empty net port metrics object for use with advanced queries involving the Attributes like $b = Get-NcClusterCounterTableRow  -Attributes $a.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ClusterCounterTableRow]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cluster.ClusterCounterTableRow

---

### Notes
Category: Cluster
Api: api/cluster/counter/tables/{counter_table.name}/rows
Family: Cluster

---

### Syntax
```PowerShell
Get-NcClusterCounterTableRow [-CounterTableName] <string> [[-Id] <string>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterCounterTableRow -Template <DataONTAP.C.Types.Cluster.ClusterCounterTableRow> [<CommonParameters>]
```
```PowerShell
Get-NcClusterCounterTableRow -Query <ClusterCounterTableRow> [-Attributes <ClusterCounterTableRow>] [<CommonParameters>]
```
