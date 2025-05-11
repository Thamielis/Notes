Start-VBRViInstantRecoveryMigration
-----------------------------------

### Synopsis
Starts VMs quick migration to specified ESXi host.

---

### Description

This cmdlet starts VMs quick migration to specified ESXi host.
You can run this cmdlet after you perform Instant Recovery.

---

### Related Links
* [Get-VBRInstantRecovery](Get-VBRInstantRecovery)

* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViResourcePool](Find-VBRViResourcePool)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Find-VBRViFolder](Find-VBRViFolder)

---

### Examples
> Performing VMs Quick Migration

$session = Get-VBRInstantRecovery
$server = Get-VBRServer -Name support.north.local
$pool = Find-VBRViResourcePool -Name "ResourcePool_9"
$store = Find-VBRViDatastore -Name "Datastore_5"
$folder = Find-VBRViFolder -Name "VM_recovery"
Start-VBRViInstantRecoveryMigration -InstantRecovery $session -Server $server -ResourcePool $pool -Datastore $store -Folder $folder -ForceVeeamQM -RunAsync
This example shows how to migrate the VMs to a the support.north.local ESXi host with the following settings:

- The target resource pool is set to ResourcePool_9.
- The target datastore is set to Datastore_5.
- The target folder is set to VM_recovery.
- The cmdlet will apply the Veeam Quick Migration mechanism to migrate VMs.
- The RunAsync parameter is set to bring the process to the background.
Perform the following steps:
1. Run the Get-VBRInstantRecovery cmdlet. Save the result to the $session variable.
2. Run the Get-VBRServer cmdlet. Provide the Name parameter value. Save the result to the $server variable.
3. Run the Find-VBRViResourcePool cmdlet. Provide the Name parameter value. Save the result to the $pool variable.
4. Run the Find-VBRViDatastore cmdlet. Provide the Name parameter value. Save the result to the $store variable.
5. Run the Find-VBRViFolder cmdlet. Provide the Name parameter value. Save the result to the $folder variable.
6. Run the Start-VBRViInstantRecoveryMigration cmdlet. Specify the following settings:
- Set the $session variable as the InstantRecovery parameter value.
- Set the $server variable as the Server parameter value.
- Set the $pool variable as the ResourcePool parameter value.
- Set the $store variable as the Datastore parameter value.
- Set the $folder variable as the Folder parameter value.
- Provide the ForceVeeamQM parameter.
- Provide the RunAsync parameter.

---

### Parameters
#### **Datastore**
Specifies the datastore to which you want to migrate restored VMs.
Veeam Backup & Replication will redirect the redo logs to the selected datastore.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CViDatastoreItem]`|false   |named   |False        |

#### **DeleteSourceVmFiles**
Defines that the cmdlet will delete the original VM on the source host after the heartbeat is received.
If you do not provide this parameter, the source VM will not be deleted. All jobs to which the VM is added will continue to process the source VM.
Note: You can not apply this option if you provide the ForceVeeamQM parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Folder**
Specifies the folder where you want to store the migrated VM.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will perform VM restore even if the geographic location of the repository where VM backups reside and the target host location does not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ForceVeeamQM**
Defines that the cmdlet will apply the Veeam Quick Migration mechanism to migrate VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **InstantRecovery**
Specifies a running Instant Recovery session.
The cmdlet will start a quick migration of VMs that are recovered during this session.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[InstantRecovery]`|true    |0       |True (ByPropertyName, ByValue)|

#### **ResourcePool**
Specifies the resource pool.
The cmdlet will migrate restored VMs to this resource pool.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies the target ESXi host. The cmdlet will migrate restored VMs to this host.
Note: You must not specify a vCenter Server in this parameter.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **SourceProxy**
Specifies an array of the source backup proxies that you want to use as source backup proxies.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the VMware storage policy profile that must be applied to the restored virtual disks.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

#### **TargetProxy**
Specifies an array of the target backup proxies that you want to use as target backup proxies.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **ToTarget**
Defines target server settings.
If you provide this parameter and do not specify the target server explicitly with the Server parameter, the cmdlet will migrate VMs to the ESXi host that is specified in the Instant Recovery session. Otherwise, it will mirgate VMs to the original ESXi host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.InstantRecovery

---

### Outputs
* Veeam.Backup.Core.CBackupSession

---

### Notes

---

### Syntax
```PowerShell
Start-VBRViInstantRecoveryMigration [-InstantRecovery] <InstantRecovery> [-Datastore <CViDatastoreItem>] [-DeleteSourceVmFiles] [-Folder <CViFolderItem>] [-Force] [-ForceVeeamQM] [-ResourcePool 
```
```PowerShell
<CViResourcePoolItem>] [-RunAsync] [-Server <CHost>] [-SourceProxy <CViProxy[]>] [-StoragePolicy <VBRViStoragePolicy>] [-TargetProxy <CViProxy[]>] [-ToTarget] [<CommonParameters>]
```
