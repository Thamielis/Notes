Start-VBRHvReplicaFailback
--------------------------

### Synopsis
Fails back Hyper-V VMs to production host.

---

### Description

This cmdlet fails back Hyper-V VMs to the production host.
This cmdlet finalizes the replica failover started with the Start-VBRHvReplicaFailover cmdlet.

Run the Stop-VBRReplicaFailover cmdlet to undo failover.
Run the Stop-VBRHvReplicaFailback cmdlet to undo failback.

Note: The cmdlet will not run if the geographic location of the VMs you want to fail back and the target production host location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Find-VBRHvEntity](Find-VBRHvEntity)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1

$restorepoint = Get-VBRRestorePoint -Name "WebServer_replica" | Sort-Object $_.creationtime -Descending | Select -First 1
Start-VBRHvReplicaFailback -RestorePoint $restorepoint -RunAsync
This example shows how to failback to the original VM.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Filter restore points with the Sort-Object method by the creationtime property to get the most recent one. Save the result to the $restorepoint variable.
2. Run the Start-VBRHvReplicaFailback cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Provide the RunAsync parameter.
> Example 2

$restorepoint = Get-VBRRestorePoint -Name "WebServer_replica" | Sort-Object $_.creationtime -Descending | Select -First 1
$vm = Find-VBRHvEntity -Name "Fileserver02"
Start-VBRHvReplicaFailback -RestorePoint $restorepoint -VM $vm
This example shows how to failback to the original VM restored in a different location.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Filter restore points with the Sort-Object method by the creationtime property to get the most recent one. Save the result to the $restorepoint variable.
2. Run the Find-VBRHvEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
3. Run the Start-VBRHvReplicaFailback cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $vm variable as the VM parameter value.
> Example 3

$restorepoint = Get-VBRRestorePoint -Name "WebServer_replica" | Sort-Object $_.creationtime -Descending | Select -First 1
$srv =  Get-VBRServer -Name "tech.support.local"
Start-VBRHvReplicaFailback -RestorePoint $restorepoint -Server $srv -VmName "Webserver_N" -QuickRollback
This example shows how to failback to another location.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Filter restore points with the Sort-Object method by the creationtime property to get the most recent one. Save the result to the $restorepoint variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $srv variable.
3. Run the Start-VBRHvReplicaFailback cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $srv variable as the Server parameter value.
- Specify the VmName parameter value.
- Provide the QuickRollback parameter.

---

### Parameters
#### **Complete**
Defines that the failback will be committed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Datastore**
Used for failback to another location.
Specifies the path to the folder where you want to register the VM.
If not specified, the cmdlet will use the datastore that is set as default for the target host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will perform failback even if the geographic location of the VMs you want to fail back and the target production host location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Network**
Used for failback to another location.
Specifies the array of production site networks. The cmdlet will map the replica to these networks.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRHvServerNetworkInfo[]]`|false   |named   |False        |

#### **PowerOn**
Defines that the production VM will be powered on after the failback. Otherwise, you will need to power the VM on manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PreserveVmID**
Defines that the restored VM will get the ID of the original VM. Otherwise, the restored VM will get a new ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **QuickRollback**
Defines that the cmdlet will perform incremental failback.
Note:  Incremental failback uses VM changed block tracking data. If the cmdlet fails to retrieve the changed block tracking data for some reason, it will perform full VM failback.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing a failback.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RegisterAsClusterResource**
Defines that the VM will be registered as a part of Microsoft Failover Cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RestorePoint**
Specifies the replica restore point.
The cmdlet uses this restore point to identify the replica you want to fail back.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Used for failback to another location.
Specifies the Hyper-V host where you want to register the VM.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **Vm**
Used for failback to the original VM restored in a different location.
Specifies the VM restored from backup. The cmdlet will map the replica to this VM.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CHvVmItem]`|true    |named   |False        |

#### **VmName**
Used for failback to another location.
Specifies the name you want to assign to the new VM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Start-VBRHvReplicaFailback [-Complete] [-Force] [-PowerOn] [-QuickRollback] [-Reason <String>] -RestorePoint <COib> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRHvReplicaFailback [-Datastore <String>] [-Force] [-Network <VBRHvServerNetworkInfo[]>] [-PowerOn] [-PreserveVmID] [-QuickRollback] [-Reason <String>] [-RegisterAsClusterResource] -RestorePoint <COib> 
```
```PowerShell
[-RunAsync] -Server <CHost> [-VmName <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRHvReplicaFailback [-Force] [-PowerOn] [-QuickRollback] [-Reason <String>] -RestorePoint <COib> [-RunAsync] -Vm <CHvVmItem> [-Confirm] [-WhatIf] [<CommonParameters>]
```
