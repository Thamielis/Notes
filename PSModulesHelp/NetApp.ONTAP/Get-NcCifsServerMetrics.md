Get-NcCifsServerMetrics
-----------------------

### Synopsis
Retrieves historical performance metrics for the CIFS protocol of an SVM.

---

### Description

Retrieves historical performance metrics for the CIFS protocol of an SVM. This cmdlet is supported with Rest.

---

### Examples
> Example 1

```PowerShell
Get-NcCifsServerMetrics -Vserver vs0
NcController : 10.237.144.166
SvmName      : vs0
SvmUuid      : 0253c79a-abfe-11ec-9e69-005056a7bd6c
Latency      : DataONTAP.C.Types.Cifs.Latency
Throughput   : DataONTAP.C.Types.Cifs.Throughput
Iops         : DataONTAP.C.Types.Cifs.Iops
Uuid         : 0253c79a-abfe-11ec-9e69-005056a7bd6c
Status       : ok
Duration     : PT15S
Timestamp    : 2022-07-02T06:16:15Z

```

---

### Parameters
#### **Vserver**
Name of the SVM on which CifsServer is Configured.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Duration**
Specifies the duration over which this sample is calculated. Possible values: 'PT15S', 'PT4M', 'PT30M', 'PT2H', 'P1D', 'PT5M'.
Valid Values:

* PT15S
* PT4M
* PT30M
* PT2H
* P1D
* PT5M

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Status**
Specifies errors associated with the sample. Possible values: 'ok', 'error', 'partial_no_data', 'partial_no_response', 'partial_other_error', 'negative_delta', 'not_found', 'backfilled_data', 'inconsistent_delta_time', 'inconsistent_old_data', 'partial_no_uuid'.
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

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Timestamp**
Specifies the timestamp of the performance data

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **Template**
Specify $a = Get-NcCifsServerMetrics -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcCifsServerMetrics -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcCifsServerMetrics -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcCifsServerMetrics -Query $a.

|Type                                                |Required|Position|PipelineInput|
|----------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Cifs.CifsServicesMetricsOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object dataONTAP.C.Types.Cifs.CifsServicesMetricsOutput, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcCifsServerMetrics -Attributes $a.

|Type                                                |Required|Position|PipelineInput|
|----------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Cifs.CifsServicesMetricsOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cifs.CifsServicesMetricsOutput

---

### Notes
Category: Cifs
Api: /api/protocols/cifs/services/{uuid}/metrics
Family: Vserver

---

### Syntax
```PowerShell
Get-NcCifsServerMetrics -Vserver <String> [-Duration <String>] [-Status <String>] [-Interval <String>] [-Timestamp <String>] [<CommonParameters>]
```
```PowerShell
Get-NcCifsServerMetrics -Template <DataONTAP.C.Types.Cifs.CifsServicesMetricsOutput> [<CommonParameters>]
```
```PowerShell
Get-NcCifsServerMetrics -Query <DataONTAP.C.Types.Cifs.CifsServicesMetricsOutput> [-Attributes <DataONTAP.C.Types.Cifs.CifsServicesMetricsOutput>] [<CommonParameters>]
```
