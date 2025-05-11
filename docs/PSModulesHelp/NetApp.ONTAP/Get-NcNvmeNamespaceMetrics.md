Get-NcNvmeNamespaceMetrics
--------------------------

### Synopsis
Retrieves historical performance metrics for an NVMe namespace.

---

### Description

Retrieves historical performance metrics for an NVMe namespace.This cmdlet is supported with Rest

---

### Examples
> Example 1

```PowerShell
Get-NcNvmeNamespaceMetrics
NcController : 10.236.65.1
Links        :
Duration     : PT15S
Fc           :
Iops         : DataONTAP.C.Types.Nvme.Iops
Latency      : DataONTAP.C.Types.Nvme.Latency
Status       : ok
Tcp          :
Throughput   : DataONTAP.C.Types.Nvme.Throughput
Timestamp    : 2017-01-25T11:20:13Z
Uuid         : 94242f70-825e-45eb-83fe-2e36d389ab38

```

---

### Parameters
#### **Path**
Specifies the name of the NVMe namespace.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |0       |true (ByPropertyName)|Name   |

#### **Duration**
Specifies the duration over which this sample is calculated. Possible values: 'PT15S', 'PT4M', 'PT30M', 'PT2H', 'P1D', 'PT5M'.
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

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Timestamp**
Specifies the timestamp of the performance data.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcNvmeNamespaceMetrics -Template, to get an Nvme-Namespace Metrics object for use with advanced queries involving the Attributes like $b = Get-NcNvmeNamespaceMetrics -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcNvmeNamespaceMetrics -Template, to get an Nvme-Namespace Metrics object for use with advanced queries involving the Attributes like $b = Get-NcNvmeNamespaceMetrics -Query $a.

|Type                                           |Required|Position|PipelineInput|
|-----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nvme.NvmeNamespaceMetrics]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Nvme.NvmeNamespaceMetrics, to get an Nvme-Namespace Metrics object for use with advanced queries involving the Attributes like $b = Get-NcNvmeNamespaceMetrics -Attributes $a.

|Type                                           |Required|Position|PipelineInput|
|-----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nvme.NvmeNamespaceMetrics]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nvme.NvmeNamespaceMetrics

---

### Notes
Category: S3
Api: /storage/namespaces/{uuid}/metrics
Family: Vserver

---

### Syntax
```PowerShell
Get-NcNvmeNamespaceMetrics [-Path] <String> [-Duration <String>] [-Status <String>] [-Interval <String>] [-Timestamp <String>] [<CommonParameters>]
```
```PowerShell
Get-NcNvmeNamespaceMetrics -Template <DataONTAP.C.Types.Nvme.NvmeNamespaceMetrics> [<CommonParameters>]
```
```PowerShell
Get-NcNvmeNamespaceMetrics -Query <DataONTAP.C.Types.Nvme.NvmeNamespaceMetrics> [<CommonParameters>]
```
```PowerShell
Get-NcNvmeNamespaceMetrics [-Attributes <DataONTAP.C.Types.Nvme.NvmeNamespaceMetrics>] [<CommonParameters>]
```
