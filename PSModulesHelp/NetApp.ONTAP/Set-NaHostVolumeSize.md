Set-NaHostVolumeSize
--------------------

### Synopsis
Grow or shrink a Windows volume.

---

### Description

Grow or shrink a Windows volume.  This is done non-disruptively on active volumes. Note that in some cases due to unmovable files or parent disk size, it may not be possible to grow or shrink as much as you would like.

This cmdlet must be run with administrative privileges and is only supported on Windows Vista sp1, Server 2008 or later.

---

### Related Links
* [New-NaHostVolume](New-NaHostVolume)

* [Get-NaHostVolume](Get-NaHostVolume)

* [Remove-NaHostVolume](Remove-NaHostVolume)

* [Mount-NaHostVolume](Mount-NaHostVolume)

* [Dismount-NaHostVolume](Dismount-NaHostVolume)

---

### Examples
> Example 1

```PowerShell
Set-NaHostVolumeSize E:\ -Minimum
Shrink the E:\ volume to the minimum possible size.
```
> Example 2

```PowerShell
Set-NaHostVolumeSize E:\ -Size "+50%"
Grow the E:\Volume by 50%.
```

---

### Parameters
#### **Path**
The mount point (i.e. G:, \\?\Volume{12345678-abcd-1234-abcd-1234567890ab}\) or a path to any file on the volume to process

|Type      |Required|Position|PipelineInput                 |Aliases                   |
|----------|--------|--------|------------------------------|--------------------------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|HostDrivePath<br/>GuidPath|

#### **Size**
Shrink or grow the volume by a specific size. Do not use with -Minimum or -Maximum.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Minimum**
Shrink the volume to the minimum size possible. Do not use with -Size or -Maximum.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Maximum**
Grow the volume to the maximum size for the parent disk or LUN. Do not use with -Size or -Minimum

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Set-NaHostVolumeSize [[-Path] <String>] [-Size <String>] [-Minimum] [-Maximum] [<CommonParameters>]
```
```PowerShell
Set-NaHostVolumeSize [-VdsId] <Guid> [-Size <String>] [-Minimum] [-Maximum] [<CommonParameters>]
```
