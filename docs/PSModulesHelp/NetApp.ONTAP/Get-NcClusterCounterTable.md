Get-NcClusterCounterTable
-------------------------

### Synopsis
Returns a collection of counter tables and their schema definitions.

---

### Description

Returns a collection of counter tables and their schema definitions. This cmdlet is supported with Rest

---

### Related Links
* 

---

### Examples
> Example 1

Get-NcClusterCounterTable
Name           : volume:svm
CounterSchemas : {average_latency, bytes_read, bytes_written, cifs.other_latency…}
NcController   : 172.26.206.81
Description    : Counter Manager table for exporting volume performance counters. The alias names for volume:node and volume:svm are volume_node and
                 volume_svm respectively

---

### Parameters
#### **Name**
Name of Counter Object.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcClusterCounterTable  -Template, to get an empty ClusterCounterTable object for use with advanced queries involving the Attributes like $b = Get-NcClusterCounterTable  -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcClusterCounterTable  -Template, to get an empty ClusterCounterTable object for use with advanced queries involving the Attributes like $b = Get-NcClusterCounterTable  -Query $a.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[ClusterCounterTable]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Cluster.ClusterCounterTable, to get an empty net port metrics object for use with advanced queries involving the Attributes like $b = Get-NcClusterCounterTable  -Attributes $a.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[ClusterCounterTable]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cluster.ClusterCounterTable

---

### Notes
Category: Cluster
Api: api/cluster/counter/tables
Family: Cluster

---

### Syntax
```PowerShell
Get-NcClusterCounterTable [[-Name] <string>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterCounterTable -Template <DataONTAP.C.Types.Cluster.ClusterCounterTable> [<CommonParameters>]
```
```PowerShell
Get-NcClusterCounterTable -Query <ClusterCounterTable> [-Attributes <ClusterCounterTable>] [<CommonParameters>]
```
