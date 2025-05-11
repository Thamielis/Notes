Stop-VBRReplicaFailover
-----------------------

### Synopsis
Undoes replica failover.

---

### Description

This cmdlet undoes the replica failover.
This cmdlet finalizes the replica failover started with the Start-VBRViReplicaFailover cmdlet.
Run the Start-VBRViReplicaFailback cmdlet to fail back to the VMware production VM.  Run the Start-VBRHvReplicaFailback cmdlet to fail back to the Hyper-V production VM.

---

### Examples
> Example 1

Get-VBRRestorePoint -Name "WebServer_replica" | Sort-Object $_.creationtime -Descending | Select -First 1 | Stop-VBRReplicaFailover -Reason "Configuration recovery" -RunAsync -Force
This command stops failover process by reverting to the production VM.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Filter the restore points with the Sort-Object method by the creationtime property to get the most recent one.
2. Pipe the cmdlet output to the Stop-VBRReplicaFailover cmdlet. Specify the Reason parameter value. Provide the RunAsync and Force parameters.
> Example 2

$WebServer_replica_restorepoint = Get-VBRRestorePoint -Name "WebServer_replica"
Stop-VBRReplicaFailover -RestorePoint $WebServer_replica_restorepoint[1] -Reason "Data recovery" -RunAsync
This command stops failover process by reverting to the production VM.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $WebServer_replica_restorepoint variable.
2. Run the Stop-VBRReplicaFailover cmdlet. Specify the following settings:
- Set the $WebServer_replica_restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the second restore point is used.
- Specify the Reason parameter value.
- Provide the RunAsync parameter.

---

### Parameters
#### **Force**
Defines that the replica job starts running without waiting for the target host to power off. Otherwise the replica job will start only after the target host is powered off.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of the production VM to recover to.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

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
Stop-VBRReplicaFailover [-RestorePoint] <COib> [-Force] [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
