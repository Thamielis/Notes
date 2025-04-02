Stop-VBRvCDCDPReplicaFailback
-----------------------------

### Synopsis
Stops Cloud Director CDP replica failback.

---

### Description

This cmdlet stops Cloud Director CDP replica failback, that is, performs failback undo.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

---

### Examples
> Example 1

$replica = Get-VBRCDPReplica -Name "Win07"
Stop-VBRvCDCDPReplicaFailback -Replica $replica
This example shows how to perform failback undo of the Cloud Director CDP replica.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Stop-VBRvCDCDPReplicaFailback cmdlet. Set the $replica variable as the Replica parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will undo failover without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerOn**
Defines that the cmdlet will power on the replica after failback stops. If you do not provide this parameter, you will need to power on the replica manually. Default: True.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Replica**
Specifies the replica for which you want to undo failback.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRvCDCDPReplica]`|true    |named   |False        |

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
Stop-VBRvCDCDPReplicaFailback [-Force] [-PowerOn] -Replica <VBRvCDCDPReplica> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
