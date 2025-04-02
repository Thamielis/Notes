Get-NaHostVolume
----------------

### Synopsis
Get Windows volume information.

---

### Description

Get Windows volume information.

This cmdlet must be run with administrative privileges.

---

### Related Links
* [Get-NaHostDisk](Get-NaHostDisk)

* [New-NaHostVolume](New-NaHostVolume)

* [Set-NaHostVolumeSize](Set-NaHostVolumeSize)

* [Remove-NaHostVolume](Remove-NaHostVolume)

* [Mount-NaHostVolume](Mount-NaHostVolume)

* [Dismount-NaHostVolume](Dismount-NaHostVolume)

---

### Examples
> Example 1

Get-NaHostVolume
Get all Windows volumes.

MountPoints                    Disk       Size GuidPaths
-----------                    ----       ---- ---------
{}                                0   100.0 MB {\\?\Volume{6c208c1f-2a50-11e0-9070-806e6f6e6963}\}
{C:\}                             0    49.9 GB {\\?\Volume{6c208c20-2a50-11e0-9070-806e6f6e6963}\}
{S:\}                             2     5.0 GB {\\?\Volume{24385e54-d340-11e0-ad95-00155da1ce00}\, \\?\Volume{f4db2c...
{E:\}                             4    10.0 GB {\\?\Volume{20a7fb8e-f8e4-11e0-949b-00155da1ce00}\}
{F:\}                             5  1021.0 MB {\\?\Volume{20a7fe7b-f8e4-11e0-949b-00155da1ce00}\}

> Example 2

Get-NaHostVolume -DiskIndex 0
Get all volumes located on disk 0.

MountPoints                    Disk       Size GuidPaths
-----------                    ----       ---- ---------
{}                                0   100.0 MB {\\?\Volume{6c208c1f-2a50-11e0-9070-806e6f6e6963}\}
{C:\}                             0    49.9 GB {\\?\Volume{6c208c20-2a50-11e0-9070-806e6f6e6963}\}

> Example 3

Get-NaHostVolume C:\
Get a specific volume by drive letter.

MountPoints                    Disk       Size GuidPaths
-----------                    ----       ---- ---------
{C:\}                             0    49.9 GB {\\?\Volume{6c208c20-2a50-11e0-9070-806e6f6e6963}\}

> Example 4

Get-NaHostVolume "\\?\Volume{6c208c20-2a50-11e0-9070-806e6f6e6963}\"
Get a volume by volume guid path

MountPoints                    Disk       Size GuidPaths
-----------                    ----       ---- ---------
{C:\}                             0    49.9 GB {\\?\Volume{6c208c20-2a50-11e0-9070-806e6f6e6963}\}

---

### Parameters
#### **Path**
The mount point (i.e. G:, \\?\Volume{12345678-abcd-1234-abcd-1234567890ab}\) or a path to any file on the volume to process

|Type      |Required|Position|PipelineInput                 |Aliases |
|----------|--------|--------|------------------------------|--------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|GuidPath|

#### **VdsId**
The Guid object which uniquely identifies the volume in VDS.  Note that this is not the same as the volume guid path.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[Guid]`|true    |1       |true (ByValue, ByPropertyName)|

#### **DiskIndex**
A windows disk index/number

|Type      |Required|Position|PipelineInput                 |Aliases                         |
|----------|--------|--------|------------------------------|--------------------------------|
|`[UInt32]`|true    |1       |true (ByValue, ByPropertyName)|Disk<br/>Index<br/>HostDiskIndex|

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
Get-NaHostVolume [[-Path] <String>] [<CommonParameters>]
```
```PowerShell
Get-NaHostVolume [-VdsId] <Guid> [<CommonParameters>]
```
```PowerShell
Get-NaHostVolume [-DiskIndex] <UInt32> [<CommonParameters>]
```
