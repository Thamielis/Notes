New-NcVserverPeer
-----------------

### Synopsis
Create a new Vserver peer relationship between two existing Vservers.

---

### Description

Create a new Vserver peer relationship between two existing Vservers.

---

### Related Links
* [Get-NcVserverPeer](Get-NcVserverPeer)

* [Confirm-NcVserverPeer](Confirm-NcVserverPeer)

---

### Examples
> Example 1

```PowerShell
New-NcVserverPeer -Vserver beam01 -PeerVserver dummy -Application snapmirror
Establish a vserver peer relationship.

Applications : {snapmirror}
NcController : 10.63.165.62
PeerCluster  : sfp-cmode-02
PeerState    : peered
PeerVserver  : dummy
Vserver      : beam01

```

---

### Parameters
#### **Vserver**
Name of the local Vserver in the relationship.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **PeerVserver**
Name of the peer Vserver in the relationship.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Application**
Applications which can make use of the peering relationship.  Possible values: 'snapmirror', 'file_copy', 'lun_copy'.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |3       |true (ByPropertyName)|

#### **PeerCluster**
Name of the peer Cluster. If peer Cluster is not given, the local cluster is considered.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **LocalName**
Specify the local name of the peer vserver in the relationship.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.VserverPeer.VserverPeerInfo

---

### Notes
Category: vserver peer
API: vserver-peer-create
Family: cluster

---

### Syntax
```PowerShell
New-NcVserverPeer [-Vserver] <String> [-PeerVserver] <String> [-Application] <String[]> [-PeerCluster <String>] [-LocalName <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
