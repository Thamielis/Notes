Get-NcDiagnosisSubsystem
------------------------

### Synopsis
Get the Health Monitor Subsystem Status.

---

### Description

Get the Health Monitor Subsystem Status.

---

### Examples
> Example 1

Get-NcDiagnosisSubsystem
Get the status of all of the diagnosis subsystems.

Subsystem                 Health               InitState                 OutstandingAlertCount     SuppressedAlertCount
---------                 ------               ---------                 ---------------------     --------------------
cifs_ndo                  ok                   initialized                                   0                        0
sas_connect               ok                   initialized                                   0                        0
switch_health             ok                   initialized                                   0                        0

> Example 2

$q = Get-NcDiagnosisSubsystem -Template
$q.Health = "ok"
Get-NcDiagnosisSubsystem -Query $q
Get all of the healthy diagnosis subsystems.

Subsystem                 Health               InitState                 OutstandingAlertCount     SuppressedAlertCount
---------                 ------               ---------                 ---------------------     --------------------
cifs_ndo                  ok                   initialized                                   0                        0
sas_connect               ok                   initialized                                   0                        0
switch_health             ok                   initialized                                   0                        0

---

### Parameters
#### **Name**
One or more subsystems.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Subsystem|

#### **Attributes**
For improved scalability in large clusters, provide a DiagnosisSubsystemConfigInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcDiagnosisSubsystem -Template" to get the initially empty DiagnosisSubsystemConfigInfo object.  If not specified, all data is returned for each object.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty DiagnosisSubsystemConfigInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a DiagnosisSubsystemConfigInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcDiagnosisSubsystem -Template" to get the initially empty DiagnosisSubsystemConfigInfo object.

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
API: diagnosis-subscriptions-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcDiagnosisSubsystem [[-Name] <String[]>] [-Attributes <DiagnosisSubsystemConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisSubsystem -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisSubsystem -Query <DiagnosisSubsystemConfigInfo> [-Attributes <DiagnosisSubsystemConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
