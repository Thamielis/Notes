Set-VBRLinuxSelectedVolume
--------------------------

### Synopsis
Modifies the scope of volumes for Veeam Agent backup jobs that back up Linux machines.

---

### Description

This cmdlet modifies the VBRLinuxSelectedVolume object that specifies the scope of volumes for Veeam Agent Backup jobs that back up Linux machines.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRLinuxSelectedVolume](New-VBRLinuxSelectedVolume)

---

### Examples
> Modifying Backup Scope for Linux Machines

$volumes = New-VBRLinuxSelectedVolume -Type Device -Path "/dev/sda"
Set-VBRLinuxSelectedVolume -SelectedVolume $volumes -Type Device -Path "/dev/sdb"
This example shows how to modify the backup scope for Linux machines. Veeam Agent Backup jobs will back up the second hard disk instead of the first hard disk.
Perform the following steps:
1. Run the New-VBRLinuxSelectedVolume cmdlet. Set the Device option for the Type parameter. Specify the Path parameter value. Save the result to the $volumes variable.
2. Run the Set-VBRLinuxSelectedVolume cmdlet. Specify the following settings:
- Set the $volumes variable as the SelectedVolume parameter value.
- Set the Device option for the Type parameter.
- Specify the Path parameter value.

---

### Parameters
#### **Path**
Specifies the path to the volume that you want to include in the backup scope.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SelectedVolume**
Specifies the volumes that you want to modify.

|Type                      |Required|Position|PipelineInput |
|--------------------------|--------|--------|--------------|
|`[VBRLinuxSelectedVolume]`|true    |named   |True (ByValue)|

#### **Type**
Specifies the type of the volume that you want to back up. You can select the following type of volumes:
* Device - use this option to include in the backup scope all volumes on a computer disk or individual volumes of a protected computer.
* MountPoint - use this option to include a mount point in the backup scope.
* LVM - use this option to include individual LVM volumes in the backups scope.
* BTRFS - use this option to include BTRFS subvolumes in the backup scope.
Valid Values:

* Device
* MountPoint
* LVM
* BTRFS

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRLinuxSelectedVolumeType]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRLinuxSelectedVolume

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRLinuxSelectedVolume [-Path <String>] -SelectedVolume <VBRLinuxSelectedVolume> [-Type {Device | MountPoint | LVM | BTRFS}] [<CommonParameters>]
```
