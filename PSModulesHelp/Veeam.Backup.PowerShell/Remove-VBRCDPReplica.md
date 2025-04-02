Remove-VBRCDPReplica
--------------------

### Synopsis
Removes a CDP replica from the configuration database or disk.

---

### Description

This cmdlet removes a CDP replica including CDP replicas created by CDP policies including Cloud Director CDP policies, CDP policies, cloud CDP policies and so on.
You can remove the replica according to the following scenarios:
- From the configuration. Veeam Backup & Replication removes records about the replicas from the configuration database, stops showing the replicas in Veeam Backup & Replication console and also stops synchronizing their state with the state of the original workload. However, the actual replicas remain on hosts.
- From the disk. Veeam Backup & Replication removes the replicas not only from the Veeam Backup & Replication console and configuration database, but also from the host storage.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

---

### Examples
> Removing CDP Replica from Backup Infrastructure

$replica = Get-VBRCDPReplica -Name "Win05"
Remove-VBRCDPReplica -Replica $replica -FromDisk
This examples shows how to remove the Win05 CDP replica from a backup infrastructure. The cmdlet will permanently remove a CDP replica from a disk.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Remove-VBRCDPReplica cmdlet. Set the $replica variable as the Replica parameter. Provide the FromDisk parameter.

---

### Parameters
#### **Force**
Defines that the cmdlet will remove a CDP replica showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FromDisk**
Defines that the cmdlet will remove the replica from the disk.
Note: If you do not provide this parameter, the cmdlet will remove the replica from the configuration.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Replica**
Specifies the replica that you want to remove.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRCDPReplicaBase]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRCDPReplicaBase

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRCDPReplica [-Force] [-FromDisk] -Replica <VBRCDPReplicaBase> [-Confirm] [-WhatIf] [<CommonParameters>]
```
