Get-NcAggrMetric
----------------

### Synopsis
Retrieves historical performance metrics for an aggregate.

---

### Description

Retrieves historical performance metrics for an aggregate.This cmdlet is supported with Rest

---

### Examples
> Example 1

Get-NcAggrMetric -Name sti77_vsim_ucs184r_aggr1
Uuid                                     Timestamp                 Duration        Status
----                                     ---------                 --------        ------
17dcd519-33ab-4251-bd29-b5548fed8b13     2022-05-25T09:26:45Z      PT15S           ok
17dcd519-33ab-4251-bd29-b5548fed8b13     2022-05-25T09:26:30Z      PT15S           ok
17dcd519-33ab-4251-bd29-b5548fed8b13     2022-05-25T09:26:15Z      PT15S           ok
17dcd519-33ab-4251-bd29-b5548fed8b13     2022-05-25T09:26:00Z      PT15S           ok
17dcd519-33ab-4251-bd29-b5548fed8b13     2022-05-25T09:25:45Z      PT15S           ok
17dcd519-33ab-4251-bd29-b5548fed8b13     2022-05-25T09:25:30Z      PT15S           ok
17dcd519-33ab-4251-bd29-b5548fed8b13     2022-05-25T09:25:15Z      PT15S           ok

---

### Parameters
#### **Name**
Specifies the name of the aggregate.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|true    |0       |true (ByPropertyName)|Aggr<br/>Aggregate|

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
Specify $a = Get-NcAggrMetric -Template, to get an Aggr Metrics object for use with advanced queries involving the Attributes like $b = Get-NcAggrMetric -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcAggrMetric -Template, to get an Aggr Metrics object for use with advanced queries involving the Attributes like $b = Get-NcAggrMetric -Query $a.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Aggr.AggrMetric]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Aggr.AggrMetric, to get an empty Aggr Metrics object for use with advanced queries involving the Attributes like $b = Get-NcAggrMetric -Attributes $a.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Aggr.AggrMetric]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrMetric

---

### Notes
Category: aggregates
Api: /storage/aggregates/{uuid}/metrics
Family: Controller

---

### Syntax
```PowerShell
Get-NcAggrMetric [-Name] <String> [-Duration <String>] [-Status <String>] [-Interval <String>] [-Timestamp <String>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrMetric -Template <DataONTAP.C.Types.Aggr.AggrMetric> [<CommonParameters>]
```
```PowerShell
Get-NcAggrMetric -Query <DataONTAP.C.Types.Aggr.AggrMetric> [<CommonParameters>]
```
```PowerShell
Get-NcNvmeNamespaceMetrics [-Attributes <DataONTAP.C.Types.Aggr.AggrMetric>] [<CommonParameters>]
```
