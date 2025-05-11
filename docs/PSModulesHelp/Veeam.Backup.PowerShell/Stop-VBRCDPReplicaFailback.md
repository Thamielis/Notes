Stop-VBRCDPReplicaFailback
--------------------------

### Synopsis
Undoes a CDP replica failback.

---

### Description

This cmdlet undoes a CDP replica failback.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

---

### Examples
> Undoing Failback

$replica = Get-VBRCDPReplica -Name "Win05"
Stop-VBRCDPReplicaFailback -Replica $replica -RunAsync
This example shows how to undo a failback of the CDP replica of the Win05 VM.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Stop-VBRCDPReplicaFailback cmdlet. Set the $replica variable as the Replica parameter. Provide the RunAsync parameter.

---

### Parameters
#### **Force**
Defines that the cmdlet will undo a failback for a CDP replica without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerOn**
Defines that the cmdlet will power on a CDP replica after failback stops.
If you do not provide this parameter, the cmdelt will not power on the replica.
Default: True.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Replica**
Specifies a CDP replica for which you want to undo a failback.
The cmdlet will switch back from this  CDP replica to the original VM.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPReplica]`|true    |named   |False        |

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRCDPReplicaFailback [-Force] [-PowerOn] -Replica <VBRCDPReplica> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
