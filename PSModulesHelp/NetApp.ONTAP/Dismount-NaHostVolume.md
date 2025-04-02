Dismount-NaHostVolume
---------------------

### Synopsis
Remove one or all mount points from a Windows volume.

---

### Description

Remove one or all mount points from a Windows volume.

This cmdlet must be run with administrative privileges.

---

### Related Links
* [New-NaHostVolume](New-NaHostVolume)

* [Remove-NaHostVolume](Remove-NaHostVolume)

* [Dismount-NaHostVolume](Dismount-NaHostVolume)

* [Get-NaHostVolume](Get-NaHostVolume)

---

### Examples
> Example 1

```PowerShell
Dismount-NaHostVolume J:\
Remove the drive letter J:\ from the volume.
```
> Example 2

Get-NaHostVolume -DiskIndex 4 | Dismount-NaHostVolume
Pass the volume object on the pipeline to remove all mount points (drive letter & folders) from a volume.

---

### Parameters
#### **MountPoint**
An active drive letter (i.e. 'G') or folder mount point to remove from the volume

|Type      |Required|Position|PipelineInput                 |Aliases                   |
|----------|--------|--------|------------------------------|--------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|DriveLetter<br/>AccessPath|

#### **Force**
Continue even if volume is in use. This might cause unexpected errors in any application using this volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VdsId**
The Guid object which uniquely identifies the volume in VDS.  Note that this is not the same as the volume guid path.  Specify this parameter directly or via the pipeline to remove all mount points from a single volume.

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
Dismount-NaHostVolume [-MountPoint] <String> [-Force] [<CommonParameters>]
```
```PowerShell
Dismount-NaHostVolume [-VdsId] <Guid> [-Force] [<CommonParameters>]
```
