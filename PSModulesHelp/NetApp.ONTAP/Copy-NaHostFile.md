Copy-NaHostFile
---------------

### Synopsis
Copy a file between LUNs mounted on a Windows host, or within a LUN mounted on a windows host.

---

### Description

Copy a file between LUNs mounted on a Windows host, or within a LUN mounted on a windows host.

The source and destination files must reside on LUNs contained in the same volume.  The destination file must not already exist.  If the controller supplied in the Controller parameter is not the controller containing the LUNs, the cmdlet consults the credentials cache and attempts to connect via HTTPS.  If credentials are not present in the credentials cache, an attempt to connect via RPC is made.  If a connection cannot be made, the cmdlet will fail.

The source and destination files must be specified with a fully-qualified path that resides on a Data ONTAP LUN.  Cluster-shared volumes (CSVs) are supported.  Administrator privileges are required to use this cmdlet.

---

### Related Links
* [Remove-NaHostFile](Remove-NaHostFile)

* [Restore-NaHostFile](Restore-NaHostFile)

---

### Examples
> Example 1

Copy-NaHostFile H:\VM1.vhd I:\VM1_copy.vhd
Copy the VHD file H:\VM1.vhd to I:\VM1_copy.vhd.

Mode                LastWriteTime     Length Name
----                -------------     ------ ----
-a---         8/16/2011  10:41 AM 3221221888 VM1_copy.vhd

---

### Parameters
#### **SourceFile**
Full path to the source file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **DestinationFile**
Full path to the destination file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Verify**
If specified, a warning will be emitted if the MD5 hash of the source and destination files are not the same.

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
API: clone-start

---

### Syntax
```PowerShell
Copy-NaHostFile [-SourceFile] <String> [-DestinationFile] <String> [-Verify] [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
