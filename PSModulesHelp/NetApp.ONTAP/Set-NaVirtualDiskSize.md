Set-NaVirtualDiskSize
---------------------

### Synopsis
Resize a VHD or VHDX format virtual disk.

---

### Description

Resize a VHD or VHDX format virtual disk.  A VHD must reside on a Data ONTAP LUN.  A VHDX may reside on a Data ONTAP LUN or a Data ONTAP CIFS share.  The cmdlet supports growing and shrinking fixed size VHD and VHDX files.  The cmdlet also supports growing dynamic VHDX files.  If necessary, the NTFS file system inside the virtual disk is resized.

A new VHD size must be between 12 MB and 2040 GB.  A new VHDX size must be between 12 MB and 64 TB.  Any blocks added or removed are zeroed on the Data ONTAP storage controller.  Growing the virtual disk consumes no space until additional data is written, and shrinking the virtual disk reclaims all of the removed space.

The file to be resized must be specified with a fully-qualified path that resides on a Data ONTAP LUN or, for VHDX files, a Data ONTAP CIFS share.  Cluster-shared volumes (CSVs) are supported.  Administrator privileges are required to use this cmdlet.

---

### Related Links
* [New-NaVirtualDisk](New-NaVirtualDisk)

* [Remove-NaHostFile](Remove-NaHostFile)

---

### Examples
> Example 1

Set-NaVirtualDiskSize J:\GoldenVM1.vhd +100g
Increase the VHD file 'GoldenVM1.vhd' by 100 GB.

Mode                LastWriteTime       Length Name
----                -------------       ------ ----
-a---         8/24/2011   4:46 PM 214748365312 GoldenVM1.vhd

> Example 2

Set-NaVirtualDiskSize E:\VM1.vhd +10%
Increase the size of VM1.vhd by 10%.

Mode                LastWriteTime       Length Name
----                -------------       ------ ----
-a---         8/24/2011   4:46 PM 214748365312 VM1.vhd

> Example 1

Set-NaVirtualDiskSize C:\ClusterStorage\Volume2\VirtualDisks\Win2k8R2_VM1.vhdx 90GB
Increase the size of the given VHDX format virtual disk.

Mode                LastWriteTime      Length Name
----                -------------      ------ ----
-a---         5/15/2013   4:23 PM 96628375552 win2k8r2_vm1.vhdx

---

### Parameters
#### **FullName**
The fully-qualified name of the VHD file to be resized.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|Name   |

#### **Size**
Specify the VHD size using the following format:
[+|-]<number>[k|m|g|t|%]
If a leading '+' or '-' appears, it indicates that the VHD size is to be increased or decreased (respectively) by the indicated amount, else the amount is the absolute size to set.  The optional trailing 'k', 'm', 'g', and 't' indicates the desired units, namely 'kilobytes', 'megabytes', 'gigabytes', and 'terabytes' (respectively).  The optional trailing '%' indicates to increase or decrease the size of the VHD by a percentage of its current size.  If the trailing unit character doesn't appear, then <number> is interpreted as the number of bytes desired.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |2       |true (ByValue, ByPropertyName)|

#### **Preserve**
Specify to leave all partitions within the VHD untouched.  This is useful if the VHD file contains a non-Windows partition style, such as EXT3.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipUnmap**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UnmapSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Minimum**
Specify to shrink the VHD file as far as possible.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

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
Set-NaVirtualDiskSize [-FullName] <String> [-Size] <String> [-Preserve] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
```PowerShell
Set-NaVirtualDiskSize [-FullName] <String> -Minimum [-Preserve] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
