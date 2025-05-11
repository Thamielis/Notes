Set-NcClusterPeerLocalName
--------------------------

### Synopsis
Modify the local name for a cluster peer.

---

### Description

Modify the local name for a cluster peer.

---

### Examples
> Example 1

Set-NcClusterPeerLocalName -Name clusterlocal1 -NewName clusterlocalnewname
Set clusterpeer localname from 'closterlocal1' to 'clusterlocalnewname'

ClusterName               Availability    ActiveAddresses                                                              
-----------               ------------    ---------------                                                              
clusterlocalnewname       available       {10.238.73.250, 10.238.73.254}

---

### Parameters
#### **Name**
The name of the peer cluster to modify.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|ClusterName|

#### **NewName**
The new local name for the peer cluster.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |2       |true (ByPropertyName)|LocalName|

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
* DataONTAP.C.Types.ClusterPeer.ClusterPeerInfo

---

### Notes
Category: cluster peer
API: cluster-peer-modify-local-name
Family: cluster

---

### Syntax
```PowerShell
Set-NcClusterPeerLocalName [-Name] <String> [-NewName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
