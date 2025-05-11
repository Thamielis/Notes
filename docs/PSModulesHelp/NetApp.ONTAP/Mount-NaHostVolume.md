Mount-NaHostVolume
------------------

### Synopsis
Add a drive letter or empty folder mount point to an existing Windows volume.

---

### Description

Add a drive letter or empty folder mount point to an existing Windows volume.

This cmdlet must be run with administrative privileges.

---

### Related Links
* [Dismount-NaHostVolume](Dismount-NaHostVolume)

* [Get-NaHostVolume](Get-NaHostVolume)

* [New-NaHostVolume](New-NaHostVolume)

* [Remove-NaHostVolume](Remove-NaHostVolume)

* [Set-NaHostVolumeSize](Set-NaHostVolumeSize)

---

### Examples
> Example 1

Mount-NaHostVolume E:\ -MountPoint C:\NewDir
Add a folder mount point to the volume currently mounted at E:\.

MountPoints                    Disk       Size GuidPaths
-----------                    ----       ---- ---------
{E:\, C:\NewDir\}                 4    10.0 GB {\\?\Volume{20a7fedf-f8e4-11e0-949b-00155da1ce00}\}

> Example 2

Dismount-NaHostVolume Q:\ | Mount-NaHostVolume -MountPoint E:\
Change the drive letter of a volume.

MountPoints                    Disk       Size GuidPaths
-----------                    ----       ---- ---------
{E:\}                             4    10.0 GB {\\?\Volume{20a7fedf-f8e4-11e0-949b-00155da1ce00}\}

---

### Parameters
#### **Path**
The mount point (i.e. G:, \\?\Volume{12345678-abcd-1234-abcd-1234567890ab}\) or a path to any file on the volume to process

|Type      |Required|Position|PipelineInput                 |Aliases                   |
|----------|--------|--------|------------------------------|--------------------------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|HostDrivePath<br/>GuidPath|

#### **MountPoint**
A drive letter (i.e. 'G') or the path to an empty folder to mount the volume

|Type      |Required|Position|PipelineInput        |Aliases                   |
|----------|--------|--------|---------------------|--------------------------|
|`[String]`|true    |2       |true (ByPropertyName)|DriveLetter<br/>AccessPath|

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
Mount-NaHostVolume [[-Path] <String>] [-MountPoint] <String> [<CommonParameters>]
```
```PowerShell
Mount-NaHostVolume [-VdsId] <Guid> [-MountPoint] <String> [<CommonParameters>]
```
