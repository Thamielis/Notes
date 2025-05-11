Add-VBRViCloudReplicaJob
------------------------

### Synopsis
Creates a new VMware cloud replication job.

---

### Description

This cmdlet creates a new VMware cloud replication job. Cloud replication creates a VM replica on a cloud host and maintains it in synch with the original VM. Note that cloud replication does not support replica from backup. When you create a replication job, you can configure the following additional settings:
- Network mapping: this option allows you to configure network mapping rules if the production site and the cloud host uses separate virtual networks. Use the EnableNetworkMapping parameter to enable the network mapping and the SourceNetwork and the TargetNetwork parameters to select the networks.
- Proxy server: this options allow you to assign particular proxy server for the data transfer. Use the SourceProxy parameter to set the proxy explicitly or leave the default (Automatic selection).
- WAN accelerators: this options allow you to use the built-in WAN accelerators to optimize the data transfer. Note that WAN accelerators must work in pair, so you can use the WAN acceleration only if the cloud provider has a WAN accelerator on the target side. Use the SourceWANAccelerator parameter to set the source WAN accelerator.
- Ri-IP rules: this option allows you to configure different IP addressing scheme for the production site and the cloud host. You need to create an object containing the re-IP rules beforehand by running the New-VBRViReplicaReIpRule cmdlet. Then pass the created object to the ReIpRule parameter of this cmdlet.
Note that when you create a replica job, you need to run it manually unless you enable a job schedule.

Run the Start-VBRJob cmdlet to run the job manually.  Run the Set-VBRJobSchedule cmdlet to set schedule for the job and run it automatically.

NOTE:  The cmdlet will not run if the geographic location of the VMs added to the job and the target cloud host location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

* [Get-VBRCloudServer](Get-VBRCloudServer)

* [Get-VBRCloudDatastore](Get-VBRCloudDatastore)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRViServerNetworkInfo](Get-VBRViServerNetworkInfo)

* [Get-VBRViProxy](Get-VBRViProxy)

* [Get-VBRWANAccelerator](Get-VBRWANAccelerator)

* [Get-VBRLocation](Get-VBRLocation)

---

### Examples
> Example - Creating Cloud Replica Job

$vm = Find-VBRViEntity -Name "web_application_server"
$cloudServer = Get-VBRCloudServer -Name 104.45.95.227
$cloudDatastore = Get-VBRCloudDatastore -CloudServer $cloudServer -Name "ABCDatastore"
Add-VBRViCloudReplicaJob -Name "Cloud Replica Job" -Entity $vm -Server $cloudServer -Datastore $cloudDatastore
This example shows how to create a cloud replica job.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Get-VBRCloudServer cmdlet. Specify the Name parameter value. Save the result to the $cloudServer variable.
3. Run the Get-VBRCloudDatastore cmdlet. Set the $cloudServer variable as CloudServer parameter value. Specify the Name parameter value. Save the datastore to the $cloudDatastore variable.
4. Run the Add-VBRViCloudReplicaJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $vm variable as Entity parameter value.
- Set the $cloudServer variable as Server parameter value.
- Set the $cloudDatastore variable as Datastore parameter value.

---

### Parameters
#### **BackupRepository**
Specifies the user backup repository that will be used to store replica metadata files. If not set, the default backup repository will be used. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Datastore**
Specifies the cloud datastore to which you want to replicate. Accepts the VBRCloudDatastore object. To get this object, run the Get-VBRCloudDatastore cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRCloudDatastore]`|true    |named   |False        |

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
Enables the network mapping option. Use the SourceNetwork and the TargetNetwork parameters to set the network mapping rules.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies the array of VMs you want to add to the job. Accepts the IViItem[] object.  To get this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IViItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will create a job even if the geographic location of the VMs added to the job and the target cloud host location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the cloud replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **OriginalVM**
For replica mapping. Specifies the production VM you want to replicate using replica mapping. The replication job will map this VM to a selected replica VM on the DR site. Use the ReplicaVM parameter to specify the replica VM on the DR site. Accepts the CViVmItem[] object.  To get this object, run the Find-VBRViEntity cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **ReplicaVM**
For replica mapping. Specifies the VM on the DR site you want to use as the replication target. The replication job will map the production VM to this VM. Use the OriginalVM parameter to specify the production VM. Accepts the COib[] object.  To create this object, run the Get-VBRRestorePoint cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[COib[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding. Specifies the backup repository where the seed (the full backup) resides. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Server**
Specifies the cloud host allocated by the service provider under the hardware plan. The replicas will be created on this host. Accepts the VBRCloudServer object. To get this object, run the Get-VBRCloudServer cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRCloudServer]`|true    |named   |False        |

#### **SourceNetwork**
Used to set the source network for the EnableNetworkMapping parameter. Specifies the production network to which VMs added to the job are connected. Use the TargetNetwork parameter to set the target network.  NOTE: The number of the source and the target networks must be the same. Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies the source proxy that will be used by the job. Default: Automatic selection. Accepts the CViProxy[] object.  To get this object, run the Get-VBRViProxy cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **SourceRepository**
Used for building replica from backup files. Specifies the backup repository that will be used to read the VM data from the already existing backup chain. You cannot specify cloud repository. Accepts the CBackupRepository[] object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **SourceWANAccelerator**
Specifies the WAN accelerator configured in the source site that will be used for data transfer. Note that you can set the source WAN accelerator only if the cloud provider has a target WAN accelerator configured. Accepts the CWanAccelerator object.  To get this object, run the Get-VBRWANAccelerator cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that will be appended to the name of the VM you are replicating. This name will be used to register the replicated VM on the target server. If omitted, the replicated VMs will have the '_replica' suffix by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
Used to set the target network for the EnableNetworkMapping parameter. Specifies the network in the DR site to which VM replicas must be connected. Use the SourceNetwork parameter to set the source network.  NOTE: The number of the source and the target networks must be the same. Accepts the VBRCloudServerNetworkInfo[] object. To get this object, run the Get-VBRCloudServerNetworkInfo cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRCloudServerNetworkInfo[]]`|false   |named   |False        |

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
Add-VBRViCloudReplicaJob [-BackupRepository <CBackupRepository>] -Datastore <VBRCloudDatastore> [-Description <String>] [-DiskType {Source | Thick | Thin | ThickEagerZeroed}] [-EnableNetworkMapping] -Entity 
```
```PowerShell
<IViItem[]> [-Force] [-HighPriority] [-Name <String>] [-OriginalVM <CViVmItem[]>] [-ReplicaVM <COib[]>] [-RepositorySeed <CBackupRepository>] -Server <VBRCloudServer> [-SourceNetwork <VBRViNetworkInfo[]>] 
```
```PowerShell
[-SourceProxy <CViProxy[]>] [-SourceRepository <CBackupRepository[]>] [-SourceWANAccelerator <CWanAccelerator>] [-Suffix <String>] [-TargetNetwork <VBRCloudServerNetworkInfo[]>] [<CommonParameters>]
```
