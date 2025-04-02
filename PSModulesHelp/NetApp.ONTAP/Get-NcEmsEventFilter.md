Get-NcEmsEventFilter
--------------------

### Synopsis
Iterate over a list of event filters.

---

### Description

Iterate over a list of event filters.

---

### Related Links
* [Remove-NcEmsEventFilter](Remove-NcEmsEventFilter)

* [New-NcEmsEventFilter](New-NcEmsEventFilter)

* [Add-NcEmsEventFilterRule](Add-NcEmsEventFilterRule)

* [Remove-NcEmsEventFilterRule](Remove-NcEmsEventFilterRule)

---

### Examples
> Example 1

Get-NcEmsEventFilter
Get details of all event filters on this cluster

EventFilterRule                         FilterName                              NcController
---------------                         ----------                              ------------
{*, *, *}                               default-trap-events                     10.63.1.234
{*, callhome.*, *}                      important-events                        10.63.1.234
{*, *}                                  no-info-debug-events                    10.63.1.234
{*, *}                                  testFilter                              10.63.1.234

---

### Parameters
#### **FilterName**
Specify to filter by FilterName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[EventFilter]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[EventFilter]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EventFilter

---

### Notes
Category: ems
API: ems-event-filter-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsEventFilter [[-FilterName] <String[]>] [-Attributes <EventFilter>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsEventFilter -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcEmsEventFilter -Query <EventFilter> [-Attributes <EventFilter>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
