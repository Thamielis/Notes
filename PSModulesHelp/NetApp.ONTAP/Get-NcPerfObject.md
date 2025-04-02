Get-NcPerfObject
----------------

### Synopsis
Get list of performance objects in the system.

---

### Description

Get list of performance objects in the system.

---

### Related Links
* [Get-NcPerfCounter](Get-NcPerfCounter)

* [Get-NcPerfData](Get-NcPerfData)

* [Get-NcPerfInstance](Get-NcPerfInstance)

---

### Examples
> Example 1

Get-NcPerfObject
Get the available performance objects.

Name                                    PrivilegeLevel
----                                    --------------
aggregate                               basic
aggregator_counter_list                 diag
aggregator_get_instances                diag
aggregator_instance_list                diag
aggregator_object_list                  diag
asup                                    diag
audit_ng                                basic
avoa                                    basic
bufcache                                diag
cacheeject                              diag
cachequeue                              diag
cifs                                    basic
cifs:node                               basic
cifs:vserver                            basic
clam                                    diag
classify_fail                           diag
cluster_peer                            basic
cm_aggregator_cache                     diag
cm_connectivity                         diag
cm_translation                          diag
cmlib                                   diag
cmrpc                                   diag
compression                             diag
copy_manager                            diag
ctran                                   diag
disk                                    basic
ems                                     diag
ext_cache                               basic
ext_cache_obj                           basic
fal                                     diag
fcache                                  basic
fcp_itn                                 diag
fcp_itn:lif                             diag
fcp_itn:port                            diag
fcp_itn:vserver                         diag
fcp_lif                                 basic
fcp_lif:node                            basic
fcp_lif:port                            basic
fcp_lif:vserver                         basic
fcp_port                                diag
flashmgmt                               diag
flashmgmt_core                          diag
flexcache                               diag
fpolicy_global                          diag
fpolicy_stats_policy                    diag
fpolicy_stats_server                    diag
hostadapter                             basic
ifnet                                   basic
iomem                                   diag
iscsi_conn                              basic
iscsi_conn:session                      basic
iscsi_lif                               basic
iscsi_lif:vserver                       basic
lmgr_ng                                 advanced
logical_replication_destination         basic
logical_replication_source              basic
lun                                     basic
lun:constituent                         basic
nblade_cifs                             basic
nfs3_diag                               diag
nfs4_1                                  diag
nfs4_diag                               diag
nfsv2                                   diag
nfsv3                                   basic
nps1                                    diag
nrv                                     diag
nvram                                   diag
oncrpc                                  diag
partial_file_restore                    diag
pcp                                     diag
pcp_worker                              diag
perf                                    diag
processor                               basic
qtree                                   basic
query                                   diag
quota                                   basic
raid                                    basic
raid_stripe                             diag
ratebucket                              diag
rave                                    diag
readahead                               diag
repl_errors                             diag
repl_exovol_scanner                     diag
repl_exovol_writer                      diag
repl_global_ops                         diag
repl_rcvr_mgr                           diag
repl_rcvr_node                          diag
repl_snapdiff                           diag
repl_sndr_mgr                           diag
repl_sndr_node                          diag
repl_stopwatches                        diag
resource                                diag
resource_detail                         diag
sis                                     diag
smb1                                    basic
smb1:node                               basic
smb1:vserver                            basic
smb2                                    basic
smb2:node                               basic
smb2:vserver                            basic
sparse                                  diag
spinhi                                  basic
striped                                 advanced
stripedattributes                       advanced
stripedfileop                           advanced
stripedfileoperrors                     advanced
stripedlock                             advanced
stripedmemory                           advanced
stripedopclient                         advanced
stripedopclienterrors                   advanced
stripedopserver                         advanced
stripedopservererrors                   advanced
sys_mgmt_and_diagnosis                  diag
system                                  basic
tape                                    diag
telnet                                  diag
tfm                                     diag
voltrans                                diag
volume                                  basic
volume:node                             basic
volume:vserver                          basic
volume_move_summary                     basic
vstorage                                diag
wafl                                    diag
wafltop                                 diag
web                                     diag
workload                                diag
workload:constituent                    diag
workload_detail                         diag
zapi                                    basic
zodiac                                  diag

---

### Parameters
#### **FilterData**
A string, representing filter-data, in the format of key=value supporting multiple key-value pairs via comma separation.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Perf.ObjectInfo

---

### Notes
Category: perf
API: perf-object-list-info
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcPerfObject [[-FilterData] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
