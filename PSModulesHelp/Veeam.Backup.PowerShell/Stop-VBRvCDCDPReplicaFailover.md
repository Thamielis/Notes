Stop-VBRvCDCDPReplicaFailover
-----------------------------

### Synopsis
Stops Cloud Director CDP replica failover.

---

### Description

This cmdlet stops Cloud Director CDP replica failover, that is, performs failover undo.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

---

### Examples
> Example 1

$replica = Get-VBRCDPReplica -Name "Win07"
Stop-VBRvCDCDPReplicaFailover -Replica $replica
This example shows how to perform failover to a specific long-term restore point of a Cloud Director CDP replica.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet.  Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Stop-VBRvCDCDPReplicaFailover cmdlet. Set the $replica variable as the Replica parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will undo a failover without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ForceFailover**
Defines that the cmdlet will force the undo failover operation. If you do not provide this parameter, the cmdlet will not be able to undo failover in case the host on which the replica resides is not avaialble.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Replica**
Specifies the replica of the vApp for which you want to undo failover.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRvCDCDPReplica]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRvCDCDPReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRvCDCDPReplicaFailover [-Force] [-ForceFailover] -Replica <VBRvCDCDPReplica> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
