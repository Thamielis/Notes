Remove-NcQosPolicyReadAhead
---------------------------

### Synopsis
Remove a read-ahead policy.

---

### Description

Remove a read-ahead policy.  The default policy may not be deleted. The policy may not be attached to any workloads.  Only user defined policies may be deleted.

---

### Related Links
* [Get-NcQosPolicyReadAhead](Get-NcQosPolicyReadAhead)

* [New-NcQosPolicyReadAhead](New-NcQosPolicyReadAhead)

* [Set-NcQosPolicyReadAhead](Set-NcQosPolicyReadAhead)

* [Update-NcQosPolicyReadAhead](Update-NcQosPolicyReadAhead)

---

### Examples
> Example 1

```PowerShell
Remove-NcQosPolicyReadAhead test-policy
Remove the read ahead policy named "test-policy"
```
> Example 2

```PowerShell
$q = Get-NcQosPolicyReadAhead -Template
$q.ReadAheadClass = "user_defined"
Remove-NcQosPolicyReadAhead -Query $q
Remove all user defined read ahead policies.

SuccessCount : 1
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Qos.QosPolicyReadAheadInfo}
FailureList  : {}

```

---

### Parameters
#### **Name**
Name of QoS read ahead policy.

|Type      |Required|Position|PipelineInput        |Aliases                                     |
|----------|--------|--------|---------------------|--------------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|ReadAheadPolicyName<br/>ReadAheadSettingName|

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
A QosPolicyReadAheadInfo object with various fields set to indicate which QoS read ahead policies to delete.  Other fields should remain set to null.  Use "Get-NcQosPolicyReadAhead -Template" to get the initially empty QosPolicyReadAheadInfo object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[QosSettingsReadAheadInfo]`|true    |named   |false        |

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
API: qos-policy-read-ahead-destroy, qos-policy-read-ahead-destroy-iter,qos-settings-read-ahead-destroy, qos-settings-read-ahead-destroy-iter
Family: cluster

---

### Syntax
```PowerShell
Remove-NcQosPolicyReadAhead [-Name] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcQosPolicyReadAhead -Query <QosSettingsReadAheadInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
