Format-NaHostVolume
-------------------

### Synopsis
Perform a quick NTFS format on an existing Windows volume.  Optionally, this can trigger a reclaim of any data previously held by the volume.

---

### Description

Perform a quick NTFS format on an existing Windows volume.  Optionally, this can trigger a reclaim of any data previously held by the volume.

This cmdlet must be run with administrative privileges.

---

### Related Links
* [New-NaHostVolume](New-NaHostVolume)

* [Remove-NaHostVolume](Remove-NaHostVolume)

---

### Examples
> Example 1

```PowerShell
Format-NaHostVolume F:\
Format the volume mounted at drive F:\ with default options.
```
> Example 2

```PowerShell
Format-NaHostVolume "\\?\Volume{20a7fe7b-f8e4-11e0-949b-00155da1ce00}\" -Label "DB Logs" -Reclaim
Format a volume by Guid path with a file system label.  Reclaim any previously used space on the storage controller.
```

---

### Parameters
#### **Path**
The mount point (i.e. G:, \\?\Volume{12345678-abcd-1234-abcd-1234567890ab}\) or a path to any file on the volume to process

|Type      |Required|Position|PipelineInput                 |Aliases                                  |
|----------|--------|--------|------------------------------|-----------------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|HostDrivePath<br/>GuidPath<br/>MountPoint|

#### **Label**
The label to assign the volume

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **AllocationUnitSize**
The allocation unit (cluster) size for the volume.  Valid values are 4KB, 8KB, 16KB, 32KB, and 64KB

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **Reclaim**
Free any blocks which formerly occupied the space used by the new volume.  This option is only supported on Windows Vista sp1, Server 2008 or later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
Continue even if volume is in use. This might cause unexpected errors in any application using this volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UnmapSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **VdsId**
The Guid object which uniquely identifies the volume in VDS.  Note that this is not the same as the volume guid path.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[Guid]`|true    |1       |true (ByValue, ByPropertyName)|

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
Format-NaHostVolume [-Path] <String> [[-Label] <String>] [[-AllocationUnitSize] <Int32>] [-Reclaim] [-Force] [-UnmapSize <String>] [<CommonParameters>]
```
```PowerShell
Format-NaHostVolume [-VdsId] <Guid> [[-Label] <String>] [[-AllocationUnitSize] <Int32>] [-Reclaim] [-Force] [-UnmapSize <String>] [<CommonParameters>]
```
