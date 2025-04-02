Get-VBRViVirtualDevice
----------------------

### Synopsis
Returns details on VMware VM virtual disks.

---

### Description

This cmdlet returns details on virtual disks of VMs from backups.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Getting Details on Virtual Disks

$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint
Get-VBRViVirtualDevice -RestorePoint $restorepoint[3]
This example shows how to get details on virtual disks of the VM that is backed up by the Winsrv4515 backup job.

Perform the following steps:

1. Get the restore point:
a. Run the Get-VBRBackup cmdlet.
Specify the Name parameter value.
Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet.
Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points.
Mind the ordinal number of the necessary restore point (in our example, it is the forth restore point in the array).
2. Run the Get-VBRViVirtualDevice cmdlet.
Set the $restorepoint variable as the RestorePoint parameter value.
The cmdlet output will contain the following details on VM virtual disks: ControllerNumber, Type, VirtualDeviceNode, VirtualDeviceCapacityGB and Name.

---

### Parameters
#### **RestorePoint**
Specifies a restore point of VMs.
The cmdlet will return details on backed-up virtual disks of these VMs.
Accepts the COib object. To get this object, run the Get-VBRRestorePoint cmdlet.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRViVirtualDevice

---

### Notes

---

### Syntax
```PowerShell
Get-VBRViVirtualDevice [-RestorePoint] <COib> [<CommonParameters>]
```
