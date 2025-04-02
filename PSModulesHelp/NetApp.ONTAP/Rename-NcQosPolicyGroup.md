Rename-NcQosPolicyGroup
-----------------------

### Synopsis
Rename a QoS Policy Group.

---

### Description

Rename a QoS Policy Group.

---

### Related Links
* [Get-NcQosPolicyGroup](Get-NcQosPolicyGroup)

* [Set-NcQosPolicyGroup](Set-NcQosPolicyGroup)

* [Remove-NcQosPolicyGroup](Remove-NcQosPolicyGroup)

---

### Examples
> Example 1

Rename-NcQosPolicyGroup -Name test-group -NewName beam01-qos-group
Rename the given QoS policy group.

PolicyGroup                                          MaxThroughput PolicyGroupClass     Vserver
-----------                                          ------------- ----------------     -------
beam01-qos-group                                               INF user_defined         beam01

---

### Parameters
#### **Name**
Name of the policy group. Policy group names must be unique and are restricted to 128 alphanumeric characters, '-', and '_', and must start with an alphanumeric character (a-z, A-Z, or 0-9).

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyGroup|

#### **NewName**
New policy group name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Qos.QosPolicyGroupInfo

---

### Notes
Category: qos
API: qos-policy-group-rename
Family: cluster

---

### Syntax
```PowerShell
Rename-NcQosPolicyGroup [-Name] <String> [-NewName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
