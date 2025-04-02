Get-NcDiagnosisSubsystemConfig
------------------------------

### Synopsis
Iterate over a list of Health Monitor Subsystem Status objects.

---

### Description

Iterate over a list of Health Monitor Subsystem Status objects.

---

### Related Links
* [Set-NcDiagnosisSubsystemConfig](Set-NcDiagnosisSubsystemConfig)

---

### Examples
> Example 1

Get-NcDiagnosisSubsystemConfig
Get all diagnostics configuration information

Subsystem                 Health               InitState                 OutstandingAlertCount     SuppressedAlertCount
---------                 ------               ---------                 ---------------------     --------------------
metrocluster_node         ok                   initialized                                   0                        0
fhm_switch                ok                   initialized                                   0                        0
fhm_bridge                ok                   initialized                                   0                        0
metrocluster              ok                   initialized                                   0                        0
sas_connect               ok                   initialized                                   0                        0
switch_health             ok                   initialized                                   0                        0
cifs_ndo                  ok                   initialized                                   0                        0

---

### Parameters
#### **Subsystem**
One or more subsystems

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Node**
One or more nodes hosting the system.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[DiagnosisSubsystemConfigInfo]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[DiagnosisSubsystemConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Diagnosis.DiagnosisSubsystemConfigInfo

---

### Notes
Category: diagnosis
API: diagnosis-subsystem-config-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcDiagnosisSubsystemConfig [[-Subsystem] <String[]>] [[-Node] <String[]>] [-Attributes <DiagnosisSubsystemConfigInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisSubsystemConfig -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisSubsystemConfig -Query <DiagnosisSubsystemConfigInfo> [-Attributes <DiagnosisSubsystemConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
