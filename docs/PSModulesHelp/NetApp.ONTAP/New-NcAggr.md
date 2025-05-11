New-NcAggr
----------

### Synopsis
Create a new aggregate with the given name.

---

### Description

Create a new aggregate with the given name.  Up to 200 aggregates can be created on each controller.  The aggregate may not yet be operational immediately after the API returns.

---

### Related Links
* [Add-NcAggr](Add-NcAggr)

---

### Examples
> Example 1

New-NcAggr aggr2 -Node fas3070cluster01-02 -DiskCount 5 -RaidType raid_dp
Create a new 64-bit aggregate 'aggr2'.

Name  State  TotalSize Used Available Disks RaidType       RaidSize Volumes
----  -----  --------- ---- --------- ----- --------       -------- -------
aggr2 online  358.5 GB   0%  358.5 GB   5   raid_dp,normal    16          0

---

### Parameters
#### **Name**
Name of the aggregate to create.  The aggregate name can contain letters, numbers, and the underscore character(_), but the first character must be a letter or underscore.

|Type      |Required|Position|PipelineInput        |Aliases                    |
|----------|--------|--------|---------------------|---------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Aggregate<br/>AggregateName|

#### **Node**
Target node to create aggregate.  If no node name is provided, aggregate will be created on the local node.  If one node name is provided, the aggregate (striped or not_striped based on the striping input) will be created on that node.  When multiple nodes are specified, a striped aggregate will be created across multiple nodes.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Striped**
Specify to create a striped aggregate.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DiskCount**
Number of disks to place into the aggregate, including parity disks.  The disks in this newly-created aggregate come from the spare disk pool.  The smallest disks in this pool join the aggregate first, unless the DiskSize argument is provided.  Either DiskCount or Disks must be supplied.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Int32]`|true    |named   |false        |Count  |

#### **DiskSize**
Disk size in bytes.  Disks that are within 10% of the specified size will be selected for use in the aggregate.  If DiskSize is not specified, existing groups are appended with disks that are the best match for the largest disk in the group.  When starting new groups, the smallest disks are selected first.  This option is ignored if a specific list of disks to use is specified through the Disks parameter.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **DiskType**
Type of disks to use: ATA, BSAS, EATA, FCAL, FSAS, LUN, SAS, SATA, SCSI, SSD, XATA, or XSAS.  This option is needed only when disks of different types are connected to the filer.  It is not allowed if a list of disks to use is specified through the Disks parameter.  An aggregate can never be created using a mix of disks of different types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ChecksumStyle**
Specifies the checksum style for the aggregate.  This input is not allowed if a list of disks to use is specified through the Disks parameter. The possible values:
"advanced_zoned"  - advanced_zoned checksum (azcs)
"block"           - block
"zoned"           - zoned

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RaidSize**
Specifies the maximum number of disks in each RAID group in the aggregate.  The maximum value for this parameter is 28.  The default value is platform-dependent.  The valid range of values is also platform-dependent, but never wider than [2..28].

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **ForceSparePool**
Disks in a plex are not normally permitted to span spare pools.  This behavior is overridden with this parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BlockType**
The indirect block format that the aggregate can have.  It can be either 32_bit or 64_bit.  Specifying 64_bit allows creation of aggregates that can be larger than 16TB.  The default is 64_bit. Possible values: 32_bit, 64_bit

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

#### **Mirrored**
If specified, the new aggregate be mirrored (have two plexes).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeInAutobalance**
If specified, the aggregate is included for Auto Balance aggregate processing
This parameter is available in ONTAP 9.0 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AutobalanceState**
The state of the aggregate being balanced.  Possible values: "disabled", "balanced", "unbalanced", "ineligible".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ForceSmallAggregate**
If specified, force the creation of a 2-disk RAID4 aggregate, or a 3-disk or 4-disk RAID-DP aggregate.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Encrypt**
If specified, enables encryption for the newly created aggregate

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|false   |named   |false        |EnableEncryption|

#### **Simulate**
Specifies to return the list of disks getting used to create the new aggregate.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SnaplockType**
Specifies the type of Snaplock aggregate to be created. Possible values - 'compliance', 'enterprise' or 'non - snaplock'.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AggrNode**
Node where the aggregate currently resides.To instantiate the please create object using New-Object DataONTAP.C.Types.Aggr.AggrNode. This parameter is supported with Rest only.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Aggr.AggrNode]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **RaidType**
Specifies the type of RAID groups to use in the new aggregate.  Possible values: raid4, raid_dp. The default value is raid4 on most platforms.

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
Actual disk type of disks to use, values can be: 
ATA, BSAS, FCAL, FSAS, LUN, MSATA, SAS, SSD, or VMDISK.
When this option is used, only disks of the specified type will be selected for use in the aggregate. One of either "DiskType, "ActualDiskType" or "DiskClass" is required to be used when converting an existing aggregate to a hybrid one, or when operating on a hybrid aggregate. Otherwise, the option is not required.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RPM**
Rotational speed of disks in revolutions per minute.  Possible values are: 5400, 7200, 10000, and 15000. This option is needed only when disks with different rotational speeds are connected to the filer.  It is not allowed if a list of disks to use is specified through the Disks parameter.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Disks**
Specific list of disks to use for the new aggregate.  Either DiskCount or Disks must be supplied.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|true    |named   |false        |

#### **MirrorDisks**
List of mirror disks to use.  It must contain the same number of disks specified in 'Disks'.  Cannot be used when Mirrored is specified.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |false        |

#### **AllowSameCarrier**
If specified, allow placing two disks from one carrier in one RAID group.
Using two disks from one carrier that houses multiple disks in one RAID group is not desirable. If that happens, Data ONTAP initiates a series of disk copy operations to correct that situation. Sometimes, selection of available spare disks makes it impossible to avoid placing two disks from one carrier in one RAID group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrAttributes

---

### Notes
Category: aggr
API: aggr-create
Family: cluster

---

### Syntax
```PowerShell
New-NcAggr [-Name] <String> [-Node <String[]>] [-Striped] -DiskCount <Int32> [-DiskSize <Int64>] [-DiskType <String>] [-ChecksumStyle <String>] [-RaidSize <Int32>] [-ForceSparePool] 
```
```PowerShell
[-BlockType <String>] [-AllowMixedRpm] [-IgnorePoolChecks] [-PreCheck] [-Mirrored] [-IncludeInAutobalance] [-AutobalanceState <String>] [-ForceSmallAggregate] [-Encrypt] [-Simulate] 
```
```PowerShell
[-SnaplockType <String>] [-AggrNode <DataONTAP.C.Types.Aggr.AggrNode>] [-Controller <NcController[]>] [-RaidType <String>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcAggr [-Name] <String> [-Node <String[]>] [-Striped] -DiskCount <Int32> [-DiskSize <Int64>] [-ChecksumStyle <String>] [-RaidSize <Int32>] [-ForceSparePool] [-BlockType <String>] 
```
```PowerShell
[-AllowMixedRpm] [-IgnorePoolChecks] [-PreCheck] [-Mirrored] [-IncludeInAutobalance] [-AutobalanceState <String>] [-ForceSmallAggregate] [-Encrypt] [-DiskClass <String>] [-Simulate] 
```
```PowerShell
[-SnaplockType <String>] [-AggrNode <DataONTAP.C.Types.Aggr.AggrNode>] [-Controller <NcController[]>] [-RaidType <String>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcAggr [-Name] <String> [-Node <String[]>] [-Striped] -DiskCount <Int32> [-DiskSize <Int64>] [-ChecksumStyle <String>] [-RaidSize <Int32>] [-ForceSparePool] [-BlockType <String>] 
```
```PowerShell
[-AllowMixedRpm] [-IgnorePoolChecks] [-PreCheck] [-Mirrored] [-IncludeInAutobalance] [-AutobalanceState <String>] [-ForceSmallAggregate] [-Encrypt] [-ActualDiskType <String>] [-Simulate] 
```
```PowerShell
[-SnaplockType <String>] [-AggrNode <DataONTAP.C.Types.Aggr.AggrNode>] [-Controller <NcController[]>] [-RaidType <String>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcAggr [-Name] <String> [-Node <String[]>] [-Striped] [-RPM <Int32>] [-RaidSize <Int32>] [-ForceSparePool] [-BlockType <String>] [-AllowMixedRpm] [-IgnorePoolChecks] [-PreCheck] 
```
```PowerShell
[-Mirrored] [-IncludeInAutobalance] [-AutobalanceState <String>] [-ForceSmallAggregate] [-Encrypt] [-Simulate] [-SnaplockType <String>] [-AggrNode <DataONTAP.C.Types.Aggr.AggrNode>] 
```
```PowerShell
[-Controller <NcController[]>] [-RaidType <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
New-NcAggr [-Name] <String> [-Node <String[]>] [-Striped] -Disks <Object[]> [-MirrorDisks <Object[]>] [-RaidSize <Int32>] [-ForceSparePool] [-BlockType <String>] [-AllowSameCarrier] 
```
```PowerShell
[-AllowMixedRpm] [-IgnorePoolChecks] [-PreCheck] [-Mirrored] [-IncludeInAutobalance] [-AutobalanceState <String>] [-ForceSmallAggregate] [-Encrypt] [-Simulate] [-SnaplockType <String>] 
```
```PowerShell
[-AggrNode <DataONTAP.C.Types.Aggr.AggrNode>] [-Controller <NcController[]>] [-RaidType <String>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
