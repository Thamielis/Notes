Rename-NcQosAdaptivePolicyGroup
-------------------------------

### Synopsis
Rename a QoS adaptive policy group

---

### Description

Rename a QoS adaptive policy group

---

### Examples
> Example 1

```PowerShell
PS E:\Debug> Rename-NcQosAdaptivePolicyGroup -NewName adaptivepolicygroup2 -PolicyGroupName adaptivepolicygroup1
Rename a QoS adaptive policy group adaptivepolicygroup1 to adaptivepolicygroup2

AbsoluteMinIops       : 75IOPS
ExpectedIops          : 6IOPS/TB
NcController          : 10.140.112.122
NumWorkloads          : 0
PeakIops              : 6IOPS/TB
PeakIopsAllocation    : used_space
Pgid                  : 5909
PolicyGroup           : adaptivepolicygroup2
Uuid                  : a38381c9-704c-11e7-ad9d-0050568a260b
Vserver               : vs1
NumWorkloadsSpecified : True
PgidSpecified         : True

```

---

### Parameters
#### **NewName**
New adaptive policy group name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **PolicyGroupName**
Name of the adaptive policy group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Qos.QosAdapterPolicyGroupInfo

---

### Notes
Category: qos
API: qos-adaptive-policy-group-rename
Family: cluster

---

### Syntax
```PowerShell
Rename-NcQosAdaptivePolicyGroup [-NewName] <String> [-PolicyGroupName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
