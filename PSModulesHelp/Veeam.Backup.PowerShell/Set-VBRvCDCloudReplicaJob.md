Set-VBRvCDCloudReplicaJob
-------------------------

### Synopsis
Modifies vCD cloud replication jobs.

---

### Description

This cmdlet modifies vCD cloud replication jobs.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRvCDCloudOrganizationvDC](Get-VBRvCDCloudOrganizationvDC)

* [Get-VBRvCDCloudNetworkInfo](Get-VBRvCDCloudNetworkInfo)

* [Get-VBRvCDCloudStoragePolicy](Get-VBRvCDCloudStoragePolicy)

* [Get-VBRvCDCloudVM](Get-VBRvCDCloudVM)

---

### Examples
> Modifying Organization vDC for vCD Cloud Replication Job

$replicaJob = Get-VBRJob -Name "ReplicavCDJob"
$vdc = Get-VBRvCDCloudOrganizationvDC -Name "AtlOrg"
Set-VBRvCDCloudReplicaJob -Job $replicajob -OrganizationvDC $vdc
This example changes the Organization vDC for the ReplicavCDJob vCD cloud replication job to the AtlOrg Organization vDC

Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $replicaJob variable.
2. Run the Get-VBRvCDCloudOrganizationvDC cmdlet. Specify the Name parameter value. Save the result to the $vdc variable.
3. Run the Set-VBRvCDCloudReplicaJob cmdlet. Set the $replicajob variable as the Job parameter value. Set the $vdc variable as the OrganizationvDC parameter value.

---

### Parameters
#### **BackupRepository**
Specifies the user backup repository that will be used to store replica metadata files. If not set, the default backup repository will be used. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Description**
Specifies the description of a new job.

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
Indicates that network mapping will be enabled. Use the following parameters to set the network mapping rules:
* SourceNetwork
* TargetNetwork

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSeeding**
Enables the replication job to use seeding.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableVMMapping**
Enables the replication job to use replica mapping.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies an array of VMs.The cmdlet will add the selected VMs to the vCD replication job. Accepts the IViItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IViItem[]]`|false   |named   |False        |

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
Specifies the vCD cloud replication job that you want to modify. Accepts the CBackupJob object. To get this object, run the Get-VBRJob cmdlet.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CBackupJob]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name that you want to assign to the cloud replication job

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **OriginalVM**
For replica mapping. Specifies the array of production VMs that you want to replicate using replica mapping. The replication job will map these VMs to a selected replica VM on the Disaster Recovery site. Use the ReplicaVM parameter to specify the replica VM on the DR site. To get this object, run the Find-VBRViEntity cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **ReplicaVM**
For replica mapping. Specifies the array of VMs on the  Disaster Recovery site that you want to use as the replication target. The replication job will map the production VMs to these VMs. Use the OriginalVM parameter to specify the production VM. Accepts the VBRvCDCloudVM[] object. To get this object, run the Get-VBRvCDCloudVM cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRvCDCloudVM[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding. Specifies the backup repository where the seed (the full backup) resides. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **SourceNetwork**
For the network mapping option. Specifies an array of the production networks, to which the VMs in the job are connected. NOTE: The number of the source and the target networks must be the same. Accepts the VBRViNetworkInfo[] object.  To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies the source proxy that will be used by the job. Accepts the CViProxy[] object.  To get this object, run the Get-VBRViProxy cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **SourceRepository**
Used for building a replica from backup files. Specifies the backup repository that will be used to read the VM data from the already existing backup chain. NOTE: You cannot specify a cloud repository. Accepts the CBackupRepository[] object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **SourceWANAccelerator**
Specifies the WAN accelerator configured in the source site that will be used for data transfer. Remember to set the pair of source and target WAN accelerators. Accepts the CWanAccelerator object.  To get this object, run the Get-VBRWANAccelerator cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the vCD cloud storage policy. The job will create replicas per the policy settings. Accepts the VBRvCDCloudStoragePolicy object. To get this object, run the Get-VBRvCDCloudStoragePolicy cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRvCDCloudStoragePolicy]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that will be appended to the name of the VM you are replicating. This name will be used to register the replicated VM on the target server. If omitted, the replicated VMs will have the '_replica' suffix by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
For the network mapping option. Specifies an array of networks on the Disaster Recovery site. The replicated VMs will be connected to these networks. NOTE: The number of the source and the target networks must be the same. Accepts the VBRvCDCloudNetworkInfo[] object. To get this object, run the Get-VBRvCDCloudNetworkInfo cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRvCDCloudNetworkInfo[]]`|false   |named   |False        |

#### **UseWANAccelerator**
Defines that the data will be transferred via WAN accelerators. Use the SourceWANAccelerator and TargetWANAccelerator parameters to set the pair of WAN accelerators.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **vApp**
Specifies the vApp container. The job will store the replicas on the selected vApp. Accepts the VBRvCDCloudvApp object.  To get this object, run the Get-VBRvCDCloudvApp cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRvCDCloudvApp]`|false   |named   |False        |

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
Set-VBRvCDCloudReplicaJob [-BackupRepository <CBackupRepository>] [-Description <String>] [-DiskType {Source | Thick | Thin | ThickEagerZeroed}] [-EnableNetworkMapping] [-EnableSeeding] [-EnableVMMapping] 
```
```PowerShell
[-Entity <IViItem[]>] [-Force] [-HighPriority] -Job <CBackupJob> [-Name <String>] [-OriginalVM <CViVmItem[]>] [-ReplicaVM <VBRvCDCloudVM[]>] [-RepositorySeed <CBackupRepository>] [-SourceNetwork 
```
```PowerShell
<VBRViNetworkInfo[]>] [-SourceProxy <CViProxy[]>] [-SourceRepository <CBackupRepository[]>] [-SourceWANAccelerator <CWanAccelerator>] [-StoragePolicy <VBRvCDCloudStoragePolicy>] [-Suffix <String>] 
```
```PowerShell
[-TargetNetwork <VBRvCDCloudNetworkInfo[]>] [-UseWANAccelerator] [-vApp <VBRvCDCloudvApp>] [<CommonParameters>]
```
