Set-NcQosAdaptivePolicyGroup
----------------------------

### Synopsis
Modify an adaptive policy group.

---

### Description

Modify an adaptive policy group.

---

### Examples
> Example 1

```PowerShell
PS E:\Debug> Set-NcQosAdaptivePolicyGroup -PolicyGroup adaptivepolicygroup1 -ExpectedIops 6 -PeakIops 6
Modify an adaptive policy group adaptivepolicygroup1

AbsoluteMinIops       : 75IOPS
ExpectedIops          : 6IOPS/TB
NcController          : 10.140.112.122
NumWorkloads          : 0
PeakIops              : 6IOPS/TB
PeakIopsAllocation    : used_space
Pgid                  : 5909
PolicyGroup           : adaptivepolicygroup1
Uuid                  : a38381c9-704c-11e7-ad9d-0050568a260b
Vserver               : vs1
NumWorkloadsSpecified : True
PgidSpecified         : True

```

---

### Parameters
#### **PolicyGroup**
Name of the adaptive policy group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **AbsoluteMinIops**
Absolute Minimum IOPS. Specifies the absolute minimum IOPS which is used as an override when the expected_iops is less than this value. The default value is computed as follows: if expected-iops >= 6144/TB, then absolute-min-iops = 1000; if expected-iops >= 2048/TB and expected-iops < 6144/TB, then absolute-min-iops = 500; if expected-iops >= 1/MB and  expected-iops < 2048/TB, then absolute-min-iops = 75.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ExpectedIops**
Expected IOPS. Specifies the minimum expected IOPS per TB|GB allocated based on volume allocated size.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PeakIops**
Peak IOPS. Specifies the maximum possible IOPS per TB|GB allocated based on volume allocated size or volume used size.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PeakIopsAllocation**
Peak IOPS Allocation. Specifies the peak-iops allocation policy. The allocation policy is either allocated-space or used-space.When the peak-iops-allocation policy is set to allocated-space the peak-iops is calculated based on the size of the storage object

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ExpectedIopsAllocation**
Expected IOPS Allocation. Specifies the expected-iops allocation policy.
This parameter is available in ONTAP 9.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **BlockSize**
Specifies the block size for the IOPS provisioned
Possible values: 
<ul>
  <li> "any"  ,
  <li> "4k"   ,
  <li> "8k"   ,
  <li> "16k"  ,
  <li> "32k"  ,
  <li> "64k"  ,
  <li> "128k" 
</ul>

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Qos.QosAdaptivePolicyGroupInfo

---

### Notes
Category: qos
API: qos-adaptive-policy-group-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcQosAdaptivePolicyGroup [-PolicyGroup] <String> [-AbsoluteMinIops <String>] [-ExpectedIops <String>] [-PeakIops <String>] [-PeakIopsAllocation <String>] [-ExpectedIopsAllocation 
```
```PowerShell
<String>] [-BlockSize <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
