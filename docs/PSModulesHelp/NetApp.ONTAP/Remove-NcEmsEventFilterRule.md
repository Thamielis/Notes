Remove-NcEmsEventFilterRule
---------------------------

### Synopsis
Delete a rule from an event filter

---

### Description

Delete a rule from an event filter

---

### Related Links
* [Add-NcEmsEventFilterRule](Add-NcEmsEventFilterRule)

* [Set-NcEmsEventFilterRuleOrder](Set-NcEmsEventFilterRuleOrder)

---

### Examples
> Example 1

Remove-NcEmsEventFilterRule testFilter2 -Position 1
Remove rule at position 1 from testFilter (other existing rules come to position n-1 to maintain contiguous numbering)

Removing rule from event filter
Are you sure you wish to remove rule 1 from testFilter2.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

MessageName       : *
NcController      : 10.63.1.234
Position          : 1
Severity          : {EMERGENCY}
SnmpTrapType      : {*}
Type              : include
PositionSpecified : True

MessageName       : *
NcController      : 10.63.1.234
Position          : 2
Severity          : {*}
SnmpTrapType      : {*}
Type              : exclude
PositionSpecified : True

---

### Parameters
#### **FilterName**
Name of the filter from which the rule will be removed

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Position**
Position of the rule to be removed

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Ems.EventFilterRuleInfo

---

### Notes
Category: ems
API: ems-event-filter-rule-delete
Family: cluster

---

### Syntax
```PowerShell
Remove-NcEmsEventFilterRule [-FilterName] <String> [-Position] <Int64> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
