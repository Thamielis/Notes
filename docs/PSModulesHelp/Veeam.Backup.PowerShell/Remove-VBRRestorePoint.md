Remove-VBRRestorePoint
----------------------

### Synopsis
Removes individual VMs from backup or replicas.

---

### Description

This cmdlet removes backup of a selected VMs or replicas.
The backup is removed from disk. If you remove a replica, the replicated VM is removed from infrastructure.
If you need to remove replicated VM, run the Remove-VBRReplica cmdlet.
IMPORTANT! This cmdlet removes all restore points of the selected VMs or replicas. Keep in mind that the subsequent backup jobs may fail to produce valid backup after you run this cmdlet.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRSOBRObjectStorageRestorePoint](Get-VBRSOBRObjectStorageRestorePoint)

---

### Examples
> Example 1. Removing Restore Points of Certain VM

$backup = Get-VBRBackup -Name "Webservers Backup Job" 
$vm = Get-VBRRestorePoint -Backup $backup -Name "Webserver03"
Remove-VBRRestorePoint -Oib $vm
This example shows how to remove restore points of Webserver03 VM.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Specify the Name parameter value. Save the result to the $vm variable.
3. Run the Remove-VBRRestorePoint cmdlet. Set the $vm variable as the Oib parameter value.
> Example 2. Removing Restore Points from Capacity Extent

$backup = Get-VBRBackup -Name "Webservers Backup Job"
$vm = Get-VBRSOBRObjectStorageRestorePoint -Id "c2befce4-c7f4-4a53-a08b-e37580a682e7", "9577ab06-8ca5-4a5a-bd5c-d6124b0a4058" -CapacityTier
Remove-VBRRestorePoint -Oib $vm
This example shows how to remove backup of Webserver03 VM.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRSOBRObjectStorageRestorePoint cmdlet. Specify the Id parameter value. Save the result to the $vm variable.
3. Run the Remove-VBRRestorePoint cmdlet. Set the $vm variable as the Oib parameter value.
> Example 3. Removing Restore Points from Archive Extent

$backup = Get-VBRBackup -Name "Webservers Backup Job"
$vm = Get-VBRSOBRObjectStorageRestorePoint -Id "c2befce4-c7f4-4a53-a08b-e37580a682e7", "9577ab06-8ca5-4a5a-bd5c-d6124b0a4058" -Archive
Remove-VBRRestorePoint -Oib $vm
This example shows how to remove backup of Webserver03 VM.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRSOBRObjectStorageRestorePoint cmdlet. Specify the Id parameter value and provide the Archive parameter. Save the result to the $vm variable.
3. Run the Remove-VBRRestorePoint cmdlet. Set the $vm variable as the Oib parameter value.

---

### Parameters
#### **Name**
This parameter is legacy and not supported.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Oib**
Specifies the array of VM restore points. The cmdlet will use these restore point to locate the VMs and remove the backups of these VMs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[COib[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.Core.COib[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRRestorePoint [-Oib] <COib[]> [-Name <String[]>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
