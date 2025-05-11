Set-VBRViReplicaJob
-------------------

### Synopsis
Modifies VMware replication jobs.

---

### Description

This cmdlet modifies an existing VMware replication job.

Note: Consider the following:
- The cmdlet will not run if the geographic location of the VMs added to the job and the job target repository location do not match. If you still want to run the cmdlet, use the Force parameter.
- To modify settings, specify new values for the necessary parameters, After you run this cmdlet, the previous settings will be rewritten with new values. The parameters that you omit will remain unchanged.

---

### Examples
> Example 1

$job = Get-VBRJob -Name "Apache Replication"
$reiprule = New-VBRViReplicaReIpRule -SourceIp 172.16.*.* -SourceMask 255.255.0.0 -TargetIp 172.17.*.* -TargetMask 255.255.0.0 -TargetGateway 172.17.0.1
Set-VBRViReplicaJob -Job $job -EnableReIp -ReIpRule $reiprule
This example shows how to configure a re-IP rule for a replication job.

Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRViReplicaReIpRule cmdlet. Specify the SourceIp, SourceMask, TargetIp, TargetMask and TargetGateway parameter values. Save it to the $reiprule variable.
3. Run the Set-VBRViReplicaJob cmdlet. Set the $job variable as the Job parameter value. Provide the EnableReIp parameter. Set the $reiprule variable as the ReIpRule parameter value.
> Example 2

$job = Get-VBRJob -Name "Apache Replication"
$repository = Get-VBRBackupRepository -Name "Backup Volume 01"
Set-VBRViReplicaJob -Job $job -EnableSeeding -RepositorySeed $repository
This example shows how to configure seeding for a replication job.

Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save it to the $repository variable.
3. Run the Set-VBRViReplicaJob cmdlet. Set the $job variable as the Job parameter value. Provide the EnableSeeding parameter. Set the $repository variable as the RepositorySeed parameter value.

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

#### **EnableReIp**
Enables the option to use the re-IP rules.
Use the ReIpRule parameter to set the re-IP rules.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSeeding**
Enables the option to use seeding for this replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableVMMapping**
Enables the option to use replica mapping for this replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies the array of  VMs you want to add to this job.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[IViItem[]]`|false   |named   |True (ByPropertyName)|

#### **Folder**
Specifies the folder to which you want to replicate.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify the job even if the geographic location of the VMs added to the job and the target host location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the replication job you want to modify.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name you want to assign to the replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **OriginalVM**
For replica mapping.
Specifies the production VM you want to replicate using replica mapping.
The replication job will map this VM to a selected replica VM on the DR site.
Use the ReplicaVM parameter to specify the replica VM on the DR site.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **ReIpRule**
Specifies the re-IP rules.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRViReplicaReIpRule[]]`|false   |named   |False        |

#### **ReplicateFromBackup**
For building replica from backup files.
If set to $true, the job will use the backups in repository to build the replica. Use the SourceRepository parameter to set the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ReplicaVM**
For replica mapping.
Specifies the VM on the DR site you want to use as the replication target. The replication job will map the production VM to this VM.       s Use the OriginalVM parameter to specify the production VM.

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
Specifies the target host where the created replica will be stored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **SourceNetwork**
For network mapping.
Specifies the array of production networks to which the VMs in the job are connected.
Note: the number of the source and the target networks must be the same.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies the source proxy you want to assign to the job.
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
Default: not set.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that will be appended to the name of the VM you are replicating.
This name will be used to register the replicated VM on the target server.
Default: "_replica".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
For network mapping.
Specifies the array of networks in the DR site. The replicated VMs will be connected to these networks.
Note: the number of the source and the target networks must be the same.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **TargetProxy**
Specifies the target proxy you want to assign to the job.
Default: automatic selection.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **TargetWANAccelerator**
Specifies the WAN accelerator configured in the target site that will be used for data transfer.
Remember to set the pair of source and target WAN accelerators.
Default: not set.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

#### **UseWANAccelerator**
Defines that the data will be transferred via WAN accelerators.
Use the SourceWANAccelerator and TargetWANAccelerator parameters to set the pair of WAN accelerators.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob

Veeam.Backup.Core.Infrastructure.IViItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViReplicaJob [-BackupRepository <CBackupRepository>] [-Datastore <VBRViDatastoreBase>] [-Description <String>] [-DiskType {Source | Thick | Thin | ThickEagerZeroed}] [-EnableNetworkMapping] [-EnableReIp] 
```
```PowerShell
[-EnableSeeding] [-EnableVMMapping] [-Entity <IViItem[]>] [-Folder <CViFolderItem>] [-Force] [-HighPriority] -Job <CBackupJob> [-Name <String>] [-OriginalVM <CViVmItem[]>] [-ReIpRule <VBRViReplicaReIpRule[]>] 
```
```PowerShell
[-ReplicateFromBackup] [-ReplicaVM <CViVmItem[]>] [-RepositorySeed <CBackupRepository>] [-ResourcePool <CViResourcePoolItem>] [-RestorePointsToKeep <Int32>] [-Server <Object>] [-SourceNetwork 
```
```PowerShell
<VBRViNetworkInfo[]>] [-SourceProxy <CViProxy[]>] [-SourceRepository <CBackupRepository[]>] [-SourceWANAccelerator <CWanAccelerator>] [-Suffix <String>] [-TargetNetwork <VBRViNetworkInfo[]>] [-TargetProxy 
```
```PowerShell
<CViProxy[]>] [-TargetWANAccelerator <CWanAccelerator>] [-UseWANAccelerator] [<CommonParameters>]
```
