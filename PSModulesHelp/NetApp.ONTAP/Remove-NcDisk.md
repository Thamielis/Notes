Remove-NcDisk
-------------

### Synopsis
Remove a spare disk.

---

### Description

Remove a spare disk.  Removes the specified spare disk from the RAID configuration, spinning the disk down when removal is complete.  You can use disk remove to remove a spare disk so that it can be used by another filer (as a replacement for a failed disk or to expand file system space).

To remove a RAID disk, use Set-NcDiskFail.

---

### Related Links
* [Set-NcDiskFail](Set-NcDiskFail)

* [Set-NcDiskUnfail](Set-NcDiskUnfail)

* [Get-NcDisk](Get-NcDisk)

---

### Examples
> Example 1

```PowerShell
Remove-NcDisk fas3070cluster01-01:0a.27 | select DiskRaidInfo -ExpandProperty DiskRaidInfo
Move spare disk '0a.27' on node 'fas3070cluster01-01' to the broken disk pool.  Display the result to see the disk in the 'broken' container.

NcController            : 10.61.172.155
ActiveNodeName          : fas3070cluster01-01
ContainerType           : broken
DiskAggregateInfo       :
DiskOutageInfo          : DataONTAP.C.Types.StorageDisk.DiskOutageInfo
DiskSpareInfo           :
DiskUid                 : 20000018:6232DB31:00000000:00000000:00000000:00000000:00000000:00000000:00000000:00000000
EffectiveDiskType       : SAS
PhysicalBlocks          : 35098773
Position                : present
SparePool               : spare
UsedBlocks              : 34816000
PhysicalBlocksSpecified : True
UsedBlocksSpecified     : True

```

---

### Parameters
#### **Name**
The name of the spare disk to remove.  The disk name should use the format "<Node Name>:<Disk Name>", such as "VxeRubble-01:1a.02.23".

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Disk<br/>DiskName|

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
API: disk-remove
Family: cluster

---

### Syntax
```PowerShell
Remove-NcDisk [-Name] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
