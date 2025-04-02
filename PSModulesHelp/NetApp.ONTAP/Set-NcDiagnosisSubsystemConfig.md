Set-NcDiagnosisSubsystemConfig
------------------------------

### Synopsis
Modify system health subsystem

---

### Description

Modify system health subsystem

---

### Related Links
* [Get-NcDiagnosisSubsystemConfig](Get-NcDiagnosisSubsystemConfig)

---

### Examples
> Example 1

Set-NcDiagnosisSubsystemConfig -Subsystem sas_connect -RefreshInterval 40m | Format-list
Set refresh interval for subsytem sas_connect to 40minutes

Health                         : ok
InitState                      : initialized
NcController                   : 10.238.49.117
Node                           : {aparajir-vsim1, aparajir-vsim1, aparajir-vsim2}
OutstandingAlertCount          : 0
RefreshInterval                : {2400, 2400, 1800}
Subsystem                      : sas_connect
SuppressedAlertCount           : 0
OutstandingAlertCountSpecified : True
RefreshIntervalSpecified       : True
SuppressedAlertCountSpecified  : True

---

### Parameters
#### **Subsystem**
Type of the subsystem whose config is to be changed. Possible values : sas_connect, ha_health

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **RefreshInterval**
The refresh interval (will be rounded down to nearest minute). Possible values : 5m (5 minutes), 1h (1 hour)

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Diagnosis.DiagnosisSubsystemConfigInfo

---

### Notes
Category: diagnosis
API: diagnosis-subsystem-config-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcDiagnosisSubsystemConfig [-Subsystem] <String> [-RefreshInterval] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
