Invoke-NaVirtualDiskSpaceReclaim
--------------------------------

### Synopsis
Reclaim space on a virtual disk residing on a Data ONTAP LUN.

---

### Description

Reclaim space on a virtual disk residing on a Data ONTAP LUN.

This cmdlet works by mounting a copy of the virtual disk to the host and finding the free space in the NTFS filesystem.  The corresponding blocks in the original virtual disk are then freed on the Data ONTAP controller.

This cmdlet requires the virtual disk to be experiencing no active I/O.  Taking a Hyper-V snapshot of a running virtual machine before invoking this cmdlet allows space to be reclaimed on a running virtual machine.  After the cmdlet has completed, the Hyper-V snapshot can be deleted.

---

### Related Links
* [Get-NaHyperV](Get-NaHyperV)

---

### Examples
> Example 1

```PowerShell
Invoke-NaVirtualDiskSpaceReclaim -Name E:\vm0_disk0.vhd
Reclaim all space from the virtual disk vm0_disk0.  The virtual machine using this disk is offline.
```
> Example 2

```PowerShell
Get-NaHyperV Win2k8R2_VM1 | Checkpoint-VM -SnapshotName reclaim_snapshot
Invoke-NaVirtualDiskSpaceReclaim -Name C:\ClusterStorage\Volume2\VirtualDisks\Win2k8R2_VM1.vhdx
Remove-VMSnapshot -Name reclaim_snapshot -VMName Win2K8R2_VM1
Take a snapshot of a running virtual machine, reclaim the free space, then remove the snapshot.
```

---

### Parameters
#### **Name**
Full path to the virtual disk.  This can be a VHD or VHDX file.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|FullName<br/>Path|

#### **Controller**
Controller containing the virtual disk file embodied by a NaController or NcController object.  This is obtained using Connect-NaController or Connect-NcController.
If not provided, the values in the global variables CurrentNaController and CurrentNcController are considered.  If neither contain the virtual disk file, an attempt is made to establish a connection to the controller containing the file.  If no connection can be established, the cmdlet will fail.

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
* 

---

### Notes
Category: host

---

### Syntax
```PowerShell
Invoke-NaVirtualDiskSpaceReclaim [-Name] <String> [-Controller <AbstractController>] [-SkipUnmap] [-UnmapSize <String>] [<CommonParameters>]
```
