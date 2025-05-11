Stop-VBRViReplicaFailback
-------------------------

### Synopsis
Undoes VMware replica failback.

---

### Description

This cmdlet undoes the VMware replica failback started with the Start-VBRViReplicaFailback cmdlet.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Example

$WebServer_replica_restorepoint = Get-VBRRestorePoint -Name "WebServer_replica" | Sort-Object $_.creationtime -Descending | Select -First 1
Stop-VBRViReplicaFailback -RestorePoint $WebServer_replica_restorepoint -PowerOn:$False -RunAsync
This example shows how to stop replica failback.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Filter the restore points of the VM with the Sort-Object method by the creationtime property to get the most recent one. Save the result to the $WebServer_replica_restorepoint variable.
2. Run the Stop-VBRViReplicaFailback cmdlet. Set the $WebServer_replica_restorepoint variable as the RestorePoint parameter value. Set the PowerOn parameter to False if you want to power on replica VM manually. Provide the RunAsync parameter.

---

### Parameters
#### **PowerOn**
Defines that the cmdlet will power on the replica VM after the failback stops.
By default this parameter is set to True. If you want to power on replica VM manually, set this parameter to False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of the replica VM. The cmdlet will undo failback of this VM.

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
Stop-VBRViReplicaFailback [-PowerOn] -RestorePoint <COib> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
