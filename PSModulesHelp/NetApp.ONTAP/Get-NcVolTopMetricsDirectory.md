Get-NcVolTopmetricsDirectory
----------------------------

### Synopsis
Retrieves a list of directories with the greatest value performance metric or capacity metric.

---

### Description

Retrieves a list of directories with the greatest value performance metric or capacity metric. This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcVolTopmetricsDirectory -Volume vol1 -Vserver vs0
NcController          : 10.236.154.53
Iops                  : DataONTAP.C.Types.Volume.Iops
NonRecursiveBytesUsed :
Path                  : /
SvmName               : vs0
SvmUuid               : cb316860-d764-11ec-9c70-005056a77eb2
Throughput            :
VolumeName            : vol1
VolumeUuid            : 04860ee0-d837-11ec-ab49-005056a7bc56

```

---

### Parameters
#### **Volume**
The name of the volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Template**
Specify $a = Get-NcVolTopmetricsDirectory -Template, to get an empty vol top metrics object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsDirectory -Attributes $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Volume.VolTopMetricsDirectory, to get an empty vol top metrics object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsDirectory -Attributes $a.

|Type                                               |Required|Position|PipelineInput|
|---------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.VolTopMetricsDirectory]`|false   |named   |false        |

#### **Query**
Specify $a = Get-NcVolTopmetricsDirectory -Template, to get an empty vol top metrics object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsDirectory -Query $a.

|Type                                               |Required|Position|PipelineInput|
|---------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.VolTopMetricsDirectory]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolTopMetricsDirectory

---

### Notes
Category: Volume
Api: api/storage/volumes/{volume.uuid}/top-metrics/directories
Family: controller

---

### Syntax
```PowerShell
Get-NcVolTopmetricsDirectory [-Volume] <String> -Vserver <String> [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsDirectory -Template <DataONTAP.C.Types.Volume.VolTopMetricsDirectory> [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsDirectory [-Attributes <DataONTAP.C.Types.Volume.VolTopMetricsDirectory>] [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsDirectory -Query <DataONTAP.C.Types.Volume.VolTopMetricsDirectory> [<CommonParameters>]
```
