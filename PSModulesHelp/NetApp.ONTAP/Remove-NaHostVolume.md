Remove-NaHostVolume
-------------------

### Synopsis
Remove a Windows volume from a disk.

---

### Description

Remove a Windows volume from a disk.

This cmdlet must be run with administrative privileges.

---

### Related Links
* [New-NaHostVolume](New-NaHostVolume)

* [Remove-NaHostVolume](Remove-NaHostVolume)

* [Format-NaHostVolume](Format-NaHostVolume)

---

### Examples
> Example 1

```PowerShell
Remove-NaHostVolume J:\
Remove the J:\ volume from its parent disk.
```

---

### Parameters
#### **Path**
The mount point (i.e. G:, \\?\Volume{12345678-abcd-1234-abcd-1234567890ab}\) or a path to any file on the volume to process

|Type      |Required|Position|PipelineInput                 |Aliases                   |
|----------|--------|--------|------------------------------|--------------------------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|HostDrivePath<br/>GuidPath|

#### **Reclaim**
Free any blocks formerly occupied by the volume

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
* 

---

### Notes
Category: host

---

### Syntax
```PowerShell
Remove-NaHostVolume [[-Path] <String>] [-Reclaim] [-Force] [-UnmapSize <String>] [<CommonParameters>]
```
```PowerShell
Remove-NaHostVolume [-VdsId] <Guid> [-Reclaim] [-Force] [-UnmapSize <String>] [<CommonParameters>]
```
