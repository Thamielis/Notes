Get-NcAggrAutobalanceAggrState
------------------------------

### Synopsis
Get a list of aggr autobalance objects.

---

### Description

Get a list of aggr autobalance objects.

---

### Related Links
* [Get-NcAggrAutobalance](Get-NcAggrAutobalance)

---

### Examples
> Example 1

Get-NcAggrAutobalanceAggrState
Get the aggregate's autobalance state for all the aggregates on the current cluster.

Threshold                       : 2387597721
IsConsidered                    : False
Aggregate                       : aggr0
AutobalanceThreshold            : 2387597721
IncomingVolumeSize              : 0
IsBalanceable                   : False
IsConsideredForBalance          : False
IsHybrid                        : False
NcController                    : 10.63.10.37
Node                            : beam-fs-ps-01
OutgoingVolumeSize              : 0
RaidType                        : raid_dp
TotalSize                       : 3410853888
UsedSize                        : 3273293824
IsBalanceableSpecified          : True
IsConsideredForBalanceSpecified : True
IsHybridSpecified               : True

Threshold                       : 246739763
IsConsidered                    : False
Aggregate                       : aggr1
AutobalanceThreshold            : 246739763
IncomingVolumeSize              : 0
IsBalanceable                   : False
IsConsideredForBalance          : False
IsHybrid                        : False
NcController                    : 10.63.10.37
Node                            : beam-fs-ps-01
OutgoingVolumeSize              : 0
RaidType                        : raid_dp
TotalSize                       : 352485376
UsedSize                        : 139264
IsBalanceableSpecified          : True
IsConsideredForBalanceSpecified : True
IsHybridSpecified               : True

> Example 2

Get-NcAggrAutobalanceAggrState -Query @{IsConsidered=$false}
Get the aggregate autobalance state for all aggregates on the cluster that are not currently considered for autobalance.

Aggregate                     Threshold IsBalanceable   IsConsidered     IsHybrid    Node
---------                     --------- -------------   ------------     --------    ----
aggr0                            2.2 GB     False          False          False      beam-fs-ps-01
aggr1                          235.3 MB     False          False          False      beam-fs-ps-01

---

### Parameters
#### **Node**
The name of one or more nodes containing the aggregates to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Nodes  |

#### **Aggregate**
The name of one or more aggregates to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|AggregateName|

#### **Attributes**
For improved scalability in large clusters, provide a AggrAutobalanceAggregateState object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAggrAutobalanceAggrState -Template" to get the initially empty AggrAutobalanceAggregateState object.  If not specified, all data is returned for each object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[AggrAutobalanceAggregateState]`|false   |named   |false        |

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
Specify to get an empty AggrAutobalanceAggregateState object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a AggrAutobalanceAggregateState object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAggrAutobalanceAggrState -Template" to get the initially empty AggrAutobalanceAggregateState object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[AggrAutobalanceAggregateState]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrAutobalanceAggregateState

---

### Notes
Category: aggr
API: aggr-autobalance-aggregate-state-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrAutobalanceAggrState [[-Node] <String[]>] [[-Aggregate] <String[]>] [-Attributes <AggrAutobalanceAggregateState>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrAutobalanceAggrState -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrAutobalanceAggrState -Query <AggrAutobalanceAggregateState> [-Attributes <AggrAutobalanceAggregateState>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
