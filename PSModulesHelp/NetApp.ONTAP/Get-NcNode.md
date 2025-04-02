Get-NcNode
----------

### Synopsis
Obtain the node information, either when it's part of the cluster or discover all nodes on the network

---

### Description

Obtain the node information, either when it's part of the cluster or discover all nodes on the network

---

### Related Links
* [Get-NcNodeInfo](Get-NcNodeInfo)

---

### Examples
> Example 1

Get-NcNode
List all nodes in the current cluster.

Name                 NodeModel  NodeLocation
----                 ---------  ------------
Cerebus-03           FAS3070    SeaLab-A7
Cerebus-04           FAS3040    SeaLab-A7
Cerebus-05           FAS3040    SeaLab-A7
Cerebus-06           FAS3040    SeaLab-A7

> Example 2

$n = Get-NcNode -Template
$n.NodeModel = "*3070"
Get-NcNode -Query $n
List nodes comprised of FAS3070 controllers.

Name                 NodeModel  NodeLocation
----                 ---------  ------------
Cerebus-03           FAS3070    SeaLab-A7

> Example 3

```PowerShell
Get-NcNode -All
Discover all nodes (works only in ONTAP 8.3 or later)

ClusterName              : dpg-7mdp-8040-03_04
ClusterUuid              : 30f1fea4-e09c-11e3-aeb4-00a09843955c
IsNodeInCluster          : True
NcController             : 10.225.215.73
Node                     : dpg-7mdp-8040-03
NodeModel                : FAS8040
NodeNvramId              : 536872186
NodeSerialNumber         : 940001024198
PartnerNvramId           : 536872339
Version                  : Longboard__8.4.0
IsNodeInClusterSpecified : True

ClusterName              : dpg-7mdp-8040-03_04
ClusterUuid              : 30f1fea4-e09c-11e3-aeb4-00a09843955c
IsNodeInCluster          : True
NcController             : 10.225.215.73
Node                     : dpg-7mdp-8040-04
NodeModel                : FAS8040
NodeNvramId              : 536872339
NodeSerialNumber         : 940001024332
PartnerNvramId           : 536872186
Version                  : Longboard__8.4.0
IsNodeInClusterSpecified : True

ClusterName              : f3250-215-73-75
ClusterUuid              : ba918857-eead-11e3-a82e-00a0983f5142
IsNodeInCluster          : True
NcController             : 10.225.215.73
Node                     : f3250-215-73-75-01
NodeModel                : FAS3250
NodeNvramId              : 2015103390
NodeSerialNumber         : 700001412335
PartnerNvramId           : 2015103330
Version                  : 8.3RC1
IsNodeInClusterSpecified : True

ClusterName              : f3250-215-73-75
ClusterUuid              : ba918857-eead-11e3-a82e-00a0983f5142
IsNodeInCluster          : True
NcController             : 10.225.215.73
Node                     : f3250-215-73-75-02
NodeModel                : FAS3250
NodeNvramId              : 2015103330
NodeSerialNumber         : 700001412323
PartnerNvramId           : 2015103390
Version                  : 8.3RC1
IsNodeInClusterSpecified : True

```

---

### Parameters
#### **Name**
The name of one or more nodes to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Node   |

#### **Attributes**
For improved scalability in large clusters, provide a NodeDetailsInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNode -Template" to get the initially empty NodeDetailsInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[NaSerializable]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **All**
If specified returns information about all nodes discovered on the network (and not just nodes in the cluster)

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[Switch]`|false   |named   |false        |UnconfiguredAlso<br/>UseSp|

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty NodeDetailsInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NodeDetailsInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNode -Template" to get the initially empty NodeDetailsInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[NaSerializable]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.NodeDetailsInfo

---

### Notes
Category: system
API: system-node-get-iter, system-node-discovery-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNode [[-Name] <String[]>] [-Attributes <NaSerializable>] [-Controller <NcController[]>] [-All] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNode -Template [-Controller <NcController[]>] [-All] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNode -Query <NaSerializable> [-Attributes <NaSerializable>] [-Controller <NcController[]>] [-All] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
