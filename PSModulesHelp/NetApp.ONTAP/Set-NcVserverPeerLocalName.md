Set-NcVserverPeerLocalName
--------------------------

### Synopsis
Modify the local name for a peer Vserver.

---

### Description

Modify the local name for a peer Vserver.

---

### Related Links
* [New-NcVserverPeer](New-NcVserverPeer)

---

### Examples
> Example 1

Set-NcVserverPeerLocalName -NewName newT -PeerCluster c1 -PeerVserver v1
Define a new local name

PS >

No output is returned on success

---

### Parameters
#### **NewName**
The new local name to set for the remote Peer Vserver.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|true    |1       |true (ByPropertyName)|NewLocalName|

#### **PeerCluster**
The cluster in which the remote peer vserver is located

|Type      |Required|Position|PipelineInput        |Aliases                |
|----------|--------|--------|---------------------|-----------------------|
|`[String]`|true    |2       |true (ByPropertyName)|Cluster<br/>ClusterName|

#### **PeerVserver**
Name of the remote peer vserver

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|true    |3       |true (ByPropertyName)|Vserver<br/>PeerName|

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
The number of times to retry commands that return with errors that may succeed after a retry

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
Category: vserver peer
API: vserver-peer-modify-local-name
Family: cluster

---

### Syntax
```PowerShell
Set-NcVserverPeerLocalName [-NewName] <String> [-PeerCluster] <String> [-PeerVserver] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
