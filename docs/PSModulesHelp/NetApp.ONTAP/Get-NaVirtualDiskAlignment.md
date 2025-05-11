Get-NaVirtualDiskAlignment
--------------------------

### Synopsis
Get the disk partitions of the given Virtual Hard Disk and determine if they are aligned.

---

### Description

Get the disk partitions of the given Virtual Hard Disk and determine if they are aligned.  VHD and VHDX format disks are supported.

The virtual disk must be an MBR disk.  Virtual disks inside a Data ONTAP volume not visible to the host are supported (accessed using a /vol/<volname>/<path> path).

---

### Related Links
* [Repair-NaVirtualDiskAlignment](Repair-NaVirtualDiskAlignment)

---

### Examples
> Example 1

Get-NaVirtualDiskAlignment E:\misaligned.vhd
Get the alignment information of the partitions contained in the virtual disk.

VirtualDisk: E:\misaligned.vhd

IsBootable    AbsoluteStartingLba             Size      IsEbr  IsAligned
----------    -------------------             ----      -----  ---------
False                          63         14680064      False      False

> Example 2

Get-NaVirtualDiskAlignment /vol/vol4/VHDs/w7.vhd
Get the alignment of the VHD file on the controller.

VirtualDisk: /vol/vol4/VHDs/w7.vhd

IsBootable    AbsoluteStartingLba             Size      IsEbr  IsAligned
----------    -------------------             ----      -----  ---------
True                         2048           204800      False       True
False                      206848         58511360      False       True

> Example 3

Get-NaVirtualDiskAlignment C:\ClusterStorage\Volume2\VirtualDisks\Win2k3_VM1\win2k3-boot.vhdx
Get the alignment of a VHDX virtual disk.

VirtualDisk: C:\ClusterStorage\Volume2\VirtualDisks\Win2k3_VM1\win2k3-boot.vhdx

IsBootable    AbsoluteStartingLba             Size       IsExtendedBootRecord  IsAligned
----------    -------------------             ----       --------------------  ---------
True                           63            20 GB                      False      False

---

### Parameters
#### **VirtualDisk**
Path to the virtual hard disk.  This can be a fully-qualified Windows path or a path to a file inside a Data ONTAP volume (/vol/<volname>/<path>).  If the path is to a file inside a Data ONTAP volume an NaController must be specified using the Controller parameter or must be present in $global:CurrentNaController.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|FullName|

#### **Controller**
The Data ONTAP controller object, embodied by an NaController object.  This parameter is returned by the Connect-NaController cmdlet.  If not specified, the value in the global variable CurrentNaController is used.

|Type                  |Required|Position|PipelineInput|Aliases         |
|----------------------|--------|--------|-------------|----------------|
|`[AbstractController]`|false   |named   |false        |Filer<br/>Server|

---

### Inputs

---

### Outputs
* DataONTAP.PowerShell.SDK.Cmdlets.HyperV.MbrPartition

---

### Notes
Category: host

---

### Syntax
```PowerShell
Get-NaVirtualDiskAlignment [-VirtualDisk] <String> [-Controller <AbstractController>] [<CommonParameters>]
```
