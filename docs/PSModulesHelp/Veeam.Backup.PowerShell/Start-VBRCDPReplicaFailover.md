Start-VBRCDPReplicaFailover
---------------------------

### Synopsis
Starts to perform failover to VM replicas.

---

### Description

This cmdlet starts to perform failover to VM replicas.

Important: Before you start to perform failover to VM replicas we recommend to the run the Get-VBRCDPShortTermRestoreInterval cmdlet to get a list of all replicated states that are available for VM replicas. This allows you to verify that you will not perform failover to replicated states of VM replicas that do not exist.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

* [Get-VBRCDPLongTermRestorePoint](Get-VBRCDPLongTermRestorePoint)

---

### Examples
> Example 1. Performing Failover to CDP Replica Latest Restore Point

$replica = Get-VBRCDPReplica -Name "Win05"
Start-VBRCDPReplicaFailover -Replica $replica -Force
This example show how to perform a failover to the latest restore point. The cmdlet will perform a failover without without showing warnings in the PowerShell console.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Start-VBRCDPReplicaFailover cmdlet. Set the $replica variable as the Replica parameter. Provide the Force parameter.
> Example 2. Performing Failover to CDP Replica Replicated State

$replica = Get-VBRCDPReplica -Name "Win05"
$restorepoints = Get-VBRCDPShortTermRestoreInterval -Replica $replica
$date = Get-Date -Year 2020 -Month 2 -Day 2 -Hour 0 -Minute 0 -Second 0
Start-VBRCDPReplicaFailover -Replica $replica -ToPointInTime $date
This example shows how start to perform a failover to a specific replicated state of the CDP replica of the Win05 VM.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRCDPShortTermRestoreInterval cmdlet. Specify the Replica parameter value. Check a list of all replicated states that are available for VM replicas.
3. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $date variable.
4. Run the Get-VBRCDPShortTermRestoreInterval cmdlet. Set the $replica variable as the Replica parameter. Set the $date variable as the ToPointInTime parameter value.
> Example 3. Performing Failover to CDP Replica LongTerm Restore Point

$replica = Get-VBRCDPReplica -Name "Win05"
$restorepoint = Get-VBRCDPLongTermRestorePoint -Replica $replica -ApplicationConsistent
Start-VBRCDPReplicaFailover -Replica $replica -LongTermRestorePoint $restorepoint[0] -Force
This example shows how to start to perform a failover to a specific long-term restore point of the CDP replica of the Win05 VM.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRCDPLongTermRestorePoint cmdlet. Provide the ApplicationConsistent and Replica parameters. Save the result to the $restorepoint variable.
3. Run the Get-VBRCDPShortTermRestoreInterval cmdlet. Specify the following settings:
- Set the $replica variable as the Replica parameter.
- Set the $restorepoint[0] variable as the LongTermRestorePoint parameter.
- Provide the ToPointInTime parameter.

---

### Parameters
#### **Commit**
Defines that the cmdlet will perform permanent failover of the specified replicas in the failover state.
* If you provide this parameter, the cmdlet will permanently switch processes from the original VM to the VM protected with CDP and will set for the CDP replica a role of the original VM.
* If you do not provide this parameter, the cmdlet will not set the CDP replica a role of the original VM after performing a failover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will perform a failover without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LongTermRestorePoint**
Specifies a long-term restore point of a VM protected with CDP.
The cmdlet will perform failover to this restore point.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRCDPLongTermRestorePoint]`|true    |named   |False        |

#### **Planned**
Defines that the cmdlet will perform planned failover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **PowerOn**
Defines that the cmdlet will power on a CDP replica after performing a failover.
If you do not provide this parameter, the cmdelt will not power on the replica.
Default: True.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing a failover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Replica**
Specifies a VM protected with CDP to which you want to perform a failover.
Accepts the VBRCDPReplica object.
To create this object, run the Get-VBRCDPReplica cmdlet.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRCDPReplica]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ToPointInTime**
Specifies a replicated state that are available for a VM protected with CDP.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

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
Veeam.Backup.PowerShell.Infos.VBRCDPReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRCDPReplicaFailover [-Commit] [-Force] -LongTermRestorePoint <VBRCDPLongTermRestorePoint> [-PowerOn] [-Reason <String>] -Replica <VBRCDPReplica> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRCDPReplicaFailover [-Commit] [-Force] -Planned [-PowerOn] [-Reason <String>] -Replica <VBRCDPReplica> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRCDPReplicaFailover [-Commit] [-Force] [-PowerOn] [-Reason <String>] -Replica <VBRCDPReplica> [-RunAsync] [-ToPointInTime <DateTime>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
