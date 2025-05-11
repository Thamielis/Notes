Get-NcVserverTopMetricsClient
-----------------------------

### Synopsis
Retrieves a list of clients with the most IO activity.This cmdlet is supported with Rest.

---

### Description

Retrieves a list of clients with the most IO activity.This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcVserverTopMetricsClient](Get-NcVserverTopMetricsClient)

---

### Examples
> Example 1

```PowerShell
Get-NcVserverTopMetricsClient -VserverContext vs0
Retrieves a list of clients with the most IO activity.

NcController : 10.236.154.53
ClientIp     : 10.236.174.185
Iops         : DataONTAP.C.Types.Vserver.Iops
SvmName      : vs0
SvmUuid      : cb316860-d764-11ec-9c70-005056a77eb2
Throughput   :

```

---

### Parameters
#### **Vserver**
Specifies the name of the Svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Template**
Specify to get an empty VserverTopMetricsClient object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a VserverTopMetricsClient object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVserverTopMetricsClient -Template" to get the initially empty VserverTopMetricsClient object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VserverTopMetricsClient]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Vserver.VserverTopMetricsClient

---

### Notes
Category: Vserver
API: /svm/svms/{svm.uuid}/top-metrics/clients
Family: vserver

---

### Syntax
```PowerShell
Get-NcVserverTopMetricsClient [-Vserver] <String> [<CommonParameters>]
```
```PowerShell
Get-NcVserverTopMetricsClient -Template [<CommonParameters>]
```
```PowerShell
Get-NcVserverTopMetricsClient -Query <DataONTAP.C.Types.Vserver.VserverTopMetricsClient> [-Attributes <DataONTAP.C.Types.Vserver.VserverTopMetricsClient>] [<CommonParameters>]
```
