Get-NcDiagnosisConfig
---------------------

### Synopsis
Get a list of Health Monitor Configuration objects.

---

### Description

Get a list of Health Monitor Configuration objects.

---

### Examples
> Example 1

Get-NcDiagnosisConfig -Monitor node_connect
Get the diagnosis configuration for the monitor "node_connect".

Node           : vsim_cluster-01
Monitor        : node_connect
NcController   : 192.168.182.144
Aggregator     : system_connect
Context        : node_context
Health         : ok
MonVersion     : 1.0
PolVersion     : 1.0
Resources      : {SasAdapter, SasDisk, SasShelf}
SubPolVersions :
Subsystem      : {sas_connect}

> Example 2

$q = Get-NcDiagnosisConfig -Template
$q.Health = "degraded"
Get-NcDiagnosisConfig -Query $q
Get all of the diagnosis configurations with a health value of "degraded".

Monitor                      MonVersion        Health        Context            Node
-------                      ----------        ------        -------            ----
node_connect                        1.0       degraded       node_context       VxeRubble-01
system                              1.0       degraded       cluster_context    VxeRubble-01
system_connect                      1.0       degraded       cluster_context    VxeRubble-01
node_connect                        1.0       degraded       node_context       VxeRubble-02

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

#### **Attributes**
For improved scalability in large clusters, provide a DiagnosisConfigInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcDiagnosisConfig -Template" to get the initially empty DiagnosisConfigInfo object.  If not specified, all data is returned for each object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[DiagnosisConfigInfo]`|false   |named   |false        |

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
Specify to get an empty DiagnosisConfigInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a DiagnosisConfigInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcDiagnosisConfig -Template" to get the initially empty DiagnosisConfigInfo object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[DiagnosisConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Diagnosis.DiagnosisConfigInfo

---

### Notes
Category: diagnosis
API: diagnosis-config-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcDiagnosisConfig [[-Node] <String[]>] [[-Monitor] <String[]>] [-Attributes <DiagnosisConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisConfig -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisConfig -Query <DiagnosisConfigInfo> [-Attributes <DiagnosisConfigInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
