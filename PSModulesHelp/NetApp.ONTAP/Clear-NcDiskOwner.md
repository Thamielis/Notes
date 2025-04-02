Clear-NcDiskOwner
-----------------

### Synopsis
Removes ownership information on a disk.

---

### Description

Removes ownership information on a disk.

---

### Related Links
* [Get-NcDiskOwner](Get-NcDiskOwner)

* [Set-NcDiskOwner](Set-NcDiskOwner)

---

### Examples
> Example 1

Clear-NcDiskOwner fas3070cluster01-01:0a.27
Remove disk ownership from disk '0a.27' on node 'fas3070cluster01-01.

---

### Parameters
#### **Owner**
Remove ownership of all disks owned by Owner (i.e. a node).  Either Owner or OwnerId is mandatory.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |named   |true (ByPropertyName)|NodeName<br/>Node|

#### **All**
If specified, remove ownership information from all disks.  This option is supported in maintenance mode only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
If specified, override the RAID checks, such as whether the disk is part of an aggregate.

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

#### **Name**
The name of the disk to unassign.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Disk<br/>DiskName|

#### **OwnerId**
Remove ownership of all disks owned by this OwnerId (NVRAM ID).  This option is supported in maintenance mode only.

|Type     |Required|Position|PipelineInput        |Aliases               |
|---------|--------|--------|---------------------|----------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|NodeNvramId<br/>NodeId|

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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: disk
API: disk-sanown-remove-ownership
Family: cluster

---

### Syntax
```PowerShell
Clear-NcDiskOwner -Owner <String> [-All] [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Clear-NcDiskOwner [-Name] <String> -Owner <String> [-OwnerId <Int64>] [-Force] [-IsRootPartition] [-IsDataPartition] [-IsData1Partition] [-IsData2Partition] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Clear-NcDiskOwner [-OwnerId <Int64>] [-All] [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
