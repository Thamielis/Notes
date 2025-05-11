Get-NcFcpMetrics
----------------

### Synopsis
Retrieves historical performance metrics for an FC interface.This cmdlet is supported with Rest

---

### Description

Retrieves historical performance metrics for an FC interface.

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcFcpMetrics -Name Interface1
Retrieves historical performance metrics for an FC interface.

NcController : 10.236.154.100
Duration     : PT15S
Iops         : DataONTAP.C.Types.Fcp.Iops
Latency      : DataONTAP.C.Types.Fcp.Latency
Status       : ok
Throughput   : DataONTAP.C.Types.Fcp.Throughput
Timestamp    : 2017-01-25T11:20:13Z
Uuid         : 1cd8a442-86d1-11e0-ae1c-123478563412

```

---

### Parameters
#### **Name**
Specifies thshe name of the FC interface.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Status**
Any errors associated with the sample. Possible values : ok, error, partial_no_data, partial_no_response, partial_other_error, negative_delta, not_found, backfilled_data, inconsistent_delta_time, inconsistent_old_data, partial_no_uuid.
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

#### **Attributes**
For improved scalability in large clusters, provide a FcpMetricsOutput object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcProtocolS3ServicesPolicy -Template" to get the initially empty FcpMetricsOutput object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[FcpMetricsOutput]`|false   |named   |false        |

#### **Template**
Specify to get an empty FcpMetricsOutput object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a FcpMetricsOutput object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFcpMetrics -Template" to get the initially empty FcpMetricsOutput object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[FcpMetricsOutput]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcp.FcpMetricsOutput

---

### Notes
Category: Fcp
API: network/fc/interfaces/{uuid}/metrics
Family: cluster

---

### Syntax
```PowerShell
Get-NcFcpMetrics [-Name] <String> [-Status <String>] [-Duration <String>] [-MaxRecords <Long>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpMetrics -Template [<CommonParameters>]
```
```PowerShell
Get-NcFcpMetrics -Query <FcpMetricsOutput> [-Attributes <FcpMetricsOutput>] [<CommonParameters>]
```
