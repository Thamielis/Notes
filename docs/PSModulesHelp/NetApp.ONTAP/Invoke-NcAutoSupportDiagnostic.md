Invoke-NcAutoSupportDiagnostic
------------------------------

### Synopsis
Generate and send an AutoSupport message with diagnostic content from specified subsystems.

---

### Description

Generate and send an AutoSupport message with diagnostic content from specified subsystems.

---

### Related Links
* [Test-NcAutosupport](Test-NcAutosupport)

* [Invoke-NcAutosupport](Invoke-NcAutosupport)

---

### Examples
> Example 1

```PowerShell
Invoke-NcAutoSupportDiagnostic -NodeName sapanj-vsim3 -Subsystem mhost
Invoke diagnostics mhost subsystems.

NcController : 10.238.73.251
SuccessCount : 1
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Autosupport.AutosupportConfigInfo}
FailureList  : {}

```

---

### Parameters
#### **NodeName**
The name of the node on which the AutoSupport message will be generated.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Node   |

#### **Subsytems**
@List of subsystems whose diagnostic content is to be included in this AutoSupport. Specify up to 4 subsystems.
Possible values: 
	'platform'                 - Hardware information about the node,
	'mhost'                    - User Space application information for a node,
	'log_files'                - Log files for a node,
	'performance'              - This subsystem gathers the .cm_stats_hourly_done file and user space counters,
	'performance_asup'         - Performance specific information for a node,
	'nht'                      - This subsystem gathers the /mroot/etc/log/nht_info content,
	'san'                      - SAN specific information for a node,
	'snapvault'                - SnapVault specific information for a node,
	'snapmirror'               - Snapmirror specific information for a node,
	'dedupe'                   - Dedupe specific information for a node,
	'nfs'                      - NFS specific information for a node,
	'wafl'                     - WAFL specific information for a node,
	'mot'                      - MOT specific information for a node,
	'ha'                       - HA specific information for a node,
	'networking'               - Networking specific information for a node,
	'cifs'                     - CIFS specific information for a node,
	'fpolicy'                  - Fpolicy specific information for a node,
	'multistore'               - Multistore specific information for a node,
	'raid'                     - RAID specific information for a node,
	'storage'                  - Storage specific information for a node,
	'asup_ems'                 - ASUP EMS specific information for a node,
	'tape'                     - Tape specific information for a node,
	'kernel'                   - kernel specific information for a node,
	'secd'                     - Security Daemon specific information for a node,
	'metrocluster'             - Metrocluster specific information for a node,
	'mandatory'                - Mandatory Basic information for a node,
	'repository'               - Repository specific information for a node,
	'splog_downcontroller'     - Service Processor log saved when ONTAP is down abnormally,
	'splog_latest'             - Up-to-date Service Processor log from Service Processor firmware  ,
	'splog_before_spreboot'    - Up-to-date Service Processor log from Service Processor firmware before SP reboot,
	'splog_rnode_down'         - Remote SPLOG saved when ONTAP is abnormal down,
	'splog_rnode_latest'       - Up-to-date SPLOG from Remote Service Processor FW,
	'splog_rnode'              - On demand collected remote SP logs,
	'hm'                       - Health Monitor Alerts specific information,
	'kcs'                      - Kernel Cluster Services information for a node,
	'av'                       - Antivirus specific information for a node,
	'vserver_dr'               - Vserver disaster recovery,
	'nwd'                      - Node Watchdog specific information for a node,
	'vscan'                    - Vscan specific information for a node,
	'san_ffdc'                 - SAN specific trace dumps for a node,
	'cluster_peer'             - Cluster peering specific dumps for a node,
	'crs'                      - Config Replication Service information,
	'cps'                      - Cluster Persistency Storage information,
	'memevt'                   - MemEVT gathered data from a node,
	'san_fcp'                  - FCP target driver related information for a node,
	'ndmp'                     - NDMP information,
	'ndu'                      - NDU specific information

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

#### **Message**
Text to include as part of the subject of the AutoSupport message.

|Type      |Required|Position|PipelineInput        |Aliases                   |
|----------|--------|--------|---------------------|--------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|Subject<br/>MessageSubject|

#### **Uri**
Destination to Send this AutoSupport. If omitted, AutoSupport will be delivered to the currently configured destination

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Force**
Specify to force collection and delivery, even if Diagnostic AutoSupport is disabled in the system

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ContinueOnFailure**
This input element is useful when multiple autosupport objects match a given query. If set to true, the API will continue with the next matching autosupport even when the operation fails for the autosupport. If set to false, the API will return on the first failure. Default: false

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFailureCount**
When allowing failures ('continue-on-failure' is set to true),then this input element may be provided to limit the number of failed operations before the server gives up and returns. If set, the API will continue with the next matching autosupport even when the operation on a previous matching autosupport fails, and do so until the total number of objects failed to be operated on reaches the maximum specified. If set to the maximum or not provided, then there will be no limit on the number of failed operations. Only applicable if 'continue-on-failure' is set to true. Default: 2^32-1

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **MaxRecords**
The maximum number of autosupport objects to be operated in this call. Default: 20

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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

#### **Query**
If operating on a specific autosupport, this input element mustspecify all keys. If operating on autosupport objects based on query, this input
element must specify a query.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[AutosupportConfigInfo]`|true    |1       |true (ByValue)|

#### **Template**
Specify to get an empty AutoSupportDiagnosticInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.TableModifyResult

---

### Notes
Category: Autosupport
API: autosupport-invoke-diagnostic
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcAutoSupportDiagnostic [[-NodeName] <String[]>] [-Subsytems] <String[]> [-Message <String>] [-Uri <String>] [-Force] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-MaxRecords 
```
```PowerShell
<Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcAutoSupportDiagnostic [-Query] <AutosupportConfigInfo> [-Subsytems] <String[]> [-Message <String>] [-Uri <String>] [-Force] [-ContinueOnFailure] [-MaxFailureCount <Int32>] 
```
```PowerShell
[-MaxRecords <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Invoke-NcAutoSupportDiagnostic -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
