Get-NcDiagnosisAlert
--------------------

### Synopsis
Get a list of Alert Information objects.

---

### Description

Get a list of Alert Information objects.

---

### Related Links
* [Set-NcDiagnosisAlert](Set-NcDiagnosisAlert)

---

### Examples
> Example 1

Get-NcDiagnosisAlert -Node VxeRubble-01
Get all of the diagnosis alerts for node VxeRubble-01.

Monitor          AlertId                        AlertingResource         Subsystem    PerceivedSeverity  Node
-------          -------                        ----------------         ---------    -----------------  ----
node_connect     DualPathToDiskShelf_Alert      50:05:0c:c1:02:01:6e:43  sas_connect  major              VxeRubble-01
node_connect     DualPathToDiskShelf_Alert      50:05:0c:c1:02:01:63:d2  sas_connect  major              VxeRubble-01

> Example 2

$q = Get-NcDiagnosisAlert -Template
$q.PerceivedSeverity = "major"
Get-NcDiagnosisAlert -Query $q
Get all of the diagnosis alerts with a perceived severity of "major".

Monitor          AlertId                        AlertingResource         Subsystem    PerceivedSeverity  Node
-------          -------                        ----------------         ---------    -----------------  ----
node_connect     DualPathToDiskShelf_Alert      50:05:0c:c1:02:01:6e:43  sas_connect  major              VxeRubble-01
node_connect     DualPathToDiskShelf_Alert      50:05:0c:c1:02:01:63:d2  sas_connect  major              VxeRubble-01
node_connect     DualPathToDiskShelf_Alert      50:05:0c:c1:02:01:6e:43  sas_connect  major              VxeRubble-02
node_connect     DualPathToDiskShelf_Alert      50:05:0c:c1:02:01:63:d2  sas_connect  major              VxeRubble-02

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

#### **AlertingResource**
One or more unique names of the resource that generated the alert.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a DiagnosisAlertInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcDiagnosisAlert -Template" to get the initially empty DiagnosisAlertInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[DiagnosisAlertInfo]`|false   |named   |false        |

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

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[DiagnosisAlertInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Diagnosis.DiagnosisAlertInfo

---

### Notes
Category: diagnosis
API: diagnosis-alert-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcDiagnosisAlert [[-Node] <String[]>] [[-Monitor] <String[]>] [[-AlertId] <String[]>] [[-AlertingResource] <String[]>] [-Attributes <DiagnosisAlertInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisAlert -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisAlert -Query <DiagnosisAlertInfo> [-Attributes <DiagnosisAlertInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
