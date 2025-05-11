New-VBRLinuxSelectedVolume
--------------------------

### Synopsis
Defines the scope of volumes for Veeam Agent backup jobs that back up Linux machines.

---

### Description

This cmdlet creates the VBRLinuxSelectedVolume object that specifies the scope of volumes for Agent Backup jobs that back up Linux machines.

---

### Examples
> Creating Backup Scope with All Volumes on Computer Disk

```PowerShell
New-VBRLinuxSelectedVolume -Type Device -Path "/dev/sda"
This command creates the backup scope that includes all volumes on a computer disk.
```

---

### Parameters
#### **Path**
Specifies the path to the volume that you want to include in the backup scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Type**
Specifies the type of the volume that you want to back up. You can select the following type of volumes:
* Device - use this option to include in the backup scope all volumes on a computer disk or individual volumes of a protected computer.
* MountPoint - use this option to include individual volumes of a protected computer in the backup scope.
* LVM - use this option to include individual LVM logical volumes in the backups scope.
* BTRFS - use this option to include BTRFS subvolumes in the backup scope.
Valid Values:

* Device
* MountPoint
* LVM
* BTRFS

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRLinuxSelectedVolumeType]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRLinuxSelectedVolume -Path <String> -Type {Device | MountPoint | LVM | BTRFS} [<CommonParameters>]
```
