Get-NcVolMetrics
----------------

### Synopsis
Retrieves volumes metrics.

---

### Description

Retrieves volumes metrics

---

### Examples
> Example 1

```PowerShell
Get-NcVolMetrics -Vserver vs0
NcController            : 10.236.64.237 
Metrics           : DataONTAP.C.Types.Volume.Metric
MetricsStatus     : ok
MetricsDuration   : PT15S
MetricsIops       : DataONTAP.C.Types.Volume.RestAttributes.Iops
MetricsLatency    : DataONTAP.C.Types.Volume.RestAttributes.Latency
MetricsThroughput : DataONTAP.C.Types.Volume.RestAttributes.Throughput
MetricsTimestamp  : 6/2/2022 9:03:15 AM
SvmName           : vs0
SvmUuid           : f6b3d16f-d73b-11ec-a9fe-005056ac4634

```

---

### Parameters
#### **Name**
Specifies the name of the S3 server.This parameter is only supported in REST.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **Vserver**
Name of Svm.This parameter is only supported in REST.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcVolMetrics -Template, to get an empty volume metrics object for use with advanced queries involving the Attributes like $b = Get-NcVolumeDestinationName -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcVolMetrics -Template, to get an empty volume metrics object for use with advanced queries involving the Attributes like $b = Get-NcVolumeDestinationName -Query $a.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[StorageVolumeInfo]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object dataONTAP.C.Types.Volume.StorageVolumeInfo, to get an empty volume metrics object for use with advanced queries involving the Attributes like $b = Get-NcVolumeDestinationName -Attributes $a.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[StorageVolumeInfo]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.StorageVolumeInfo

---

### Notes
Category: Volume
Api: /api/storage/volumes
Family: Volume

---

### Syntax
```PowerShell
Get-NcVolMetrics [-Vserver] <String> [<CommonParameters>]
```
```PowerShell
Get-NcVolMetrics -Template <DataONTAP.C.Types.Volume.StorageVolumeInfo> [<CommonParameters>]
```
```PowerShell
Get-NcVolMetrics -Query <StorageVolumeInfo> [-Attributes <StorageVolumeInfo>] [<CommonParameters>]
```
