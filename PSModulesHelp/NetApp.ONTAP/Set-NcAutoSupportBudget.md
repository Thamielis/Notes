Set-NcAutoSupportBudget
-----------------------

### Synopsis
Modify AutoSupport time and size limits per subsystem.

---

### Description

Modify AutoSupport time and size limits per subsystem.

---

### Related Links
* [Get-NcAutoSupportBudget](Get-NcAutoSupportBudget)

---

### Examples
> Example 1

Set-NcAutoSupportBudget fas3070cluster01-01 -Subsystem cifs -SizeLimit 2.5MB
Set the size limit for the subsystem cifs on node fas3070cluster01-01 to 2.5MB.

NodeName                       Subsystem                         SizeLimit      TimeLimitTS
--------                       ---------                         ---------      -----------
fas3070cluster01-01            cifs                                 2.5 MB         00:01:00

---

### Parameters
#### **Node**
The name of a filer on which the AutoSupport tool is running.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **Subsystem**
The name of a subsystem from which AutoSupport collects data.
Possible values: 
    "platform"            - Hardware information about the node
    "mhost"               - User Space application information for a node
    "log_files"           - Log files for a node
    "performance"         - This subsystem gathers the .cm_stats_hourly_done file and user space counter
    "performance_asup"    - Performance specific information for a node
    "nht"                 - This subsystem gathers the /mroot/etc/log/nht_info content
    "san"                 - SAN specific information for a node
    "snapvault"           - SNAPVAULT specific information for a node
    "snapmirror"          - Snapmirror specific information for a node
    "dedupe"              - Dedupe specific information for a node
    "nfs"                 - NFS specific information for a node
    "wafl"                - WAFL specific information for a node
    "mot"                 - MOT specific information for a node
    "ha"                  - HA specific information for a node
    "networking"          - Networking specific information for a node
    "cifs"                - CIFS specific information for a node
    "fpolicy"             - Fpolicy specific information for a node
    "multistore"          - Multistore specific information for a node
    "raid"                - RAID specific information for a node
    "storage"             - Storage specific information for a node
    "asup_ems"            - ASUP EMS specific information for a node
    "tape"                - Tape specific information for a node
    "kernel"              - kernel specific information for a node
    "secd"                - SECD specific information for a node
    "metrocluster"        - Metrocluster specific information for a node
    "mandatory"           - Mandatory Basic information for a node

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **TimeLimit**
The maximum allowable collection time (in seconds) for the subsystem.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **SizeLimit**
The maximum allowable collection size (in bytes) for the subsystem.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DiagnosticTimeLimit**
The maximum allowable diagnostic content collection time for the subsystem (in <value><units>, where units can be s|m|h)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DiagnosticSizeLimit**
The maximum allowable diagnostic content collection size for the subsystem. It must be entered as '<value><unit>' where unit can be b|kb|mb|gb|tb

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Autosupport.AutosupportBudgetInfo

---

### Notes
Category: autosupport
API: autosupport-budget-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcAutoSupportBudget [-Node] <String> [-Subsystem] <String> [-TimeLimit <Int64>] [-SizeLimit <String>] [-DiagnosticTimeLimit <String>] [-DiagnosticSizeLimit <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
