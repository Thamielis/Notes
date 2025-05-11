Get-NcProtocolS3ServicesMetrics
-------------------------------

### Synopsis
Retrieves volumes metrics.

---

### Description

Retrieves volumes metrics..This cmdlet is supported with Rest.

---

### Examples
> Example 1

```PowerShell
Get-NcProtocolS3ServicesMetrics -Vserver vs0 -Name Server-1
NcController      : 10.236.64.237 
Metric            : DataONTAP.C.Types.S3.Metric
MetricsStatus     : ok
MetricsDuration   : PT15S
MetricsIops       : DataONTAP.C.Types.S3.Iops
MetricsLatency    : DataONTAP.C.Types.S3.Latency
MetricsThroughput : DataONTAP.C.Types.S3.Throughput
MetricsTimestamp  : 5/16/2022 9:35:15 AM
SvmName           : vs0
SvmUuid           : 8b540394-cb72-11ec-b271-005056ac1b5c

```

---

### Parameters
#### **Name**
Specifies the name of the S3 server.This parameter is only supported in REST.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Vserver**
Name of Svm.This parameter is only supported in REST.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcProtocolS3ServicesMetrics -Template, to get an empty storage volume metrics object for use with advanced queries involving the Attributes like $b = Get-NcVolumeDestinationName -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcProtocolS3ServicesMetrics -Template, to get an empty storage volume metrics object for use with advanced queries involving the Attributes like $b = Get-NcVolumeDestinationName -Query $a.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[ProtocolS3ServicesMetrics]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object dataONTAP.C.Types.S3.ProtocolS3ServicesMetrics, to get an empty storage volume metrics object for use with advanced queries involving the Attributes like $b = Get-NcVolumeDestinationName -Attributes $a.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[ProtocolS3ServicesMetrics]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.S3.ProtocolS3ServicesMetrics

---

### Notes
Category: S3
Api: api/protocols/s3/services
Family: S3

---

### Syntax
```PowerShell
Get-NcProtocolS3ServicesMetrics [-Vserver] <String> [-Name] <String> [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesMetrics -Template <DataONTAP.C.Types.S3.ProtocolS3ServicesMetrics> [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesMetrics -Query <ProtocolS3ServicesMetrics> [-Attributes <ProtocolS3ServicesMetrics>] [<CommonParameters>]
```
