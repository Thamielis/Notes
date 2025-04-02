Get-NcFcpAdapterMetrics
-----------------------

### Synopsis
Retrieves historical performance metrics for an FC port.

---

### Description

Retrieves historical performance metrics for an FC port.This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcFcpAdapterMetrics -Port 0c -Node stiC190-007
NcController            : 10.236.69.71
Duration     : PT15S
Iops         : DataONTAP.C.Types.Fcp.Iops
Latency      : DataONTAP.C.Types.Fcp.Latency
Status       : ok
Throughput   : DataONTAP.C.Types.Fcp.Throughput
Timestamp    : 2022-06-17T10:28:45Z
Uuid         : 5ef5c23e-ed5d-11ec-9c0d-00a098fa7c29

```

---

### Parameters
#### **Timestamp**
The timestamp of the performance data.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Port**
The Name of Port.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Node**
The Name of Node.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Duration**
The duration over which this sample is calculated. The time durations are represented in the ISO-8601 standard format.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Status**
Any errors associated with the sample.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcFcpAdapterMetrics -Template, to get an Fcp Adapter Metrics object for use with advanced queries involving the Attributes like $b = Get-NcFcpAdapterMetrics -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcFcpAdapterMetrics -Template, to get an empty event destination object for use with advanced queries involving the Attributes like $b = Get-NcFcpAdapterMetrics -Query $a.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[FcpAdapterMetricsOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object dataONTAP.C.Types.Fcp.FcpAdapterMetricsOutput, to get an empty event destination object for use with advanced queries involving the Attributes like $b = Get-NcFcpAdapterMetrics -Attributes $a.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[FcpAdapterMetricsOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcp.FcpAdapterMetricsOutput

---

### Notes
Category: Fcp
Api: api/network/fc/ports/{uuid}/metrics
Family: cluster

---

### Syntax
```PowerShell
{Get-NcFcpAdapterMetrics, Get-NcFcpAdapterMetrics, Get-NcFcpAdapterMetrics, Get-NcFcpAdapterMetrics...} [-Timestamp <String>] [-Port] <String> [-Node] <String> [-Duration <String>] [-Status 
```
```PowerShell
<String>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpAdapterMetrics -Template <DataONTAP.C.Types.Fcp.FcpAdapterMetricsOutput> [<CommonParameters>]
```
```PowerShell
Get-NcFcpAdapterMetrics -Query <FcpAdapterMetricsOutput> [<CommonParameters>]
```
```PowerShell
 [-Attributes <FcpAdapterMetricsOutput>] [<CommonParameters>]
```
