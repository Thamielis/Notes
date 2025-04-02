Get-NcClusterNodeMetrics
------------------------

### Synopsis
Retrieves historical performance metrics for a node.

---

### Description

Retrieves historical performance metrics for a node. This cmdlet is supported with Rest

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcClusterNodeMetrics -Node stiA220-327
Duration             : PT15S
NcController         : 172.26.206.81
ProcessorUtilization : 2
Status               : ok
Timestamp            : 2022-04-25T18:46:30Z
Uuid                 : 55a0c670-beea-11ec-985e-d039ea024c8c

```
> Example 2(With node uuid)

```PowerShell
Get-NcClusterNodeMetrics -Uuid 55a0c670-beea-11ec-985e-d039ea024c8c
Duration             : PT15S
NcController         : 172.26.206.81
ProcessorUtilization : 2
Status               : ok
Timestamp            : 2022-04-25T18:30:00Z
Uuid                 : 55a0c670-beea-11ec-985e-d039ea024c8c

```

---

### Parameters
#### **Node**
Name of the node.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |0       |true (ByPropertyName)|NodeName|

#### **Duration**
The duration over which this sample is calculated. " +
            "The time durations are represented in the ISO-8601 standard format. Samples can be calculated over the following durations:" +
            "[ PT15S, PT5M, PT30M, PT2H, P1D ].
Valid Values:

* PT15S
* PT5M
* PT30M
* PT2H
* P1D

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Status**
Errors associated with the sample. For example, if the aggregation of data over multiple nodes fails, then any partial errors might return \"ok\" on success or \"error\" on an internal uncategorized failure." +
            "Whenever a sample collection is missed but done at a later time, it is back filled to the previous 15 second timestamp and tagged with \"backfilled_data\". \"Inconsistent_ delta_time\" is encountered when the time between two collections is not the same for all nodes." +
            "Therefore, the aggregated value might be over or under inflated. \"Negative_delta\" is returned when an expected monotonically increasing value has decreased in value. \"Inconsistent_old_data\" is returned when one or more nodes do not have the latest data." +
            "Possible values are : [ ok, error, partial_no_data, partial_no_uuid, partial_no_response, partial_other_error, negative_delta, backfilled_data, inconsistent_delta_time, inconsistent_old_data ]
Valid Values:

* ok
* error
* partial_no_data
* partial_no_uuid
* partial_no_response
* partial_other_error
* negative_delta
* backfilled_data
* inconsistent_delta_time
* inconsistent_old_data

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Uuid**
Unique identifier of the node.
This parameter is marked as required = true because in case you don't have node name you can also filter with node uuid.

|Type      |Required|Position|PipelineInput         |
|----------|--------|--------|----------------------|
|`[string]`|true    |named   |false (ByPropertyName)|

#### **Template**
Specify $a = Get-NcClusterNodeMetrics  -Template, to get an empty ClusterNodeMetricsOutput object for use with advanced queries involving the Attributes like $b = Get-NcClusterNodeMetrics  -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcClusterNodeMetrics  -Template, to get an empty ClusterNodeMetricsOutput object for use with advanced queries involving the Attributes like $b = Get-NcClusterNodeMetrics  -Query $a.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[ClusterNodeMetricsOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Cluster.ClusterNodeMetricsOutput, to get an empty net port metrics object for use with advanced queries involving the Attributes like $b = Get-NcClusterNodeMetrics  -Attributes $a.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[ClusterNodeMetricsOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cluster.ClusterNodeMetricsOutput

---

### Notes
Category: Cluster
Api: api/cluster/nodes/{uuid}/metrics
Family: Cluster

---

### Syntax
```PowerShell
Get-NcClusterNodeMetrics [-Node] <string> -Uuid <string> [[-Duration] <string>] [[-Status] <string>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterNodeMetrics -Template <DataONTAP.C.Types.Cluster.ClusterNodeMetricsOutput> [<CommonParameters>]
```
```PowerShell
Get-NcClusterNodeMetrics -Query <ClusterNodeMetricsOutput> [-Attributes <ClusterNodeMetricsOutput>] [<CommonParameters>]
```
