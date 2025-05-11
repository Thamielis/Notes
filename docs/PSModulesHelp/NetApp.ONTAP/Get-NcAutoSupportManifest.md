Get-NcAutoSupportManifest
-------------------------

### Synopsis
Get a detailed manifest for the contents of an AutoSupport.

---

### Description

Get a detailed manifest for the contents of an AutoSupport.

---

### Examples
> Example 1

```PowerShell
Get-NcAutoSupportManifest fas3070cluster01-01
Get the AutoSupport manifest for the node fas3070cluster01-01.

NcController           : 10.61.172.155
BodyFile               : SYSCONFIG-A.txt
Cmd                    : sysconfig -a
CmdTgt                 : dblade
ContentType            : basic
Error                  :
NodeName               : fas3070cluster01-01
PrioNum                : 0
Query                  :
SeqNum                 : 764
SizeCollected          : 8872
Status                 : completed
Subsystem              : mandatory
TimeCollected          : 416
PrioNumSpecified       : True
SeqNumSpecified        : True
SizeCollectedSpecified : True
TimeCollectedSpecified : True

NcController           : 10.61.172.155
BodyFile               : OPTIONS.txt
Cmd                    : options
CmdTgt                 : dblade
ContentType            : basic
Error                  :
NodeName               : fas3070cluster01-01
PrioNum                : 1
Query                  :
SeqNum                 : 764
SizeCollected          : 28751
Status                 : completed
Subsystem              : mandatory
TimeCollected          : 599
PrioNumSpecified       : True
SeqNumSpecified        : True
SizeCollectedSpecified : True
TimeCollectedSpecified : True

NcController           : 10.61.172.155
BodyFile               : software_image.xml
Cmd                    : software_image
CmdTgt                 : smf_table
ContentType            : basic
Error                  :
NodeName               : fas3070cluster01-01
PrioNum                : 2
Query                  :
SeqNum                 : 764
SizeCollected          : 8986
Status                 : completed
Subsystem              : mandatory
TimeCollected          : 21
PrioNumSpecified       : True
SeqNumSpecified        : True
SizeCollectedSpecified : True
TimeCollectedSpecified : True

```
> Example 2

$q = Get-NcAutoSupportManifest -Template
$q.SizeCollected = ">$(1MB)"
Get-NcAutoSupportManifest -Query $q
Get all AutoSupport manifests that have a size collected of greater than 1MB.

NodeName                       Subsystem            Cmd                  CmdTgt           Status
--------                       ---------            ---                  ------           ------
fas3070cluster01-01            mhost                smdb_smf_metrics     smf_table        completed
fas3070cluster01-01            kernel               /etc/log/leak_data   dblade_file      completed
fas3070cluster01-01            mhost                smdb_smf_metrics     smf_table        completed
fas3070cluster01-01            kernel               /etc/log/leak_data   dblade_file      completed
fas3070cluster01-01            mhost                smdb_smf_metrics     smf_table        completed
fas3070cluster01-01            kernel               /etc/log/leak_data   dblade_file      completed

---

### Parameters
#### **Node**
The name of the controller that owns the manifest.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Sequence**
The AutoSupport sequence number.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |2       |true (ByPropertyName)|SeqNum |

#### **Priority**
The priority order of collection.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |3       |true (ByPropertyName)|PrioNum|

#### **Subsystem**
The AutoSupport subsystem.  Data ONTAP wildcards are permitted.
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
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **CommandTarget**
The AutoSupport execution domain for command.  Data ONTAP wildcards are permitted.
Possible values:
    "bsd"            - Command executed by BSD
    "smf_table"      - Command selects SMF table
    "file"           - Command indicates file to collect
    "dblade"         - Collect from dbladecli
    "dblade_file"    - Collect a file from dblade. Could be partner file
    "zapi_xml"       - Response in XML format
    "custom_fx"      - Collect custom function output file

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|CmdTgt |

#### **Status**
The status of the manifest.  Data ONTAP wildcards are permitted.
Possible values:
    "requested"                          - ASUP request has been added to the queue and is waiting processing by the collector
    "working"                            - ASUP Collector is actively gathering the needed data
    "file_not_found"                     - ASUP collection failed, a needed file is missing
    "no_such_table"                      - ASUP collection was unable to find the requested SMF table
    "collection_truncated_size_limit"    - ASUP collection truncated due to size limits and partial data is available
    "collection_skipped_size_limit"      - ASUP collection skipped due to size limits and no data is available
    "collection_truncated_time_limit"    - ASUP collection truncated due to time limits and partial data is available
    "collection_skipped_time_limit"      - ASUP collection skipped due to time limits and no data is available
    "delivery_skipped_size_limit"        - ASUP data was skipped at delivery time due to size limits
    "general_error"                      - ASUP collection failed, additional information if any will be in the Error String field
    "completed"                          - ASUP collection is complete, ready for delivery
    "content_not_collected_mode"         - ASUP content was not collected, incompatible operational mode
    "content_not_collected_precheck"     - ASUP content was not collected, pre-check function violation
    "content_not_collected_privacy"      - ASUP content was not collected, the operation is disabled in privacy mode
    "content_empty"                      - ASUP content was collected successfully, but output was empty
    "collection_aborted"                 - ASUP collection aborted

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a AutosupportManifestInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAutoSupportManifest -Template" to get the initially empty AutosupportManifestInfo object.  If not specified, all data is returned for each object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[AutosupportManifestInfo]`|false   |named   |false        |

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
Specify to get an empty AutosupportManifestInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a AutosupportManifestInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAutoSupportManifestInfo -Template" to get the initially empty AutosupportManifestInfo object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[AutosupportManifestInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Autosupport.AutosupportManifestInfo

---

### Notes
Category: autosupport
API: autosupport-manifest-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAutoSupportManifest [[-Node] <String[]>] [[-Sequence] <String[]>] [[-Priority] <String[]>] [-Subsystem <String[]>] [-CommandTarget <String[]>] [-Status <String[]>] [-Attributes 
```
```PowerShell
<AutosupportManifestInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAutoSupportManifest -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAutoSupportManifest -Query <AutosupportManifestInfo> [-Attributes <AutosupportManifestInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
