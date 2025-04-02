ConvertTo-NaLun
---------------

### Synopsis
Create a LUN from a virtual hard disk (VHD or VHDX).

---

### Description

Create a LUN from a virtual hard disk (VHD or VHDX).  The virtual hard disk file must reside on a Data ONTAP LUN.  The path of the LUN to create must lie on the same volume as the LUN containing the VHD file or the cmdlet will fail.

If the controller supplied in the Controller parameter is not the controller containing the VHD file, the cmdlet consults the credentials cache and attempts to connect via HTTPS.  If credentials are not present in the credentials cache, an attempt to connect via RPC is made.  If a connection cannot be made, the cmdlet will fail.

---

### Related Links
* [ConvertTo-NaVhd](ConvertTo-NaVhd)

---

### Examples
> Example 1

ConvertTo-NaLun E:\VM1.vhd /vol/vol4/fromVhd
Convert the VHD file VM1.vhd into a LUN.

Path                                      TotalSize   SizeUsed Protocol     Online Mapped  Thin  Comment
----                                      ---------   -------- --------     ------ ------  ----  -------
/vol/vol4/fromVhd                           20.0 GB   136.6 MB windows_2008  True  False   True

> Example 2

ConvertTo-NaLun -SourceVhdx F:\VHDX\disk1.vhdx -DestinationLun /vol/vol2/luns/disk1 -Type windows_2008
Create a LUN from the given VHDX file.

Path                                      TotalSize   SizeUsed Protocol     Online Mapped  Thin  Comment
----                                      ---------   -------- --------     ------ ------  ----  -------
/vol/vol2/luns/disk1                        10.0 GB    75.6 MB windows_2008  True  False   True

---

### Parameters
#### **SourceVhd**
Virtual hard disk file to create a new LUN from.

|Type      |Required|Position|PipelineInput        |Aliases                    |
|----------|--------|--------|---------------------|---------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Source<br/>Vhd<br/>Fullname|

#### **DestinationLun**
The path to give the new LUN.  The new LUN must reside in the same volume as the LUN containing the source VHD.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |2       |false        |Lun    |

#### **Reserved**
If specified, the created LUN will have space reservation enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Type**
OS type to give the created LUN.  If not specified, the created LUN will have the type "windows_2008".  Issue "help New-NaLun -Parameter Type" for more information on LUN OS types.  The following types are supported: windows_2008, hyper_v, linux, aix, hpux, netware, vmware, xen

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **SnapshotName**
The name of snapshot to be used during cloning.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|false   |4       |false        |Snapshot<br/>SnapName|

#### **Controller**
The Data ONTAP controller object, embodied by an NaController object.  This parameter is returned by the Connect-NaController cmdlet.  If not specified, the value in the global variable CurrentNaController is used.

|Type                  |Required|Position|PipelineInput|Aliases         |
|----------------------|--------|--------|-------------|----------------|
|`[AbstractController]`|false   |named   |false        |Filer<br/>Server|

#### **SourceVhdx**
VHDX file from which to create a LUN.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.Types.Lun.LunInfo

---

### Notes
Category: host

---

### Syntax
```PowerShell
ConvertTo-NaLun [-SourceVhd] <String> [-DestinationLun] <String> [-Reserved] [[-Type] <String>] [[-SnapshotName] <String>] [-Controller <AbstractController>] [<CommonParameters>]
```
```PowerShell
ConvertTo-NaLun -SourceVhdx <String> [-DestinationLun] <String> [-Reserved] [[-Type] <String>] [[-SnapshotName] <String>] [-Controller <AbstractController>] [<CommonParameters>]
```
