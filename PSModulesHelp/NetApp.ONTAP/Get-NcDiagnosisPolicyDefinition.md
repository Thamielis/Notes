Get-NcDiagnosisPolicyDefinition
-------------------------------

### Synopsis
Get a list of Policy Definition objects.

---

### Description

Get a list of Policy Definition objects.

---

### Related Links
* [Enable-NcDiagnosisPolicy](Enable-NcDiagnosisPolicy)

* [Disable-NcDiagnosisPolicy](Disable-NcDiagnosisPolicy)

---

### Examples
> Example 1

Get-NcDiagnosisPolicyDefinition -PolicyId DualControllerHa_Policy
Get the diagnosis policy definition for the policy "DualControllerHa_Policy".

AlertCount              :
AlertId                 : DualControllerHa_Alert
CreationTime            :
Enable                  : True
Monitor                 : system_connect
NcController            : 192.168.182.144
Node                    : vsim_cluster-01
PolicyId                : DualControllerHa_Policy
ResponsibleResourceInfo : sschm_shelf_info.name
RuleExpression          : sschm_shelf_info.num-nodes < 2 && sschm_node_info.nchm-discovery-status == "discovery_done" &
                          & sschm_node_info.ha-pair-status == "true"
Where                   : sschm_node_info.owner-node =~ sschm_shelf_info.connected-nodes[]
AlertCountSpecified     : False
EnableSpecified         : True

> Example 2

$q = Get-NcDiagnosisPolicyDefinition -Template
$q.Enable = "true"
Get-NcDiagnosisPolicyDefinition -Query $q
Get all of the diagnosis policy definitions that are currently enabled.

Monitor          PolicyId                         AlertId                            Enable   Node
-------          --------                         -------                            ------   ----
system_connect   DualControllerNonHa_Policy       DualControllerNonHa_Alert           True    vsim_cluster-01

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

#### **PolicyId**
One or more policy ids.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a DiagnosisConfigInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcDiagnosisConfig -Template" to get the initially empty DiagnosisConfigInfo object.  If not specified, all data is returned for each object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[DiagnosisPolicyDefinitionInfo]`|false   |named   |false        |

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

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[DiagnosisPolicyDefinitionInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Diagnosis.DiagnosisPolicyDefinitionInfo

---

### Notes
Category: diagnosis
API: diagnosis-policy-definition-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcDiagnosisPolicyDefinition [[-Node] <String[]>] [[-Monitor] <String[]>] [[-PolicyId] <String[]>] [-Attributes <DiagnosisPolicyDefinitionInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisPolicyDefinition -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDiagnosisPolicyDefinition -Query <DiagnosisPolicyDefinitionInfo> [-Attributes <DiagnosisPolicyDefinitionInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
