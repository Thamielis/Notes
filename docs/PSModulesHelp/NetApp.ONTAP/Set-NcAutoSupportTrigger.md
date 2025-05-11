Set-NcAutoSupportTrigger
------------------------

### Synopsis
Modify the AutoSupport trigger data for the given node and EMS message.

---

### Description

Modify the AutoSupport trigger data for the given node and EMS message.

---

### Related Links
* [Get-NcAutoSupportTrigger](Get-NcAutoSupportTrigger)

---

### Examples
> Example 1

Set-NcAutoSupportTrigger fas3070cluster01-01 weekly -BasicAdditional @("fpolicy","performance_asup")
Add the subsystems "fpolicy" and "performance_asup" to the basic reporting for the weekly trigger.

NcController              : 10.61.172.155
AdditionalContent         : {basic}
BasicAdditional           : {performance_asup, fpolicy}
BasicDefault              : {mandatory, platform, mhost, performance...}
NodeName                  : fas3070cluster01-01
NotetoEnabled             : disabled
TimeLimit                 :
ToEnabled                 : disabled
Trigger                   : weekly
TroubleshootingAdditional :
TroubleshootingDefault    : {mandatory, networking}
NotetoEnabledSpecified    : True
TimeLimitSpecified        : False
ToEnabledSpecified        : True

---

### Parameters
#### **Node**
The name of a controller on which the AutoSupport tool is running.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **Trigger**
The name of the trigger to modify.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ToEnabled**
If true, deliver to AutoSupport -to addresses.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **NoteToEnabled**
If true, deliver to AutoSupport -noteto Addresses.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **BasicAdditional**
Additional subsystems reporting basic info.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **TroubleshootingAdditional**
Additional subsystems reporting troubleshooting info.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **TimeLimit**
The data collection time budget for this trigger (in seconds).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **SizeLimit**
The data collection size budget for this trigger.
This parameter is available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Autosupport.AutosupportTriggerInfo

---

### Notes
Category: autosupport
API: autosupport-trigger-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcAutoSupportTrigger [-Node] <String> [-Trigger] <String> [-ToEnabled <Boolean>] [-NoteToEnabled <Boolean>] [-BasicAdditional <String[]>] [-TroubleshootingAdditional <String[]>] 
```
```PowerShell
[-TimeLimit <Int64>] [-SizeLimit <Int64>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
