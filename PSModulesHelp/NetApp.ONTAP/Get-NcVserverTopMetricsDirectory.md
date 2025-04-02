Get-NcVserverTopMetricsDirectory
--------------------------------

### Synopsis
Retrieves a list of directories with the most IO activity.This cmdlet is supported with Rest.

---

### Description

Retrieves a list of directories with the most IO activity.This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcVserverTopMetricsDirectory -VserverContext vs0
Retrieves a list of directory with the most IO activity.

NcController : 10.236.154.53
Iops         : DataONTAP.C.Types.Vserver.Iops
JunctionPath : /vol1
Path         : /vol/vol1/
SvmName      : vs0
SvmUuid      : cb316860-d764-11ec-9c70-005056a77eb2
Throughput   :
VolumeName   : vol1
VolumeUuid   : 04860ee0-d837-11ec-ab49-005056a7bc56

```

---

### Parameters
#### **Vserver**
Specifies the name of the Svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Template**
Specify to get an empty NcVserverTopMetricsDirectory object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NcVserverTopMetricsDirectory object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVserverTopMetricsClient -Template" to get the initially empty NcVserverTopMetricsDirectory object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[NcVserverTopMetricsDirectory]`|true    |named   |false        |

#### **Attributes**
For improved scalability in large clusters, provide a VserverTopMetricsDirectory object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVserverTopMetricsDirectory -Template" to get the initially empty VserverTopMetricsDirectory object.  If not specified, all data is returned for each object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[NcVserverTopMetricsDirectory]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.NcVserverTopMetricsDirectory

---

### Notes
Category: Vserver
API: svm/svms/{svm.uuid}/top-metrics/directories
Family: vserver

---

### Syntax
```PowerShell
Get-NcVserverTopMetricsDirectory [-Vserver] <String> [<CommonParameters>]
```
```PowerShell
Get-NcVserverTopMetricsDirectory -Template [<CommonParameters>]
```
```PowerShell
Get-NcVserverTopMetricsDirectory -Query <DataONTAP.C.Types.Vserver.VserverTopMetricsDirectory> [-Attributes <DataONTAP.C.Types.Vserver.NcVserverTopMetricsDirectory>] [<CommonParameters>]
```
