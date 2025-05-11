Get-NcAggrOption
----------------

### Synopsis
Get the options that have been set for the specified aggregate.

---

### Description

Get the options that have been set for the specified aggregate.  This API does not support listing options of striped aggregates.

---

### Related Links
* [Set-NcAggrOption](Set-NcAggrOption)

---

### Examples
> Example 1

Get-NcAggrOption aggr2
Get the options for aggregate 'aggr2'.

cController  Name                   Value
-----------  ----                   -----
0.61.172.155 dlog_hole_reserve      off
0.61.172.155 free_space_realloc     off
0.61.172.155 fs_size_fixed          off
0.61.172.155 ha_policy              sfo
0.61.172.155 hybrid_enabled         false
0.61.172.155 ignore_inconsistent    off
0.61.172.155 lost_write_protect     on
0.61.172.155 no_delete_log          off
0.61.172.155 no_i2p                 off
0.61.172.155 nosnap                 off
0.61.172.155 percent_snapshot_space 0
0.61.172.155 raid_cv                on
0.61.172.155 raid_lost_write        on
0.61.172.155 raidsize               16
0.61.172.155 raidtype               raid_dp
0.61.172.155 resyncsnaptime         60
0.61.172.155 root                   false
0.61.172.155 snapmirrored           off
0.61.172.155 snapshot_autodelete    on
0.61.172.155 striping               not_striped
0.61.172.155 thorough_scrub         off

---

### Parameters
#### **Name**
Name of the aggregate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Hashtable**
Specify to get all values in a hashtable instead of separate objects.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |HT     |

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
* DataONTAP.C.Types.Aggr.AggrOptionInfo

---

### Notes
Category: aggr
API: aggr-options-list-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrOption [-Name] <String> [-Hashtable] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
