Dismount-NaVirtualDisk
----------------------

### Synopsis
Dismounts a VHD file from the local host.

---

### Description

Dismounts a VHD file from the local host.

---

### Related Links
* [New-NaVirtualDisk](New-NaVirtualDisk)

* [Mount-NaVirtualDisk](Mount-NaVirtualDisk)

---

### Examples
> Example 1

Dismount-NaVirtualDisk 1
Dismount the VHD file that is mounted as Disk 1 on the local host.

Mode         LastWriteTime      Length Name
----         -------------      ------ ----
-a---  10/6/2011   4:10 PM 21474836992 VM1.vhd

---

### Parameters
#### **FullName**
The fully-qualified path of the VHD file to be dismounted.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|Name   |

#### **Disk**
The Windows disk index of the VHD file to be dismounted.

|Type      |Required|Position|PipelineInput                 |Aliases      |
|----------|--------|--------|------------------------------|-------------|
|`[UInt32]`|true    |1       |true (ByValue, ByPropertyName)|HostDiskIndex|

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
Dismount-NaVirtualDisk [-FullName] <String> [<CommonParameters>]
```
```PowerShell
Dismount-NaVirtualDisk [-Disk] <UInt32> [<CommonParameters>]
```
