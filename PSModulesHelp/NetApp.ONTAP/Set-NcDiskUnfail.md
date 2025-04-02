Set-NcDiskUnfail
----------------

### Synopsis
Unfail a disk in the broken pool.

---

### Description

Unfail a disk in the broken pool, by clearing its FDR (Failed Disk Registry) entry and unfailing it at the Storage Layer, as necessary.  If -MakeSpare is specified, the disk is returned to the spare pool.  Otherwise, label assimilation will bring the disk back according to its on-disk labels, with one of four possible outcomes.

1. Disk becomes a spare.  This is the common case.  The disk becomes a spare upon unfail, because its parent volume is complete and online.
2. Disk is assimilated into former volume.  This is a recovery scenario.  The disk is brought back into an existing volume, which may result in this volume coming back online.
3. Disk is assimilated into a new partial volume.  This may occur in the rare case that the disk's former volume was destroyed or moved.
4. Disk returned to broken pool.  This is the case if a fatal error occurs in process of unfailing the disk.

---

### Related Links
* [Set-NcDiskFail](Set-NcDiskFail)

* [Remove-NcDisk](Remove-NcDisk)

* [Get-NcDisk](Get-NcDisk)

---

### Examples
> Example 1

Set-NcDiskUnfail fas3070cluster01-01:0a.27
Unfail the disk '0a.27' on node 'fas3070cluster01-01'.

DiskName          : fas3070cluster01-01:0a.27
NcController      : 10.61.172.155
Name              : fas3070cluster01-01:0a.27
DiskInventoryInfo : DataONTAP.C.Types.StorageDisk.DiskInventoryInfo
DiskOwnershipInfo : DataONTAP.C.Types.StorageDisk.DiskOwnershipInfo
DiskPaths         : {fas3070cluster01-02:0a.27, fas3070cluster01-01:0a.27}
DiskRaidInfo      : DataONTAP.C.Types.StorageDisk.DiskRaidInfo
DiskStatsInfo     : DataONTAP.C.Types.StorageDisk.DiskStatsInfo
DiskUid           : 20000018:6232DB31:00000000:00000000:00000000:00000000:00000000:00000000:00000000:00000000
Bay               :
Shelf             :
Position          : present
Capacity          : 146010895680
RPM               : 15000
Paths             : 2
Pool              : 0
FW                : NA02
Model             : X275_S15K4146F15
Aggregate         :

---

### Parameters
#### **Name**
The name of the spare disk to unfail.  The disk name should use the format "<Node Name>:<Disk Name>", such as "VxeRubble-01:1a.02.23".

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Disk<br/>DiskName|

#### **MakeSpare**
Specify to force the disk to become a spare.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Spare  |

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
* DataONTAP.C.Types.StorageDisk.StorageDiskInfo

---

### Notes
Category: disk
API: disk-unfail
Family: cluster

---

### Syntax
```PowerShell
Set-NcDiskUnfail [-Name] <String> [-MakeSpare] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
