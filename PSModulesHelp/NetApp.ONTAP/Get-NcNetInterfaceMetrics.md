Get-NcNetInterfaceMetrics
-------------------------

### Synopsis
Retrieves historical performance metrics for an interface.

---

### Description

Retrieves historical performance metrics for an interface. This cmdlet is supported with Rest.

---

### Examples
> Example 1

```PowerShell
Get-NcNetInterfaceMetrics -Name lif1_c2
NcController : 10.237.144.166
Duration     : PT15S
Status       : ok
Uuid         : 20d0e1fb-af33-11ec-9e69-005056a7bd6c
Timestamp    : 2022-07-01T11:53:00Z
Read         : 3734
Write        : 2271
Total        : 6005

```

---

### Parameters
#### **Name**
Name of the Interface.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|false   |0       |true (ByPropertyName)|InterfaceName|

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

#### **Template**
Specify $a = Get-NcNetInterfaceMetrics -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNetInterfaceMetrics -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcNetInterfaceMetrics -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNetInterfaceMetrics -Query $a.

|Type                                              |Required|Position|PipelineInput|
|--------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Net.IpInterfaceMetricsOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object dataONTAP.C.Types.Net.IpInterfaceMetricsOutput, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNetInterfaceMetrics -Attributes $a.

|Type                                              |Required|Position|PipelineInput|
|--------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Net.IpInterfaceMetricsOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.IpInterfaceMetricsOutput

---

### Notes
Category: Net
Api: api/network/ip/interfaces/uuid/metrics
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetInterfaceMetrics [-Name] <String> [-Duration <String>] [-Status <String>] [-Timestamp <String>] [<CommonParameters>]
```
```PowerShell
Get-NcNetInterfaceMetrics -Template <DataONTAP.C.Types.Net.IpInterfaceMetricsOutput> [<CommonParameters>]
```
```PowerShell
Get-NcNetInterfaceMetrics -Query <DataONTAP.C.Types.Net.IpInterfaceMetricsOutput> [-Attributes <DataONTAP.C.Types.Net.IpInterfaceMetricsOutput>] [<CommonParameters>]
```
