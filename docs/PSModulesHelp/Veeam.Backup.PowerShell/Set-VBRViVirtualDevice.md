Set-VBRViVirtualDevice
----------------------

### Synopsis
Modifies settings of VM virtual disks.

---

### Description

This cmdlet modifies settings of VM virtual disks.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRViVirtualDevice](Get-VBRViVirtualDevice)

---

### Examples
> Modifying Controllers Number

$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint
$disk = Get-VBRViVirtualDevice -RestorePoint $restorepoint[3]
Set-VBRViVirtualDevice -VirtualDevice $disk -ControllerNumber 5
This cmdlet modifies the following settings for VM virtual disks and sets it to the SCSI 0:5.
The controller number is set to 0. The number of a virtual device node is set to 5.

Perform the following steps:

1. Get the restore point:
a. Run the Get-VBRBackup cmdlet.
Specify the Name parameter value.
Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet.
Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points.
Consider that the array numbering starts with 0. In our example, the fourth restore point is used.
2. Run the Get-VBRViVirtualDevice cmdlet.
Set the $restorepoint variable as the RestorePoint parameter value.
Save the result to the $disk variable.
The cmdlet output will contain the following details on VM virtual disks: ControllerNumber, Type, VirtualDeviceNode, VirtualDeviceCapacityGB and Name.
3. Run the Set-VBRViVirtualDevice cmdlet.
Set the $disk variable as the VirtualDevice parameter value.
Specify the ControllerNumber parameter value.

---

### Parameters
#### **ControllerNumber**
Specifies a controller number for VM virtual disks.
The cmdlet will set the specified controller number to the VM virtual disks.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Type**
Specifies a virtual device node type.
You can specify either of the following virtual device node types:
* SCSI
* SATA
* NVME
Valid Values:

* SCSI
* SATA
* NVME
* IDE

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRViVirtualDeviceType]`|false   |named   |False        |

#### **VirtualDevice**
Specifies VM virtual disks.
The cmdlet will modify settings of these VM disks.
Accepts the VBRViVirtualDevice object.
To get this object, run the Get-VBRViVirtualDevice cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRViVirtualDevice]`|true    |0       |True (ByPropertyName, ByValue)|

#### **VirtualDeviceNode**
Specifies a number of a virtual device node.
The cmdlet will set the VM virtual disk with the specified number of a virtual device node.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViVirtualDevice

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRViVirtualDevice

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViVirtualDevice [-VirtualDevice] <VBRViVirtualDevice> [-ControllerNumber <Int32>] [-Type {SCSI | SATA | NVME | IDE}] [-VirtualDeviceNode <Int32>] [<CommonParameters>]
```
