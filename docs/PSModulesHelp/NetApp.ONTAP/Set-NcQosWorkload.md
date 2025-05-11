Set-NcQosWorkload
-----------------

### Synopsis
Modify a workload.

---

### Description

Modify a workload.  This may be used to attach/detach policies, rename the workload, or modify the workload's policy-priority.

This cmdlet is not available in ONTAP 8.2 and later.

---

### Related Links
* [Get-NcQosWorkload](Get-NcQosWorkload)

* [New-NcQosWorkload](New-NcQosWorkload)

* [Remove-NcQosWorkload](Remove-NcQosWorkload)

* [Update-NcQosWorkload](Update-NcQosWorkload)

---

### Examples
> Example 1

Set-NcQosWorkload d15633d5-6e11-11e1-a794-123478563412 -PolicyUuid 86efe287-6e0f-11e1-a794-123478563412
Set the given workload to use the given policy.

WorkloadName                   WorkloadClass  PolicyUuid                                      MatchPriority
------------                   -------------  ----------                                      -------------
test-workload                  user_defined   86efe287-6e0f-11e1-a794-123478563412                        1

---

### Parameters
#### **WorkloadUuid**
Universally unique identifier for the QoS workload.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Name**
The user visible name of the QoS workload.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|false   |named   |true (ByPropertyName)|WorkloadName|

#### **PolicyUuid**
Universally unique identifier of the policy that the workload is using.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **MatchPriority**
Priority of workload if a request can be classified into multiple workloads.  The request will be classified to the workload with the highest match-priority.  If the workloads have the same match priority then default matching rules are used.  Modifying this field is not recommended.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

#### **ReadAhead**
Name for a read-ahead tunable policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.QosWorkloadInfo

---

### Notes
Category: qos
API: qos-workload-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcQosWorkload [-WorkloadUuid] <String> [-Name <String>] [-PolicyUuid <String>] [-MatchPriority <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcQosWorkload [-Name <String>] [[-ReadAhead] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
