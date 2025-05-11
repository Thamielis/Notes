Set-NcVserverPeer
-----------------

### Synopsis
Modify a Vserver peer relationship.

---

### Description

Modify a Vserver peer relationship.

---

### Related Links
* [Get-NcVserverPeer](Get-NcVserverPeer)

* [New-NcVserverPeer](New-NcVserverPeer)

* [Remove-NcVserverPeer](Remove-NcVserverPeer)

---

### Examples
> Example 1

Set-NcVserverPeer -Vserver dummy -PeerVserver beam01 -Application snapmirror
Set the vserver peer relationship's application to 'snapmirror'.

Vserver                   PeerVserver               PeerState          PeerCluster               Applications
-------                   -----------               ---------          -----------               ------------
dummy                     beam01                    peered             sfp-cmode-02              {snapmirror}

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
Applications which can make use of the peering relationship.  Possible values: 'snapmirror'.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |3       |true (ByPropertyName)|

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
* DataONTAP.C.Types.VserverPeer.VserverPeerInfo

---

### Notes
Category: vserver peer
API: vserver-peer-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcVserverPeer [-Vserver] <String> [-PeerVserver] <String> [-Application] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
