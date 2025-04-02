ConvertTo-NaVmdk
----------------

### Synopsis
Convert a VHD or VHDX file into a VMDK file.

---

### Description

Convert a VHD or VHDX file into a VMDK file.

The source and destination files must reside inside of a Data ONTAP volume (accessed using a path starting with /vol/<volname>), a Data ONTAP attached LUN, or a Data ONTAP CIFS share (accessed using a mapped network drive or a UNC path starting with \\hostname\<share>).  The source and destination files must reside on the same controller and volume.

If the controller supplied in the Controller parameter is not the controller containing the files, the cmdlet consults the credentials cache and attempts to connect via HTTPS.  If credentials are not present in the credentials cache, an attempt to connect via RPC is made.  If a connection cannot be made, the cmdlet will fail.

---

### Related Links
* [ConvertTo-NaVhd](ConvertTo-NaVhd)

---

### Examples
> Example 1

ConvertTo-NaVmdk F:\VM1.vhd
Convert the VHD into a VMDK.  The VMDK will be given the name "VM1.vmdk".

Mode                LastWriteTime      Length Name
----                -------------      ------ ----
-a---        11/22/2011   1:11 PM         680 VM1.vmdk
-a---        11/22/2011   1:11 PM 21474836480 VM1-flat.vmdk

> Example 2

ConvertTo-NaVmdk \\benson\vol4\VHDs\testvhd.vhd \\benson\vol4\VMDKs\testvmdk.vmdk -VmdkType twoGbMaxExtentFlat
Converts the testvhd VHD into a VMDK of the twoGbMaxExtentFlat type.

Mode                LastWriteTime     Length Name
----                -------------     ------ ----
-a---        11/22/2011   1:52 PM        690 testvmdk.vmdk
-a---        11/22/2011   1:52 PM 2147483648 testvmdk-f001.vmdk
-a---        11/22/2011   1:52 PM 2147483648 testvmdk-f002.vmdk
-a---        11/22/2011   1:52 PM 2147483648 testvmdk-f003.vmdk
-a---        11/22/2011   1:52 PM 2147483648 testvmdk-f004.vmdk
-a---        11/22/2011   1:52 PM 2147483648 testvmdk-f005.vmdk
-a---        11/22/2011   1:52 PM 2147483648 testvmdk-f006.vmdk
-a---        11/22/2011   1:52 PM 2147483648 testvmdk-f007.vmdk
-a---        11/22/2011   1:52 PM 2147483648 testvmdk-f008.vmdk
-a---        11/22/2011   1:52 PM 2147483648 testvmdk-f009.vmdk
-a---        11/22/2011   1:52 PM 2147483648 testvmdk-f010.vmdk

> Example 3

ConvertTo-NaVmdk -SourceVhdx F:\VHDX\disk1.vhdx -DestinationVmdk F:\VMDK\TwoGbMaxExtent\disk1.vmdk -AdapterType IDE -VmdkType TwoGbMaxExtentFlat
Convert disk1.vhdx into a VMDK of type TwoGbMaxExtentFlat with an IDE adapter type.

Mode                LastWriteTime     Length Name
----                -------------     ------ ----
-a---         8/21/2012  10:40 AM        513 disk1.vmdk
-a---         8/21/2012  10:40 AM 2147483648 disk1-f001.vmdk
-a---         8/21/2012  10:40 AM 2147483648 disk1-f002.vmdk
-a---         8/21/2012  10:40 AM 2147483648 disk1-f003.vmdk
-a---         8/21/2012  10:40 AM 2147483648 disk1-f004.vmdk
-a---         8/21/2012  10:40 AM 2147483648 disk1-f005.vmdk
-a---         8/21/2012  10:40 AM   33554432 disk1-f006.vmdk

---

### Parameters
#### **SourceVhd**
Path to the source VHD file.  The path can be a path to the file on a Data ONTAP mounted LUN or a path to a Data ONTAP CIFS share (either a mapped network drive or a UNC path starting with \\hostname\<share>).

|Type      |Required|Position|PipelineInput                 |Aliases                    |
|----------|--------|--------|------------------------------|---------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|Source<br/>Vhd<br/>Fullname|

#### **DestinationVmdk**
Path to the destination VMDK file.  If not supplied, the VMDK file will be created in the same directory as the source VMDK.  The file must not exist.  The path can be a path to the file on the controller (starting with /vol/<volname>), a path to the file on a Data ONTAP mounted LUN, or a path to a Data ONTAP CIFS share (either a mapped network drive or a UNC path starting with \\hostname\<share>).

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[String]`|false   |2       |false        |Destination<br/>Vmdk|

#### **VmdkType**
The VMDK type of the VMDK file to be created.  The supported types are:  "vmfs", "monolithicFlat", and "twoGbMaxExtentFlat".  If not provided, the type will be "vmfs".

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VmdkDescriptor+CreateType]`|false   |3       |false        |

#### **AdapterType**
The adapter type to assign the created VMDK.  Supported values types are: "lsilogic", "buslogic", and "ide".  If not provided, the type will be "lsilogic".

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VmdkDescriptor+AdapterType]`|false   |4       |false        |

#### **VirtualHwVersion**
Specify the virtual hardware version of the virtual machine which will use this disk.
Default is 7 (supported on ESX/ESXi 4.x and later).

|Type    |Required|Position|PipelineInput|Aliases  |
|--------|--------|--------|-------------|---------|
|`[Byte]`|false   |5       |false        |HwVersion|

#### **SnapshotName**
The name of snapshot to be used during cloning.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|false   |named   |false        |Snapshot<br/>SnapName|

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

#### **SourceVhdx**
Path to the source VHDX file.  The path can be a path to the file on a Data ONTAP mounted LUN, a path to a Data ONTAP CIFS share (either a mapped network drive or a UNC path starting with \\hostname\<share>), or a path to a file residing on a Data ONTAP controller (starting with /vol/<volname>/).

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|Vhdx   |

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
ConvertTo-NaVmdk [-SourceVhd] <String> [[-DestinationVmdk] <String>] [[-VmdkType] <VmdkDescriptor+CreateType>] [[-AdapterType] <VmdkDescriptor+AdapterType>] [[-VirtualHwVersion] <Byte>] 
```
```PowerShell
[-SnapshotName <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
```PowerShell
ConvertTo-NaVmdk [-SourceVhdx] <String> [[-DestinationVmdk] <String>] [[-VmdkType] <VmdkDescriptor+CreateType>] [[-AdapterType] <VmdkDescriptor+AdapterType>] [[-VirtualHwVersion] <Byte>] 
```
```PowerShell
[-SnapshotName <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
