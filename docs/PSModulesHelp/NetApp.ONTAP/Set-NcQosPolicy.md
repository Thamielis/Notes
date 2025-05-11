Set-NcQosPolicy
---------------

### Synopsis
Modify a policy.

---

### Description

Modify a policy.

---

### Related Links
* [Get-NcQosPolicy](Get-NcQosPolicy)

* [New-NcQosPolicy](New-NcQosPolicy)

* [Remove-NcQosPolicy](Remove-NcQosPolicy)

* [Update-NcQosPolicy](Update-NcQosPolicy)

---

### Examples
> Example 1

Set-NcQosPolicy 86efe287-6e0f-11e1-a794-123478563412 -ReadAheadPolicyName test
Modify the given quality of service policy.

PolicyName                     PolicyClass    CachePolicyName      ReadAheadPolicyName
----------                     -----------    ---------------      -------------------
test-policy                    user_defined   Default              test

---

### Parameters
#### **PolicyUuid**
Universally unique identifier for the QoS policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **PolicyName**
User visible name of QoS policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CachePolicyName**
Name of an entry in the cache policy table.  Identifies cache settings that will be used by workloads using this policy.  If this field contains the special value 'default' then the default cache policies will be used.  Modifying this field is not recommended.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ReadAheadPolicyName**
Name of an entry in the read-ahead policy table.  Identifies read-ahead settings that will be used by workloads using this policy.  If this field contains the special value 'default' then the default read-ahead policies will be used.  Modifying this field is not recommended.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Qos.QosPolicyInfo

---

### Notes
Category: qos
API: qos-policy-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcQosPolicy [-PolicyUuid] <String> [-PolicyName <String>] [-CachePolicyName <String>] [-ReadAheadPolicyName <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
