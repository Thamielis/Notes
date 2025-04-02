Start-VBRvCDReplicaFailover
---------------------------

### Synopsis
Starts to perform failover to a Cloud Director replica.

---

### Description

This cmdlet starts to perform failover to a Cloud Director replica.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Example 1. Performing Failover to vCD Replica

$restorepoint = Get-VBRRestorePoint -Name "WebServer"
Start-VBRvCDReplicaFailover -RestorePoint $restorepoint[3] -Reason "Data recovery" -RunAsync
This example shows how to perform failover to the WebServer vCD replica.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Provide the vApp name as the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRvCDReplicaFailover cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
- Specify the Reason parameter value.
- Provide the RunAsync parameter.
> Example 2. Performing Failover to CDP Replica with Retry Option

$restorepoint = Get-VBRRestorePoint -Name "WebServer"
Start-VBRvCDReplicaFailover -RestorePoint $restorepoint[3] -Retry -Reason "Data recovery" -RunAsync
This example shows how to perform failover to the WebServer vCD replica. If a failover does not complete successfully, Veeam Backup & Replication will start to perform a failover to a vCD replica again.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Provide the vApp name as the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRvCDReplicaFailover cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
- Provide the Retry parameter.
- Specify the Reason parameter value.
- Provide the RunAsync parameter.
> Example 3. Performing Permanent Failover to vCD Replica

$restorepoint = Get-VBRRestorePoint -Name "WebServer"
Start-VBRvCDReplicaFailover -RestorePoint $restorepoint[3] -Definitive -Reason "Data recovery" -RunAsync
This example shows how to perform a permanent failover to the WebServer vCD replica.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Provide the vApp name as the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRvCDReplicaFailover cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
- Provide the Definitive parameter.
- Specify the Reason parameter value.
- Provide the RunAsync parameter.

---

### Parameters
#### **Definitive**
Defines that the cmdlet will perform a permanent failover of a Cloud Director replica.
If you do not specify this parameter, the cmdlet will not switch permanently from the original vApp to a Cloud Director replica.
Note: Before you perform permanent failover, make sure that your Cloud Director replica is in the Failover state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will perform failover without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerOn**
If set, the replica vApp will be powered on after the failback. Otherwise, you will need to power the vApp on manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing failover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point of a Cloud Director replica to which you want to perform failover.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Retry**
Defines that if failover does not complete successfully, Veeam Backup & Replication will start to perform failover to a Cloud Director replica again.
If you do not specify this parameter, the cmdlet will not start to perform failover to a Cloud Director replica if some VMs are in the incomplete state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Start-VBRvCDReplicaFailover [-Definitive] [-Force] [-PowerOn] [-Reason <String>] -RestorePoint <COib> [-Retry] [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
