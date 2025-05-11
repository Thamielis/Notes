New-NaVirtualDisk
-----------------

### Synopsis
Rapidly create a VHD file on a LUN or CIFS share mounted on a Windows host.

---

### Description

Rapidly create a VHD file on a LUN or CIFS share mounted on a Windows host.

This cmdlet creates a VHD file between 12 MB and 2040 GB in size.  Smaller files are created nearly instantly, while the largest ones typically finish in seconds or minutes.  The file blocks are zeroed on the Data ONTAP storage controller using block deallocation, so the VHD file consumes no space until data is written to it.

This cmdlet can also create a VHDX file between 12MB and 64TB in size.  By default the cmdlet will deallocate blocks on the Data ONTAP storage controller, but the -Dynamic switch allows the creation of dynamic VHDX files which will remain block-aligned as they grow.

The file to be created must be specified with a fully-qualified path that resides on a Data ONTAP LUN.  Cluster-shared volumes (CSVs) are supported.  Administrator privileges are required to use this cmdlet.

In order to create a file on a CIFS share, a connection to the Data ONTAP controller must be made.  If the Controller parameter is not specified and the global CurrentNaController variable is not present, the cmdlet consults the credentials cache to attempt to make a connection.  If a connection cannot be made, the cmdlet will fail.

---

### Related Links
* [Get-NaHostDisk](Get-NaHostDisk)

* [Set-NaVirtualDiskSize](Set-NaVirtualDiskSize)

---

### Examples
> Example 1

New-NaVirtualDisk j:\vm1.vhd (1tb)
Create a 1TB VHD file on the J: drive.

Mode         LastWriteTime        Length Name
----         -------------        ------ ----
-a---  7/22/2011   1:27 PM 1099511624192 vm1.vhd

---

### Parameters
#### **FullName**
The fully-qualified name of the VHD file to be created.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|Name   |

#### **Size**
Size in bytes of the VHD file to be created.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |2       |true (ByValue, ByPropertyName)|

#### **Controller**
In order to create a file on a CIFS share, a connection to the Data ONTAP controller hosting the CIFS share must be made.  This parameter is returned by the Connect-NaController or Connect-NcController cmdlet.  If not present, the value in the global variable CurrentNaController or CurrentNcController will be used.  If no global variables are present, the cmdlet consults the credentials cache and attempts to make a connection.  If no connection can be made, the cmdlet will fail.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[AbstractController]`|false   |named   |false        |

#### **SkipUnmap**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UnmapSize**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Vhdx**
If specified, the cmdlet will create a VHDX file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Dynamic**
If specified, create a dynamic VHDX file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BlockSize**
The block size to assign the created VHDX file.  The block size defines the size of each payload chunk inside the VHDX.  The block size must be a power of 2 and at least 1 MB and at most 256 MB.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

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
New-NaVirtualDisk [-FullName] <String> [-Size] <String> [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
```PowerShell
New-NaVirtualDisk [-FullName] <String> [-Size] <String> -Vhdx [-Dynamic] [[-BlockSize] <String>] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
