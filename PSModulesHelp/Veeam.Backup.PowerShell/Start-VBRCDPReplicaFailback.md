Start-VBRCDPReplicaFailback
---------------------------

### Synopsis
Starts to perform failback from a CDP replica to the production VM.

---

### Description

This cmdlet starts to perform failback from CDP replica to the production VM. The CPD replica must be in the failover status. After you start to commit failback, the cmdlet switches the status of the CDP replica from the Fialover state to the Ready to switch state.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Example 1. Performing Failback from CDP Replica to Orignal VM

$replica = Get-VBRCDPReplica -Name "Win05"
$DRproxy = Get-VBRCDPProxy -Name "Proxy05, Proxy07, Proxy09"
$prodproxy = Get-VBRCDPProxy -Name "Proxy12, Proxy13, Proxy15"
Start-VBRCDPReplicaFailback -Replica $replica -DRProxy $DRproxy -ProductionProxy $prodproxy
This example shows how to perform a failback from the Win05 CDP replica to the original VM with the following settings:
- The cmdlet will use the Proxy05, Proxy07, Proxy09 machines as VMware CDP proxies that are configured on the disaster recovery site.
- The cmdlet will use the Proxy12, Proxy13, Proxy15 machines as  VMware CDP proxies that are configured on the production site.
Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRCDPProxy cmdlet. Save the result to the $DRproxy variable.
3. Run the Get-VBRCDPProxy cmdlet. Save the result to the $prodproxy variable.
4. Run the Start-VBRCDPReplicaFailback cmdlet. Specify the following settings:
- Set the $replica variable as the Replica parameter value.
- Set the $DRproxy variable as the DRProxy parameter value.
- Set the $prodproxy variable as the ProductionProxy parameter value.
> Example 2. Performing Failback from CDP Replica to Different Location

$replica = Get-VBRCDPReplica -Name "Win05"
$server = Get-VBRServer -Name "ESXiHost 04"
$originalvm = Find-VBRViEntity -Server $server -Name "Win05_Prod"
Start-VBRCDPReplicaFailback -Replica $replica -DestinationVM $originalvm
This example shows how to perform a failback from the CDP replica of the Win05 VM to the Win05_Prod original VM.
This VM is restored on the ESXiHost 04 ESXi host.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Get the original VM:
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $originalvm variable.
3. Run the Stop-VBRCDPReplicaFailback cmdlet. Set the $replica variable as the Replica parameter value. Set the $originalvm variable as the DestinationVM parameter value.
> Example 3. Performing Failback from CDP Replica with Different Settings

$replica = Get-VBRCDPReplica -Name "Win05"
$server = Get-VBRServer -Name "ESXiHost 03"
$pool = Find-VBRViEntity -Server $server -ResourcePools -Name "Resources"
$folder = Find-VBRViEntity -Server $server  -Name "ProductionRestored"
Start-VBRCDPReplicaFailback -Replica $replica -Server $server -ResourcePool $pool -Folder $folder -VmName "Win07_Prod"
This example shows how to perform failback from the Win05 CDP replica to the Win07_Prod VM. The Win07_Prod VM is restored during failback to the Resources resource pool and the ProductionRestored folder.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Get the server, resource pool and folder:
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $pool variable.
- Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $folder variable.
2. Run the Stop-VBRCDPReplicaFailback cmdlet. Specify the following settings:
- Set the $replica variable as the Replica parameter value.
- Set the $server variable as the Server parameter value.
- Set the $pool variable as the ResourcePool parameter value.
- Set the $folder variable as the Folder parameter value.

---

