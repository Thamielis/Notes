Switch-NcDiskOwner
------------------

### Synopsis
Changes ownership on disks already belonging to an owner.

---

### Description

Changes ownership on disks already belonging to an owner.

---

### Related Links
* [Get-NcDiskOwner](Get-NcDiskOwner)

* [Clear-NcDiskOwner](Clear-NcDiskOwner)

* [Set-NcDiskOwner](Set-NcDiskOwner)

---

### Examples
> Example 1

```PowerShell
Switch-NcDiskOwner -OldOwner fas3070cluster01-01 -NewOwner fas3070cluster01-02 -Force
Forcibly reassign all disks from one node to another.
```

---

### Parameters
#### **OldOwner**
Name of old owner.  This form takes all disks currently belonging to the specific old owner, and reassigns them to a new owner.
Note: This parameter is not available in ONTAP 8.3 or later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OldOwnerId**
NVRAM ID of old owner.  This form takes all disks currently belonging to the specific old owner ID, and reassign them to a new owner.  Either OldOwner or OldOwnerId must be specified, but not both.
Note: This parameter is mandatory in ONTAP 8.3 or later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **NewOwner**
Name of new owner.  This form will assign all the disks belonging to the old owner to the specific owner.
Note: This parameter is not available in ONTAP 8.3 or later. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NewOwnerId**
NVRAM ID of new owner.  This form will assign all the disks belonging to the old owner to the specific owner ID. Either NewOwner or NewOwnerId (or both) must be specified.
Note: This parameter is mandatory in ONTAP 8.3 or later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **Force**
Specify if reassigning disks which are owned by another node.  However, if that filer is up and has put a reservation on the disk, even the force option won't work.  In this case reassign must be run on the filer which owns the disks. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DiskName**
Specify the Disk Name whose owner need to be change. This parameter is supported with Rest only.

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
* 

---

### Notes
Category: disk
API: disk-sanown-reassign
Family: cluster

---

### Syntax
```PowerShell
Switch-NcDiskOwner [-OldOwner <String>] [-OldOwnerId <UInt32>] [-NewOwner <String>] [-NewOwnerId <UInt32>] [-Force] [-DiskName <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
