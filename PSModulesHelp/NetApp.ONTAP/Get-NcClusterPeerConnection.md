Get-NcClusterPeerConnection
---------------------------

### Synopsis
Get a list of connections to cluster peers.

---

### Description

Get a list of connections to cluster peers.

---

### Related Links
* [Disconnect-NcClusterPeer](Disconnect-NcClusterPeer)

---

### Examples
> Example 1

Get-NcClusterPeerConnection
Get all the cluster peer connections for the current cluster.

PeerClusterName            StatusOperational    ConnectionType            Address       Port             FileDescriptor
---------------            -----------------    --------------            -------       ----             --------------
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974244098601
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974244313641
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974248069673
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974244086825
beam-fs-pt                 ok                   dsmf_server           10.63.10.35      11104                        149
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974244037673
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974244043817

> Example 2

Get-NcClusterPeerConnection -Query @{StatusOperational="ok"}
Get all of the "ok" connections.

PeerClusterName            StatusOperational    ConnectionType            Address       Port             FileDescriptor
---------------            -----------------    --------------            -------       ----             --------------
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974244098601
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974244313641
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974248069673
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974244086825
beam-fs-pt                 ok                   dsmf_server           10.63.10.35      11104                        142
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974244037673
beam-fs-pt                 ok                   spinnp                10.63.10.35      11105       18446742974244043817

---

### Parameters
#### **Name**
The name of the peer cluster.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                        |
|------------|--------|--------|---------------------|-------------------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ClusterName<br/>PeerClusterName|

#### **Node**
One or more nodes involved in the connection(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ConnectionType**
One or more connection types.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **FileDescriptor**
One or more file descriptors for the cluster peer connection.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt64[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a ClusterPeerConnections object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcClusterPeerConnection -Template" to get the initially empty ClusterPeerConnections object.  If not specified, all data is returned for each object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ClusterPeerConnections]`|false   |named   |false        |

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
Specify to get an empty ClusterPeerConnections object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ClusterPeerConnections object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterPeerConnection -Template" to get the initially empty ClusterPeerConnections object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ClusterPeerConnections]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterPeer.ClusterPeerConnections

---

### Notes
Category: cluster peer
API: cluster-peer-connections-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterPeerConnection [[-Name] <String[]>] [-Node <String[]>] [-ConnectionType <String[]>] [-FileDescriptor <UInt64[]>] [-Attributes <ClusterPeerConnections>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterPeerConnection -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterPeerConnection -Query <ClusterPeerConnections> [-Attributes <ClusterPeerConnections>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
