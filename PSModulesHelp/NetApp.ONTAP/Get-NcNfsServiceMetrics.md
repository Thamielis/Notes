Get-NcNfsServiceMetrics
-----------------------

### Synopsis
Retrieves historical performance metrics for the NFS protocol of an SVM.

---

### Description

Retrieves historical performance metrics for the NFS protocol of an SVM. This cmdlet is supported with Rest

---

### Examples
> Example 1

```PowerShell
Get-NcNfsServiceMetrics -VserverContext vs0
V3           : DataONTAP.C.Types.Nfs.V3
V4           : DataONTAP.C.Types.Nfs.V4
V41          : DataONTAP.C.Types.Nfs.V41
SvmUuid      : e8abc817-f77f-11ec-8269-005056a77bad
Timestamp    : 2022-07-06T08:26:30Z
SvmName      : vs0
Uuid         : e8abc817-f77f-11ec-8269-005056a77bad
NcController : 10.237.177.102

```

---

### Parameters
#### **Interval**
The Time Range of the Data
Valid Values:

* 1h
* 1d
* 1w
* 1m
* 1y

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **MaxRecords**
Limit the Number of records returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Template**
Specify $a = Get-NcNfsServiceMetrics -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNfsServiceMetrics -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcNfsServiceMetrics -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNfsServiceMetrics -Query $a.

|Type                                             |Required|Position|PipelineInput|
|-------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nfs.NfsServiceMetricsOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Nfs.NfsServiceMetricsOutput, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcNfsServiceMetrics -Attributes $a.

|Type                                             |Required|Position|PipelineInput|
|-------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Nfs.NfsServiceMetricsOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nfs.NfsServiceMetricsOutput

---

### Notes
Category: Nfs
Api: api/protocols/nfs/services/{svm.uuid}/metrics
Family: Vserver

---

### Syntax
```PowerShell
Get-NcNfsServiceMetrics [-Interval <String>] [-MaxRecords <String>] [<CommonParameters>]
```
```PowerShell
Get-NcNfsServiceMetrics -Template <DataONTAP.C.Types.Nfs.NfsServiceMetricsOutput> [<CommonParameters>]
```
```PowerShell
Get-NcNfsServiceMetrics -Query <DataONTAP.C.Types.Nfs.NfsServiceMetricsOutput> [-Attributes <DataONTAP.C.Types.Nfs.NfsServiceMetricsOutput>] [<CommonParameters>]
```
