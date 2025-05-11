Start-VBRHvReplicaFailover
--------------------------

### Synopsis
Fails over corrupted Hyper-V VMs to their replicas.

---

### Description

This cmdlet fails over a corrupted Hyper-V VM to its successfully created replica.
This cmdlet provides 3 parameter sets for the following operations: - Failover
- Permanent failover
- Planned failover
Run the Start-VBRHvReplicaFailback cmdlet to fail back to the original VM.
Run the Stop-VBRReplicaFailover cmdlet to undo failover. You can also undo planned failover.

---

### Examples
> Performing Planned Failover for Hyper-V VM

$restorepoint = Get-VBRRestorePoint -Name "Hyper-V WebServer"
Start-VBRHvReplicaFailover -RestorePoint $restorepoint[1] -Reason "Data recovery" -RunAsync -Planned
This example shows how to perform failover to the Hyper-V WebServer VM replica.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRHvReplicaFailover cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the fourth restore point is used.
- Specify the Reason parameter value.
- Provide the RunAsync parameter.
- Provide the Planned parameter.
> Performing Permanent Failover to VM Replica

$restorepoint = Get-VBRRestorePoint -Name "Hyper-V WebServer"
Start-VBRHvReplicaFailover -RestorePoint $restorepoint[3] -Reason "Data recovery" -RunAsync -Definite
This example shows how to perform failover to the Hyper-V WebServer VM replica.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRHvReplicaFailover cmdlet. Specify the following settings:
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

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing a failover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Start-VBRHvReplicaFailover [-RestorePoint] <COib> [-Definite] [-Reason <String>] [-RunAsync] [<CommonParameters>]
```
```PowerShell
Start-VBRHvReplicaFailover [-RestorePoint] <COib> [-Planned] [-Reason <String>] [-RunAsync] [<CommonParameters>]
```
