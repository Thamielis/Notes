Update-NcNetPort
----------------

### Synopsis
Modify the attributes of network port or a group of network port objects.

---

### Description

Modify the attributes of network port or a group of network port objects.

---

### Related Links
* [Get-NcNetPort](Get-NcNetPort)

* [Set-NcNetPort](Set-NcNetPort)

---

### Examples
> Example 1

$q = Get-NcNetPort -Template
$q.Port = "e2c"
$a = Get-NcNetPort -Template
$a.IsAdministrativeUp = $true
Update-NcNetPort -Query $q -Attributes $a
Set the administrative status of all 'e2c' ports to 'up'.

NcController : vxeRubble
SuccessCount : 2
FailureCount : 0
SuccessList  : {e2c, e2c}
FailureList  : {}

---

### Parameters
#### **Query**
A NetPortInfo object with various fields set to indicate which network ports to modify.  Other fields should remain set to null.  Use "Get-NcNetPort -Template" to get the initially empty NetPortInfo object.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[NetPortInfo]`|true    |named   |true (ByValue)|

#### **Attributes**
A NetPortInfo object with various fields set to the values that will be set on all objects that are identified by the Query parameter.  Other fields should remain set to null.  Use "Get-NcNetPort -Template" to get the initially empty NetPortInfo object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[NetPortInfo]`|true    |named   |false        |

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
Category: net
API: net-port-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcNetPort -Query <NetPortInfo> -Attributes <NetPortInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
