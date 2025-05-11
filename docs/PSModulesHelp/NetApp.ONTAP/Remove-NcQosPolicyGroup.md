Remove-NcQosPolicyGroup
-----------------------

### Synopsis
Delete a QoS policy group.

---

### Description

Delete a QoS policy group.  The default policy group may not be deleted. The policy group may not be attached to any workloads.  Only user defined policy groups may be deleted.

---

### Related Links
* [Get-NcQosPolicyGroup](Get-NcQosPolicyGroup)

* [Set-NcQosPolicyGroup](Set-NcQosPolicyGroup)

* [New-NcQosPolicyGroup](New-NcQosPolicyGroup)

* [Update-NcQosPolicyGroup](Update-NcQosPolicyGroup)

---

### Examples
> Example 1

```PowerShell
Remove-NcQosPolicyGroup -Name dummy_policy
Remove the given QoS policy group.
```
> Example 2

$q = Get-NcQosPolicyGroup -Template
$q.Vserver = 'dummy'
Remove-NcQosPolicyGroup -Query $q
Remove all of the QoS policy groups for vserver 'dummy'.

NcController : 10.63.165.62
SuccessCount : 2
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Qos.QosPolicyGroupInfo, DataONTAP.C.Types.Qos.QosPolicyGroupInfo}
FailureList  : {}

---

### Parameters
#### **Name**
Name of the policy group. Policy group names must be unique and are restricted to 128 alphanumeric characters, '-', and '_', and must start with an alphanumeric character (a-z, A-Z, or 0-9).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Force**
Setting to 'true' forces the deletion of the workloads associated with the policy group along with the policy group. The default is 'false'. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
A QosPolicyGroupInfo object with various fields set to indicate which QoS policies to delete.  Other fields should remain set to null.  Use "Get-NcQosPolicyGroup -Template" to get the initially empty QosPolicyGroupInfo object. This parameter is supported with Ontapi only.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[QosPolicyGroupInfo]`|true    |named   |false        |

#### **ContinueOnFailure**
This input element is useful when multiple objects match a given query.  If set to true, the API will continue removing the next matching object even when removal of a previous object fails.  If set to false, the API will return on the first failure.  Default: false. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFailureCount**
When allowing failures, then this input element may be provided to limit the number of failed remove operations before the server gives up and returns.  If set, the cmdlet will continue removing the next matching object even when the removal of a previous matching object fails, and do so until the total number of objects failed to be removed reaches the maximum specified.  If set to the maximum or not provided, then there will be no limit on the number of failed remove operations.  Only applicable if ContinueOnFailure is specified.  Default: 2^32-1. This parameter is supported with Ontapi only.

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
API: qos-policy-group-delete
Family: cluster

---

### Syntax
```PowerShell
Remove-NcQosPolicyGroup [-Name] <String> [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcQosPolicyGroup -Query <QosPolicyGroupInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
