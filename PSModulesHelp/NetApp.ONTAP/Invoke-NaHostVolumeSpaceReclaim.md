Invoke-NaHostVolumeSpaceReclaim
-------------------------------

### Synopsis
Reclaim free space on a Windows volume that is hosted on a Data ONTAP LUN.

---

### Description

Reclaim free space on a Windows volume that is hosted on a Data ONTAP LUN.

This cmdlet examines the NTFS file system on a Windows volume, locates all free space, and deallocates the corresponding blocks on the Data ONTAP storage controller.  No difference is apparent from Windows' perspective, but all space not consumed by files on the volume is freed on the storage controller.

Cluster-shared volumes (CSVs) are supported, but this cmdlet uses a different reclamation algorithm due to CSV limitations.  A CSV may appear to become up to 98% full during the reclamation process, but this should not pose a problem even for LUNs that are not space-reserved.  There is no requirement for the CSV to be in redirected or maintenance mode to use this cmdlet.

This cmdlet may be run while the Windows volume is online and undergoing active I/O.  Administrator privileges are required to use this cmdlet.

---

### Related Links
* [Get-NaHostVolume](Get-NaHostVolume)

---

### Examples
> Example 1

```PowerShell
Invoke-NaHostVolumeSpaceReclaim f:
Reclaim all free space on the LUN mounted as F:\ on the local host.
```

---

### Parameters
#### **Path**
The mount point (i.e. G:, \\?\Volume{12345678-abcd-1234-abcd-1234567890ab}\) or a path to any file on the volume to process

|Type      |Required|Position|PipelineInput                 |Aliases |
|----------|--------|--------|------------------------------|--------|
|`[String]`|false   |1       |true (ByValue, ByPropertyName)|GuidPath|

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
Invoke-NaHostVolumeSpaceReclaim [[-Path] <String>] [-UnmapSize <String>] [<CommonParameters>]
```
```PowerShell
Invoke-NaHostVolumeSpaceReclaim [-VdsId] <Guid> [-UnmapSize <String>] [<CommonParameters>]
```
