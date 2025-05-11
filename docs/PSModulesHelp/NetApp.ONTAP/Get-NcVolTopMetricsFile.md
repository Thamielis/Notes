Get-NcVolTopmetricsFile
-----------------------

### Synopsis
Retrieves a list of files with the most IO activity.

---

### Description

Retrieves a list of files with the most IO activity. This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcVolTopmetricsFile -Volume vol1 -Vserver vs0
NcController : 10.236.154.53
Iops         : DataONTAP.C.Types.Volume.Iops
Path         : /DT_TestFile
SvmName      : vs0
SvmUuid      : cb316860-d764-11ec-9c70-005056a77eb2
Throughput   :
VolumeName   : vol1
VolumeUuid   : 04860ee0-d837-11ec-ab49-005056a7bc56

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

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcVolTopmetricsFile -Template, to get an empty vol top metrics file object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsFile -Attributes $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Volume.VolTopMetricsFile, to get an empty vol top metrics file object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsFile -Attributes $a.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.VolTopMetricsFile]`|false   |named   |false        |

#### **Query**
Specify $a = Get-NcVolTopmetricsFile -Template, to get an empty vol top metrics file object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsFile -Query $a.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.VolTopMetricsFile]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolTopMetricsFile

---

### Notes
Category: Volume
Api: api/storage/volumes/{volume.uuid}/top-metrics/files
Family: controller

---

### Syntax
```PowerShell
Get-NcVolTopmetricsFile [-Volume] <String> -Vserver <String> [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsFile -Template <DataONTAP.C.Types.Volume.VolTopMetricsFile> [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsFile [-Attributes <DataONTAP.C.Types.Volume.VolTopMetricsFile>] [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsFile -Query <DataONTAP.C.Types.Volume.VolTopMetricsFile> [<CommonParameters>]
```
