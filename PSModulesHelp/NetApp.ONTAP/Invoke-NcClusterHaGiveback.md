Invoke-NcClusterHaGiveback
--------------------------

### Synopsis
Initiate a giveback of partner resources.

---

### Description

Initiate a giveback of partner resources. Once the giveback is complete, the automatic takeover capability is disabled until the partner is rebooted. A giveback fails if outstanding CIFS sessions, active system dump processes, or other filer operations makes a giveback dangerous or disruptive.

---

### Related Links
* [Invoke-NcClusterHaTakeover](Invoke-NcClusterHaTakeover)

---

### Examples
> Example 1

```PowerShell
Invoke-NcClusterHaGiveback fas3070cluster01-01
Start giveback of partner resources of node fas3070cluster01-01.
```

---

### Parameters
#### **Node**
The name of the node which performs giveback to its partner.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Force**
If specified, allow a giveback to proceed even if there are outstanding CIFS sessions, active system dump processes, or other filer operations which makes a giveback dangerous or disruptive as long as it would not result in data corruption or filer error.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoPartnerWaiting**
If specified, allow the process of giveback of the aggregates to proceed even if the partner is not up and waiting to receive them.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OverrideVetoes**
Some conditions cause attempts to giveback aggregates to be vetoed. If specified, allow the process of giveback of the aggregates to be initiated even in the face of such vetoes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OnlyCfoAggregates**
If specified, only the CFO HA-style aggregates (which includes the root aggregate) will be given back. This may be needed in the case when the partner node's VLDB and other such management applications are not properly working (they are required to be online for the SFO HA-style aggregates to start serving data), so it might not be possible to giveback SFO HA-style aggregates.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Category: cf
API: cf-giveback
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcClusterHaGiveback [-Node] <String> [-Force] [-NoPartnerWaiting] [-OverrideVetoes] [-OnlyCfoAggregates] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
