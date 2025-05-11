Copy-NcEmsEventFilter
---------------------

### Synopsis
Copy an Event filter including all its rules

---

### Description

Copy an Event filter including all its rules

---

### Related Links
* [New-NcEmsEventFilter](New-NcEmsEventFilter)

* [Get-NcEmsEventFilter](Get-NcEmsEventFilter)

* [Add-NcEmsEventFilterRule](Add-NcEmsEventFilterRule)

* [Remove-NcEmsEventFilter](Remove-NcEmsEventFilter)

* [Rename-NcEmsEventFilter](Rename-NcEmsEventFilter)

---

### Examples
> Example 1

Copy-NcEmsEventFilter -FilterName test_20151214_075255 -NewFilterName trial
Create a new filter "trial" by copying all the details from filter "test_20151214_075255"

EventFilterRule                         FilterName                              NcController
---------------                         ----------                              ------------
{*, *}                                  test_20151214_075255                    10.63.1.234

---

### Parameters
#### **FilterName**
Name of the event filter to copy details from.

|Type      |Required|Position|PipelineInput        |Aliases                           |
|----------|--------|--------|---------------------|----------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|OldFilterName<br/>Name<br/>OldName|

#### **NewFilterName**
Name of the new event filter.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|NewName|

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
API: ems-event-filter-copy
Family: cluster

---

### Syntax
```PowerShell
Copy-NcEmsEventFilter [-FilterName] <String> [-NewFilterName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
