New-NcClone
-----------

### Synopsis
Clone a file or LUN.

---

### Description

Clone a file or LUN.  This is a constant-time, synchronous operation.

---

### Related Links
* [Get-NcLun](Get-NcLun)

---

### Examples
> Example 1

```PowerShell
New-NcClone testvol exchangeLun exchangeLunClone -SpaceReserved $false
Clone LUN 'exchangeLun' in volume testvol.  The result must be thin and have the name 'exchangeLunClone'.
```
> Example 2

```PowerShell
Get-NcLun /vol/testvol/exchangeLun | New-NcClone -SpaceReserved $false
Create a thin clone of LUN '/vol/testvol/exchangeLun'.
```

---

### Parameters
#### **Volume**
Name of the volume where the source and destination files or LUNs reside.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **SourcePath**
Relative path of the source file or source LUN inside the volume.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |2       |true (ByPropertyName)|Source<br/>Path|

#### **DestinationPath**
Relative path of the destination file or destination LUN inside the volume.  The destination must be in same volume as the source.  If not specified, the destination is taken as the source appended with "Clone".

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|false   |3       |true (ByPropertyName)|Destination|

#### **TokenUuid**
Token which was used to reserve split load for creation of file or LUN clones. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |4       |true (ByPropertyName)|Token  |

#### **Snapshot**
Snapshot name from which to clone the source file or LUN.  If not specified, the contents of the active filesystem will be used. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|false   |named   |true (ByPropertyName)|SnapshotName|

#### **SpaceReserved**
The space reservation setting of the destination clone.  By default space reservation is inherited from source. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IgnoreStreams**
If specified, clone only the base file and ignore streams on source or destination. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IgnoreLocks**
If specified, clone even if (advisory/mandatory) byte_range locks or share_mode locks exist on the source or destination. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **QosPolicyGroup**
Quality of service policy group name to assign to the created flexclone file. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **EnableAutodelete**
If specified, clones will be autodeleted to reclaim space when the volume runs out of space.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsBackup**
Specifies whether the clone is being created for backup - that is source file will get periodically modified, but the clone file should not be modified. The default value is false. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **DestinationVolume**
Name of the volume where the destination files resides. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **BlockRange**
List of block ranges for sub-file cloning. This parameter is supported with REST only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **VolumeUuid**
Volume Uuid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
Category: clone
API: clone-create
Family: vserver

---

### Syntax
```PowerShell
New-NcClone [-Volume] <String> [-SourcePath] <String> [[-DestinationPath] <String>] [[-TokenUuid] <String>] [-Snapshot <String>] [-SpaceReserved <Boolean>] [-IgnoreStreams] [-IgnoreLocks] 
```
```PowerShell
[-QosPolicyGroup <String>] [-EnableAutodelete] [-IsBackup <Boolean>] [-DestinationVolume <String>] [-VserverContext <String>] [-VolumeUuid <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
