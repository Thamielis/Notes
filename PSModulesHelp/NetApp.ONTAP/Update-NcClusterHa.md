Update-NcClusterHa
------------------

### Synopsis
Modify the attributes of cf or a group of cf objects.

---

### Description

Modify the attributes of cf or a group of cf objects.

---

### Related Links
* [Get-NcClusterHa](Get-NcClusterHa)

---

### Examples
> Example 1

```PowerShell
$query = Update-NcClusterHa -Template
$query.Node = "beam-cluster-01"
$attr = Update-NcClusterHa -Template
$attr.AutoGivebackEnabled = $true
Update-NcClusterHa -Query $query -Attributes $attr
Enable auto giveback on node 'beam-cluster-01'.

NcController : 10.63.10.33
SuccessCount : 1
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Cf.OptionsRelatedInfoModify}
FailureList  : {}

```

---

### Parameters
#### **Query**
A OptionsRelatedInfoModify object with various fields set to indicate which cf objects to modify.  Other fields should remain set to null.  Use "Update-NcClusterHa -Template" to get the initially empty OptionsRelatedInfoModify object.

|Type                        |Required|Position|PipelineInput |
|----------------------------|--------|--------|--------------|
|`[OptionsRelatedInfoModify]`|true    |named   |true (ByValue)|

#### **Attributes**
A OptionsRelatedInfoModify object with various fields set to the values that will be set on all objects that are identified by the Query parameter.  Other fields should remain set to null.  Use "Update-NcClusterHa -Template" to get the initially empty OptionsRelatedInfoModify object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[OptionsRelatedInfoModify]`|true    |named   |false        |

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

#### **Template**
Specify to get an empty TableModifyResult object for use with advanced queries involving the Query attribute.

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
Category: cf
API: cf-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcClusterHa -Query <OptionsRelatedInfoModify> -Attributes <OptionsRelatedInfoModify> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcClusterHa -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
