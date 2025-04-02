Add-VBRViReplicaJob
-------------------

### Synopsis
Creates VMware replication jobs.

---

### Description

This cmdlet creates a new VMware replication job.
You can select a data source from which VM data must be read:
- Actual VM: Veeam Backup & Replication will copy an actual VM from production storage. The created replica will mirror an actual VM state.
Use the Entity parameter to indicate the VMs you want to replicate.
- Replica from backup files: Veeam Backup & Replication will build a replica from backup files stored in a backup repository. The created replica will be in the latest state the VM is available in backups.
Use the Entity parameter to indicate the VMs you want to replicate and the SourceRepository parameter to set the repository from where the backup files must be read.
When you create a replication job, you can configure the following additional settings:
- Storage policy profile: you can apply a particular VMware storage policy profile to virtual disks of the replica VM. Use the StoragePolicy parameter to set the profile.
- Network mapping: this option allows you to configure network mapping rules if the production site and DR site uses separate virtual networks. Use the EnableNetworkMapping parameter to enable the network mapping and the SourceNetwork and the TargetNetwork parameters to select the networks.
- Proxy servers: this options allow you to configure particular proxy servers for the data transfer. Use the SourceProxy and the TargetProxy parameters to set the proxies.
- WAN accelerators: this options allow you to use the built-in WAN accelerators to optimize the data transfer. Use the SourceWANAccelerator and the TargetWANAccelerator parameters to set the WAN accelerators. Note that WAN acceleration is available only in the Enterprise Plus, Veeam Universal License edition.
- Ri-IP rules: this option allows you to configure different IP addressing scheme for the production and the DR sites. You need to create an object containing the re-IP rules before hand by running the New-VBRViReplicaReIpRule cmdlet. Pass the created object to the ReIpRule parameter of this cmdlet.
Note that when you create a replica job, you need to run it manually unless you enable a job schedule.
Run the Start-VBRJob cmdlet to run the job manually.
Run the Set-VBRJobSchedule cmdlet to set schedule for the job and run it automatically.
Note: The cmdlet will not run if the geographic location of the VMs added to the job and the job target repository location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Examples
> Example 1

$server = Get-VBRServer -Name "DR Host"
$vm = Find-VBRViEntity -Server $server -Name "DC"
$pool = Find-VBRViResourcePool -Server "DR Host" -Name "ResourcePool_05"
$datastore = Find-VBRViDatastore -Server "DR Host" -Name "LocalStore"
Add-VBRViReplicaJob -Name "DC Replication Job" -Server $server -Entity $vm -ResourcePool $pool -Datastore $datastore -Suffix "_replicated"
This example shows how to create a replication job.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViEntity cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value. Save it to the $vm variable.
3. Run the Find-VBRViResourcePool cmdlet. Specify the Server and Name parameter values. Save it to the $pool variable.
4. Run the Find-VBRViDatastore cmdlet. Specify the Server and Name parameter values. Save it to the $datastore variable.
5. Run the Add-VBRViReplicaJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $server variable as the Server parameter value.
- Set the $vm variable as the Entity parameter value.
- Set the $pool variable as the ResourcePool parameter value.
- Set the $datastore variable as the Datastore parameter value.
- Specify the Suffix parameter value.

---

### Parameters
#### **BackupRepository**
Specifies the backup repository that will be used to store replica metadata files.
Default: default backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Datastore**
Specifies the datastore to which you want to replicate.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **Description**
Specifies the description of the new job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DiskType**
Specifies the format that will be used to restore replica disk files:
* Source: the restored replica disks will be the same format as source.
* Thick: the restored replica disks will be thick.
* Thin: the restored replica disks will be thick.
Default: Source.
Valid Values:

* Source
* Thick
* Thin
* ThickEagerZeroed

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[EDiskCreationMode]`|false   |named   |False        |

#### **EnableNetworkMapping**
Enables the network mapping feature.
Use the SourceNetwork and the TargetNetwork parameters to set the network mapping rules.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies the array of  VMs you want to add to this job.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IViItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Folder**
Specifies the folder to which you want to replicate.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will create a job even if the geographic location of the VMs added to the job and the target host location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Multitag**
Defines that the cmdlet will replicate tags.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **OriginalVM**
For replica mapping.
Specifies a production VM you want to replicate using replica mapping.
The replication job will map this VM to a selected replica VM on the disaster recovery site.
Use the ReplicaVM parameter to specify the replica VM on the disaster recovery site.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **ReIpRule**
Specifies the re-IP rules.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRViReplicaReIpRule[]]`|false   |named   |False        |

#### **ReplicaVM**
For replica mapping.
Specifies a VM on the disaster recovery site.
The cmdlet will map the production VM to this VM, and the replication job will replicate data to this VM.
Use the OriginalVM parameter to specify the production VM.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding.
Specifies the backup repository where the seed (the full backup) resides.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **ResourcePool**
Specifies the resource pool to which you want to replicate.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **RestorePointsToKeep**
Specifies the number of restore points you want to keep.
Permitted values: 1 to 28.
Default: 7.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies the target VMware host where the created replica will be stored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |named   |False        |

#### **SourceNetwork**
For network mapping.
Specifies the array of production networks to which the VMs in the job are connected.
Note: The number of the source and the target networks must be the same.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies the source proxy that you want to assign to the job.
Default: automatic selection.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **SourceRepository**
For building replica from backup files.
Specifies the backup repository that will be used to read the VM data from the already existing backup chain.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **SourceWANAccelerator**
Specifies the WAN accelerator configured in the source site that will be used for data transfer.
Remember to set the pair of source and target WAN accelerators.
Default: Not set.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the VMware storage policy profile that must be applied to the replica virtual disks.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that will be appended to the name of the VM you are replicating. This name will be used to register the replicated VM on the target server.
Default: "_replica".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
For network mapping.
Specifies the array of networks in the disaster recovery site. The replicated VMs will be connected to these networks.
Note: The number of the source and the target networks must be the same.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **TargetProxy**
Specifies the target proxy that you want to assign to the job.
Default: automatic selection.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **TargetWANAccelerator**
Specifies the WAN accelerator configured in the target site that will be used for data transfer.
Remember to set the pair of source and target WAN accelerators.
Default: Not set.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Infrastructure.IViItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRViReplicaJob [-BackupRepository <CBackupRepository>] [-Datastore <VBRViDatastoreBase>] [-Description <String>] [-DiskType {Source | Thick | Thin | ThickEagerZeroed}] [-EnableNetworkMapping] -Entity 
```
```PowerShell
<IViItem[]> [-Folder <CViFolderItem>] [-Force] [-HighPriority] [-Multitag] [-Name <String>] [-OriginalVM <CViVmItem[]>] [-ReIpRule <VBRViReplicaReIpRule[]>] [-ReplicaVM <CViVmItem[]>] [-RepositorySeed 
```
```PowerShell
<CBackupRepository>] [-ResourcePool <CViResourcePoolItem>] [-RestorePointsToKeep <Int32>] -Server <Object> [-SourceNetwork <VBRViNetworkInfo[]>] [-SourceProxy <CViProxy[]>] [-SourceRepository 
```
```PowerShell
<CBackupRepository[]>] [-SourceWANAccelerator <CWanAccelerator>] [-StoragePolicy <VBRViStoragePolicy>] [-Suffix <String>] [-TargetNetwork <VBRViNetworkInfo[]>] [-TargetProxy <CViProxy[]>] [-TargetWANAccelerator 
```
```PowerShell
<CWanAccelerator>] [<CommonParameters>]
```
