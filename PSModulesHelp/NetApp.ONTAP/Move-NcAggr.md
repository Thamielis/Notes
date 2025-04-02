Move-NcAggr
-----------

### Synopsis
Relocate one or more aggregates from on node to another.

---

### Description

Relocate one or more aggregates from on node to another.

---

### Related Links
* [Get-NcAggrRelocation](Get-NcAggrRelocation)

---

### Examples
> Example 1

Move-NcAggr aggr1 -SourceNode sfp-cmode-02-01 -DestinationNode sfp-cmode-02-02
Move aggregate aggr1.

Aggregate                 SourceNode                Destination               RelocationStatus
---------                 ----------                -----------               ----------------
aggr1                     sfp-cmode-02-01           sfp-cmode-02-02           Done

---

### Parameters
#### **Name**
One or more aggregates to move.

|Type        |Required|Position|PipelineInput        |Aliases                       |
|------------|--------|--------|---------------------|------------------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|Names<br/>Aggregates<br/>Aggrs|

#### **SourceNode**
Name of the source node in which aggregate resides.

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|true    |2       |true (ByPropertyName)|SourceNodeName|

#### **DestinationNode**
Name of destination node where aggregates are to be relocated.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |3       |true (ByPropertyName)|DestinationNodeName|

#### **OverrideVetoes**
If specified, override veto checks for relocating an aggregate.  Initiating aggregate relocation with vetoes overridden will result in relocation proceeding even if the node detects outstanding issues that would make aggregate relocation dangerous or disruptive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RelocateToHigherVersion**
If specified, relocate to a node running higher major Data ONTAP version.  If an aggregate is relocated to this destination then that aggregate cannot be relocated back to the source node till the source is also upgraded to the same or higher Data ONTAP version. This option is not required if the destination is running on higher minor version but the same major version.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OverrideDestinationChecks**
If specified, override checks done on destination node.  This option could be used to force a relocation of aggregates even if the destination has outstanding issues. Note that this could make the relocation dangerous or disruptive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NdoControllerUpgrade**
If specified, relocation of aggregates is a part of node upgrade.  Aggregate relocation will not change home ownership of the aggregates while relocating as part of controller upgrade.

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
* DataONTAP.C.Types.Aggr.AggrRelocationInfo

---

### Notes
Category: aggr
API: aggr-relocation
Family: cluster

---

### Syntax
```PowerShell
Move-NcAggr [-Name] <String[]> [-SourceNode] <String> [-DestinationNode] <String> [-OverrideVetoes] [-RelocateToHigherVersion] [-OverrideDestinationChecks] [-NdoControllerUpgrade] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