### Parameters
#### **Complete**
Defines that the cmdlet will switch the CDP replica from the failback state to the permanent failback state.
Note: Do not use this parameter if the PowerOn parameter is specified. Otherwise, the cmdlet will not work.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Datastore**
For performing failback to a new location or to any location but with different settings.
Specifies the datastore. The cmdlet will perform failback of the CDP replica to a VM that will be recovered to this datastore.
If not specified, the cmdlet will use the datastore that is set as default for the target host.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **DestinationVM**
For performing failback to a new location.
Specifies a VM that is restored in a different location. The cmdlet will perform failback from the CDP replica to this VM.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CViVmItem]`|true    |named   |False        |

#### **DRNetwork**
For performing failback to a new location or to any location but with different settings.
Specifies an array of disaster recovery site networks. The cmdlet will map replica to these networks.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **DRProxy**
Specifies an array of VMware CDP proxies that are configured on the disaster recovery site.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

#### **Folder**
For performing failback to a new location or to any location but with different settings.
Specifies a folder. The cmdlet will perform failback of the CDP replica to a VM that will be recovered to this folder.
If you do not specify this parameter, the cmdlet will use the folder that is set as a default for the target host.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will to fail back without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IncludeTags**
Defines that the cmdlet will restore VMs with their VMware tags.
If you do not provide this paramer, the cmdlet will restore VMs without their VMware tag.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerOn**
Defines that the cmdlet will power on a production VM after failback. If you do not provide this parameter, you will need to power the VM on manually.
Default: False.
Note: Do not use this parameter if the Complete parameter is specified. Otherwise, the cmdlet will not work.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ProductionNetwork**
For performing failback to a new location or to any location but with different settings.
Specifies an array of production site networks. The cmdlet will map the replica to these networks.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **ProductionProxy**
Specifies an array of VMware CDP proxies that are configured on the production site.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

#### **QuickRollback**
For performing failback to the original VM.
Defines that the cmdlet will perform incremental failback.
Note: Incremental failback uses VM changed block tracking data. If the cmdlet fails to retrieve the changed block tracking data for some reason, it will perform full VM failback.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing a failback.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Replica**
Specifies a CDP replica from which you want to perform failback.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRCDPReplica]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ResourcePool**
For performing failback to a new location or to any location but with different settings.
Specifies a resource pool. The cmdlet will perform failback of the CDP replica to a VM that will be recovered to this resource pool.
If you do not specify this parameter, the cmdlet will use the resource pool that is set as a default for the target host.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.
Note: This parameter cannot be used if you set the failback switch  schedule by running the New-VBRFailbackSwitchingSchedule cmdlet to the Auto or Scheduled types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
For performing failback to a new location or to any location but with different settings.
Specifies an ESXi host or cluster. The cmdlet will perform failover of the CDP replica to a VM that will be recovered on this ESXi host or cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |named   |False        |

#### **SwitchingSchedule**
Specifies a switching schedule for the CDP replica. The cmdlet will switch the replica to the production VM according to this schedule.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRFailbackSwitchingSchedule]`|false   |named   |False        |

#### **SwitchToProduction**
Defines that the cmdlet will switch the CDP replica from the ready to switch state to the failback state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **VmName**
For performing failback to a new location or to any location but with different settings.
Specifies the name of the VM. The cmdlet will recover a VM with this name and will perform failback of the CDP replica to this VM.
If not specified, the cmdlet will use the name of the original VM.

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
Veeam.Backup.PowerShell.Infos.VBRCDPReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRCDPReplicaFailback [-Complete] [-Datastore <VBRViDatastoreBase>] [-DRNetwork <VBRViNetworkInfo[]>] [-DRProxy <VBRCDPProxy[]>] [-Folder <CViFolderItem>] [-Force] [-IncludeTags] [-PowerOn] 
```
```PowerShell
[-ProductionNetwork <VBRViNetworkInfo[]>] [-ProductionProxy <VBRCDPProxy[]>] [-Reason <String>] -Replica <VBRCDPReplica> [-ResourcePool <CViResourcePoolItem>] [-RunAsync] -Server <Object> [-SwitchingSchedule 
```
```PowerShell
<VBRFailbackSwitchingSchedule>] [-SwitchToProduction] [-VmName <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRCDPReplicaFailback [-Complete] -DestinationVM <CViVmItem> [-DRProxy <VBRCDPProxy[]>] [-Force] [-IncludeTags] [-PowerOn] [-ProductionProxy <VBRCDPProxy[]>] [-Reason <String>] -Replica <VBRCDPReplica> 
```
```PowerShell
[-RunAsync] [-SwitchingSchedule <VBRFailbackSwitchingSchedule>] [-SwitchToProduction] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRCDPReplicaFailback [-Complete] [-DRProxy <VBRCDPProxy[]>] [-Force] [-IncludeTags] [-PowerOn] [-ProductionProxy <VBRCDPProxy[]>] [-QuickRollback] [-Reason <String>] -Replica <VBRCDPReplica> [-RunAsync] 
```
```PowerShell
[-SwitchingSchedule <VBRFailbackSwitchingSchedule>] [-SwitchToProduction] [-Confirm] [-WhatIf] [<CommonParameters>]
```
