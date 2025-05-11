New-NcAggrMirror
----------------

### Synopsis
Turn an unmirrored aggregate into a mirrored aggregate.

---

### Description

Turn an unmirrored aggregate into a mirrored aggregate by adding a plex to it.  The plex is newly formed from disks chosen from a spare pool.

The named aggregate must currently be unmirrored.  Disks may be specified explicitly using the MirrorDisks list option in the same way as with the New-NcAggr and Add-NcAggr commands.  The number of disks indicated must match the number present in the existing aggregate.

If disks are not specified explicitly, then disks are automatically selected to match those in the aggregate's existing plex.

---

### Related Links
* [New-NcAggr](New-NcAggr)

* [Get-NcAggr](Get-NcAggr)

---

### Examples
> Example 1

New-NcAggrMirror -Name aggr1_mcc1
Mirror the given aggregate.

Name                      State       TotalSize  Used  Available Disks RaidType        RaidSize  Volumes
----                      -----       ---------  ----  --------- ----- --------        --------  -------
aggr1_mcc1                online         2.2 GB    3%     2.1 GB  10   raid_dp, mir...    16           3

---

### Parameters
#### **Name**
The name of the aggregate to mirror.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |1       |true (ByPropertyName)|Aggregate|

#### **MirrorDisks**
Specific list of mirror disks to add.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |2       |false        |

#### **AllowMixedRpm**
It true, allow disks with different RPMs in the mirror aggregate.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IgnorePoolChecks**
Disks in a plex are normally required to come from the same spare pool.  Similarly, disks in different plexes of a mirrored aggregate are required to come from different spare pools. This behavior is overridden with this option when it is set to true.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowSameCarrier**
If true, allows placing two disks from one carrier in one RAID group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PreCheck**
If specified, only check for the warnings without actually mirroring the aggregate.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Simulate**
Simulates the addition of a new plex to an existing aggregate. If set to "true", new plex won't be added but returns the disks that would be automatically selected for the creation of the new plex. By default, simulate option is set to false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
* DataONTAP.C.Types.Aggr.AggrAttributes

---

### Notes
Category: aggr
API: aggr-mirror
Family: cluster

---

### Syntax
```PowerShell
New-NcAggrMirror [-Name] <String> [[-MirrorDisks] <Object[]>] [-AllowMixedRpm] [-IgnorePoolChecks] [-AllowSameCarrier] [-PreCheck] [-Simulate] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
