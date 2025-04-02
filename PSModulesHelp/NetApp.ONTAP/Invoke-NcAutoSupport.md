Invoke-NcAutoSupport
--------------------

### Synopsis
Generate a new AutoSupport message.

---

### Description

Generate a new AutoSupport message.

---

### Related Links
* [Invoke-NcAutoSupportDiagnostic](Invoke-NcAutoSupportDiagnostic)

---

### Examples
> Example 1

Invoke-NcAutoSupport -Type all
Generate a new AutoSupport message.

NcController : 10.238.73.251
SuccessCount : 2
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Autosupport.AutosupportConfigInfo, 
               DataONTAP.C.Types.Autosupport.AutosupportConfigInfo}
FailureList  : {}

---

### Parameters
#### **Node**
The name of the filer on which the AutoSupport message will be generated.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Message**
Text to include as part of the subject of the AutoSupport message.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Type**
The type of AutoSupport to generate.
Possible values:
    "test"           - Test AutoSupport send and receive only
    "performance"    - Generate a Performance AutoSupport as requested by NetApp Support
    "all"            - Send all AutoSupport data without time or size limit, as requested by NetApp Support

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Uri**
Alternate destination for the AutoSupport.  If this field is omitted, the AutoSupport will be delivered to the currently configured destinations.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Force**
If specified, force generation, even if AutoSupport is disabled in the system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ContinueOnFailure**
This input element is useful when multiple autosupport objects match a given query. If set to true, the API will continue with the next matching autosupport even when the operation fails for the autosupport. If set to false, the API will return on the first failure. Default: false

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFailureCount**
When allowing failures ('continue-on-failure' is set to true),then this input element may be provided to limit the number of failed operations before the server gives up and returns. If set, the API will continue with the next matching autosupport even when the operation on a previous matching autosupport fails, and do so until the total number of objects failed to be operated on reaches the maximum specified. If set to the maximum or not provided, then there will be no limit on the number of failed operations. Only applicable if 'continue-on-failure' is set to true. Default: 2^32-1

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **MaxRecords**
The maximum number of autosupport objects to be operated in this call. Default: 20

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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

#### **Query**
If operating on a specific autosupport, this input element mustspecify all keys. If operating on autosupport objects based on query, this input
element must specify a query.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[AutosupportConfigInfo]`|true    |1       |true (ByValue)|

#### **Template**
Specify to get an empty AutoSupportInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.TableModifyResult

---

### Notes
Category: autosupport
API: autosupport-invoke
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcAutoSupport [[-Node] <String[]>] [-Message <String>] [-Type] <String> [-Uri <String>] [-Force] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-MaxRecords <Int32>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcAutoSupport [-Query] <AutosupportConfigInfo> [-Message <String>] [-Type] <String> [-Uri <String>] [-Force] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-MaxRecords <Int32>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcAutoSupport -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
