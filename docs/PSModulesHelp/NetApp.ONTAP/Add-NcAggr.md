Add-NcAggr
----------

### Synopsis
Add disks to the specified aggregate.

---

### Description

Add disks to the specified aggregate. The disks to add are specified in the same way as for New-NcAggr.  By the time the API returns, the disk(s) may not yet be completely added.  Use Get-NcAggr to query the aggregate status to determine when it has finished growing due to the added disk(s).  When the Upgrade64BitMode input is provided to this API, the API produces a set of results in the background.  These results are not available as output from Add-NcAggr.  Use the Get-NcAggr and Get-NcVol cmdlets to query the results of the 64-bit upgrade process on the aggregate and flexible volumes, respectively.

---

### Related Links
* [New-NcAggr](New-NcAggr)

---

### Examples
> Example 1

Add-NcAggr aggr2 -DiskCount 3
Add three disks to aggregate 'aggr2'.

Name  State  TotalSize Used Available Disks RaidType       RaidSize Volumes
----  -----  --------- ---- --------- ----- --------       -------- -------
aggr2 online  717.1 GB   0%  717.1 GB   8   raid_dp,normal    16          0

---

### Parameters
#### **Name**
Name of the aggregate to which the disks will be added.

|Type      |Required|Position|PipelineInput        |Aliases                    |
|----------|--------|--------|---------------------|---------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Aggregate<br/>AggregateName|

#### **DiskCount**
Number of disks to add, including the parity disks.  The disks will come from the pool of spare disks.  The smallest disks in this pool join the aggregate first, unless the DiskSize argument is specified. Either the DiskCount or Disks argument must be specified.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Int32]`|true    |named   |false        |Count  |

#### **ChecksumStyle**
Specifies the checksum style for the disks to be added to an aggregate.  This input is not allowed if a list of disks to use is specified through the Disks parameter.  The possible values: 
"advanced_zoned"  - advanced_zoned checksum (azcs)
"block"           - block.
By default, disks with same checksum style as the aggregate are selected.  Use this option to override that behavior and create a mixed checksum aggregate.  "zoned" is not supported as one of the possible values as a mixed checksum aggregate can support only block and advanced_zoned checksum styles.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DiskSize**
The individual disk size in bytes.  Disks that are within approximately 20% of the specified size will be selected.  If the DiskSize argument is not specified, existing groups are appended with disks that are the best match by size for the largest disk in the group.  When starting new groups, disks that are the best match by size for the largest disk in the last raid group are selected first, then smaller disks, and finally larger disks.  This DiskSize option is ignored if a specific list of disks is specified through the Disks parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt64]`|false   |named   |false        |

