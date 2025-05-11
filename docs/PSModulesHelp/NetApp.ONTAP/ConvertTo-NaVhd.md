ConvertTo-NaVhd
---------------

### Synopsis
Convert a VMDK file, a VHDX file, a dynamic VHD file, or a Data ONTAP LUN into a VHD file.

---

### Description

Convert a VMDK file, a VHDX file, a dynamic VHD file, or a Data ONTAP LUN into a VHD file.

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

ConvertTo-NaVhd E:\Windows7_VM1.vmdk
Converts the VMDK file to a VHD file.  The VHD file will be named "Windows7_VM1.vhd".

Mode                LastWriteTime      Length 	Name
----                -------------      ------ 	----
-a---        11/22/2011  10:30 AM 30064771584 	Windows7_VM1.vhd

> Example 2

ConvertTo-NaVhd \\benson\vol4\VMDKs\Windows7.vmdk \\benson\vol4\VHDs\Windows7.vhd
Converts the VMDK file on the vol4 share on benson into a VHD file.

Mode                LastWriteTime      Length Name
----                -------------      ------ ----
-a---        11/22/2011  10:44 AM 30064771584 Windows7.vhd

> Example 3

ConvertTo-NaVhd /vol/vol4/VMDKs/Windows7.vmdk /vol/vol4/VHDs/Windows7.vhd
Performs the same conversion as example 2, except it uses the direct path on the controller to the file.  This is useful if there is no CIFS share providing access to the VMDK file.

Name                                     Type            Size      Created     Modified Owner Group   Perm Empty
----                                     ----            ----      -------     -------- ----- -----   ---- -----
/vol/vol4/VHDs/Windows7.vhd              file           28 GB   11/22/2011   11/22/2011     0     0   1077

> Example 4

ConvertTo-NaVhd -SourceDiskIndex 2 -DestinationVhd E:\fromLUN.vhd
Convert the LUN that is presented as disk 2 into a VHD file.

Mode                LastWriteTime      Length Name
----                -------------      ------ ----
-a---         2/10/2012   2:33 PM 21474836992 fromLUN.vhd

> Example 5

ConvertTo-NaVhd -SourceVhd E:\dynamic.vhd -DestinationVhd E:\fixed.vhd
Convert the dynamic VHD into a fixed VHD.

Mode                LastWriteTime     Length Name
----                -------------     ------ ----
-a---         2/10/2012   2:44 PM 4294967808 fixed.vhd

> Example 6

ConvertTo-NaVhd -SourceVhdx F:\VHDX\disk1.vhdx -DestinationVhd F:\VHD\disk1.vhd
Convert the disk1.vhdx file into a VHD.

Mode                LastWriteTime      Length  Name
----                -------------      ------  ----
-a---         8/21/2012  10:32 AM 10770973184  disk1.vhd

---

### Parameters
#### **SourceVmdk**
Path to the source VMDK file.  The VMDK file must be of type "vmfs", "monolithicFlat", or "twoGbMaxExtentFlat".  The path can be a path to the file on the controller (starting with /vol/<volname>), a path to the file on a Data ONTAP mounted LUN, or a path to a Data ONTAP CIFS share (either a mapped network drive or a UNC path starting with \\hostname\<share>).
Note:  This cmdlet can convert a VMDK that is being used by a running VM.  Be sure to shutdown the VM or quiesce the filesystem before running this cmdlet.  Failing to do so may result in an inconsistent or corrupt result.

|Type      |Required|Position|PipelineInput        |Aliases                     |
|----------|--------|--------|---------------------|----------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Fullname<br/>Vmdk<br/>Source|

#### **DestinationVhd**
Path to the destination VHD file.  If not supplied, the VHD file will be created in the same directory as the source VMDK.  The file must not exist.  The path can be a path to the file on the controller (starting with /vol/<volname>), a path to the file on a Data ONTAP mounted LUN, or a path to a Data ONTAP CIFS share (either a mapped network drive or a UNC path starting with \\hostname\<share>).

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[String]`|false   |2       |false        |Vhd<br/>Destination|

#### **Win2k3ScsiToIde**
Use this switch when converting a Windows Server 2003 SCSI VMDK to VHD.  When specified, the cmdlet will perform the necessary steps to ensure the required IDE drivers are present on the virtual disk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FollowParent**
If specified, the parser will follow the VMDK parent descriptor and use the base VMDK for the clone operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **SourceLun**
Path of a LUN to convert to a VHD file.  Must start with /vol/<volname>/.  The following LUN types are supported: windows_2008, hyper_v, linux, aix, hpux, netware, vmware, xen

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |true (ByPropertyName)|Path   |

#### **SourceDiskIndex**
A Windows disk index of the disk to convert to a VHD.  The disk index must reference a Data ONTAP LUN or the cmdlet will fail.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[UInt32]`|true    |named   |true (ByPropertyName)|HostDiskIndex|

#### **SourceVhd**
Absolute path to a dynamic VHD file to convert to a fixed VHD file.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |named   |false        |DynamicVhd|

#### **ForceHostCopy**
If specified, the cmdlet will not attempt to offload any of the copying associated with converting a dynamic VHD to a fixed VHD to Data ONTAP.  A host-based copy will use SCSI XCOPY when available, otherwise data will be copied from the source to the host, then from the host to the destination.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SourceVhdx**
Absolute path to a VHDX file to convert to a VHD.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Vhdx   |

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
ConvertTo-NaVhd [-SourceVmdk] <String> [[-DestinationVhd] <String>] [-Win2k3ScsiToIde] [-FollowParent] [[-SnapshotName] <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize 
```
```PowerShell
<String>] [<CommonParameters>]
```
```PowerShell
ConvertTo-NaVhd -SourceLun <String> [[-DestinationVhd] <String>] [[-SnapshotName] <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
```PowerShell
ConvertTo-NaVhd -SourceDiskIndex <UInt32> [[-DestinationVhd] <String>] [[-SnapshotName] <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
```PowerShell
ConvertTo-NaVhd -SourceVhd <String> [-ForceHostCopy] [[-DestinationVhd] <String>] [[-SnapshotName] <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
ConvertTo-NaVhd [-SourceVhdx] <String> [[-DestinationVhd] <String>] [[-SnapshotName] <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
