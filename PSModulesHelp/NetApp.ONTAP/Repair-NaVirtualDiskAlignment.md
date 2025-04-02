Repair-NaVirtualDiskAlignment
-----------------------------

### Synopsis
Perform an alignment operation on a misaligned virtual hard disk file.  If the virtual hard disk file contains only aligned partitions the cmdlet will do nothing.

---

### Description

Perform an alignment operation on a misaligned virtual hard disk file.  If the virtual hard disk file contains only aligned partitions the cmdlet will do nothing.  This cmdlet can align VHD and VHDX format virtual disks.

The virtual disk must be an MBR disk residing on a Data ONTAP LUN or Data ONTAP CIFS share.  Virtual disks inside a Data ONTAP volume not visible to the host are supported (accessed using a /vol/<volname>/<path> path).

When possible, the cmdlet will use Data ONTAP to offload the alignment operation.  The cmdlet will prompt for confirmation when a host-based copy is going to be used.  The switch, ForceHostCopy, can be used to force the cmdlet to use a host-based copy.  A host-based copy will use SCSI XCOPY when available, otherwise data will be copied from the source to the host, then from the host to the destination.

If the virtual hard disk file contains partitions that are already aligned, a cloning operation will be used to move the partition into the aligned virtual disk.  The ForceHostCopy switch disables this behavior.

The cmdlet backs up the virtual hard disk file with the original name plus the extension ".bkup"

---

### Related Links
* [Get-NaVirtualDiskAlignment](Get-NaVirtualDiskAlignment)

---

### Examples
> Example 1

Repair-NaVirtualDiskAlignment E:\misaligned.vhd
Align the partitions for the virtual hard disk file.

Mode                LastWriteTime      Length  Name
----                -------------      ------  ----
-a---          1/5/2012  12:21 PM 10737418752  misaligned.vhd

> Example 2

Repair-NaVirtualDiskAlignment C:\ClusterStorage\Volume2\VirtualDisks\Win2k3_VM1\win2k3-boot.vhdx
Align the given VHDX format virtual disk.

Mode                LastWriteTime      Length  Name
----                -------------      ------  ----
-a---          1/5/2012  12:21 PM 21487419392  win2k3-boot.vhdx

---

### Parameters
#### **VirtualDisk**
Path to the virtual hard disk.  This can be a fully-qualified Windows path or a path to a file inside a Data ONTAP volume (/vol/<volname>/<path>).  If the path is to a file inside a Data ONTAP volume an NaController must be specified using the Controller parameter or must be present in $global:CurrentNaController.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|FullName|

#### **ForceHostCopy**
If specified, the cmdlet will use a host based copy operation to perform the alignment.  A host-based copy will use SCSI XCOPY when available, otherwise data will be copied from the source to the host, then from the host to the destination.

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
Repair-NaVirtualDiskAlignment [-VirtualDisk] <String> [-ForceHostCopy] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
