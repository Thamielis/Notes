Update-NcEmsRoute
-----------------

### Synopsis
Modify several EMS routes.

---

### Description

Modify several EMS routes.  This cmdlet uses the query mechanism to update multiple records at once.

---

### Related Links
* [Get-NcEmsRoute](Get-NcEmsRoute)

* [Set-NcEmsRoute](Set-NcEmsRoute)

---

### Examples
> Example 1

$q = Get-NcEmsRoute -Template
$q.MessageName = "app.log.*"
$a = Get-NcEmsRoute -Template
$a.Destinations = @("asup")
Update-NcEmsRoute -Query $q -Attributes $a
Set the destination to "asup" for all of the app.log.* EMS messages.

SuccessCount : 8
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Ems.EmsRoutingInfo, DataONTAP.C.Types.Ems.EmsRoutingInfo, NetApp.Ontapi
               .Filer.C.Ems810.EmsRoutingInfo, DataONTAP.C.Types.Ems.EmsRoutingInfo...}
FailureList  : {}

---

### Parameters
#### **Query**
A EmsRoutingInfo object with various fields set to indicate which policies to modify.  Other fields should remain set to null.  Use "Get-NcEmsRoute -Template" to get the initially empty EmsRoutingInfo object.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[EmsRoutingInfo]`|true    |named   |true (ByValue)|

#### **Attributes**
A EmsRoutingInfo object with various fields set to the values that will be set on all objects that are identified by the Query parameter.  Other fields should remain set to null.  Use "Get-NcEmsRoute -Template" to get the initially empty EmsRoutingInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[EmsRoutingInfo]`|true    |named   |false        |

#### **ContinueOnFailure**
This input element is useful when multiple objects match a given query.  If set to true, the API will continue modifying the next matching object even when modification of a previous object fails.  If set to false, the API will return on the first failure.  Default: false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFailureCount**
When allowing failures, then this input element may be provided to limit the number of failed modify operations before the server gives up and returns.  If set, the cmdlet will continue modifying the next matching object even when the modification of a previous matching object fails, and do so until the total number of objects failed to be modified reaches the maximum specified.  If set to the maximum or not provided, then there will be no limit on the number of failed modify operations.  Only applicable if ContinueOnFailure is specified.  Default: 2^32-1

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.TableModifyResult

---

### Notes
Category: ems
API: ems-routing-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcEmsRoute -Query <EmsRoutingInfo> -Attributes <EmsRoutingInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
