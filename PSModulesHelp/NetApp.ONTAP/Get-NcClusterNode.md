Get-NcClusterNode
-----------------

### Synopsis
Get information about nodes in a cluster.

---

### Description

Get information about nodes in a cluster.

---

### Related Links
* [Set-NcClusterNode](Set-NcClusterNode)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterNode
Get cluster information for all of the nodes on the cluster.

IsNodeEligible          : True
IsNodeEpsilon           : False
IsNodeHealthy           : True
NcController            : 10.63.165.62
NodeName                : sfp-cmode-02-01
NodeUuid                : 8465d61f-a182-11e1-aa4a-3ffec582086d
IsNodeEligibleSpecified : True
IsNodeEpsilonSpecified  : True
IsNodeHealthySpecified  : True

IsNodeEligible          : True
IsNodeEpsilon           : False
IsNodeHealthy           : True
NcController            : 10.63.165.62
NodeName                : sfp-cmode-02-02
NodeUuid                : e3f6a70d-3e7f-11e2-b566-993f20743733
IsNodeEligibleSpecified : True
IsNodeEpsilonSpecified  : True
IsNodeHealthySpecified  : True

```
> Example 2

```PowerShell
$q = Get-NcClusterNode -Template
$q.IsNodeEligible = $true
Get-NcClusterNode -Query $q
Get all of the eligible node cluster information.

IsNodeEligible          : True
IsNodeEpsilon           : False
IsNodeHealthy           : True
NcController            : 10.63.165.62
NodeName                : sfp-cmode-02-01
NodeUuid                : 8465d61f-a182-11e1-aa4a-3ffec582086d
IsNodeEligibleSpecified : True
IsNodeEpsilonSpecified  : True
IsNodeHealthySpecified  : True

IsNodeEligible          : True
IsNodeEpsilon           : False
IsNodeHealthy           : True
NcController            : 10.63.165.62
NodeName                : sfp-cmode-02-02
NodeUuid                : e3f6a70d-3e7f-11e2-b566-993f20743733
IsNodeEligibleSpecified : True
IsNodeEpsilonSpecified  : True
IsNodeHealthySpecified  : True

```

---

### Parameters
#### **Name**
Name of one or more nodes to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Attributes**
For improved scalability in large clusters, provide a ClusterNodeInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcClusterNode -Template" to get the initially empty ClusterNodeInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ClusterNodeInfo]`|false   |named   |false        |

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
Specify to get an empty ClusterNodeInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ClusterNodeInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterNode -Template" to get the initially empty ClusterNodeInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ClusterNodeInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cluster.ClusterNodeInfo

---

### Notes
Category: cluster
API: cluster-node-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterNode [[-Name] <String[]>] [-Attributes <ClusterNodeInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterNode -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcClusterNode -Query <ClusterNodeInfo> [-Attributes <ClusterNodeInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
