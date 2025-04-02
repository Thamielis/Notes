Remove-NcEmsEventFilter
-----------------------

### Synopsis
Delete one or more existing event filters.

---

### Description

Delete one or more existing event filters. To delete the event notifications associated with the filter as well, specify the ForceDeleteNotification parameter.

---

### Related Links
* [Get-NcEmsEventFilter](Get-NcEmsEventFilter)

* [New-NcEmsEventFilter](New-NcEmsEventFilter)

* [Copy-NcEmsEventFilter](Copy-NcEmsEventFilter)

---

### Examples
> Example 1

Remove-NcEmsEventFilter -FilterName test_20151214_075255
Remove a filter from the cluster

Destory EMS Event Filter
Are you sure you want to remove the ems event filter(s)?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

EmsEventFilterKey  : {test_20151214_075255}
ErrorCode          :
ErrorMessage       :
NcController       : 10.63.1.234
ErrorCodeSpecified : False

---

### Parameters
#### **FilterName**
Specify to filter by FilterName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

#### **ForceDeleteNotification**
Specify to force deletion of event notifications associated with the specified filter

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **ContinueOnFailure**
Specify to continue modifications on other nodes in case operations fail on one (or more) nodes

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
If operation is allowed to continue on failure on one (or more) nodes, this can be specified to stop the operation after n number of failures

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

#### **Query**
Specify to query using a object with restricting fields set.

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[EventFilter]`|true    |1       |true (ByPropertyName)|

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsEventFilterDestroyIterInfo

---

### Notes
Category: ems
API: ems-event-filter-destroy-iter
Family: cluster

---

### Syntax
```PowerShell
Remove-NcEmsEventFilter [-FilterName] <String[]> [-ForceDeleteNotification] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcEmsEventFilter [-Query] <EventFilter> [-ForceDeleteNotification] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcEmsEventFilter [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
