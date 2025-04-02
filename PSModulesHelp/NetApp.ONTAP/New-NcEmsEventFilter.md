New-NcEmsEventFilter
--------------------

### Synopsis
Create a new event filter.

---

### Description

Create a new event filter.

---

### Related Links
* [Remove-NcEmsEventFilter](Remove-NcEmsEventFilter)

* [Get-NcEmsEventFilter](Get-NcEmsEventFilter)

* [Add-NcEmsEventFilterRule](Add-NcEmsEventFilterRule)

* [Copy-NcEmsEventFilter](Copy-NcEmsEventFilter)

* [Rename-NcEmsEventFilter](Rename-NcEmsEventFilter)

---

### Examples
> Example 1

New-NcEmsEventFilter -FilterName testFilter
Create a filter called testFilter

EventFilterRule                         FilterName                              NcController
---------------                         ----------                              ------------
{*}                                     testFilter                              10.63.1.234

---

### Parameters
#### **FilterName**
Name of the filter to be created.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Rules**
Array of event filter rules on which to match. To instantiate the please create object using New-Object DataONTAP.C.Types.Ems.Rule. This parameter is supported with Rest only.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Ems.Rule]`|false   |named   |false        |

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
* DataONTAP.C.Types.Ems.EventFilter

---

### Notes
Category: ems
API: ems-event-filter-create
Family: cluster

---

### Syntax
```PowerShell
New-NcEmsEventFilter [-FilterName] <String> [-Rules <DataONTAP.C.Types.Ems.Rule>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
