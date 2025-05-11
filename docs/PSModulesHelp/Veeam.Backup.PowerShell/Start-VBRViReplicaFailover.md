Start-VBRViReplicaFailover
--------------------------

### Synopsis
Fails over corrupted VMware VMs to their replicas.

---

### Description

This cmdlet fails over a corrupted VMware VM to its successfully created replica.
Run the Start-VBRViReplicaFailback cmdlet to fail back to the original VM.  Run the Stop-VBRReplicaFailover cmdlet to undo failover.

---

### Examples
> Example 1

$restorepoint = Get-VBRRestorePoint -Name "WebServer"
Start-VBRViReplicaFailover -RestorePoint $restorepoint[3] -Reason "Data recovery" -RunAsync
This example shows how to perform failover to the WebServer VM replica.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRViReplicaFailover cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the fourth restore point is used.
- Specify the Reason parameter value.
- Provide the RunAsync parameter.
> Example 2

Get-VBRRestorePoint -Name "WebServer" | Sort-Object $_.creationtime -Descending | Select-Object -First 1 | Start-VBRViReplicaFailover -Reason "Configuration recovery" -RunAsync
This command fails over to the latest restore point of the WebServer VM replica.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Sort-Object cmdlet. Set the .creationtime property for the $_ variable. Provide the Descending parameter.
3. Pipe the cmdlet output to the Select-Object cmdlet. Set the 1 number as the First parameter value.
4. Pipe the cmdlet output to the Start-VBRViReplicaFailover cmdlet. Specify the Reason parameter value. Provide the RunAsync parameter.
> Example 3

$restorepoint = Get-VBRRestorePoint -Name "WebServer"
Start-VBRViReplicaFailover -RestorePoint $restorepoint[3] -Reason "Tsunami forecast" -Planned
This example shows how to perform planned failover of the WebServer VM.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRViReplicaFailover cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the fourth restore point is used.
- Specify the Reason parameter value.
- Provide the Planned parameter.
> Example 4

$restorepoint = Get-VBRRestorePoint -Name "WebServer"
Start-VBRViReplicaFailover -RestorePoint $restorepoint[3] -Reason "Configuration recovery" -RunAsync -Definite
This example shows how to perform permanent failover of the WebServer VM.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRViReplicaFailover cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the fourth restore point is used.
- Specify the Reason parameter value.
- Provide the RunAsync parameter.
- Provide the Definite parameter.

---

### Parameters
#### **Definite**
Defines that the failover is permanent.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Planned**
Defines that the failover is planned.
Default: The planned failover option is enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerOn**
Defines that the cmdlet will power on replica VM after the failover. Otherwise, you will need to power on the replica VM manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing a failover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ReIp**
Defines that the replica will use the re-IP rules that are set in the replication job.
Note: Do not enable the re-IP if the re-IP rules are not configured in the replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RestorePoint**
Specifies the replica restore point to which you want to fail over.

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
Start-VBRViReplicaFailover [-RestorePoint] <COib> [-Definite] [-Reason <String>] [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRViReplicaFailover [-RestorePoint] <COib> [-Planned] [-PowerOn] [-Reason <String>] [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRViReplicaFailover [-RestorePoint] <COib> [-PowerOn] [-Reason <String>] [-ReIp] [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
