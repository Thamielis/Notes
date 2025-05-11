Start-VBRvCDCDPReplicaFailover
------------------------------

### Synopsis
Starts to perform failover to a Cloud Director CDP replica.

---

### Description

This cmdlet starts to perform failover to a Cloud Director CDP replica. The replica must be in the Ready state.
Note: Before you start to perform failover to replicas we recommend to the run the Get-VBRvCDCDPShortTermRestoreInterval cmdlet to get a list of all replicated states that are available for replicas. This allows you to verify that you do not perform failover to replicated states of replicas that do not exist.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

* [Get-Date](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Get-Date)

* [Get-VBRvCDCDPLongTermRestorePoint](Get-VBRvCDCDPLongTermRestorePoint)

---

### Examples
> Example 1. Performing Failover to Restore Point Created at Specific Sate and Time

$replica = Get-VBRCDPReplica -Name "Win07"
$date = Get-Date  -Year 2020 -Month 2 -Day 2 -Hour 0 -Minute 0 -Second 0
Start-VBRvCDCDPReplicaFailover -Replica $replica -ToPointInTime $date
This example shows how to perform failover to a restore point created at a specific date and time.

Perform the following steps: 1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $date variable.
3. Run the Start-VBRvCDCDPReplicaFailover cmdlet. Set the $replica variable as the Replica parameter value. Set the $date variable as the ToPointInTime parameter value.
> Example 2. Performing Failover to Specific Long-Term Restore Point Created of Cloud Director CDP Replica

$replica = Get-VBRCDPReplica -Name "Win07"
$restorepoint = Get-VBRvCDCDPLongTermRestorePoint -Replica $replica
Start-VBRvCDCDPReplicaFailover -Replica $replica -LongTermRestorePoint $restorepoint
This example shows how to perform failover to a specific long-term restore point of a Cloud Director CDP replica.

Perform the following steps: 1. Run the Get-VBRCDPReplica cmdlet.  Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRvCDCDPLongTermRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
3. Run the Start-VBRvCDCDPReplicaFailover cmdlet. Set the $replica variable as the Replica parameter value. Set the $restorepoint variable as the LongTermRestorePoint parameter value.

---

### Parameters
#### **Commit**
Defines whether the cmdlet will perform permanent failover.
If you provide this parameter, the cmdelt will switch from the original vApp to the replica and will set for the replica the role of the original vApp.
If you do not provide this parameter, the cmdlet will not set for the replica the role of the original vApp after performing a failover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will peform failover without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LongTermRestorePoint**
Specifies a long-term restore point of a replica. The cmdlet will perform failover to this restore point.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRvCDCDPLongTermRestorePoint]`|true    |named   |False        |

#### **PowerOn**
Defines that the cmdlet will power on the replica after performing failover. If you do not want to power on the replica, set the parameter to False.
Note: If you provide this parameter with the Commit parameter, the cmdlet will always start the replica.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing failover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Replica**
Specifies the Cloud Director CDP replica to which you want to fail over.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRvCDCDPReplica]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Retry**
Defines that if failover does not complete successfully, the cmdlet will start to perform failover again.
If you do not specify this parameter, the cmdlet will not start to perform failover if any vApps are in the incomplete state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ToPointInTime**
Specifies date and time when a restore point was created. The cmdlet will perform failover to the restore point created at the specified date and time.

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
Veeam.Backup.PowerShell.Infos.VBRvCDCDPReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRvCDCDPReplicaFailover [-Commit] [-Force] -LongTermRestorePoint <VBRvCDCDPLongTermRestorePoint> [-PowerOn] [-Reason <String>] -Replica <VBRvCDCDPReplica> [-Retry] [-RunAsync] [-Confirm] [-WhatIf] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Start-VBRvCDCDPReplicaFailover [-Commit] [-Force] [-PowerOn] [-Reason <String>] -Replica <VBRvCDCDPReplica> [-Retry] [-RunAsync] [-ToPointInTime <DateTime>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
