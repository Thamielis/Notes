Get-NcMetroclusterProgress
--------------------------

### Synopsis
Get a list of MetroCluster progress table info objects.

---

### Description

Get a list of MetroCluster progress table info objects.

---

### Related Links
* [Get-NcMetroclusterOperation](Get-NcMetroclusterOperation)

---

### Examples
> Example 1

Get-NcMetroclusterProgress
Get the state of all MetroCluster subsystems.

NodeName                   EntryName                            DurationTS State                                       
--------                   ---------                            ---------- -----                                       
beam-mcc-01-01             SO_HA_op_in_progress_vetocheck       00:00:00   -                                           
beam-mcc-01-01             dr_partner_online_vetocheck          00:00:00   -                                           
beam-mcc-01-01             WAFL_nso_dest_vetocheck              00:00:00   -                                           
beam-mcc-01-01             test_so_veto                         00:00:00   -                                           
beam-mcc-01-01             HA_partner_fsm_state_check           00:00:00   -                                           
beam-mcc-01-01             halt_DR_partners                     00:00:00   -                                           
beam-mcc-01-01             sanown_replay_so                     00:00:00   -                                           
beam-mcc-01-01             halt_DR_partners                     00:00:00   -                                           
beam-mcc-01-01             freeze_raid_assimilations            00:00:00   -                                           
beam-mcc-01-01             drdom_SO                             00:00:00   -                                           
beam-mcc-01-01             NVPM_copy                            00:00:00   -                                           
beam-mcc-01-01             RAID_SO_assimilate_disks             00:00:00   -                                           
beam-mcc-01-01             nvram_validate                       00:00:00   -                                           
beam-mcc-01-01             flexlog_register_nodetags_SO_start   00:00:00   -                                           
beam-mcc-01-01             RAID_SO_NVRAM_handling               00:00:00   -                                           
beam-mcc-01-01             RAID_SO_invalidate_DR_nvram          00:00:00   -                                           
beam-mcc-01-01             WAFL_phase_1_SO                      00:00:00   -                                           
beam-mcc-01-01             drsom_set_wafl_nvinfo_online         00:00:00   -                                           
beam-mcc-01-01             WAFL_phase_2_SO                      00:00:00   -                                           
beam-mcc-01-01             flexlog_register_nodetags_SO_end     00:00:00   -                                           
beam-mcc-01-01             NVPM_Extension                       00:00:00   -                                           
beam-mcc-01-01             WAFL_restart_on_SO                   00:00:00   -                                           
beam-mcc-01-01             WAFL_restart_non-critical_ops_on_SO  00:00:00   -                                           
beam-mcc-01-01             test_SO                              00:00:00   -                                           
beam-mcc-01-01             RAID_SO_mount_dirty_volumes          00:00:00   -                                           
beam-mcc-01-01             lmgr_so_commit                       00:00:00   -                                           
beam-mcc-01-01             quota_SO_commit                      00:00:00   -                                           
beam-mcc-01-01             drdom_SO_cleanup                     00:00:00   -                                           
beam-mcc-01-01             sfo_gb_populate_status               00:00:00   -                                           
beam-mcc-01-01             WAFL_SO_cleanup                      00:00:00   -                                           
beam-mcc-01-01             RAID_SO_mark_complete                00:00:00   -                                           
beam-mcc-01-01             clear_nvinfo_online_SO               00:00:00   -                                           
beam-mcc-01-01             raid_switchover_cleanup              00:00:00   -                                           
beam-mcc-01-01             test_so_cleanup                      00:00:00   -                                           
beam-mcc-01-01             heal_aggrs_HA_op_in_progress_veto... 00:00:00   -                                           
beam-mcc-01-01             test_heal_aggrs_vetocheck            00:00:00   -                                           
beam-mcc-01-01             raid_heal_aggrs_vetocheck            00:00:00   -                                           
beam-mcc-01-01             test_heal_aggrs                      00:00:00   -                                           
beam-mcc-01-01             drdom_heal_aggrs                     00:00:00   -                                           
beam-mcc-01-01             heal_roots_HA_op_in_progress_veto... 00:00:00   -                                           
beam-mcc-01-01             RAID_heal_roots_vetocheck            00:00:00   -                                           
beam-mcc-01-01             test_heal_root_vetocheck             00:00:00   -                                           
beam-mcc-01-01             RAID_heal_roots_clear_disk_revert... 00:00:00   -                                           
beam-mcc-01-01             test_heal_roots                      00:00:00   -                                           
beam-mcc-01-01             suspend_sanown_completions           00:00:00   -                                           
beam-mcc-01-01             RAID_heal_roots                      00:00:00   -                                           
beam-mcc-01-01             drdom_heal_roots                     00:00:00   -                                           
beam-mcc-01-01             enable_sanown_completions            00:00:00   -                                           
beam-mcc-01-01             set_nvinfo_online                    00:00:00   -                                           
beam-mcc-01-01             RAID_SB_set_in_progress_flags        00:00:00   -                                           
beam-mcc-01-01             volume_move_SB_vetochecks            00:00:00   -                                           
beam-mcc-01-01             Replication_engine_SB_vetocheck      00:00:00   -                                           
beam-mcc-01-01             test_SB_vetocheck                    00:00:00   -                                           
beam-mcc-01-01             RAID_SB_vetocheck                    00:00:00   -                                           
beam-mcc-01-01             WAFL_SB_vetocheck                    00:00:00   -                                           
beam-mcc-01-01             lmgr_sb_vetocheck                    00:00:00   -                                           
beam-mcc-01-01             quota_SB_vetocheck                   00:00:00   -                                           
beam-mcc-01-01             partner_config_SB_vetocheck          00:00:00   -                                           
beam-mcc-01-01             partner_drsom_state_vetocheck        00:00:00   -                                           
beam-mcc-01-01             SnapMirror_SB_vetocheck              00:00:00   -                                           
beam-mcc-01-01             Backup_SB_vetocheck                  00:00:00   -                                           
beam-mcc-01-01             SB-PC_test                           00:00:00   -                                           
beam-mcc-01-01             SnapMirror_switchback_pre_commit     00:00:00   -                                           
beam-mcc-01-01             Snapdiff_switchback_pre_commit       00:00:00   -                                           
beam-mcc-01-01             Replication_engine_SB_pre_commit     00:00:00   -                                           
beam-mcc-01-01             lmgr_sb_pre_commit                   00:00:00   -                                           
beam-mcc-01-01             snapshot_SB_precommit                00:00:00   -                                           
beam-mcc-01-01             SnapMirror_SB_abort                  00:00:00   -                                           
beam-mcc-01-01             WAFL_SB_abort                        00:00:00   -                                           
beam-mcc-01-01             lmgr_sb_abort                        00:00:00   -                                           
beam-mcc-01-01             volume_move_veto_checks_SB_abort     00:00:00   -                                           
beam-mcc-01-01             RAID_SB_abort                        00:00:00   -                                           
beam-mcc-01-01             clear_nvinfo_online_SB_abort         00:00:00   -                                           
beam-mcc-01-01             WAFL_SB_zombie_restart               00:00:00   -                                           
beam-mcc-01-01             RAID_SB_block_assim                  00:00:00   -                                           
beam-mcc-01-01             volume_move_SB                       00:00:00   -                                           
beam-mcc-01-01             SnapMirror_SB_commit                 00:00:00   -                                           
beam-mcc-01-01             Backup_SB_commit                     00:00:00   -                                           
beam-mcc-01-01             Replication_engine_SB_commit         00:00:00   -                                           
beam-mcc-01-01             lmgr_sb_commit                       00:00:00   -                                           
beam-mcc-01-01             snapshot_SB_commit                   00:00:00   -                                           
beam-mcc-01-01             wafl_SB_commit_non_critical          00:00:00   -                                           
beam-mcc-01-01             vdom_sb_commit                       00:00:00   -                                           
beam-mcc-01-01             RAID_SB_precommit                    00:00:00   -                                           
beam-mcc-01-01             test_SB                              00:00:00   -                                           
beam-mcc-01-01             wafl_SB_commit                       00:00:00   -                                           
beam-mcc-01-01             clear_nvinfo_online_SB               00:00:00   -                                           
beam-mcc-01-01             NVPM Retraction                      00:00:00   -                                           
beam-mcc-01-01             suspend_sanown_completion_event_SB   00:00:00   -                                           
beam-mcc-01-01             RAID_SB_commit                       00:00:00   -                                           
beam-mcc-01-01             drdom_SB                             00:00:00   -                                           
beam-mcc-01-01             enable_sanown_completions_SB         00:00:00   -                                           
beam-mcc-01-01             flexlog_unregister_nodetags_SB       00:00:00   -                                           
beam-mcc-01-01             raid_switchback_cleanup              00:00:00   -                                           
beam-mcc-01-01             lmgr_sb_cleanup                      00:00:00   -                                           
beam-mcc-01-01             ext_cache_switchback_cleanup         00:00:00   -                                           
beam-mcc-01-01             test_sb_cleanup                      00:00:00   -                                           
beam-mcc-01-01             RAID_NSO_set_in_progress_flags       00:00:00   -                                           
beam-mcc-01-01             Coredump_NSO_vetocheck               00:00:00   -                                           
beam-mcc-01-01             RAID_NSO_vetocheck                   00:00:00   -                                           
beam-mcc-01-01             volume_move_veto_checks_nso_veto     00:00:00   -                                           
beam-mcc-01-01             Replication_engine_NSO_vetocheck     00:00:00   -                                           
beam-mcc-01-01             WAFL_NSO_vetocheck                   00:00:00   -                                           
beam-mcc-01-01             lmgr_nso_vetocheck                   00:00:00   -                                           
beam-mcc-01-01             quota_NSO_vetocheck                  00:00:00   -                                           
beam-mcc-01-01             partner_config_NSO_vetocheck         00:00:00   -                                           
beam-mcc-01-01             nvmm_nso_vetocheck                   00:00:00   -                                           
beam-mcc-01-01             SnapMirror_NSO_vetocheck             00:00:00   -                                           
beam-mcc-01-01             Backup_NSO_vetocheck                 00:00:00   -                                           
beam-mcc-01-01             test_nso_veto                        00:00:00   -                                           
beam-mcc-01-01             NSO-PC_test                          00:00:00   -                                           
beam-mcc-01-01             SnapMirror_NSO_pre_commit            00:00:00   -                                           
beam-mcc-01-01             Snapdiff_NSO_pre_commit              00:00:00   -                                           
beam-mcc-01-01             Replication_engine_NSO_pre_commit    00:00:00   -                                           
beam-mcc-01-01             lmgr_nso_pre_commit                  00:00:00   -                                           
beam-mcc-01-01             snapshot_NSO_precommit               00:00:00   -                                           
beam-mcc-01-01             SnapMirror_NSO_abort                 00:00:00   -                                           
beam-mcc-01-01             WAFL_NSO_abort                       00:00:00   -                                           
beam-mcc-01-01             lmgr_nso_abort                       00:00:00   -                                           
beam-mcc-01-01             volume_move_veto_checks_nso_src_veto 00:00:00   -                                           
beam-mcc-01-01             Coredump_NSO_abort                   00:00:00   -                                           
beam-mcc-01-01             test_nso_src_abort                   00:00:00   -                                           
beam-mcc-01-01             RAID_NSO_abort                       00:00:00   -                                           
beam-mcc-01-01             volume_move_nso                      00:00:00   -                                           
beam-mcc-01-01             SnapMirror_NSO_commit                00:00:00   -                                           
beam-mcc-01-01             Backup_NSO_commit                    00:00:00   -                                           
beam-mcc-01-01             Replication_engine_NSO_commit        00:00:00   -                                           
beam-mcc-01-01             lmgr_nso_commit                      00:00:00   -                                           
beam-mcc-01-01             snapshot_NSO_commit                  00:00:00   -                                           
beam-mcc-01-01             RAID_NSO_commit_clear_disk_revert... 00:00:00   -                                           
beam-mcc-01-01             WAFL_NSO_commit                      00:00:00   -                                           
beam-mcc-01-01             suspend_sanown_completions_NSO       00:00:00   -                                           
beam-mcc-01-01             RAID_NSO_commit                      00:00:00   -                                           
beam-mcc-01-01             DRDOM_NSO_commit                     00:00:00   -                                           
beam-mcc-01-01             disable_dr_mirroring                 00:00:00   -                                           
beam-mcc-01-01             enable_completions_and_notify_NSO... 00:00:00   -                                           
beam-mcc-01-01             test_nso_commit                      00:00:00   -                                           
beam-mcc-01-01             raid_nso_cleanup                     00:00:00   -                                           
beam-mcc-01-01             lmgr_nso_cleanup                     00:00:00   -                                           
beam-mcc-01-01             test_nso_cleanup                     00:00:00   -                                           
beam-mcc-01-01             nvpm_retract_extensions              00:00:00   -

---

### Parameters
#### **Index**
One or more metrocluster progress table entry indices.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt64[]]`|false   |1       |true (ByPropertyName)|

#### **Node**
One or more node names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterProgressTableInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterProgress -Template" to get the initially empty MetroclusterProgressTableInfo object.  If not specified, all data is returned for each object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[MetroclusterProgressTableInfo]`|false   |named   |false        |

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
Specify to get an empty MetroclusterProgressTableInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterProgressTableInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterProgress -Template" to get the initially empty MetroclusterProgressTableInfo object.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[MetroclusterProgressTableInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterProgressTableInfo

---

### Notes
Category: metrocluster
API: metrocluster-progress-table-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterProgress [[-Index] <UInt64[]>] [-Node <String[]>] [-Attributes <MetroclusterProgressTableInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterProgress -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterProgress -Query <MetroclusterProgressTableInfo> [-Attributes <MetroclusterProgressTableInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
