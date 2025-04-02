Get-NcNvmeMetrics
-----------------

### Synopsis
Retrieves historical performance metrics for the Nvme Services of an SVM.

---

### Description

Retrieves historical performance metrics for the NvmeService of an SVM. This cmdlet is supported with Rest only.

---

### Examples
> Example 1

```PowerShell
Get-NcNvmeMetrics -VserverContext Nvme_Vserver5932
NcController : 10.234.36.57
SvmUuid      : d006a190-463e-11ed-9795-005056a78c6e
Latency      : 0
Throughput   : 0
Fc           :
Tcp          : ok
Iops         : 0
Status       : ok
Duration     : PT15S
Timestamp    : 2022-10-12T06:30:30Z

```

---

### Parameters
#### **VserverContext**
Name of the SVM on which Nvme Services is Configured.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |VS     |

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
Specify $a = Get-NcNvmeMetrics -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNvmeMetrics -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcNvmeMetrics -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNvmeMetrics -Query $a.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nvme.NvmeServicesMetrics]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Nvme.NvmeServicesMetrics, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNvmeMetrics -Attributes $a.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nvme.NvmeServicesMetrics]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nvme.NvmeServicesMetrics

---

### Notes
Category: Nvme
Api: /api/protocols/Nvme/services/{svm.uuid}/metrics
Family: Vserver

---

### Syntax
```PowerShell
Get-NcNvmeMetrics -VserverContext <String> [-Duration <String>] [-Status <String>] [-Interval <String>] [-Timestamp <String>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeMetrics -Template <DataONTAP.C.Types.Nvme.NvmeServicesMetrics> [<CommonParameters>]
```
```PowerShell
Get-NcNvmeMetrics -Query <DataONTAP.C.Types.Nvme.NvmeServicesMetrics> [-Attributes <DataONTAP.C.Types.Nvme.NvmeServicesMetrics>] [<CommonParameters>]
```
