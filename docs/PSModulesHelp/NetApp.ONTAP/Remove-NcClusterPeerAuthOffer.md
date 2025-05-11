Remove-NcClusterPeerAuthOffer
-----------------------------

### Synopsis
Cancel the outstanding offer to authenticate with a peer cluster.

---

### Description

Cancel the outstanding offer to authenticate with a peer cluster.

---

### Related Links
* [Get-NcClusterPeerAuthOffer](Get-NcClusterPeerAuthOffer)

* [Set-NcClusterPeerAuthOffer](Set-NcClusterPeerAuthOffer)

---

### Examples
> Example 1

```PowerShell
Remove-NcClusterPeerAuthOffer -Name beam-fs-pt
Remove the cluster peer auth offer for the given peer cluster.
```

---

### Parameters
#### **Name**
The name of the peer cluster to remove authentication offer.

|Type      |Required|Position|PipelineInput        |Aliases                        |
|----------|--------|--------|---------------------|-------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|ClusterName<br/>PeerClusterName|

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
API: cluster-peer-delete
Family: cluster

---

### Syntax
```PowerShell
Remove-NcClusterPeerAuthOffer [-Name] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