#### **GroupSelectionMode**
Specifies how Data ONTAP adds the specified disks to RAID groups.  Legitimate values are "last", "one", "new" or "all".  GroupSelectionMode is an optional argument, and the behavior when it is not used is selected by value of RaidGroup. If RaidGroup is used, the behavior is the same as for GroupSelectionMode "one". If RaidGroup is not used, the behavior is the same as for GroupSelectionMode "last".  The RaidGroup option must be used with GroupSelectionMode value "one", and it cannnot be used with others.  If the string value is "last", Data ONTAP adds the specified disks to the existing last RAID group first.  After the last RAID group is full, it creates one or more new RAID groups and adds the remaining disks to the new groups.  If the string value is "one", Data ONTAP adds the specified disks to the existing RAID group specified by RaidGroup option until this specified RAID group is full.  If the string value is "new", Data ONTAP creates one or more new RAID groups and adds the specified disks to the new groups, even if they would fit into an existing RAID group.  The name of new RAID groups are selected automatically.  It is not possible to specify the name for the new RAID groups.  If the string value is "all", Data ONTAP adds the specified disks to existing RAID groups first.  Only after all existing RAID groups are full, it creates one or more new RAID groups and adds the remaining disks to the new groups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ForceSparePool**
Disks in a plex are not normally permitted to span spare pools.  This behavior is overridden with this option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Upgrade64BitMode**
Allows the aggregate to grow past 16 TB and begin 64-bit upgrade.  If not supplied, adding disks past 16 TB to a 32-bit aggregate will fail.  Legitimate values are "check", "grow_all", "grow_none", and "grow_reserved".  If the "check" value is specified, Add-NcAggr produces a summary of the space impact which would result from upgrading the aggregate to 64-bit.  This summary includes the space usage of each contained volume after the volume is upgraded to 64-bit and the amount of space that must be added to the volume to successfully complete the 64-bit upgrade.  The summary can be obtained via the Get-NcAggr and Get-NcVol cmdlets.  The aggregate's summary is made available in the 'check' element that is part of the 'aggr-64bit-upgrade-info' typedef.  The flexible volumes' summary is made available in the 'check' element that is part of the 'volume-64bit-upgrade-info' typedef.  This option does not result in an upgrade to 64-bit or addition of disks.  If the "grow_all" value is specified, Add-NcAggr upgrades the aggregate to 64-bit if the total aggregate size after adding the specified disks exceeds 16TB.  This option allows Add-NcAggr to automatically grow volumes as needed if they run out of space due to the 64-bit upgrade.  The volumes will be grown to accommodate all the files within these volumes.  This option does not affect volumes which have autosize enabled.  If the "grow_none" value is specified, Add-NcAggr upgrades the aggregate to 64-bit if the total aggregate size after adding the specified disks exceeds 16TB.  This option does not allow Add-NcAggr to automatically grow volumes if they run out of space due to the 64-bit upgrade.  If the "grow_reserved" value is specified, Add-NcAggr upgrades the aggregate to 64-bit if the total aggregate size after adding the specified disks exceeds 16TB.  This option allows Add-NcAggr to automatically grow volumes if they run out of space due to the 64-bit upgrade, but only to accommodate the space reserved files within these volumes.  This option does not affect volumes which have autosize enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DiskType**
Type of disks to use: ATA, BSAS, EATA, FCAL, FSAS, LUN, SAS, SATA, SCSI, XATA, XSAS, or SSD.  This option is required when converting an existing aggregate to a hybrid one, or when operating on a hybrid aggregate.  Otherwise, the option is not required.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AllowMixedRpm**
If specified, disks in an aggregate are not required to have the same RPM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IgnorePoolChecks**
If specified, disks in a plex are not required to come from the same spare pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PreCheck**
If specified, only check for the warnings without actually adding the disks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ForceCacheSize**
If specified, force the addition of SSD disks to hybrid enabled aggregate by skipping the check for total (local + partner) hybrid SSD capacity. This can be used when the partner's cache capacity cannot be retrieved.
Warning: If specified, the administrator is responsible to ensure that the total limit will not be exceeded.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CacheRaidType**
Specifies the raid-type of the new RAID groups being created as part of the disk add operation. This option should be used while adding SSD disks for the first time to a hybrid-enabled aggregate. Possible values: raid4 and raid_dp. If not specified, the default value is the raid-type of the aggregate.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CacheRaidGroupSize**
The RAID group size of the new SSD RAID groups being created as part of the disk add operation. This option should be used while adding SSD disks for the first time to a hybrid-enabled aggregate.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **OutputJob**
If specified, output the job responsible for creating the aggregate.  Progress can be tracked using the job cmdlets.
This parameter is available in ONTAP 8.3 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Simulate**
Simulates the addition of disks to the given aggregate or UUID of the aggregate.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **RaidGroup**
Specifies the RAID group (for example rg0) to which the indicated disks are to be added.  By default, the controller fills up one RAID group with disks before starting another RAID group.  Suppose an aggregate currently has one RAID group of 12 disks and its RAID group size is 14.  If you add 5 disks to this aggregate, it will have one RAID group with 14 disks and another RAID group with 3 disks.  The filer does not evenly distribute disks among RAID groups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **DiskClass**
Class of disks to use. Possible values are:
"capacity" -  Capacity-oriented, near-line disk types. Includes disk types FSAS, BSAS and ATA.
"performance" - Performance-oriented, enterprise class disk types. Includes disk types FCAL and SAS.
"archive" - Archive class SATA disks in multi-disk carrier storage shelves. Includes disk type MSATA.
"solid-state" - Solid-state drives. Includes disk type SSD.
"array" - Logical storage devices backed by storage arrays and used by Data ONTAP as disks. Includes disk type LUN.
"virtual"- Virtual disks that are formatted and managed by VMware ESX. Includes disk type VMDISK.
Disks are grouped into classes based on  their performance characteristics. Disks belonging to the same class are compatible for use in the same aggregate. When this option is used, all disks belonging to the specified disk class are considered eligible for selection.
One of either "DiskType, "ActualDiskType" or "DiskClass" is required to be used when converting an existing aggregate to a hybrid one, or when operating on a hybrid aggregate. Otherwise, the option is not required.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ActualDiskType**
Actual disk type of disks to use, possible values are: 
ATA, BSAS, FCAL, FSAS, LUN, MSATA, SAS, SSD, or VMDISK.
When this option is used, only disks of the specified type will be selected for use in the aggregate. One of either "DiskType, "ActualDiskType" or "DiskClass" is required to be used when converting an existing aggregate to a hybrid one, or when operating on a hybrid aggregate. Otherwise, the option is not required.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Disks**
Specific list of disks to add to the aggregate.  Either the Disks or DiskCount argument must be specified.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|true    |named   |false        |

