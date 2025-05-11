New-NcQosPolicy
---------------

### Synopsis
Create a new policy.

---

### Description

Create a new policy.  A unique name must be provided for the new policy.  The policy will not affect any work until it is assigned to a workload.  Therefore a workload referencing the policy should usually be created along with the policy.

This cmdlet is not available in ONTAP 8.2 and later.

---

### Related Links
* [Get-NcQosPolicy](Get-NcQosPolicy)

* [Remove-NcQosPolicy](Remove-NcQosPolicy)

* [Set-NcQosPolicy](Set-NcQosPolicy)

* [Update-NcQosPolicy](Update-NcQosPolicy)

---

### Examples
> Example 1

```PowerShell
New-NcQosPolicy new-policy
Create a new quality of service policy name new-policy.

PolicyName          : new-policy
NcController        : 10.60.189.172
CachePolicyName     : Default
PolicyClass         : user_defined
PolicyUuid          : c466bfd3-6df8-11e1-a794-123478563412
ReadAheadPolicyName : Default

```

---

### Parameters
#### **Name**
User visible name of QoS policy.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

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
API: qos-policy-create
Family: cluster

---

### Syntax
```PowerShell
New-NcQosPolicy [-Name] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
