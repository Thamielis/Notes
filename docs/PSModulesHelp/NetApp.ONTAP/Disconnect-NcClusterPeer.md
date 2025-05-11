Disconnect-NcClusterPeer
------------------------

### Synopsis
Terminate a current peering connection.

---

### Description

Terminate a current peering connection.

---

### Related Links
* [Get-NcClusterPeerConnection](Get-NcClusterPeerConnection)

---

### Examples
> Example 1

```PowerShell
Disconnect-NcClusterPeer -Name beam-fs-pt -Node beam-fs-ps-01 -ConnectionType spinnp -FileDescriptor 155
Disconnect the given cluster peering connection.
```

---

### Parameters
#### **Name**
The name of the peer cluster.

|Type      |Required|Position|PipelineInput        |Aliases                        |
|----------|--------|--------|---------------------|-------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|ClusterName<br/>PeerClusterName|

#### **Node**
The name of the node that has the connections involved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ConnectionType**
The type of connection for cluster peering.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **FileDescriptor**
The file descriptor for the connection.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[UInt64]`|true    |4       |true (ByPropertyName)|

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
* 

---

### Notes
Category: cluster peer
API: cluster-peer-connection-destroy
Family: cluster

---

### Syntax
```PowerShell
Disconnect-NcClusterPeer [-Name] <String> [-Node] <String> [-ConnectionType] <String> [-FileDescriptor] <UInt64> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
