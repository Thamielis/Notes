Get-NcAutoSupportTrigger
------------------------

### Synopsis
Get the AutoSupport trigger data.

---

### Description

Get the AutoSupport trigger data.

---

### Related Links
* [Set-NcAutoSupportTrigger](Set-NcAutoSupportTrigger)

---

### Examples
> Example 1

Get-NcAutoSupportTrigger fas3070cluster01-01
Get the AutoSupport trigger information for node fas3070cluster01-01.

NcController              : 10.61.172.155
AdditionalContent         :
BasicAdditional           :
BasicDefault              : {mandatory, log_files, platform, wafl...}
NodeName                  : fas3070cluster01-01
NotetoEnabled             : enabled
TimeLimit                 :
ToEnabled                 : enabled
Trigger                   : aggr.offline
TroubleshootingAdditional :
TroubleshootingDefault    : {mandatory, wafl, log_files}
NotetoEnabledSpecified    : True
TimeLimitSpecified        : False
ToEnabledSpecified        : True

NcController              : 10.61.172.155
AdditionalContent         :
BasicAdditional           :
BasicDefault              : {mandatory, log_files, platform, raid...}
NodeName                  : fas3070cluster01-01
NotetoEnabled             : enabled
TimeLimit                 :
ToEnabled                 : disabled
Trigger                   : aggr.restricted
TroubleshootingAdditional :
TroubleshootingDefault    : {mandatory, raid, wafl, log_files}
NotetoEnabledSpecified    : True
TimeLimitSpecified        : False
ToEnabledSpecified        : True

> Example 2

$q = Get-NcAutoSupportTrigger -Template
$q.TroubleshootingDefault ="wafl"
Get-NcAutoSupportTrigger -Query $q
Get the AutoSupport triggers that have "wafl" listed as a troubleshooting default subsystem.

NcController              : 10.61.172.155
AdditionalContent         :
BasicAdditional           :
BasicDefault              : {mandatory, log_files, platform, wafl...}
NodeName                  : fas3070cluster01-01
NotetoEnabled             : enabled
TimeLimit                 :
ToEnabled                 : enabled
Trigger                   : aggr.offline
TroubleshootingAdditional :
TroubleshootingDefault    : {mandatory, wafl, log_files}
NotetoEnabledSpecified    : True
TimeLimitSpecified        : False
ToEnabledSpecified        : True

NcController              : 10.61.172.155
AdditionalContent         :
BasicAdditional           :
BasicDefault              : {mandatory, log_files, platform, raid...}
NodeName                  : fas3070cluster01-01
NotetoEnabled             : enabled
TimeLimit                 :
ToEnabled                 : disabled
Trigger                   : aggr.restricted
TroubleshootingAdditional :
TroubleshootingDefault    : {mandatory, raid, wafl, log_files}
NotetoEnabledSpecified    : True
TimeLimitSpecified        : False
ToEnabledSpecified        : True

---

### Parameters
#### **Node**
The name of the controller that owns the trigger configuration.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Name**
The name of the trigger(s) to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Trigger|

#### **Attributes**
For improved scalability in large clusters, provide a AutosupportTriggerInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAutoSupportTrigger -Template" to get the initially empty AutosupportTriggerInfo object.  If not specified, all data is returned for each object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[AutosupportTriggerInfo]`|false   |named   |false        |

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
Specify to get an empty AutosupportTriggerInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a AutosupportTriggerInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAutoSupportTrigger -Template" to get the initially empty AutosupportTriggerInfo object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[AutosupportTriggerInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Autosupport.AutosupportTriggerInfo

---

### Notes
Category: autosupport
API: autosupport-trigger-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAutoSupportTrigger [[-Node] <String[]>] [[-Name] <String[]>] [-Attributes <AutosupportTriggerInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAutoSupportTrigger -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAutoSupportTrigger -Query <AutosupportTriggerInfo> [-Attributes <AutosupportTriggerInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
