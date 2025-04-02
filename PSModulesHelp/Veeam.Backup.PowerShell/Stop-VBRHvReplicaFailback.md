Stop-VBRHvReplicaFailback
-------------------------

### Synopsis
Undoes Hyper-V replica failback.

---

### Description

This cmdlet undoes the Hyper-V replica failback started with the Start-VBRHvReplicaFailback cmdlet.

---

### Examples
> Example 1

Get-VBRRestorePoint -Name "WebServer_replica" | Sort-Object $_.creationtime -Descending | Select -First 1 | Stop-VBRHvReplicaFailback -RunAsync
This example shows how to stop failback using pipeline.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Filter the restore points of the VM with the Sort-Object method by the creationtime property to get the most recent one.
2. Pipe the cmdlet output to the Stop-VBRHvReplicaFailback cmdlet. Provide the RunAsync parameter.
> Example 2

$WebServer_replica_restorepoint = Get-VBRRestorePoint -Name "WebServer_replica" | Sort-Object $_.creationtime -Descending | Select -First 1
Stop-VBRHvReplicaFailback -RestorePoint $WebServer_replica_restorepoint -RunAsync
This example shows how to stop failback using a variable.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Filter the restore points of the VM with the Sort-Object method by the creationtime property to get the most recent one. Save it to the $WebServer_replica_restorepoint variable.
2. Run the Stop-VBRHvReplicaFailback cmdlet. Set the $WebServer_replica_restorepoint variable as the RestorePoint parameter value. Provide the RunAsync parameter.

---

### Parameters
#### **RestorePoint**
Specifies the restore point of the replica VM.
The cmdlet will undo failback of this VM.

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
Stop-VBRHvReplicaFailback -RestorePoint <COib> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
