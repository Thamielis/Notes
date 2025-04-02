Remove-NcQosAdaptivePolicyGroup
-------------------------------

### Synopsis
Delete single adaptive policy group. The default adaptive policy group may not be deleted. An error will be returned if the policy group is attached to any workloads unless 'force' is set to true.

---

### Description

Delete single adaptive policy group. The default adaptive policy group may not be deleted. An error will be returned if the policy group is attached to any workloads unless 'force' is set to true.

---

### Examples
> Example 1

PS E:\Debug> Remove-NcQosAdaptivePolicyGroup -PolicyGroup adaptivepolicygroup2
Delete single adaptive policy group.

Removing QoS adaptive policy group.
Are you sure you want to remove QoS adaptive policy group 'adaptivepolicygroup2'?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

---

### Parameters
#### **PolicyGroup**
Name of the adaptive policy group

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Force**
Setting to 'true' forces the deletion of the workloads associated with the adaptive policy group along with the adaptive policy group. The default is 'false'. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
For advanced queries, provide a QosAdaptivePolicyGroup object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQosAdaptivePolicyGroup -Template" to get the initially empty QosAdaptivePolicyGroup object. This parameter is supported with Ontapi only.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[QosAdaptivePolicyGroupInfo]`|true    |named   |false        |

#### **ContinueOnFailure**
This input element is useful when multiple qos-adaptive-policy-group objects match a given query. If set to true, the API will continue with the next matching qos-adaptive-policy-group even when the operation fails for the qos-adaptive-policy-group. If set to false, the API will return on the first failure. Default: false. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
When allowing failures ('continue-on-failure' is set to true), then this input element may be provided to limit the number of failed operations before the server gives up and returns. If set, the API will continue with the next matching qos-adaptive-policy-group even when the operation on a previous matching qos-adaptive-policy-group fails, and do so until the total number of objects failed to be operated on reaches the maximum specified.If set to the maximum or not provided, then there will be no limit on the number of failed operations. Only applicable if 'continue-on-failure' is set to true. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: qos
API: qos-adaptive-policy-group-delete
Family: cluster

---

### Syntax
```PowerShell
Remove-NcQosAdaptivePolicyGroup [-PolicyGroup] <String> [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcQosAdaptivePolicyGroup -Query <QosAdaptivePolicyGroupInfo> [-Force] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
