Get-NcAggrStatus
----------------

### Synopsis
Get status and topology information about one or more aggregates from RAID subsystem.

---

### Description

Get status and topology information about one or more aggregates from RAID subsystem.

---

### Related Links
* [Get-NcAggr](Get-NcAggr)

---

### Examples
> Example 1

Get-NcAggrStatus
Get the aggregate raid status for all aggregates in the cluster.

Aggregate                  AggrRaidType         AggrCksumstyle     AggrWaflStatus     Node
---------                  ------------         --------------     --------------     ----
aggr0                      raid_dp              block              online             beam-fs-ps-01
aggr1                      raid_dp              block              online             beam-fs-ps-01

> Example 2

Get-NcAggrStatus -Query @{AggrRaidType="raid_dp"} -Attributes @{AggrCksumstyle=""}
Get the aggregate checksum style for all of the raid_dp aggregates on the cluster.

Aggregate                  AggrRaidType         AggrCksumstyle     AggrWaflStatus     Node
---------                  ------------         --------------     --------------     ----
aggr0                                           block
aggr1                                           block

---

### Parameters
#### **Node**
The name of one or more nodes containing the aggregates to get.  Data ONTAP wildcards are permitted. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Nodes  |

#### **Aggregate**
The name of one or more aggregates to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|AggregateName|

#### **Attributes**
For improved scalability in large clusters, provide a AggrStatusInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAggrStatus -Template" to get the initially empty AggrStatusInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[AggrStatusInfo]`|false   |named   |false        |

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
Specify to get an empty AggrStatusInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a AggrStatusInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAggrStatus -Template" to get the initially empty AggrStatusInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[AggrStatusInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrStatusInfo

---

### Notes
Category: aggr
API: aggr-status-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrStatus [[-Node] <String[]>] [[-Aggregate] <String[]>] [-Attributes <AggrStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrStatus -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAggrStatus -Query <AggrStatusInfo> [-Attributes <AggrStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
