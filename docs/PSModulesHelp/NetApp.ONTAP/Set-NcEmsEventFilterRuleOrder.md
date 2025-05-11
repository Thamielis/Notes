Set-NcEmsEventFilterRuleOrder
-----------------------------

### Synopsis
Reorder the rules based on the new position for a given rule

---

### Description

Reorder the rules based on the new position for a given rule

---

### Related Links
* [Add-NcEmsEventFilterRule](Add-NcEmsEventFilterRule)

* [Remove-NcEmsEventFilterRule](Remove-NcEmsEventFilterRule)

---

### Examples
> Example 1

```PowerShell
Set-NcEmsEventFilterRuleOrder -FilterName testFilter -Position 1 -ToPosition 2
Sends the rule currently at position 1 to position 2

MessageName       : access*
NcController      : 10.63.1.234
Position          : 1
Severity          : {*}
SnmpTrapType      : {*}
Type              : exclude
PositionSpecified : True

MessageName       : *
NcController      : 10.63.1.234
Position          : 2
Severity          : {EMERGENCY}
SnmpTrapType      : {*}
Type              : include
PositionSpecified : True

MessageName       : *
NcController      : 10.63.1.234
Position          : 3
Severity          : {*}
SnmpTrapType      : {*}
Type              : exclude
PositionSpecified : True

```

---

### Parameters
#### **FilterName**
Name of the filter in which rules are to be reorderd

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Position**
Current Positon of the rule

|Type     |Required|Position|PipelineInput        |Aliases     |
|---------|--------|--------|---------------------|------------|
|`[Int64]`|true    |2       |true (ByPropertyName)|FromPosition|

#### **ToPosition**
New position of the rule

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |3       |true (ByPropertyName)|

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
API: ems-event-filter-rule-reorder
Family: cluster

---

### Syntax
```PowerShell
Set-NcEmsEventFilterRuleOrder [-FilterName] <String> [-Position] <Int64> [-ToPosition] <Int64> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
