Update-NcVserver
----------------

### Synopsis
Modify the attributes of vserver or a group of vserver objects.

---

### Description

Modify the attributes of vserver or a group of vserver objects.

---

### Related Links
* [Get-NcVserver](Get-NcVserver)

---

### Examples
> Example 1

$q = Get-NcVserver -Template
$q.Vserver = "vserver*"
$a = Get-NcVserver -Template
$a.Comment = "SQL Server LUNs"
Update-NcVserver -Query $q -Attributes $a
Update the comment field on all vservers whose name matches the specified pattern.

NcController : 10.61.172.155
SuccessCount : 3
FailureCount : 0
SuccessList  : {vserver1, vserver2, vserver3}
FailureList  : {}

---

### Parameters
#### **Query**
A VserverInfo object with various fields set to indicate which vservers to modify.  Other fields should remain set to null.  Use "Get-NcVserver -Template" to get the initially empty VserverInfo object.

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[VserverInfo]`|true    |named   |true (ByValue)|

#### **Attributes**
A VserverInfo object with various fields set to the values that will be set on all objects that are identified by the Query parameter.  Other fields should remain set to null.  Use "Get-NcVserver -Template" to get the initially empty VserverInfo object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[VserverInfo]`|true    |named   |false        |

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
Category: vserver
API: vserver-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcVserver -Query <VserverInfo> -Attributes <VserverInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
