Get-NcDiagnosisAlertDefinition
------------------------------

### Synopsis
Get a list of Alert Definition objects.

---

### Description

Get a list of Alert Definition objects.

---

### Examples
> Example 1

Get-NcDiagnosisAlertDefinition  -AlertId DualControllerHa_Alert
Get the diagnosis alert definition for the alert id "DualControllerHa_Alert".

AdditionalInformation    :
AlertId                  : DualControllerHa_Alert
AlertType                : quality_of_service
CorrectiveActions        : 1. Halt all controllers that are connected to disk shelf $(sschm_shelf_info.id).
                           2. Connect disk shelf $(sschm_shelf_info.id) to both HA controllers following the rules in t
                           he Universal SAS and ACP Cabling Guide.
                           3. Reboot the halted controllers.
                           4. Contact support personnel if the alert persists.
Monitor                  : system_connect
NcController             : 192.168.182.144
Node                     : vsim_cluster-01
PerceivedSeverity        : major
PossibleEffect           : Access to disk shelf $(sschm_shelf_info.id) will be lost with a single controller failure.
ProbableCause            : configuration_error
ProbableCauseDescription : Disk shelf $(sschm_shelf_info.id) is not connected to both controllers of the HA pair ($(ssc
                           hm_node_info.owner-node), $(sschm_node_info.ha-node)).
Subsystem                : sas_connect

> Example 2

$q = Get-NcDiagnosisAlertDefinition -Template
$q.PerceivedSeverity = "major"
Get-NcDiagnosisAlertDefinition -Query $q
Get diagnosis alert definitions for alerts that have a perceived severity of "major".

Monitor          AlertId                          Subsystem          PerceivedSeverity  Node
-------          -------                          ---------          -----------------  ----
system_connect   DualControllerHa_Alert           sas_connect        major              vsim_cluster-01
system_connect   DualControllerNonHa_Alert        sas_connect        major              vsim_cluster-01

---

### Parameters
#### **Node**
One or more nodes hosting the health monitor.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Monitor**
One or more health monitors.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **AlertId**
One or more alert ids.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a DiagnosisAlertInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcDiagnosisAlert -Template" to get the initially empty DiagnosisAlertInfo object.  If not specified, all data is returned for each object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[DiagnosisAlertDefinitionInfo]`|false   |named   |false        |

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
Specify to get an empty DiagnosisAlertInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a DiagnosisAlertInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcDiagnosisAlert -Template" to get the initially empty DiagnosisAlertInfo object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[DiagnosisAlertDefinitionInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Diagnosis.DiagnosisAlertDefinitionInfo

---

### Notes
Category: diagnosis
API: diagnosis-alert-definition-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcDiagnosisAlertDefinition [[-Node] <String[]>] [[-Monitor] <String[]>] [[-AlertId] <String[]>] [-Attributes <DiagnosisAlertDefinitionInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisAlertDefinition -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisAlertDefinition -Query <DiagnosisAlertDefinitionInfo> [-Attributes <DiagnosisAlertDefinitionInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
