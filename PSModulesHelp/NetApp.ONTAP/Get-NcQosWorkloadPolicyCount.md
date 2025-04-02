Get-NcQosWorkloadPolicyCount
----------------------------

### Synopsis
Get the cluster-wide QoS policy-group and workload count.

---

### Description

Get the cluster-wide QoS policy-group and workload count.

---

### Examples
> Example 1

```PowerShell
PS E:\Debug> Get-NcQosWorkloadPolicyCount
Get the cluster-wide QoS policy-group and workload count.

MaxUserPolicies             : 12000
MaxUserWorkloads            : 12000
NcController                : 10.140.112.122
TotalUserPolicies           : 3
TotalUserWorkloads          : 0
MaxUserPoliciesSpecified    : True
MaxUserWorkloadsSpecified   : True
TotalUserPoliciesSpecified  : True
TotalUserWorkloadsSpecified : True

```

---

### Parameters
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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.QosWorkloadPolicyCountInfo

---

### Notes
Category: qos
API: qos-workload-policy-count-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcQosWorkloadPolicyCount [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
