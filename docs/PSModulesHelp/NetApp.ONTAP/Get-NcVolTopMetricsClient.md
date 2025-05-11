Get-NcVolTopmetricsClient
-------------------------

### Synopsis
Retrieves a list of clients with the most IO activity.

---

### Description

Retrieves a list of clients with the most IO activity. This cmdlet is supported with Rest.

---

### Related Links
* 

---

### Examples
> Example 1

```PowerShell
Get-NcVolTopMetricsClient -Volume vol1 -Vserver vs0
NcController : 10.236.154.53
Iops         : DataONTAP.C.Types.Volume.Iops
ClientIp     : 10.236.174.185
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

#### **ClientIp**
IP address of the client. Both IPv4 and IPv6 IP addresses are supported.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Template**
Specify $a = Get-NcVolTopmetricsClient -Template, to get an empty vol top metrics client object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsClient -Attributes $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Volume.VolTopMetricsClient, to get an empty vol top metrics client object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsClient -Attributes $a.

|Type                                            |Required|Position|PipelineInput|
|------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.VolTopMetricsClient]`|false   |named   |false        |

#### **Query**
Specify $a = Get-NcVolTopmetricsClient -Template, to get an empty vol top metrics client object for use with advanced queries involving the Attributes like $b = Get-NcVolTopmetricsClient -Query $a.

|Type                                            |Required|Position|PipelineInput|
|------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Volume.VolTopMetricsClient]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolTopMetricsClient

---

### Notes
Category: Volume
Api: /storage/volumes/{volume.uuid}/top-metrics/clients
Family: controller

---

### Syntax
```PowerShell
Get-NcVolTopmetricsClient [-Volume] <String> -Vserver <String> [-ClientIp <String>] [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsClient -Template <DataONTAP.C.Types.Volume.VolTopMetricsClient> [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsClient [-Attributes <DataONTAP.C.Types.Volume.VolTopMetricsClient>] [<CommonParameters>]
```
```PowerShell
Get-NcVolTopmetricsClient -Query <DataONTAP.C.Types.Volume.VolTopMetricsClient> [<CommonParameters>]
```
