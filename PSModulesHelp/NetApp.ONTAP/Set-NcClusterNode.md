Set-NcClusterNode
-----------------

### Synopsis
Modify state of a node in a cluster.

---

### Description

Modify state of a node in a cluster.

---

### Examples
> SetNcClusterNode

```PowerShell
Set-NcClusterNode sfp-cmode-02-01 -NodeEligible $false
Set sfp-cmode-02-01 to be ineligible to participate in the cluster.

IsNodeEligible          : False
IsNodeEpsilon           : False
IsNodeHealthy           : True
NcController            : 10.63.165.62
NodeName                : sfp-cmode-02-01
NodeUuid                : 8465d61f-a182-11e1-aa4a-3ffec582086d
IsNodeEligibleSpecified : True
IsNodeEpsilonSpecified  : True
IsNodeHealthySpecified  : True

```

---

### Parameters
#### **Name**
The name of the node to modify.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **NodeEpsilon**
If true, the node is epsilon.  You can designate a node as epsilon to add weight to its voting in a cluster with an even number of nodes. In a cluster, only one node can be designated as epsilon at any given time.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **NodeEligible**
If true, the node is eligible.  Nodes that are eligible are able to participate in the cluster.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **SkipQuorumCheck**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **SkipQuorumCheckBeforeEligible**

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cluster.ClusterNodeInfo

---

### Notes
Category: cluster
API: cluster-node-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcClusterNode [-Name] <String> [-NodeEpsilon <Boolean>] [-NodeEligible <Boolean>] [-SkipQuorumCheck] [-SkipQuorumCheckBeforeEligible <Boolean>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
