Update-NcQosWorkload
--------------------

### Synopsis
Modify a workload or a group of workloads.

---

### Description

Modify a workload or a group of workloads.

---

### Related Links
* [Get-NcQosWorkload](Get-NcQosWorkload)

* [New-NcQosWorkload](New-NcQosWorkload)

* [Set-NcQosWorkload](Set-NcQosWorkload)

* [Remove-NcQosWorkload](Remove-NcQosWorkload)

---

### Examples
> Example 1

$q = Get-NcQosWorkload -Template
$q.WorkloadClass = "user_defined"
$a = Get-NcQosWorkload -Template
$a.PolicyUuid = "86efe287-6e0f-11e1-a794-123478563412"
Update-NcQosWorkload -Query $q -Attributes $a
Update all the user defined workloads to use the given policy.

SuccessCount : 2
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Qos.QosWorkloadInfo, DataONTAP.C.Types.Qos.QosWorkloadInfo}
FailureList  : {}

---

### Parameters
#### **Query**
A QosWorkloadInfo object with various fields set to indicate which policies to modify.  Other fields should remain set to null.  Use "Get-NcQosWorkload -Template" to get the initially empty QosWorkloadInfo object.

|Type               |Required|Position|PipelineInput |
|-------------------|--------|--------|--------------|
|`[QosWorkloadInfo]`|true    |named   |true (ByValue)|

#### **Attributes**
A QosWorkloadInfo object with various fields set to the values that will be set on all objects that are identified by the Query parameter.  Other fields should remain set to null.  Use "Get-NcQosWorkload -Template" to get the initially empty QosWorkloadInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[QosWorkloadInfo]`|true    |named   |false        |

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
Category: qos
API: qos-workload-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcQosWorkload -Query <QosWorkloadInfo> -Attributes <QosWorkloadInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
