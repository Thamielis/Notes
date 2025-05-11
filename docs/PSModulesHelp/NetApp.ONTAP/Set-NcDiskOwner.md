Set-NcDiskOwner
---------------

### Synopsis
Changes ownership on a disk.

---

### Description

Changes ownership on a disk.  The normal usage is when there is no current owner or to assign a disk to a pool.

---

### Related Links
* [Get-NcDiskOwner](Get-NcDiskOwner)

* [Clear-NcDiskOwner](Clear-NcDiskOwner)

---

### Examples
> Example 1

```PowerShell
Get-NcDisk 0a.27 | Set-NcDiskOwner -Owner fas3070cluster01-01
Assign disk '0a.27' to node 'fas3070cluster01-01'.
```
> Example 2

```PowerShell
Set-NcDiskOwner 0a.27 -OwnerId 118054408
Set owner of disk '0a.27' to the node with NVRAM ID '118054408'.
```
> Example 3

```PowerShell
Get-NcNode fas3070cluster01-01 | Get-NcDiskOwner -OwnershipType unowned | Set-NcDiskOwner -Owner fas3070cluster01-01
Assume ownership of all unowned disks attached to node 'fas3070cluster01-01'.
```

---

### Parameters
#### **Name**
Name of disk to assign.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Disk<br/>DiskName|

#### **Owner**
Assign disk to specific owner (node).  Either Owner or OwnerId must be specified.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |2       |true (ByPropertyName)|NodeName<br/>Node|

#### **Pool**
Assign disk to specific pool, e.g. '0' or '1'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **Checksum**
Assign checksum type to disk.  Option may only be specified on a RAID array LUNs.  Possible values: 'block' or 'zoned'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Force**
Specify if assigning disks which are already owned a filer.  However, if that filer is up and has put a reservation on the disk, even the Force option won't work.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsRootPartition**
Specify to set owner of only the root partition of this disk

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsDataPartition**
Specify to set owner of only the data partition of this disk

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

#### **CopyOwnerFrom**
The disk from which ownership information is to be copied for this disk.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **OwnerId**
Assign disk to specific owner ID (NVRAM ID).  Either Owner or OwnerId must be specified.

|Type      |Required|Position|PipelineInput|Aliases               |
|----------|--------|--------|-------------|----------------------|
|`[UInt32]`|true    |named   |false        |NodeNvramId<br/>NodeId|

#### **IsData1Partition**
Specify to execute AssignOwner only on data1 partition of disk.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsData2Partition**
Specify to execute AssignOwner only on data2 partition of disk.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DiskCount**
Assign specified count of disks.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **DiskType**
Assign specified type of disk or set of disks.
Type of disk: ATA, BSAS, EATA, FCAL, FSAS, LUN, MSATA, SAS, SATA, SCSI, SSD, BSSD, XATA, XSAS, or unknown.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **All**
Assign all unowned visible disks to the specified node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Auto**
Auto-assign unowned disks which are on loops where only one filer owns the disks and the pool information is the same.  No other input parameters are allowed when specifying this option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: disk
API: disk-sanown-assign
Family: cluster

---

### Syntax
```PowerShell
Set-NcDiskOwner [-Name] <String> [[-Owner] <String>] [-Pool <UInt32>] [-Checksum <String>] [-Force] [-IsRootPartition] [-IsDataPartition] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcDiskOwner [-Name] <String> [[-CopyOwnerFrom] <String>] [-Pool <UInt32>] [-Checksum <String>] [-Force] [-IsRootPartition] [-IsDataPartition] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcDiskOwner [-Name] <String> -OwnerId <UInt32> [-Pool <UInt32>] [-Checksum <String>] [-Force] [-IsRootPartition] [-IsDataPartition] [-IsData1Partition] [-IsData2Partition] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcDiskOwner [[-Owner] <String>] [-Pool <UInt32>] [-Checksum <String>] [-Force] -DiskCount <Int32> [-DiskType <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcDiskOwner [[-Owner] <String>] -All [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcDiskOwner [[-Owner] <String>] -Auto [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcDiskOwner [[-CopyOwnerFrom] <String>] -DiskCount <Int32> [-DiskType <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcDiskOwner -OwnerId <UInt32> [-Pool <UInt32>] [-Checksum <String>] [-Force] -DiskCount <Int32> [-DiskType <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
