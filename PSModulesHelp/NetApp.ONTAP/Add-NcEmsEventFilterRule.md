Add-NcEmsEventFilterRule
------------------------

### Synopsis
Add a rule to an event filter

---

### Description

Add a rule to an event filter

---

### Related Links
* [Remove-NcEmsEventFilterRule](Remove-NcEmsEventFilterRule)

* [Get-NcEmsEventFilter](Get-NcEmsEventFilter)

* [New-NcEmsEventFilter](New-NcEmsEventFilter)

* [Set-NcEmsEventFilterRuleOrder](Set-NcEmsEventFilterRuleOrder)

---

### Examples
> Example 1

```PowerShell
Add-NcEmsEventFilterRule -FilterName testFilter -Severity emergency -Type include -Position 1
Add a rule to include all emergency messages under testFilter

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

```

---

### Parameters
#### **FilterName**
Name of the filter to which the message is to be added

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Type**
Rule Type

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **MessageName**
Message Name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Position**
The position at which the rule is needed.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Severity**
The severity of the message.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SnmpTrapType**
The snmp trap types.

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
API: ems-event-filter-rule-add
Family: cluster

---

### Syntax
```PowerShell
Add-NcEmsEventFilterRule [-FilterName] <String> [-Type] <String> [-MessageName <String>] [-Position <Int64>] [-Severity <String[]>] [-SnmpTrapType <String[]>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
