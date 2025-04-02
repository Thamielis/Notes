Set-VBRViVirtualDeviceMappingRule
---------------------------------

### Synopsis
Modifies backed-up virtual disk mapping settings.

---

### Description

This cmdlet modifies mapping settings of backed-up virtual disks.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRViVirtualDevice](Get-VBRViVirtualDevice)

* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [New-VBRViVirtualDeviceMappingRule](New-VBRViVirtualDeviceMappingRule)

---

### Examples
> Modifying Mapping Settings of BackedUp Virtual Disks

$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$disks = Get-VBRViVirtualDevice -RestorePoint $restorepoint[3]
$mappingrule = New-VBRViVirtualDeviceMappingRule -SourceVirtualDevice $disks
$server = Get-VBRServer -Name "WinSrv2073"
$datastore = Find-VBRViDatastore -Server $server -Name "LocalStore_0"
Set-VBRViVirtualDeviceMappingRule -MappingRule $mappingrule -Datastore $datastore
This example shows how to modify an existing mapping rule. The cmdlet will set this rule to map backed-up virtual disks to the LocalStore_0 datastore.

Perform the following steps:

1. Get the backed-up VM virtual disks:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Specify the Backup parameter value. Save the result to the $restorepoint variable.
c. Run the Get-VBRViVirtualDevice cmdlet. Specify the RestorePoint parameter value. Save the result to the $disks variable.
The Get-VBRRestorePoint cmdlet will return an array of disks. Consider that the array numbering starts with 0. In our example, the fourth restore point will be used.
2. Run the New-VBRViVirtualDeviceMappingRule cmdlet. Set the $disks variable as the SourceVirtualDevice parameter value. Save the result to the $mappingrule variable.
3. Get the datastore:
a. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
b. Run the Find-VBRViDatastore cmdlet. Specify the Name and Server parameter values. Save the result to the $datastore variable.
4. Run the Set-VBRViVirtualDeviceMappingRule cmdlet. Set the $mappingrule variable as the MappingRule parameter value. Set the $datastore variable as the Datastore parameter value.

---

### Parameters
#### **Datastore**
Specifies a datastore.
The cmdlet will map backed-up virtual disks to this datastore.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CViDatastoreItem]`|false   |named   |False        |

#### **MappingRule**
Specifies the mapping settings that you want to modify.

|Type                             |Required|Position|PipelineInput                 |
|---------------------------------|--------|--------|------------------------------|
|`[VBRViVirtualDeviceMappingRule]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SourceVirtualDevice**
Specifies backed-up virtual disks.
The cmdlet will map these disks to the datastore.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViVirtualDevice]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViVirtualDeviceMappingRule

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRViVirtualDeviceMappingRule

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViVirtualDeviceMappingRule [-Datastore <CViDatastoreItem>] -MappingRule <VBRViVirtualDeviceMappingRule> [-SourceVirtualDevice <VBRViVirtualDevice>] [<CommonParameters>]
```
