New-VBRViVirtualDeviceMappingRule
---------------------------------

### Synopsis
Defines backed-up virtual disk mapping settings.

---

### Description

This cmdlet defines mapping settings of a backed-up virtual disk.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Example 1. Mapping BackedUp Virtual Disk to Default Datastore

$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$disks = Get-VBRViVirtualDevice -RestorePoint $restorepoint[3]
New-VBRViVirtualDeviceMappingRule -SourceVirtualDevice $disks[0]
This example shows how to map the backed-up virtual disks to the default datastore. The cmdlet will attach virtual disks of the VM that is backed up by the Winsrv4515 job.

Perform the following steps:

Perform the following steps:
1. Get the backed-up VM virtual disks:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Specify the Backup parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the fourth restore point will be used.
c. Run the Get-VBRViVirtualDevice cmdlet. Specify the RestorePoint parameter value. Save the result to the $disks variable.
The Get-VBRViVirtualDevice cmdlet will return an array of disks. Consider that the array numbering starts with 0. In our example, the first disk will be used.
2. Run the New-VBRViVirtualDeviceMappingRule cmdlet. Set the $disks[0] variable as the SourceVirtualDevice parameter value.
> Example 2. Mapping BackedUp Virtual Disk to Specific Datastore

$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$disks = Get-VBRViVirtualDevice -RestorePoint $restorepoint[3]
$server = Get-VBRServer -Name "WinSrv2073"
$datastore = Find-VBRViDatastore -Server $server -Name "LocalStore_0"
New-VBRViVirtualDeviceMappingRule -SourceVirtualDevice $disks[0] -Datastore $datastore
This example shows how to map the backed-up virtual disks to the LocalStore_0 datastore.
This datastore is connected to the WinSrv2073 server.
The cmdlet will map virtual disks of the VM that is backed up by the Winsrv4515 job.
Perform the following steps:

1. Get the backed-up VM virtual disks:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Specify the Backup parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the fourth restore point will be used.
c. Run the Get-VBRViVirtualDevice cmdlet. Specify the RestorePoint parameter value. Save the result to the $disks variable.
The Get-VBRViVirtualDevice cmdlet will return an array of disks. Consider that the array numbering starts with 0. In our example, the first disk will be used.
2. Get the datastore:
a. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable. b. Run the Find-VBRViDatastore cmdlet. Specify the Name and Server parameter values. Save the result to the $datastore variable.
3. Run the New-VBRViVirtualDeviceMappingRule cmdlet. Set the $disks[0] variable as the SourceVirtualDevice parameter value. Set the $datastore variable as the Datastore parameter value.

---

### Parameters
#### **Datastore**
Specifies a datastore.
The cmdlet will map backed-up virtual disks to this datastore.
Note: If you do not specify this parameter, the cmdlet will will attach backed-up virtual disks to the default datastore.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CViDatastoreItem]`|false   |named   |False        |

#### **SourceVirtualDevice**
Specifies a backed-up virtual disk.
The cmdlet will map this disks to the datastore.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRViVirtualDevice]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViVirtualDevice

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRViVirtualDeviceMappingRule

---

### Notes

---

### Syntax
```PowerShell
New-VBRViVirtualDeviceMappingRule [-Datastore <CViDatastoreItem>] -SourceVirtualDevice <VBRViVirtualDevice> [<CommonParameters>]
```
