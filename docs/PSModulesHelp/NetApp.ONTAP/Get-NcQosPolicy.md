Get-NcQosPolicy
---------------

### Synopsis
Get a list of policies.

---

### Description

Get a list of policies.

This cmdlet is not available in ONTAP 8.2 and later.

---

### Related Links
* [Set-NcQosPolicy](Set-NcQosPolicy)

* [Remove-NcQosPolicy](Remove-NcQosPolicy)

* [Update-NcQosPolicy](Update-NcQosPolicy)

* [New-NcQosPolicy](New-NcQosPolicy)

---

### Examples
> Example 1

```PowerShell
Get-NcQosPolicy
Get all quality of service policies on the current cluster.

CachePolicyName     : Default
PolicyClass         : preset
PolicyName          : Default
PolicyUuid          : 700169c0-eae7-11e0-8b1e-123478563412
ReadAheadPolicyName : Default

CachePolicyName     : Default
PolicyClass         : user_defined
PolicyName          : test-policy
PolicyUuid          : e052c86e-6de3-11e1-a794-123478563412
ReadAheadPolicyName : Default

```
> Example 2

```PowerShell
$q = Get-NcQosPolicy -Template
$q.PolicyClass = "preset"
Get-NcQosPolicy -Query $q
Get all of the preset quality of service policy objects.

CachePolicyName     : Default
PolicyClass         : preset
PolicyName          : Default
PolicyUuid          : 700169c0-eae7-11e0-8b1e-123478563412
ReadAheadPolicyName : Default

```

---

### Parameters
#### **Name**
The QoS policy name(s) to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|PolicyName|

#### **PolicyUuid**
Unique identifier(s) of the policy.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a QosPolicyInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcQosPolicy -Template" to get the initially empty QosPolicyInfo object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[QosPolicyInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty QosPolicyInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a QosPolicyInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQosPolicy -Template" to get the initially empty QosPolicyInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[QosPolicyInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.QosPolicyInfo

---

### Notes
Category: qos
API: qos-policy-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcQosPolicy [[-Name] <String[]>] [[-PolicyUuid] <String[]>] [-Attributes <QosPolicyInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQosPolicy -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcQosPolicy -Query <QosPolicyInfo> [-Attributes <QosPolicyInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
