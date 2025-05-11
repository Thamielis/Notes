Stop-VBRvCDReplicaFailback
--------------------------

### Synopsis
Stops a Cloud Director replica failback.

---

### Description

This cmdlet stops a Cloud Director replica failback.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Undoing Failover

$restorepoint = Get-VBRRestorePoint -Name "WebServer"
Stop-VBRvCDReplicaFailback -RestorePoint $restorepoint[3] -RunAsync
This example shows how to undo a failback to the the WebServer vCD replica.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
2. Run the Stop-VBRvCDReplicaFailover cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Provide the RunAsync parameter.

---

### Parameters
#### **Force**
Defines that the cmdlet will perform failover without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerOn**
Defines that the cmdlet will power on replica VM after the failover.
Otherwise, you will need to power on the replica VM manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of the Cloud Director replica.
The cmdlet will stop failback of this replica.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[COib]`|true    |named   |False        |

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
Stop-VBRvCDReplicaFailback [-Force] [-PowerOn] -RestorePoint <COib> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
