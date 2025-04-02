Disable-NcHaInterconnectLink
----------------------------

### Synopsis
Turn off selected interconnect link on the selected node.

---

### Description

Turn off selected interconnect link on the selected node.

---

### Examples
> Example 1

Disable-NcHaInterconnectLink
Disabling Ha-Interconnect link with LinkNumber 0 for node sapanj-vsim3

cmdlet Disable-NcHaInterconnectLink at command pipeline position 1
Supply values for the following parameters:
(Type !? for Help.)
LinkNumber: 0
NodeName: sapanj-vsim3

Disabling Interconnect Link
Are you sure you want to disable Interconnect Link on node sapanj-vsim3?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

DevicePortDetails    : {DataONTAP.C.Types.HaInterconnect.DevicePortInfo}
LinkMonitor          : False
NcController         : 10.238.73.251
NodeName             : sapanj-vsim3
LinkMonitorSpecified : True

---

### Parameters
#### **LinkNumber**
Interconnect link number (0-based) to turn off.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **NodeName**
The node on which the link command executes.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|Node   |

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
* DataONTAP.C.Types.HaInterconnect.HaInterconnectPortDetails

---

### Notes
Category: ha interconnect
API: ha-interconnect-link-off
Family: cluster

---

### Syntax
```PowerShell
Disable-NcHaInterconnectLink [-LinkNumber] <String> [-NodeName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
