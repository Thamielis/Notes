Mount-NaVirtualDisk
-------------------

### Synopsis
Mounts a VHD file on the local host.

---

### Description

Mounts a VHD file on the local host.

This cmdlet must be run with administrative privileges.

---

### Related Links
* [New-NaVirtualDisk](New-NaVirtualDisk)

* [Dismount-NaVirtualDisk](Dismount-NaVirtualDisk)

* [Get-NaHostDisk](Get-NaHostDisk)

* [Initialize-NaHostDisk](Initialize-NaHostDisk)

---

### Examples
> Example 1

Mount-NaVirtualDisk G:\VM1.vhd
Mount the VHD file 'G:\VM1.vhd' as a disk on the local host.

Mode         LastWriteTime      Length Name
----         -------------      ------ ----
-a---  10/6/2011   4:10 PM 21474836992 VM1.vhd

---

### Parameters
#### **FullName**
The fully-qualified path of the VHD file to be mounted.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|Name   |

---

### Inputs

---

### Outputs
* DataONTAP.HostUtilities.DiskDiscovery.DiskResource

---

### Notes
Category: host

---

### Syntax
```PowerShell
Mount-NaVirtualDisk [-FullName] <String> [<CommonParameters>]
```
