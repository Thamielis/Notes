Get-NcFcpServiceMetrics
-----------------------

### Synopsis
Retrieves historical performance metrics for the FC Protocol service of an SVM.

---

### Description

Retrieves historical performance metrics for the FC Protocol service of an SVM . This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcFcpServiceMetrics
NcController:   10.235.104.154
Duration     :
Iops         :
Latency      :
Status       :
SvmUuid      : d754ebaa-c7b7-11ec-8878-00a098ef4d06
Throughput   :
Timestamp    : 2022-05-23T08:55:00Z

```

---

### Parameters
#### **Timestamp**
The timestamp of the performance data.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

#### **MaxRecords**
Limit the number of records returned.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcFcpServiceMetrics -Template, to get an empty Fcp Service metrics object for use with advanced queries involving the Attributes like $b = Get-NcFcpServiceMetrics -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcFcpServiceMetrics -Template, to get an empty Fcp Service metrics object object for use with advanced queries involving the Attributes like $b = Get-NcFcpServiceMetrics -Query $a.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[FcpServiceMetricsOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Fcp.FcpServiceMetricsOutput, to get an empty Fcp Service metrics object for use with advanced queries involving the Attributes like $b = Get-NcFcpServiceMetrics -Attributes $a.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[FcpServiceMetricsOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcp.FcpServiceMetricsOutput

---

### Notes
Category: Fcp
Api: api/protocols/san/fcp/services/{svm.uuid}/metrics
Family: cluster

---

### Syntax
```PowerShell
Get-NcFcpServiceMetrics [-Timestamp <string>] [-Duration <string>] [-Status <string>] [-MaxRecords <Int64>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpServiceMetrics -Template <DataONTAP.C.Types.Fcp.FcpServiceMetricsOutput> [<CommonParameters>]
```
```PowerShell
Get-NcFcpServiceMetrics -Query <FcpServiceMetricsOutput> [<CommonParameters>]
```
```PowerShell
Get-NcFcpServiceMetrics [-Attributes <FcpServiceMetricsOutput>] [<CommonParameters>]
```
