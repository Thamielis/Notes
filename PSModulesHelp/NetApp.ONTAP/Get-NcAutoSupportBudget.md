Get-NcAutoSupportBudget
-----------------------

### Synopsis
Get AutoSupport time and size limits per subsystem.

---

### Description

Get AutoSupport time and size limits per subsystem.

---

### Related Links
* [Set-NcAutoSupportBudget](Set-NcAutoSupportBudget)

---

### Examples
> Example 1

```PowerShell
Get-NcAutoSupportBudget fas3070cluster01-01
Get the AutoSupport budget info for node fas3070cluster01-01.

NodeName           : fas3070cluster01-01
Subsystem          : storage
NcController       : 10.61.172.155
SizeLimit          : 2097152
TimeLimit          : 1m
TimeLimitTS        : 00:01:00
SizeLimitSpecified : True
TimeLimitSpecified : True

NodeName           : fas3070cluster01-01
Subsystem          : tape
NcController       : 10.61.172.155
SizeLimit          : 2097152
TimeLimit          : 1m
TimeLimitTS        : 00:01:00
SizeLimitSpecified : True
TimeLimitSpecified : True

NodeName           : fas3070cluster01-01
Subsystem          : wafl
NcController       : 10.61.172.155
SizeLimit          : 10485760
TimeLimit          : 5m
TimeLimitTS        : 00:05:00
SizeLimitSpecified : True
TimeLimitSpecified : True

```
> Example 2

$q = Get-NcAutoSupportBudget -Template
$q.TimeLimit = 60
Get-NcAutoSupportBudget -Query $q
Get all of the AutoSupport budgets with a time limit value of 60 seconds.

NodeName                       Subsystem                         SizeLimit      TimeLimitTS
--------                       ---------                         ---------      -----------
fas3070cluster01-01            asup_ems                             2.0 MB         00:01:00
fas3070cluster01-01            cifs                                 2.0 MB         00:01:00
fas3070cluster01-01            fpolicy                              2.0 MB         00:01:00
fas3070cluster01-01            ha                                   2.0 MB         00:01:00

---

### Parameters
#### **Node**
The name of a controller on which the AutoSupport tool is running.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Subsystem**
The name of a subsystem from which AutoSupport collects data.  Data ONTAP wildcards are permitted.
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

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a AutosupportBudgetInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAutoSupportBudget -Template" to get the initially empty AutosupportBudgetInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[AutosupportBudgetInfo]`|false   |named   |false        |

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
Specify to get an empty AutosupportBudgetInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a AutosupportBudgetInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAutoSupportBudget -Template" to get the initially empty AutosupportBudgetInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[AutosupportBudgetInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Autosupport.AutosupportBudgetInfo

---

### Notes
Category: autosupport
API: autosupport-budget-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAutoSupportBudget [[-Node] <String[]>] [[-Subsystem] <String[]>] [-Attributes <AutosupportBudgetInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAutoSupportBudget -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAutoSupportBudget -Query <AutosupportBudgetInfo> [-Attributes <AutosupportBudgetInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
