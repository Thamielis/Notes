Get-NcIscsiMetrics
------------------

### Synopsis
Retrieves historical performance metrics for the iSCSI protocol of an SVM.

---

### Description

Retrieves historical performance metrics for the iSCSI protocol of an SVM. This cmdlet is supported with Rest

---

### Examples
> Example 1

```PowerShell
Get-NcIscsiMetrics -Vserver test_vs1 -Duration PT15S -Status ok
NcController : 172.25.144.130
Duration     : PT15S
Status       : ok
Iops         : DataONTAP.C.Types.Iscsi.Iops
Latency      : DataONTAP.C.Types.Iscsi.Latency
SvmUuid      : 860a7e54-dc09-11ec-882e-d039ea1e2b82
Throughput   : DataONTAP.C.Types.Iscsi.Throughput
Timestamp    : 2022-05-27T07:40:30Z

```

---

### Parameters
#### **Vserver**
Name of the SVM

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |0       |true (ByPropertyName)|SvmName|

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
|`[String]`|false   |1       |true         |

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
|`[String]`|false   |2       |false        |

#### **Template**
Specify $a = Get-NcIscsiMetrics -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcIscsiMetrics -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcIscsiMetrics -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcIscsiMetrics -Query $a.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Iscsi.IscsiMetricsOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Iscsi.IscsiMetricsOutput, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcIscsiMetrics -Attributes $a.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Iscsi.IscsiMetricsOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Iscsi.IscsiMetricsOutput

---

### Notes
Category: Iscsi
Api: /api/protocols/san/iscsi/services/{svm.uuid}/metrics
Family: Vserver

---

### Syntax
```PowerShell
Get-NcIscsiMetrics [[-Vserver] <String>] [[-Duration] <String>] [[-Status] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcIscsiMetrics -Template <DataONTAP.C.Types.Iscsi.IscsiMetricsOutput> [<CommonParameters>]
```
```PowerShell
Get-NcIscsiMetrics -Query <DataONTAP.C.Types.Iscsi.IscsiMetricsOutput> [-Attributes <DataONTAP.C.Types.Iscsi.IscsiMetricsOutput>] [<CommonParameters>]
```
