New-NaHostVolume
----------------

### Synopsis
Create a new Windows volume on an existing disk.

---

### Description

Create a new Windows volume on an existing disk.  This will automatically initialize an unitialized/offline disk and optionally format the new volume (by default)

This cmdlet must be run with administrative privileges.

---

### Related Links
* [Get-NaHostVolume](Get-NaHostVolume)

* [Remove-NaHostVolume](Remove-NaHostVolume)

* [Set-NaHostVolumeSize](Set-NaHostVolumeSize)

* [Mount-NaHostVolume](Mount-NaHostVolume)

* [Dismount-NaHostVolume](Dismount-NaHostVolume)

---

### Examples
> Example 1

New-NaHostVolume 4
Create a new volume on disk 4

MountPoints                    Disk       Size GuidPaths
-----------                    ----       ---- ---------
{E:\}                             4    10.0 GB {\\?\Volume{20a7fedf-f8e4-11e0-949b-00155da1ce00}\}

> Example 2

New-NaHostVolume 4 -Raw
Create a new raw (unformatted) volume

MountPoints                    Disk       Size GuidPaths
-----------                    ----       ---- ---------
{}                                4    10.0 GB {\\?\Volume{20a8008a-f8e4-11e0-949b-00155da1ce00}\}

> Example 3

New-NaHostVolume 4 J:\
Create a new volume with a specific mount point

MountPoints                    Disk       Size GuidPaths
-----------                    ----       ---- ---------
{J:\}                                4    10.0 GB {\\?\Volume{20a8008a-f8e4-11e0-949b-00155da1ce00}\}

---

### Parameters
#### **DiskIndex**
A windows disk index/number

|Type      |Required|Position|PipelineInput                 |Aliases       |
|----------|--------|--------|------------------------------|--------------|
|`[UInt32]`|true    |1       |true (ByValue, ByPropertyName)|Disk<br/>Index|

#### **MountPoint**
A drive letter (i.e. 'G') or the path to an empty folder to mount the new volume

|Type      |Required|Position|PipelineInput        |Aliases                   |
|----------|--------|--------|---------------------|--------------------------|
|`[String]`|false   |2       |true (ByPropertyName)|DriveLetter<br/>AccessPath|

#### **NoMount**
Do not automatically assign a drive letter

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Raw**
Do not format the new volume, leave it as a raw partition

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Label**
The label to assign the new file system

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Size**
The size in bytes of the new volume

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AllocationUnitSize**
The allocation unit (cluster) size for the volume.  Valid values are 4KB, 8KB, 16KB, 32KB, and 64KB

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Reclaim**
Free any blocks which formerly occupied the space used by the new volume

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UnmapSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.PowerShell.SDK.Cmdlets.Toolkit.Windows.HostVolume

---

### Notes
Category: host

---

### Syntax
```PowerShell
New-NaHostVolume [-DiskIndex] <UInt32> [[-MountPoint] <String>] [-NoMount] [-Raw] [-Label <String>] [-Size <String>] [-AllocationUnitSize <Int32>] [-Reclaim] [-UnmapSize <String>] 
```
```PowerShell
[<CommonParameters>]
```
