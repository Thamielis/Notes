Remove-VBRReplica
-----------------

### Synopsis
Removes replicated VMs.

---

### Description

This cmdlet removes replicated VMs.
You can use the following options:
- Remove from console. When you remove replica from the Veeam console, you will not delete the VM but only stop managing it with Veeam Backup & Replication. When replica is created, Veeam Backup & Replication maintains it in sync with the original VM by running the replication job. When you delete a replica from your managing console, it is no longer synchronized. The replica VM stays on target host.
- Remove from disk. With this option, the replica is removed from database and from target host. This removal is complete and non-reversible.
To stop synchronizing a replica without deleting it from the console, you need to disable or delete the corresponding replication job. Run the Disable-VBRJob or Remove-VBRJob cmdlet.
This cmdlet removes all VMs in the replication job. To remove individual VMs, run the Remove-VBRRestorePoint cmdlet.

NOTE: When you remove a replica from Veeam Backup & Replication console, you can not bring it back by means of PowerShell. Use replica seeding option in UI to restore a removed replica.

---

### Examples
> Example 1

$replica = Get-VBRReplica -Name "DC_replica01", "DC_replica02"
Remove-VBRReplica -Backup $replica
This example shows how to remove replicas from Veeam Backup & Replication.

Perform the following steps:
1. Run the Get-VBRReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Remove-VBRReplica cmdlet. Set the $replica variable as the Backup parameter value.
> Example 2

$replica = Get-VBRReplica -Name "DC_replica01", "DC_replica02"
Remove-VBRReplica -Backup $replica -FromDisk
This example shows how to remove replicas from disk.

Perform the following steps:
1. Run the Get-VBRReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Remove-VBRReplica cmdlet. Set the $replica variable as the Backup parameter value. Provide the FromDisk parameter.

---

### Parameters
#### **Backup**
Specifies the array of replicas you want to remove.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **FromDisk**
Defines that the replicated VM will be permanently removed from disk. Otherwise, you only exclude the replica from processing with Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Veeam.Backup.Core.CBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRReplica [-Backup] <CBackup[]> [-FromDisk] [-Confirm] [-WhatIf] [<CommonParameters>]
```
