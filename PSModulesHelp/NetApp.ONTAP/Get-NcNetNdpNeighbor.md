Get-NcNetNdpNeighbor
--------------------

### Synopsis
Get a list of static configured NDP neighbor entries.

---

### Description

Get a list of static configured NDP neighbor entries.

---

### Related Links
* [New-NcNetNdpNeighbor](New-NcNetNdpNeighbor)

* [Remove-NcNetNdpNeighbor](Remove-NcNetNdpNeighbor)

---

### Examples
> Example 1

Get-NcNetNdpNeighbor
Get all of the NDP neighbors configured for the given cluster.

NeighborAddress                    MacAddress                 Vserver
---------------                    ----------                 -------
fe80:5::200:83ef:bd14              25:ef:39:a5:7f:ff          pester

---

### Parameters
#### **Neighbor**
One or more neighbor IPv6 addresses.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NeighborAddress|

#### **Vserver**
Restrict results to one or more vservers.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NdpNeighborInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetNdpNeighbor -Template" to get the initially empty NdpNeighborInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[NdpNeighborInfo]`|false   |named   |false        |

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
Specify to get an empty NdpNeighborInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NdpNeighborInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetNdpNeighbor -Template" to get the initially empty NdpNeighborInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[NdpNeighborInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NdpNeighborInfo

---

### Notes
Category: net
API: net-ndp-neighbor-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetNdpNeighbor [[-Neighbor] <String[]>] [[-Vserver] <String[]>] [-Attributes <NdpNeighborInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetNdpNeighbor -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetNdpNeighbor -Query <NdpNeighborInfo> [-Attributes <NdpNeighborInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
