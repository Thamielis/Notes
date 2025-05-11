ConvertTo-NaVhdx
----------------

### Synopsis
Convert a VMDK file, a fixed VHD file, or a Data ONTAP LUN into a VHDX file.

---

### Description

Convert a VMDK file, a fixed VHD file, or a Data ONTAP LUN into a VHDX file.

A VMDK file must be of type "vmfs", "monolithicFlat", or "twoGbMaxExtentFlat".

When converting from a Data ONTAP LUN, the destination VHD file must reside on a different LUN in the same volume.

The source and destination files must reside inside of a Data ONTAP volume (accessed using a path starting with /vol/<volname>), a Data ONTAP attached LUN, or a Data ONTAP CIFS share (accessed using a mapped network drive or a UNC path starting with \\hostname\<share>).  The source and destination files must reside on the same controller and volume.

If the controller supplied in the Controller parameter is not the controller containing the files, the cmdlet consults the credentials cache and attempts to connect via HTTPS.  If credentials are not present in the credentials cache, an attempt to connect via RPC is made.  If a connection cannot be made, the cmdlet will fail.

---

### Related Links
* [ConvertTo-NaVmdk](ConvertTo-NaVmdk)

---

### Examples
> Example 1

ConvertTo-NaVhdx -SourceVhd F:\VHD\win2k8r2.vhd -DestinationVhdx F:\VHDX\win2k8r2.vhdx
Convert a VHD file to a VHDX file.

Mode                LastWriteTime      Length Name
----                -------------      ------ ----
-a---         8/16/2012   3:05 PM 26847739904 win2k8r2.vhdx

> Example 2

ConvertTo-NaVhdx -SourceVMDK X:\VMDK\Monolithic\win2k8r2.vmdk -DestinationVhdx X:\VHDX\win2k8r2.vhdx
Convert a VMDK file in a CIFS share into a VHDX file.

Mode                LastWriteTime      Length  Name
----                -------------      ------  ----
-a---         8/16/2012   3:00 PM 26847739904  win2k8r2.vhdx

> Example 3

ConvertTo-NaVhdx -SourceVMDK /vol/vol2/cifs/VMDK/Monolithic/win2k8r2.vmdk -DestinationVhdx /vol/vol2/cifs/VHDX/win2k8r2.vhdx
Performs the same operation as Example 2, except it uses the direct path on the controller to the file.  This is useful if there is no CIFS share providing access to the VMDK file.

Name                                 Type            Size      Created     Modified Owner Group   Perm Empty
----                                 ----            ----      -------     -------- ----- -----   ---- -----
/vol/vol2/cifs/VHDX/win2k8r2.vhdx    file           25 GB    8/16/2012    8/16/2012     0     0   1077

> Example 4

ConvertTo-NaVhdx -SourceLun /vol/vol2/luns/lun0 -DestinationVhdx F:\VHDX\fromLUN.vhdx
Convert the Data ONTAP LUN into a VHDX.

Mode                LastWriteTime     Length  Name
----                -------------     ------  ----
-a---         8/16/2012   3:38 PM 10775166976 fromLUN.vhdx

---

### Parameters
#### **SourceVhd**
Absolute path to a fixed VHD file to convert to a VHDX file.
The path can be a path to a file on a Data ONTAP LUN, a path to a file on a Data ONTAP CIFS share (either a mapped network drive, or a UNC path starting with \\hostname\share), or a path to a file on a Data ONTAP controller (starting with /vol/<volname/).

|Type      |Required|Position|PipelineInput |Aliases         |
|----------|--------|--------|--------------|----------------|
|`[String]`|true    |1       |true (ByValue)|Vhd<br/>Fullname|

#### **DestinationVhdx**
Absolute path to the destination VHDX file.  The file must not yet exist.  If not specified and the source is either a VHD or VMDK, the destination VHDX will be created in the same directory alongside the source.
The path can be a path to a file on a Data ONTAP LUN, a path to a file on a Data ONTAP CIFS share (either a mapped network drive, or a UNC path starting with \\hostname\share), or a path to a file on a Data ONTAP controller (starting with /vol/<volname/).

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |2       |true (ByPropertyName)|Vhdx   |

#### **BlockSize**
The block size to assign the created VHDX file.  The block size defines the size of each payload chunk inside the VHDX.  The block size must be a power of 2 and at least 1 MB and at most 256 MB.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SnapshotName**
The name of snapshot to be used during cloning.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|false   |3       |false        |Snapshot<br/>SnapName|

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

#### **SourceVmdk**
Path to the source VMDK file.  The VMDK file must be of type "vmfs", "monolithicFlat", or "twoGbMaxExtentFlat".
The path can be a path to a file on a Data ONTAP LUN, a path to a file on a Data ONTAP CIFS share (either a mapped network drive, or a UNC path starting with \\hostname\share), or a path to a file on a Data ONTAP controller (starting with /vol/<volname/).
Note:  This cmdlet can convert a VMDK that is being used by a running VM.  Be sure to shutdown the VM or quiesce the filesystem before running this cmdlet.  Failing to do so may result in an inconsistent or corrupt result.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |true (ByValue)|

#### **Win2k3ScsiToIde**
Use this switch when converting a Windows Server 2003 SCSI VMDK to VHDX.  When specified, the cmdlet will perform the necessary steps to ensure the required IDE drivers are present on the virtual disk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FollowParent**
If specified, the parser will follow the VMDK parent descriptor and use the base VMDK for the clone operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SourceLun**
Path of a LUN to convert to a VHDX file.  Must start with /vol/<volname>/.  The following LUN types are supported: windows_2008, hyper_v, linux, aix, hpux, netware, vmware, xen

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |true (ByPropertyName)|Path   |

#### **SourceDiskIndex**
A Windows disk index of the disk to convert to a VHD.  The disk index must reference a Data ONTAP LUN or the cmdlet will fail.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[UInt32]`|true    |named   |true (ByPropertyName)|HostDiskIndex|

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
ConvertTo-NaVhdx [-SourceVhd] <String> [[-DestinationVhdx] <String>] [-BlockSize <String>] [[-SnapshotName] <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
ConvertTo-NaVhdx -SourceVmdk <String> [[-DestinationVhdx] <String>] [-BlockSize <String>] [-Win2k3ScsiToIde] [-FollowParent] [[-SnapshotName] <String>] [-Controller <AbstractController>] 
```
```PowerShell
[-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
```PowerShell
ConvertTo-NaVhdx -SourceLun <String> [[-DestinationVhdx] <String>] [-BlockSize <String>] [[-SnapshotName] <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
ConvertTo-NaVhdx -SourceDiskIndex <UInt32> [[-DestinationVhdx] <String>] [-BlockSize <String>] [[-SnapshotName] <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] 
```
```PowerShell
[<CommonParameters>]
```
