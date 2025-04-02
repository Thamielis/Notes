Start-VBRViReplicaFailback
--------------------------

### Synopsis
Fails back VMware VMs to production host.

---

### Description

This cmdlet fails back VMware VMs to the production host.
This cmdlet finalizes the replica failover started with the Start-VBRViReplicaFailover cmdlet.

Run the Stop-VBRReplicaFailover cmdlet to undo failover.
Run the Stop-VBRViReplicaFailback cmdlet to undo failback.
Note: The cmdlet will not run if the geographic location of the VMs you want to fail back and the target production host location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Example 1

$restorepoint = Get-VBRRestorePoint -Name "WebServer_replica" | Sort-Object $_.creationtime -Descending | Select -First 1
Start-VBRViReplicaFailback -RestorePoint $restorepoint -StoragePolicyAction Current -PowerOn -QuickRollback
This example shows how to fail back to the original VM. The VM will fail back with the following parameters:
- The storage policy is set to Current.
- The cmdlet will power the VM on after failback.
- The cmdlet will perform failback using changed block tracking data.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Filter restore points with Sort-Object method by the creationtime property to get the most recent one. Save the result to the $restorepoint variable.
2. Run the Start-VBRViReplicaFailback cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the Current value as the StoragePolicyAction parameter value.
- Provide the PowerOn and QuickRollback parameters.
> Example 2

$restorepoint = Get-VBRRestorePoint -Name "WebServer_replica" | Sort-Object $_.creationtime -Descending | Select -First 1
$vm =  Find-VBRViEntity -Name "Fileserver03"
Start-VBRViReplicaFailback -RestorePoint $restorepoint -VM $vm
This example shows how to fail back to the VM restored in a new location.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Filter restore points with Sort-Object method by the creationtime property to get the most recent one. Save the result to the $restorepoint variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
3. Run the Start-VBRViReplicaFailback cmdlet. Set the $restorepoint as the RestorePoint parameter value. Set the $vm variable as the VM parameter value.

---

### Parameters
#### **Complete**
If set, the failback will be committed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Datastore**
For performing failback to a new location or to any location but with different settings.
Specifies the datastore where you want to register the recovered VM.
If not specified, the cmdlet will use the datastore that is set as default for the target host.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **DRSiteProxy**
Specifies the proxy configured on the disaster recovery site.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **Folder**
For performing failback to a new location or to any location but with different settings.
Specifies the folder where you want to register the recovered VM.
If not specified, the cmdlet will use the folder that is set as default for the target host.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will perform failback even if the geographic location of the VMs you want to fail back and the target production host location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Network**
For performing failback to a new location or to any location but with different settings.
Specifies the array of production site networks. The cmdlet will map the replica to these networks.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **PowerOn**
Defines that the production VM will be powered on after the failback. Otherwise, you will need to power the VM on manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ProdSiteProxy**
Specifies the proxy configured on the production site.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **QuickRollback**
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

#### **ReIp**
Defines that the production VM will use the re-IP rules set in the replication job.
Do not enable the re-IP if the re-IP rules are not configured in the replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ResourcePool**
For performing failback to a new location or to any location but with different settings.
Specifies the resource pool where you want to register the recovered VM.
If not specified, the cmdlet will use the resource pool that is set as default for the target host.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **RestorePoint**
Specifies the replica restore point. The cmdlet uses this restore point to identify the replica you want to fail back.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.
Note: This parameter cannot be used if you set the failback switch  schedule by running the New-VBRFailbackSwitchingSchedule cmdlet to the Auto or Scheduled types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
For performing failback to a new location or to any location but with different settings.
Specifies the ESXi host where you want to register the recovered VM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |named   |False        |

#### **SkipTagsRestore**
Defines that the VM will be restored without its VMware tag. Otherwise, the restored VM will keep its original tag.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StoragePolicy**
For performing failback to a new location or to any location but with different settings.
Specifies the storage policy with which you want to register the recovered VM.
If not specified, the cmdlet will use the storage policy that is set as default for the target host.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

#### **StoragePolicyAction**
Specifies the strategy for selecting storage policy profile in case the storage profile of the backed up VM differs from the profile of the original VM.
* Current: the restored VM will be subscribed to the same profile as in backup (if such profile still exists) or to the profile to which the original VM is subscribed (if profile as in backup was removed).
* Default: the restored VM will be subscribed to the profile that is set as default for the target datastore.
* Stored: the restored VM will be subscribed to the profile as in backup (if such profile still exists).
Valid Values:

* Current
* Stored
* Default

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRStoragePolicyAction]`|false   |named   |False        |

#### **SwitchingSchedule**
Specifies a switching schedule for a VM replica. The cmdlet will switch the replica to the production VM according to this schedule

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRFailbackSwitchingSchedule]`|false   |named   |False        |

#### **SwitchToProduction**
Defines that the cmdlet will switch a VM replica from the Ready to switch state to the Failback state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Vm**
For performing failback to a new location.
Specifies the VM restored from backup. The cmdlet will map the replica to this VM.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CViVmItem]`|true    |named   |False        |

#### **VmName**
For performing failback to a new location or to any location but with different settings.
Specifies the name of the VM. The cmdlet will recover a VM with this name and will perform failback of the replica to this VM.
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
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRViReplicaFailback [-Complete] [-Datastore <VBRViDatastoreBase>] [-DRSiteProxy <CViProxy[]>] [-Folder <CViFolderItem>] [-Force] [-Network <VBRViNetworkInfo[]>] [-PowerOn] [-ProdSiteProxy <CViProxy[]>] 
```
```PowerShell
[-QuickRollback] [-Reason <String>] [-ReIp] [-ResourcePool <CViResourcePoolItem>] -RestorePoint <COib> [-RunAsync] -Server <Object> [-SkipTagsRestore] [-StoragePolicy <VBRViStoragePolicy>] [-SwitchingSchedule 
```
```PowerShell
<VBRFailbackSwitchingSchedule>] [-SwitchToProduction] [-VmName <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRViReplicaFailback [-Complete] [-DRSiteProxy <CViProxy[]>] [-Force] [-PowerOn] [-ProdSiteProxy <CViProxy[]>] [-QuickRollback] [-Reason <String>] [-ReIp] -RestorePoint <COib> [-RunAsync] 
```
```PowerShell
[-SkipTagsRestore] [-StoragePolicyAction {Current | Stored | Default}] [-SwitchingSchedule <VBRFailbackSwitchingSchedule>] [-SwitchToProduction] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRViReplicaFailback [-Complete] [-DRSiteProxy <CViProxy[]>] [-Force] [-PowerOn] [-ProdSiteProxy <CViProxy[]>] [-QuickRollback] [-Reason <String>] [-ReIp] -RestorePoint <COib> [-RunAsync] 
```
```PowerShell
[-SkipTagsRestore] [-SwitchingSchedule <VBRFailbackSwitchingSchedule>] [-SwitchToProduction] -Vm <CViVmItem> [-Confirm] [-WhatIf] [<CommonParameters>]
```
