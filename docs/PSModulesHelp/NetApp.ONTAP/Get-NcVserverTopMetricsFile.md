Get-NcVserverTopmetricsFile
---------------------------

### Synopsis
Retrieves a list of files with the most IO activity.

---

### Description

Retrieves a list of files with the most IO activity.. This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcVserverTopMetricsFile -Vserver vs0
NcController : 10.236.154.53
Iops         : DataONTAP.C.Types.Vserver.Iops
Path         : /vol/vol1/DT_TestFile
JunctionPath : /vol1
SvmName      : vs0
SvmUuid      : cb316860-d764-11ec-9c70-005056a77eb2
Throughput   :
VolumeName   : vol1
VolumeUuid   : 04860ee0-d837-11ec-ab49-005056a7bc56

```

---

### Parameters
#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Volume**
The name of the volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Path**
Path of the file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **JunctionPath**
Junction path of the file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Template**
Specify $a = Get-NcVserverTopmetricsFile -Template, to get an empty vserver top metrics file object for use with advanced queries involving the Attributes like $b = Get-NcVserverTopmetricsFile -Attributes $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Vserver.VserverTopMetricsFile, to get an empty vserver top metrics file object for use with advanced queries involving the Attributes like $b = Get-NcVserverTopmetricsFile -Attributes $a.

|Type                                               |Required|Position|PipelineInput|
|---------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.VserverTopMetricsFile]`|false   |named   |false        |

#### **Query**
Specify $a = Get-NcVserverTopmetricsFile -Template, to get an empty vserver top metrics file object for use with advanced queries involving the Attributes like $b = Get-NcVserverTopmetricsFile -Query $a.

|Type                                               |Required|Position|PipelineInput|
|---------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Vserver.VserverTopMetricsFile]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.VserverTopMetricsFile

---

### Notes
Category: Vserver
Api: api/svm/svms/{svm.uuid}/top-metrics/files
Family: controller

---

### Syntax
```PowerShell
Get-NcVolTopmetricsUser [-Vserver] <String> [-Volume <String>] [-Path <String>] [-JunctionPath <String>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverTopmetricsFile -Template <DataONTAP.C.Types.Vserver.VserverTopMetricsFile> [<CommonParameters>]
```
```PowerShell
Get-NcVserverTopmetricsFile [-Attributes <DataONTAP.C.Types.Vserver.VserverTopMetricsFile>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverTopmetricsFile -Query <DataONTAP.C.Types.Vserver.VserverTopMetricsFile> [<CommonParameters>]
```
