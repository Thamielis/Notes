Get-NcClusterPeerHealth
-----------------------

### Synopsis
Get the health of all local and peer nodes sequentially.

---

### Description

Get the health of all local and peer nodes sequentially.

---

### Related Links
* [Get-NcClusterPeer](Get-NcClusterPeer)

* [Ping-NcClusterPeer](Ping-NcClusterPeer)

---

### Examples
> Example 1

Get-NcClusterPeerHealth stlfas3170-7-8-cluster
Get the health info for peer cluster 'stlfas3170-7-8-cluster'.

DestinationCluster        DestinationNode           DataPing             IcmpPing             OriginatingNode
------------------        ---------------           --------             --------             ---------------
stlfas3170-7-8-cluster    stlfas3170-7-8-cluster-01 interface_reachable  interface_reachable  VxeRubble-01
stlfas3170-7-8-cluster    stlfas3170-7-8-cluster-01 interface_reachable  interface_reachable  VxeRubble-02
stlfas3170-7-8-cluster    stlfas3170-7-8-cluster-02 interface_reachable  interface_reachable  VxeRubble-01
stlfas3170-7-8-cluster    stlfas3170-7-8-cluster-02 interface_reachable  interface_reachable  VxeRubble-02

---

### Parameters
#### **Name**
The name of the peer cluster.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                           |
|------------|--------|--------|---------------------|----------------------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ClusterName<br/>DestinationCluster|

#### **Node**
The name of the node in the peer cluster.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                     |
|------------|--------|--------|---------------------|----------------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|NodeName<br/>DestinationNode|

#### **IsClusterHealthy**
The status of peer cluster health.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsNodeHealthy**
The RDB health of the node.  True means the node is in quorum.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsNodeAvailable**
True implies that the destination node is available for intercluster communication.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a ClusterPeerHealthInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcClusterPeerHealth -Template" to get the initially empty ClusterPeerHealthInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[ClusterPeerHealthInfo]`|false   |named   |false        |

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
Specify to get an empty ClusterPeerHealthInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ClusterPeerHealthInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterPeerHealth -Template" to get the initially empty ClusterPeerHealthInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[ClusterPeerHealthInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterPeer.ClusterPeerHealthInfo

---

### Notes
Category: cluster peer
API: cluster-peer-health-info-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterPeerHealth [[-Name] <String[]>] [-Node <String[]>] [-IsClusterHealthy <Boolean>] [-IsNodeHealthy <Boolean>] [-IsNodeAvailable <Boolean>] [-Attributes <ClusterPeerHealthInfo>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterPeerHealth -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcClusterPeerHealth -Query <ClusterPeerHealthInfo> [-Attributes <ClusterPeerHealthInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