#### **AllowSameCarrier**
If specified, allow placing two disks from one carrier in one RAID group.
Using two disks from one carrier that houses multiple disks in one RAID group is not desirable. If that happens, Data ONTAP initiates a series of disk copy operations to correct that situation. Sometimes, selection of available spare disks makes it impossible to avoid placing two disks from one carrier in one RAID group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **StoragePool**
Name of the shared storage pool from which the capacity will be added.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **AllocationUnits**
The spare capacity in terms of number of allocation units to be added to a given aggregate.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrAttributes

---

### Notes
Category: aggr
API: aggr-add
Family: cluster

---

### Syntax
```PowerShell
Add-NcAggr [-Name] <String> -DiskCount <Int32> [-ChecksumStyle <String>] [-DiskSize <UInt64>] [-GroupSelectionMode <String>] [-ForceSparePool] [-Upgrade64BitMode <String>] [-DiskType 
```
```PowerShell
<String>] [-AllowMixedRpm] [-IgnorePoolChecks] [-PreCheck] [-ForceCacheSize] [-CacheRaidType <String>] [-CacheRaidGroupSize <Int32>] [-OutputJob] [-Simulate] [-Controller <NcController[]>] 
```
```PowerShell
[-RaidGroup <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcAggr [-Name] <String> -DiskCount <Int32> [-ChecksumStyle <String>] [-DiskSize <UInt64>] [-GroupSelectionMode <String>] [-ForceSparePool] [-Upgrade64BitMode <String>] [-AllowMixedRpm] 
```
```PowerShell
[-IgnorePoolChecks] [-PreCheck] [-ForceCacheSize] [-CacheRaidType <String>] [-CacheRaidGroupSize <Int32>] [-OutputJob] [-DiskClass <String>] [-Simulate] [-Controller <NcController[]>] 
```
```PowerShell
[-RaidGroup <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcAggr [-Name] <String> -DiskCount <Int32> [-ChecksumStyle <String>] [-DiskSize <UInt64>] [-GroupSelectionMode <String>] [-ForceSparePool] [-Upgrade64BitMode <String>] [-AllowMixedRpm] 
```
```PowerShell
[-IgnorePoolChecks] [-PreCheck] [-ForceCacheSize] [-CacheRaidType <String>] [-CacheRaidGroupSize <Int32>] [-OutputJob] [-ActualDiskType <String>] [-Simulate] [-Controller <NcController[]>] 
```
```PowerShell
[-RaidGroup <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcAggr [-Name] <String> -Disks <Object[]> [-GroupSelectionMode <String>] [-ForceSparePool] [-Upgrade64BitMode <String>] [-AllowSameCarrier] [-AllowMixedRpm] [-IgnorePoolChecks] 
```
```PowerShell
[-PreCheck] [-ForceCacheSize] [-CacheRaidType <String>] [-CacheRaidGroupSize <Int32>] [-OutputJob] [-Simulate] [-Controller <NcController[]>] [-RaidGroup <String>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcAggr [-Name] <String> [-GroupSelectionMode <String>] [-ForceSparePool] [-Upgrade64BitMode <String>] [-AllowMixedRpm] [-IgnorePoolChecks] [-PreCheck] [-ForceCacheSize] [-CacheRaidType 
```
```PowerShell
<String>] [-CacheRaidGroupSize <Int32>] -StoragePool <String> -AllocationUnits <Int32> [-OutputJob] [-Simulate] [-Controller <NcController[]>] [-RaidGroup <String>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
