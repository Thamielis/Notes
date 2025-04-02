Remove-NcQosPolicy
------------------

### Synopsis
Remove a policy.

---

### Description

Remove a policy.  The policy may not be attached to any workloads.  Only user defined policies may be deleted.

This cmdlet is not available in ONTAP 8.2 and later.

---

### Related Links
* [Get-NcQosPolicy](Get-NcQosPolicy)

* [New-NcQosPolicy](New-NcQosPolicy)

* [Set-NcQosPolicy](Set-NcQosPolicy)

* [Update-NcQosPolicy](Update-NcQosPolicy)

---

### Examples
> Example 1

```PowerShell
Remove-NcQosPolicy cd1030f0-6e01-11e1-a794-123478563412
Remove the specified Quality of Service policy.
```
> Example 2

$q = Get-NcQosPolicy -Template
$q.PolicyClass = "user_defined"
Remove-NcQosPolicy -Query $q -Verbose
Removes all user defined quality of service policies.

SuccessCount : 2
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Qos.QosPolicyInfo, DataONTAP.C.Types.Qos.QosPolicyInfo}
FailureList  :

---

### Parameters
#### **PolicyUuid**
Universally unique identifier for the QoS policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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

#### **Query**
A QosPolicyInfo object with various fields set to indicate which QoS policies to delete.  Other fields should remain set to null.  Use "Get-NcQosPolicy -Template" to get the initially empty QosPolicyInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[QosPolicyInfo]`|true    |named   |false        |

#### **ContinueOnFailure**
This input element is useful when multiple objects match a given query.  If set to true, the API will continue removing the next matching object even when removal of a previous object fails.  If set to false, the API will return on the first failure.  Default: false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFailureCount**
When allowing failures, then this input element may be provided to limit the number of failed remove operations before the server gives up and returns.  If set, the cmdlet will continue removing the next matching object even when the removal of a previous matching object fails, and do so until the total number of objects failed to be removed reaches the maximum specified.  If set to the maximum or not provided, then there will be no limit on the number of failed remove operations.  Only applicable if ContinueOnFailure is specified.  Default: 2^32-1

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: qos
API: qos-policy-destroy, qos-policy-destroy-iter
Family: cluster

---

### Syntax
```PowerShell
Remove-NcQosPolicy [-PolicyUuid] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcQosPolicy -Query <QosPolicyInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
