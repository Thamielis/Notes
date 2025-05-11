Disable-NcDiagnosisPolicy
-------------------------

### Synopsis
Disable a diagnosis policy.

---

### Description

Disable a diagnosis policy.

---

### Related Links
* [Enable-NcDiagnosisPolicy](Enable-NcDiagnosisPolicy)

* [Get-NcDiagnosisPolicyDefinition](Get-NcDiagnosisPolicyDefinition)

---

### Examples
> Example 1

Disable-NcDiagnosisPolicy -Node vsim_cluster-01 -Monitor system_connect -PolicyId DualControllerHa_Policy
Disable the diagnosis policy.

Monitor          PolicyId                         AlertId                            Enable   Node
-------          --------                         -------                            ------   ----
system_connect   DualControllerHa_Policy          DualControllerHa_Alert             False    vsim_cluster-01

---

### Parameters
#### **Node**
Node hosting this health monitor.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Monitor**
Type of health monitor (e.g. node_connect, system_connect, system).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **PolicyId**
Policy identifier.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Diagnosis.DiagnosisPolicyDefinitionInfo

---

### Notes
Category: diagnosis
API: diagnosis-policy-modify
Family: cluster

---

### Syntax
```PowerShell
Disable-NcDiagnosisPolicy [-Node] <String> [-Monitor] <String> [-PolicyId] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
