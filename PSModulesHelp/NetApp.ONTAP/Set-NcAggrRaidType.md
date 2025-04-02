Set-NcAggrRaidType
------------------

### Synopsis

---

### Description

Modify the RAID type for the given aggregate to the specified RaidType. This API can also selectively change the RAID type of specific raid groups in the aggregate based on the specified DiskType. The change remains effective even if the filer is rebooted.  

This API does not support modifying options of a striped aggregate.

---

### Related Links
* [Get-NcAggr](Get-NcAggr)

---

### Examples
> Example 1

Set-NcAggrRaidType -Name test_aggr -RaidType raid_dp
Set the RAID type to raid_dp for aggregate testaggr.

Name                      State       TotalSize  Used  Available Disks RaidType        RaidSize  Volumes
----                      -----       ---------  ----  --------- ----- --------        --------  -------
test_aggr                 online         2.9 TB    1%     2.9 TB   4   raid_dp, normal    14           3

---

### Parameters
#### **Name**
Name or UUID of the aggregate whose option is to be set.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |1       |true (ByPropertyName)|Aggregate|

#### **RaidType**
The type of RAID group used for this aggregate. The "raid4" setting  provides one parity disk per RAID group, while "raid_dp" provides two. Changing this option immediately changes the RAID group type for the RAID groups in the aggregate.  When upgrading RAID groups from "raid4" to "raid_dp", each RAID group begins a reconstruction onto a spare disk allocated for the second "dparity" parity disk.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **DiskType**
Type of disks to use : ATA, BSAS, FCAL, FSAS, LUN, SAS, SATA, or SSD.  This option is required if we want to change the raid type of raid groups created out of the specified disks only. Otherwise, if this is not specified then the raid type for all raid groups in the aggregate would change.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Simulate**
Simulates modifying the raid type of the aggregate.
This parameter is available in ONTAP 8.4 and later.

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
API: aggr-modify-raid-type
Family: cluster

---

### Syntax
```PowerShell
Set-NcAggrRaidType [-Name] <String> [-RaidType] <String> [-DiskType <String>] [-Simulate] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
