Set-VBRHvCloudReplicaJob
------------------------

### Synopsis
Modifies a Hyper-V cloud replication job.

---

### Description

This cmdlet modifies an existing Hyper-V cloud replication job. To modify settings, you need to enter the corresponding parameters with new values. The parameters that you omit will remain unchanged.

NOTE: The cmdlet will not run if the geographical location of the VMs added to the job and the target cloud host location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRCloudServer](Get-VBRCloudServer)

* [Get-VBRCloudDatastore](Get-VBRCloudDatastore)

* [Find-VBRHvEntity](Find-VBRHvEntity)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRHvServerNetworkInfo](Get-VBRHvServerNetworkInfo)

* [Get-VBRCloudServerNetworkInfo](Get-VBRCloudServerNetworkInfo)

* [Get-VBRWANAccelerator](Get-VBRWANAccelerator)

* [Get-VBRHvProxy](Get-VBRHvProxy)

* [Get-VBRLocation](Get-VBRLocation)

---

### Examples
> Example - Changing Cloud Replica Job Settings

$job = Get-VBRJob -Name "Hv Cloud Replica Job"
$vms = Find-VBRHvEntity -Name fileserver*
$cloudServer = Get-VBRCloudServer -Name 104.45.95.227
$NewCloudDatastore = Get-VBRCloudDatastore -CloudServer $NewCloudServer -Name "KLMDatastore"
Set-VBRHvCloudReplicaJob -Job $job -Entity $vms -Datastore $NewCloudDatastore
This example shows how to apply custom settings to a cloud replica job.

Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Find-VBRHvEntity cmdlet. Specify the Name parameter value. Save the result to the $vms variable.
3. Run the Get-VBRCloudServer cmdlet. Specify the Name parameter value. Save the server to the $cloudServer variable.
4. Run the Get-VBRCloudDatastore cmdlet. Set the $cloudServer variable as the CloudServer parameter value. Specify the Name parameter value. Save the datastore to the $NewCloudDatastore variable.
5. Run the Set-VBRHvCloudReplicaJob cmdlet. Specify the following settings:
- Set the $job variable as Job parameter value.
- Set the $vms variable as Entity parameter value.
- Set the $NewCloudDatastore variable as Datastore parameter value.

---

### Parameters
#### **BackupRepository**
Specifies the backup repository which will be used to store replica metadata files. If not set, the default backup repository will be used. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Datastore**
Specifies the cloud disk volume to which you want to replicate. Accepts the VBRCloudDatastore object. To get this object, run the Get-VBRCloudDatastore cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRCloudDatastore]`|false   |named   |False        |

#### **Description**
Specifies the description of the new job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableNetworkMapping**
Enables the network mapping option.  Use the SourceNetwork and the TargetNetwork parameters to set the network mapping rules.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSeeding**
Enables replica seeding option for the replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableVMMapping**
Enables replica mapping option for the replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies the array of VMs you want to replicate. Accepts the IHvItem[] object.  To get this object, run the Find-VBRHvEntity cmdlet.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IHvItem[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify the cloud replication job even if the geographic location of the VMs added to the job and the target cloud host location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the replication job you want to modify. Accepts the CBackupJob object. To get this object, run the Get-VBRJob cmdlet.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the string with the name of the created replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **OriginalVM**
For replica mapping. Specifies the production VM you want to replicate using replica mapping. The replication job will map this VM to a selected replica VM on the DR site. Use the ReplicaVM parameter to specify the replica VM on the DR site. Accepts the CHvVmItem[] object.  To get this object, run the Find-VBRHvEntity cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CHvVmItem[]]`|false   |named   |False        |

#### **ReplicaVM**
Specifies the VM replicFor replica mapping. Specifies the VM on the DR site you want to use as the replication target. The replication job will map the production VM to this VM. Use the OriginalVM parameter to specify the production VM. Accepts the COib[] object.  To create this object, run the Get-VBRRestorePoint cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[COib[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding. Specifies the backup repository on which a backup used as a seed for the replication job resides. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **SourceNetwork**
Used to set the source network for the EnableNetworkMapping parameter. Specifies the production network to which VMs added to the job are connected. Use the TargetNetwork parameter to set the target network.  NOTE: the number of the source and the target networks must be the same. Accepts the VBRHvServerNetworkInfo[] object.  To get this object, run the Get-VBRHvServerNetworkInfo cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRHvServerNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies the source proxy that will be used by the job. Default: Automatic selection. Accepts the CHvProxy[] object.  To get this object, run the Get-VBRHvProxy cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CHvProxy[]]`|false   |named   |False        |

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
Used to set the target network for the EnableNetworkMapping parameter. Specifies the network in the DR site to which VM replicas must be connected. Use the SourceNetwork parameter to set the source network.  NOTE: the number of the source and the target networks must be the same. Accepts the VBRCloudServerNetworkInfo[] object.  To get this object, run the Get-VBRCloudServerNetworkInfo cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRCloudServerNetworkInfo[]]`|false   |named   |False        |

#### **UseWANAccelerator**
Defines that the data must be transferred via WAN accelerators. Use the SourceWANAccelerator parameter to set the WAN accelerator on the source side.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRHvCloudReplicaJob [-BackupRepository <CBackupRepository>] [-Datastore <VBRCloudDatastore>] [-Description <String>] [-EnableNetworkMapping] [-EnableSeeding] [-EnableVMMapping] [-Entity <IHvItem[]>] 
```
```PowerShell
[-Force] [-HighPriority] -Job <CBackupJob> [-Name <String>] [-OriginalVM <CHvVmItem[]>] [-ReplicaVM <COib[]>] [-RepositorySeed <CBackupRepository>] [-SourceNetwork <VBRHvServerNetworkInfo[]>] [-SourceProxy 
```
```PowerShell
<CHvProxy[]>] [-SourceRepository <CBackupRepository[]>] [-SourceWANAccelerator <CWanAccelerator>] [-Suffix <String>] [-TargetNetwork <VBRCloudServerNetworkInfo[]>] [-UseWANAccelerator] [<CommonParameters>]
```
