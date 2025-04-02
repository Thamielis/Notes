Set-NcDiskFail
--------------

### Synopsis
Fail a file system disk.

---

### Description

Fail a file system disk.  Removes the specified file system disk from the RAID configuration, spinning the disk down when removal is complete.  Disk fail is used to remove a file system disk that may be logging excessive errors and requires replacement.  Note that if optional input parameter -Immediate is specified, the specified disk will be immediately failed out, and the RAID group to which the disk belongs will enter degraded mode (meaning a disk is missing from the RAID group).  If a spare disk at least as large as the disk being removed is available, the contents of the disk being removed will be reconstructed onto that spare disk.  If -Immediate is not specified, system will prefail the disk and its content will be copied to a replacement disk if a suitable spare disk is available, and afterwards the prefailed disk will be failed out.  The disk being failed is marked as 'broken', so that if it remains in the disk shelf, it will not be used by the filer as a spare disk.  If the disk is moved to another filer, that filer will use it as a spare.  This is not a recommended course of action, as the reason that the disk was failed may have been because it needed to be replaced.

To fail a spare disk, use Remove-NcDisk.

---

### Related Links
* [Remove-NcDisk](Remove-NcDisk)

* [Set-NcDiskUnfail](Set-NcDiskUnfail)

* [Get-NcDisk](Get-NcDisk)

---

### Examples
> Example 1

Set-NcDiskFail fas3070cluster01-01:0a.17
Fail RAID disk '0a.17' on node 'fas3070cluster01-01'.

DiskName          : fas3070cluster01-01:0a.17
NcController      : 10.61.172.155
Name              : fas3070cluster01-01:0a.17
DiskInventoryInfo : DataONTAP.C.Types.StorageDisk.DiskInventoryInfo
DiskOwnershipInfo : DataONTAP.C.Types.StorageDisk.DiskOwnershipInfo
DiskPaths         : {fas3070cluster01-01:0a.17, fas3070cluster01-02:0a.17}
DiskRaidInfo      : DataONTAP.C.Types.StorageDisk.DiskRaidInfo
DiskStatsInfo     : DataONTAP.C.Types.StorageDisk.DiskStatsInfo
DiskUid           : 20000018:6232F7F7:00000000:00000000:00000000:00000000:00000000:00000000:00000000:00000000
Bay               :
Shelf             :
Position          : dparity
Capacity          : 146010895680
RPM               : 15000
Paths             : 2
Pool              : 0
FW                : NA02
Model             : X275_S15K4146F15
Aggregate         : aggr0

---

### Parameters
#### **Name**
The name of the RAID disk to fail.  The disk name should use the format "<Node Name>:<Disk Name>", such as "VxeRubble-01:1a.02.23".

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Disk<br/>DiskName|

#### **Immediate**
Specify if disk is to be failed out immediately.  If not specified, the disk will be prefailed.

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
* DataONTAP.C.Types.StorageDisk.StorageDiskInfo

---

### Notes
Category: disk
API: disk-fail
Family: cluster

---

### Syntax
```PowerShell
Set-NcDiskFail [-Name] <String> [-Immediate] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
