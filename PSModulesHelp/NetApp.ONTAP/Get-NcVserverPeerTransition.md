Get-NcVserverPeerTransition
---------------------------

### Synopsis
Gets a list of transition peering relationship.

---

### Description

Gets a list of transition peering relationship.

---

### Related Links
* [New-NcVserverPeerTransition](New-NcVserverPeerTransition)

* [Set-NcVserverPeerTransition](Set-NcVserverPeerTransition)

* [Remove-NcVserverPeerTransition](Remove-NcVserverPeerTransition)

---

### Examples
> Example 1

Get-NcVserverPeerTransition -Vserver beam01
Get the transition relationship for vserver beam01.

LocalVserver                  MultiPathAddress              NcController                  SrcFilerName
------------                  ----------------              ------------                  ------------
beam01                                                      10.63.165.62                  10.61.169.28

---

### Parameters
#### **Vserver**
Name of the local Vserver.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|LocalVserver|

#### **SrcFiler**
Name of the source filer.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|SrcFilerName|

#### **Attributes**
For improved scalability in large clusters, provide a VserverPeerTransitionInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVserverPeerTransition -Template" to get the initially empty VserverPeerTransitionInfo object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VserverPeerTransitionInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
Specify to get an empty VserverPeerTransitionInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a VserverPeerTransitionInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVserverPeerTransition -Template" to get the initially empty VserverPeerTransitionInfo object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VserverPeerTransitionInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.VserverPeerTransition.VserverPeerTransitionInfo

---

### Notes
Category: vserver peer transition
API: vserver-peer-transition-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcVserverPeerTransition [[-Vserver] <String[]>] [[-SrcFiler] <String[]>] [-Attributes <VserverPeerTransitionInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverPeerTransition -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverPeerTransition -Query <VserverPeerTransitionInfo> [-Attributes <VserverPeerTransitionInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
