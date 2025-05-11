Remove-NcVserverPeerTransition
------------------------------

### Synopsis
Delete a Transition peering relationship.

---

### Description

Delete a Transition peering relationship.

---

### Related Links
* [New-NcVserverPeerTransition](New-NcVserverPeerTransition)

* [Get-NcVserverPeerTransition](Get-NcVserverPeerTransition)

* [Set-NcVserverPeerTransition](Set-NcVserverPeerTransition)

---

### Examples
> Example 1

```PowerShell
Remove-NcVserverPeerTransition -Vserver beam01 -SrcFiler 10.61.169.28
Remove the given relationship.
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
Category: vserver peer transition
API: vserver-peer-transition-destroy
Family: cluster

---

### Syntax
```PowerShell
Remove-NcVserverPeerTransition [-Vserver] <String> [-SrcFiler] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
