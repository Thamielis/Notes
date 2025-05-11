Set-NcVserverPeerTransition
---------------------------

### Synopsis
Modify a Transition peering relationship.

---

### Description

Modify a Transition peering relationship.

---

### Related Links
* [Get-NcVserverPeerTransition](Get-NcVserverPeerTransition)

* [New-NcVserverPeerTransition](New-NcVserverPeerTransition)

* [Remove-NcVserverPeerTransition](Remove-NcVserverPeerTransition)

---

### Examples
> Example 1

Set-NcVserverPeerTransition -Vserver beam01 -SrcFiler 10.61.169.28 -MultipathAddress fas2040rre1
Set a multipath address for the given relationship.

LocalVserver                  MultiPathAddress              NcController                  SrcFilerName
------------                  ----------------              ------------                  ------------
beam01                        fas2040rre1                   10.63.165.62                  10.61.169.28

> Example 2

```PowerShell
Set-NcVserverPeerTransition -Vserver beam01 -SrcFiler 10.61.167.86 -LocalLif @("")
Clear the local lifs list for the given vserver peer transition relationship.

LocalLifs        :
LocalVserver     : beam01
MultiPathAddress :
NcController     : 10.63.10.33
SrcFilerName     : 10.61.167.86

```

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
API: vserver-peer-transition-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcVserverPeerTransition [-Vserver] <String> [-SrcFiler] <String> [[-MultipathAddress] <String>] [-LocalLif <String[]>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
