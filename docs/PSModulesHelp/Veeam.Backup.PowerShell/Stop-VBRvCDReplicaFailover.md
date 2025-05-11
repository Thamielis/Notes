Stop-VBRvCDReplicaFailover
--------------------------

### Synopsis
Stops Cloud Director replica failover.

---

### Description

This cmdlet stops Cloud Director replica failover.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

---

### Examples
> Undoing Failover

$restorepoint = Get-VBRRestorePoint -Name "WebServer"
Stop-VBRvCDReplicaFailover -RestorePoint $restorepoint[3] -RunAsync
This example shows how to undo a failover of the WebServer vCD replica.

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

#### **RestorePoint**
Specifies a restore point of a production vApp. The cmdlet will stop failover to this vApp.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRvCDReplicaFailover [-Force] -RestorePoint <COib> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
