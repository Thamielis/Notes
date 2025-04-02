New-NcVserverPeerTransition
---------------------------

### Synopsis
Create a new Transition peering relationship between a Data ONTAP 7-Mode system and a clustered Data ONTAP Vserver.

---

### Description

Create a new Transition peering relationship between a Data ONTAP 7-Mode system and a clustered Data ONTAP Vserver.

---

### Related Links
* [Get-NcVserverPeerTransition](Get-NcVserverPeerTransition)

* [Set-NcVserverPeerTransition](Set-NcVserverPeerTransition)

* [Remove-NcVserverPeerTransition](Remove-NcVserverPeerTransition)

---

### Examples
> Example 1

New-NcVserverPeerTransition -Vserver beam01 -SrcFiler 10.61.169.28
Create a new vserver peer transition relationship.

LocalVserver                  MultiPathAddress              NcController                  SrcFilerName
------------                  ----------------              ------------                  ------------
beam01                                                      10.63.165.62                  10.61.169.28

---

### Parameters
#### **Vserver**
Name of the local Vserver in the relationship.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|true    |1       |true (ByPropertyName)|LocalVserver|

#### **SrcFiler**
Name of the source filer in the relationship.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|true    |2       |true (ByPropertyName)|SrcFilerName|

#### **MultipathAddress**
Additional address(hostname/IP address) for source filer.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **LocalLif**
List of Local Intercluster LIFs.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.VserverPeerTransition.VserverPeerTransitionInfo

---

### Notes
Category: vserver peer transition
API: vserver-peer-transition-create
Family: cluster

---

### Syntax
```PowerShell
New-NcVserverPeerTransition [-Vserver] <String> [-SrcFiler] <String> [[-MultipathAddress] <String>] [-LocalLif <String[]>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
