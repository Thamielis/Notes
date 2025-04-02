Get-NcNetNdpActiveNeighbor
--------------------------

### Synopsis
Get a list of network ndp active neighbor objects.

---

### Description

Get a list of network ndp active neighbor objects.

---

### Related Links
* [Remove-NcNetNdpActiveNeighbor](Remove-NcNetNdpActiveNeighbor)

---

### Examples
> Example 1

Get-NcNetNdpActiveNeighbor
Get all of the NDP active neighbors in the cluster.

Neighbor                           Node                 Port     SubnetGroup          State        Vserver
--------                           ----                 ----     -----------          -----        -------
fe80:3::226:98ff:fe0c:b6c1         beam-fs-ps-01        e0c      ::/0                 stale        beam-fs-ps
fe80:3::4255:39ff:fe25:27c1        beam-fs-ps-01        e0c      ::/0                 stale        beam-fs-ps
fe80:3::5:73ff:fea0:107            beam-fs-ps-01        e0c      ::/0                 stale        beam-fs-ps
fe80:4::226:98ff:fe0c:b6c1         beam-fs-ps-01        e0d      ::/0                 stale        beam-fs-ps
fe80:4::4255:39ff:fe25:27c1        beam-fs-ps-01        e0d      ::/0                 stale        beam-fs-ps
fe80:4::5:73ff:fea0:107            beam-fs-ps-01        e0d      ::/0                 stale        beam-fs-ps

> Example 2

Get-NcNetNdpActiveNeighbor -Query @{State="stale"}
Get all of the NDP active neighbors in the "stale" state.

Neighbor                           Node                 Port     SubnetGroup          State        Vserver
--------                           ----                 ----     -----------          -----        -------
fe80:3::226:98ff:fe0c:b6c1         beam-fs-ps-01        e0c      ::/0                 stale        beam-fs-ps
fe80:3::4255:39ff:fe25:27c1        beam-fs-ps-01        e0c      ::/0                 stale        beam-fs-ps
fe80:3::5:73ff:fea0:107            beam-fs-ps-01        e0c      ::/0                 stale        beam-fs-ps
fe80:4::226:98ff:fe0c:b6c1         beam-fs-ps-01        e0d      ::/0                 stale        beam-fs-ps
fe80:4::4255:39ff:fe25:27c1        beam-fs-ps-01        e0d      ::/0                 stale        beam-fs-ps
fe80:4::5:73ff:fea0:107            beam-fs-ps-01        e0d      ::/0                 stale        beam-fs-ps

---

### Parameters
#### **Neighbor**
One or more neighbor IPv6 addresses.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Node**
One or more nodes.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Restrict results to one or more vservers.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **SubnetGroup**
Name of one or more subnet groups.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Port**
One or more physical ports.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |5       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetNdpNeighborCacheInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetNdpActiveNeighbor -Template" to get the initially empty NetNdpNeighborCacheInfo object.  If not specified, all data is returned for each object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[NetNdpNeighborCacheInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty NetNdpNeighborCacheInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetNdpNeighborCacheInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetNdpActiveNeighbor -Template" to get the initially empty NetNdpNeighborCacheInfo object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[NetNdpNeighborCacheInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetNdpNeighborCacheInfo

---

### Notes
Category: net
API: net-ndp-active-neighbor-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetNdpActiveNeighbor [[-Neighbor] <String[]>] [[-Node] <String[]>] [[-Vserver] <String[]>] [[-SubnetGroup] <String[]>] [[-Port] <String[]>] [-Attributes <NetNdpNeighborCacheInfo>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetNdpActiveNeighbor -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetNdpActiveNeighbor -Query <NetNdpNeighborCacheInfo> [-Attributes <NetNdpNeighborCacheInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
