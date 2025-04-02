Get-NcClusterMetrics
--------------------

### Synopsis
Retrieves historical performance metrics for the cluster..

---

### Description

Retrieves historical performance metrics for the cluster. This cmdlet is supported with Rest

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcClusterMetrics
Duration     : PT15S
Iops         : DataONTAP.C.Types.Cluster.Iops
Latency      : DataONTAP.C.Types.Cluster.Latency
NcController : 172.26.206.81
Status       : ok
Throughput   : DataONTAP.C.Types.Cluster.Throughput
Timestamp    : 2022-04-11T17:58:30Z

```
> Example 2(With position parameters)

```PowerShell
Get-NcClusterMetrics PT15S ok
Duration     : PT15S
Iops         : DataONTAP.C.Types.Cluster.Iops
Latency      : DataONTAP.C.Types.Cluster.Latency
NcController : 172.26.206.81
Status       : ok
Throughput   : DataONTAP.C.Types.Cluster.Throughput
Timestamp    : 2022-04-11T17:59:45Z

```

---

### Parameters
#### **Duration**
The duration over which this sample is calculated. " +
            "The time durations are represented in the ISO-8601 standard format. Samples can be calculated over the following durations:" +
            "[ PT15S, PT5M, PT30M, PT2H, P1D ].
Valid Values:

* PT15S
* PT4M
* PT30M
* PT2H
* P1D
* PT5M

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **Status**
Errors associated with the sample. For example, if the aggregation of data over multiple nodes fails, then any partial errors might return \"ok\" on success or \"error\" on an internal uncategorized failure." +
            "Whenever a sample collection is missed but done at a later time, it is back filled to the previous 15 second timestamp and tagged with \"backfilled_data\". \"Inconsistent_ delta_time\" is encountered when the time between two collections is not the same for all nodes." +
            "Therefore, the aggregated value might be over or under inflated. \"Negative_delta\" is returned when an expected monotonically increasing value has decreased in value. \"Inconsistent_old_data\" is returned when one or more nodes do not have the latest data." +
            "Possible values are : [ ok, error, partial_no_data, partial_no_uuid, partial_no_response, partial_other_error, negative_delta, backfilled_data, inconsistent_delta_time, inconsistent_old_data ]
Valid Values:

* ok
* error
* partial_no_data
* partial_no_response
* partial_other_error
* negative_delta
* not_found
* backfilled_data
* inconsistent_delta_time
* inconsistent_old_data
* partial_no_uuid

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Interval**
The time range for the data. Examples can be 1h, 1d, 1m, 1w, 1y.
The period for each time range is as follows:
1h: Metrics over the most recent hour sampled over 15 seconds.
1d: Metrics over the most recent day sampled over 5 minutes.
1w: Metrics over the most recent week sampled over 30 minutes.
1m: Metrics over the most recent month sampled over 2 hours.
1y: Metrics over the most recent year sampled over a day.
Available values: 1h, 1d, 1w, 1m, 1y
Default value: 1h
Valid Values:

* 1h
* 1d
* 1w
* 1m
* 1y

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Timestamp**
The timestamp of the performance data.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcClusterMetrics  -Template, to get an empty ClusterMetrics object for use with advanced queries involving the Attributes like $b = Get-NcClusterMetrics  -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcClusterMetrics  -Template, to get an empty ClusterMetrics object for use with advanced queries involving the Attributes like $b = Get-NcClusterMetrics  -Query $a.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ClusterMetrics]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Cluster.ClusterMetrics, to get an empty net port metrics object for use with advanced queries involving the Attributes like $b = Get-NcClusterMetrics  -Attributes $a.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ClusterMetrics]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cluster.ClusterMetrics

---

### Notes
Category: Cluster
Api: api/cluster/metrics
Family: Cluster

---

### Syntax
```PowerShell
Get-NcClusterMetrics [[-Duration] <string>] [[-Status] <string>] [-Interval <string>] [-Timestamp <string>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterMetrics -Template <DataONTAP.C.Types.Cluster.ClusterMetrics> [<CommonParameters>]
```
```PowerShell
Get-NcClusterMetrics -Query <ClusterMetrics> [-Attributes <ClusterMetrics>] [<CommonParameters>]
```
