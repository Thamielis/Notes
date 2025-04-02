Update-NcQosAdaptivePolicyGroup
-------------------------------

### Synopsis
Modify multiple adaptive policy groups

---

### Description

Modify multiple adaptive policy groups

---

### Examples
> Example 1

```PowerShell
PS E:\Debug> $q = Get-NcQosAdaptivePolicyGroup -Template
PS E:\Debug> $q.Vserver = 'vs1'
PS E:\Debug> $a = Get-NcQosAdaptivePolicyGroup -Template
PS E:\Debug> $a.NumWorkloads = 1
PS E:\Debug> Update-NcQosAdaptivePolicyGroup -Query $q -Attributes $a
NcController : 10.140.112.122
SuccessCount : 1
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Qos.QosAdaptivePolicyGroupInfo}
FailureList  : {}

```

---

### Parameters
#### **Query**
For advanced queries, provide a QosAdaptivePolicyGroup object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQosAdaptivePolicyGroup -Template" to get the initially empty QosAdaptivePolicyGroup object.

|Type                          |Required|Position|PipelineInput        |
|------------------------------|--------|--------|---------------------|
|`[QosAdaptivePolicyGroupInfo]`|true    |1       |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **ContinueOnFailure**
This input element is useful when multiple qos-adaptive-policy-group objects match a given query. If set to true, the API will continue with the next matching qos-adaptive-policy-group even when the operation fails for the qos-adaptive-policy-group. If set to false, the API will return on the first failure. Default: false

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
When allowing failures ('continue-on-failure' is set to true), then this input element may be provided to limit the number of failed operations before the server gives up and returns. If set, the API will continue with the next matching qos-adaptive-policy-group even when the operation on a previous matching qos-adaptive-policy-group fails, and do so until the total number of objects failed to be operated on reaches the maximum specified.If set to the maximum or not provided, then there will be no limit on the number of failed operations. Only applicable if 'continue-on-failure' is set to true.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                          |Required|Position|PipelineInput        |Aliases          |
|------------------------------|--------|--------|---------------------|-----------------|
|`[QosAdaptivePolicyGroupInfo]`|false   |named   |true (ByPropertyName)|DesiredAttributes|

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
* DataONTAP.C.PowerShell.SDK.Cmdlets.TableModifyResult

---

### Notes
Category: qos
API: qos-adaptive-policy-group-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcQosAdaptivePolicyGroup [-Query] <QosAdaptivePolicyGroupInfo> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Attributes <QosAdaptivePolicyGroupInfo>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
