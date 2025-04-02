Restore-NaHostFile
------------------

### Synopsis
Restore a single file from a snapshot.

---

### Description

Restore a single file from a snapshot.  The file is cloned from a temporary LUN backed by the given snapshot.

This cmdlet requires Data ONTAP 8.1 or later.

---

### Related Links
* [Copy-NaHostVolume](Copy-NaHostVolume)

* [Remove-NaHostVolume](Remove-NaHostVolume)

---

### Examples
> Example 1

Restore-NaHostFile K:\vm1.vhd snapshot1
Restore the file K:\vm1.vhd from snapshot1.

Mode                LastWriteTime     Length 	  Name
----                -------------     ------ 	  ----
-a---         5/30/2012   4:09 PM 107374182912  vm1.vhd

---

### Parameters
#### **Path**
Full path to the file to restore.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Snapshot**
Name of the snapshot to use to restore the file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **MountPoint**
Mount point to give to the temporary LUN.  If the LUN is not assigned a drive letter by the host, this mount point is used.  If not provided and a drive letter is not automatically assigned by the host, the cmdlet will fail.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Overwrite**
If provided, the original file will be overwritten.  If not provided, a backup of the original file will be kept with the extension ".bkup".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Controller**
The Data ONTAP controller object, embodied by an NaController object.  This parameter is returned by the Connect-NaController cmdlet.  If not specified, the value in the global variable CurrentNaController is used.

|Type                  |Required|Position|PipelineInput|Aliases         |
|----------------------|--------|--------|-------------|----------------|
|`[AbstractController]`|false   |named   |false        |Filer<br/>Server|

#### **SkipUnmap**

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
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)

---

### Notes
Category: host

---

### Syntax
```PowerShell
Restore-NaHostFile [-Path] <String> [-Snapshot] <String> [-MountPoint <String>] [-Overwrite] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
