Get-NcEfficiency
----------------

### Synopsis
Get efficiency information for volumes.

---

### Description

Get efficiency information for volumes.  The efficiency information includes the space savings that result from using several NetApp space savings technologies.

The cmdlet returns a VolEfficiencyInfo object for each volume it investigaes.  An EfficiencyInfo object contains the following values:
- Capacity:  The capacity of the storage object.
- Used:  The amount of space used on the storage object.
- Free:  The amount of space free on the storage object.
- Returns:  A ReturnsInfo object which describes the storage efficiency returns.

The VolEfficiency object returned contains the following volume-specific values:
- SnapshotCount:  The number of snapshots of the volume.
- SnapshotReserve:  The size of the snapshot reserve for the volume.
- SnapshotUsed:  The amount of space used by snapshots.
- SnapshotOverflow:  The amount of space consumed by snapshots outside of the snapshot reserve.
- Reserve:  The amount of space in the overwrite reserve.  This space is saved as overwrite space for LUNs and files that have space reservation enabled.
- ReserveUsed:  The amount of reserve space that is currently in use.
- SpaceReserve:  The type of space reservation of the volume.  This value can be:  none, volume, or file.
- QuotaCommitted:  The total amount of space committed on the volume to tree quotas.
- QuotaUsed:  The amount of space used on the volume by qtrees with tree quotas set.
- QuotaOvercommit:  The amount of space overcommitted to tree quotas.  If QuotaCommitted < Capacity then the quota overcommit is zero.
- TotalLunSize:  The total sze of all LUNs contained within this volume.
- LunOverprovisionPercent:  The LUN over-provisioning percent of the volume.  This value is equal to (TotalLunSize / Capacity) * 100.
- EffectiveUsed:  The amount of space that would be used without NetApp storage efficiency technologies.  This is equal to Used + Returns.
- EfficiencyPercent:  A percentage representing the overall storage efficiency of the volume.  This is equal to (EffectiveUsed / Capacity) * 100.
- Qtrees:  A Hashtable containing the qtrees that exist for the volume.

The QtreeEfficiency object contains the following qtree-specific values:
- HasTreeQuota:  If true, the qtree has a tree quota enabled.  When a tree quota is enabled for the qtree, the Capacity value is equal to the DiskLimit of the quota.  The Capacity, Used, and Free values are only considered valid when HasTreeQuota is true.
- Luns:  A Hashtable containing the LUNs contained within this qtree.

The LunEfficiency object contains the following LUN-specific values:
- IsThin:  If true, the LUN is thin provisioned (i.e. space reservation is not enabled).

The VolReturnsInfo object contains the following volume efficiency returns information:
- Dedupe:  The savings that result from using deduplication.
- Compression:  The savings that result from using compression.
- Snapshot:  The savings that result from using volume snapshots.  This is equal to:  Used - (SnapshotUsed / SnapshotCount).  We divide the snapshot used space by the number of snapshots to get an accurate savings calculation from volumes with long-running snapshots that effectively consume more space than the data.
- Cloning:  The savings that result from using NetApp Volume FlexClones.  This value is equal to the result of the volume-clone-split-estimate API, that is, the amount of additional space that would be consumed if the volume were no longer a clone.

The LunReturnsInfo object contains the following LUN efficiency information:
- Thin:  The savings that result from LUN thin provisioning.  This is equal to the LUN size minus the LUN space consumed.

---

### Examples
> Example 1

Get-NcEfficiency -Vserver vserver1 -Volume nfs
Get the efficiency information for the given volume on the given vserver.

SnapshotCount           : 10
SnapshotReserve         : 0
SnapshotUsed            : 14760075264
SnapshotOverflow        : 14760075264
Reserve                 : 0
ReserveUsed             : 0
SpaceReserve            : none
QuotaCommitted          : 0
QuotaUsed               : 0
QuotaOverCommit         : 0
TotalLunSize            : 0
LunOverprovisionPercent : 0
EffectiveUsed           : 2028179085721
EfficiencyPercent       : 944.4444839474745094776153564
Qtrees                  : {[, DataONTAP.C.Types.Efficiency.QtreeEfficiency]}
NcController            : 10.60.189.172
Vserver                 : vserver1
Name                    : nfs
Capacity                : 214748364800
Used                    : 94281019392
Free                    : 120467255296
Returns                 : 1933898066329

> Example 2

Get-NcEfficiency -Vserver dlamotta01
Get the efficiency information for all of the volumes on the given vserver.

Vserver: dlamotta01

Name                       Capacity       Used   SnapshotUsed    Returns  EffectiveUsed  EfficiencyPercent
----                       --------       ----   ------------    -------  -------------  -----------------
cifs                        95.0 GB     5.2 MB         2.1 MB     5.0 MB        10.3 MB               0.0%
cmodesr2                     3.0 GB   244.0 KB              0          0       244.0 KB               0.0%
dlamotta01_root_vol         19.0 MB   124.0 KB       720.0 KB    52.0 KB       176.0 KB               0.9%
luns                        95.0 GB     3.5 GB       251.9 MB     3.6 GB         7.1 GB               7.4%
luns_clone                  95.0 GB     3.5 GB         6.7 MB     6.9 GB        10.4 GB              11.0%
vol1_SM1                     9.5 GB  1004.0 KB         1.1 MB   899.6 KB         1.9 MB               0.0%
vol1_SM2                     9.5 GB  1004.0 KB         1.1 MB   906.7 KB         1.9 MB               0.0%

> Example 3

$eff = Get-NcEfficiency -Vserver dlamotta01
$eff | % { $_.Qtrees.Values }
View the information for all the qtrees on the given vserver.

Vserver: dlamotta01

Volume                   Name                      HasQtreeQuota     Capacity       Used
------                   ----                      -------------     --------       ----
cifs                                                   False                -          -
cifs                     qtree1                         True          10.0 GB          0
cmodesr2                                               False                -          -
dlamotta01_root_vol                                    False                -          -
luns                                                    True           5.0 GB          0
luns_clone                                             False                -          -
vol1_SM1                                               False                -          -
vol1_SM2                                               False                -          -

> Example 4

$eff = Get-NcEfficiency
$eff | % { $_.Qtrees.Values } | % { $_.Luns.Values }
Get all of the LUN information for the current cluster.

Vserver: costea01

Name                                   IsThin     Capacity       Used
----                                   ------     --------       ----
/vol/xenfcp_vol/xenfcp                  True        1.0 GB          0

   Vserver: dlamotta01

Name                                   IsThin     Capacity       Used
----                                   ------     --------       ----
/vol/luns/lun0                          True      150.0 GB   330.7 MB
/vol/luns/lun0_clone                    True      150.0 GB     3.2 GB
/vol/luns_clone/lun0                    True      150.0 GB   330.7 MB
/vol/luns_clone/lun0_clone              True      150.0 GB     3.2 GB

   Vserver: iscsivs1

Name                                   IsThin     Capacity       Used
----                                   ------     --------       ----
/vol/xenlun_vol/xenlun                  True        2.0 GB   100.4 MB

---

### Parameters
#### **Volume**
Volume for which to get efficiency information.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
Vserver for which to get efficiency information.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Efficiency.VolEfficiency

---

### Notes
Category: toolkit
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcEfficiency [[-Volume] <String[]>] [[-Vserver] <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
