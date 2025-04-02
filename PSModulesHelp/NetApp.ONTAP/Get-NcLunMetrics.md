Get-NcLunMetrics
----------------

### Synopsis
Retrieves historical performance metrics for a LUN.This cmdlet is supported with Rest

---

### Description

Retrieves historical performance metrics for a LUN. This cmdlet is supported with Rest

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcLunMetrics -Path /vol/vol1/lun1 -VserverContext vs1
Retrieves historical performance metrics for Lun.

NcController : 10.236.128.181
Links        :
Duration     : PT15S
Iops         : DataONTAP.C.Types.Lun.Iops
Latency      : DataONTAP.C.Types.Lun.Latency
Status       : ok
Throughput   : DataONTAP.C.Types.Lun.Throughput
Timestamp    : 2017-01-25T11:20:13Z
Uuid         : c304026a-3a74-44db-ad29-ebc8452452f2

```

---

### Parameters
#### **Path**
Specifies the name of the Lun.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|true    |0       |true (ByPropertyName)|Lun<br/>Name|

#### **Duration**
The duration over which this sample is calculated. The time durations are represented in the ISO-8601 standard format. Possible values: PT15S, PT4M, PT30M, PT2H, P1D, PT5M
Valid Values:

* PT15S
* PT4M
* PT30M
* PT2H
* P1D
* PT5M

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Status**
Any errors associated with the sample. Possible values : ok, error, partial_no_data, partial_no_response, partial_other_error, negative_delta, not_found, backfilled_data, inconsistent_delta_time, inconsistent_old_data, partial_no_uuid
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
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Interval**
Specifies the time range for the data. Possible values: '1h', '1d', '1w', '1m', '1y'.
Valid Values:

* 1h
* 1d
* 1w
* 1m
* 1y

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Timestamp**
Specifies the timestamp of the performance data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Attributes**
For improved scalability in large clusters, provide a LunMetrics object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcLunMetrics -Template" to get the initially empty LunMetrics object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[FcpMetricsOutput]`|false   |named   |false        |

#### **Template**
Specify to get an empty LunMetrics object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a LunMetrics object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcLunMetrics -Template" to get the initially empty LunMetrics object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[LunMetrics]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunMetrics

---

### Notes
Category: Lun
API: /storage/luns/{uuid}/metrics
Family: vserver

---

### Syntax
```PowerShell
Get-NcLunMetrics [-Path] <String> [-Duration <String>] [-Status <String>] [-Interval <String>] [-Timestamp <String>] [<CommonParameters>]
```
```PowerShell
Get-NcLunMetrics -Template [<CommonParameters>]
```
```PowerShell
Get-NcLunMetrics -Query <DataONTAP.C.Types.Lun.LunMetrics> [-Attributes <DataONTAP.C.Types.Lun.LunMetric>] [<CommonParameters>]
```
