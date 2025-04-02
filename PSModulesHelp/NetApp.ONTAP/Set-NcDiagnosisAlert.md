Set-NcDiagnosisAlert
--------------------

### Synopsis
Acknowledge and/or suppress an alert.

---

### Description

Acknowledge and/or suppress an alert.

---

### Related Links
* [Get-NcDiagnosisAlert](Get-NcDiagnosisAlert)

---

### Examples
> Example 1

Get-NcDiagnosisAlert -AlertingResource 50:05:0c:c1:02:01:6e:43 -Node VxeRubble-01 | Set-NcDiagnosisAlert -Acknowledge $true -Acknowledger user1
Acknowledge all alerts from the given resource on node VxeRubble-01 as user1.

Node                     : VxeRubble-01
Monitor                  : node_connect
AlertId                  : DualPathToDiskShelf_Alert
NcController             : 10.60.189.172
Acknowledge              : True
Acknowledger             : user1
AdditionalInfo           : {Shelf uuid: 50:05:0c:c1:02:01:6e:43, Shelf id: 2, Shelf Name: 1a.shelf2, Number of Paths: 1
                           ...}
AlertingResource         : 50:05:0c:c1:02:01:6e:43
AlertingResourceName     : Shelf ID 2
CorrectiveActions        : 1. Halt controller VxeRubble-01 and all controllers attached to disk shelf 2.
                           2. Connect disk shelf 2 to controller VxeRubble-01 via two paths following the rules in the
                           Universal SAS and ACP Cabling Guide.
                           3. Reboot the halted controllers.
                           4. Contact support personnel if the alert persists.
IndicationTime           : 1332236915
IndicationTimeDT         : 3/20/2012 9:48:35 AM
PerceivedSeverity        : major
Policy                   : DualPathToDiskShelf_Policy
PossibleEffect           : Access to disk shelf 2 via controller VxeRubble-01 will be lost with a single hardware compo
                           nent failure (e.g. cable, HBA, or IOM failure).
ProbableCause            : connection_establishment_error
ProbableCauseDescription : Disk shelf 2 does not have two paths to controller VxeRubble-01.
Subsystem                : sas_connect
Suppress                 : False
Suppressor               :
AcknowledgeSpecified     : True
SuppressSpecified        : True

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

#### **AlertId**
Alert identification.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **AlertingResource**
Unique name of resource that generated the alert.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **Acknowledge**
If true, acknowledge the alert condition.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Suppress**
If true, suppress this alert.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Acknowledger**
Person who acknowledged this alert.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Suppressor**
Person who suppressed this alert.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* DataONTAP.C.Types.Diagnosis.DiagnosisAlertInfo

---

### Notes
Category: diagnosis
API: diagnosis-alert-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcDiagnosisAlert [-Node] <String> [-Monitor] <String> [-AlertId] <String> [-AlertingResource] <String> [-Acknowledge <Boolean>] [-Suppress <Boolean>] [-Acknowledger <String>] [-Suppressor 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
