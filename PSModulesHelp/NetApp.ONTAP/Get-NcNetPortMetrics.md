Get-NcNetPortMetrics
--------------------

### Synopsis
Retrieves historical performance metrics for a port.

---

### Description

Retrieves historical performance metrics for a port. This cmdlet is supported with Rest

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcNetPortMetrics -PortName e0a -Node sti11-vsim-ucs573y
NcController    : 10.234.38.181
Uuid            : 50cf6d5c-d79f-11ec-9f3c-005056a77908
Duration        : PT15S
Status          : ok
Timestamp       : 2022-06-01T19:51:45Z
ThroughputRead  : 15836
ThroughputTotal : 41240
ThroughputWrite : 25404

```

---

### Parameters
#### **PortName**
Specify name of Port

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Node**
Specify name of Node.

|Type      |Required|Position|PipelineInput         |
|----------|--------|--------|----------------------|
|`[String]`|true    |0       |false (ByPropertyName)|

#### **Template**
Specify $a = Get-NcNetPortMetrics  -Template, to get an empty net metric object for use with advanced queries involving the Attributes like $b = Get-NcNetPortMetrics  -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcNetPortMetrics  -Template, to get an empty EthernetPortsMetricsInfo object for use with advanced queries involving the Attributes like $b = Get-NcNetPortMetrics  -Query $a.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[EthernetPortsMetricsInfo]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Net.EthernetPortsMetricsInfo, to get an empty net port metrics object for use with advanced queries involving the Attributes like $b = Get-NcNetPortMetrics  -Attributes $a.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[EthernetPortsMetricsInfo]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.EthernetPortsMetricsInfo

---

### Notes
Category: Net
Api: api/network/ethernet/ports/{uuid}/metrics
Family: NcController

---

### Syntax
```PowerShell
Get-NcNetPortMetrics [-PortName] <String> [-Node] <String> [<CommonParameters>]
```
```PowerShell
Get-NcNetPortMetrics -Template <DataONTAP.C.Types.Net.EthernetPortsMetricsInfo> [<CommonParameters>]
```
```PowerShell
Get-NcNetPortMetrics -Query <EthernetPortsMetricsInfo> [-Attributes <EthernetPortsMetricsInfo>] [<CommonParameters>]
```
