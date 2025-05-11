Remove-VBRvCDReplica
--------------------

### Synopsis
Removes Cloud Director replicas.

---

### Description

This cmdlet removes Cloud Director replicas.

---

### Related Links
* [Get-VBRvCDReplica](Get-VBRvCDReplica)

---

### Examples
> Removing vCD Replica

$replica = Get-VBRvCDReplica -Id "2a7c321c-c8cf-4aec-9332-93882e69c667"
Remove-VBRvCDReplica -Replica $replica
This cmdlet removes a vCD replica from the backup infrastructure.

Perform the following steps:
1. Run the Get-VBRvCDReplica cmdlet. Specify the Id parameter value. Save the result to the $replica variable.
2. Run the Remove-VBRvCDReplica cmdlet. Set the $replica variable as the Replica parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will remove  a vCD without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FromDisk**
Defines that the cmdlet will remove a Cloud Director replica from a disk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Replica**
Specifies a Cloud Director replica that you want to remove.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRvCDReplica]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

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
Veeam.Backup.PowerShell.Infos.VBRvCDReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRvCDReplica [-Force] -FromDisk -Replica <VBRvCDReplica> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
