Add-VBRvCDCloudReplicaJob
-------------------------

### Synopsis
Creates vCD cloud replication jobs.

---

### Description

This cmdlet creates vCD cloud replication jobs. Only the tenant can create vCD cloud replication jobs.

To allow the tenant create vCD cloud replication jobs, the Service provider must configure the infrastructure in VMware vCloud Director. It includes the following elements:
- The Organization vDC
- The vCD storage policy settings

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

* [Get-VBRvCDCloudOrganizationvDC](Get-VBRvCDCloudOrganizationvDC)

* [Get-VBRvCDCloudvApp](Get-VBRvCDCloudvApp)

* [Get-VBRvCDCloudStoragePolicy](Get-VBRvCDCloudStoragePolicy)

---

### Examples
> Example - Creating vCD Cloud Replication Job

$vm = Find-VBRViEntity -Name "vCD VM"
$vdc = Get-VBRvCDCloudOrganizationvDC -Name "Cloud Organization"
$vApp = Get-VBRvCDCloudvApp -OrganizationvDC $vdc
$policy = Get-VBRvCDCloudStoragePolicy -Name "Silver Policy"
Add-VBRvCDCloudReplicaJob -Name "ReplicaJob" -Entity $vm -OrganizationvDC $vdc -vApp $vapp -StoragePolicy $policy
This example shows how to create a vCD cloud replication job.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to $vm variable.
2. Run the Get-VBRvCDCloudOrganizationvDC cmdlet. Specify the Name parameter value. Save the result to the $vdc variable.
3. Run the Get-VBRvCDCloudvApp cmdlet. Set the $vdc variable as the OrganizationvDC parameter value. Save the result to the $vApp variable.
4. Run the Get-VBRvCDCloudStoragePolicy cmdlet. Specify the Name parameter value. Save the result to the $policy variable.
5. Run the Add-VBRvCDCloudReplicaJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $vm variable as the Entity parameter value.
- Set the $vdc variable as the OrganizationvDC parameter value.
- Set the $vapp variable as the vApp parameter value.
- Set the $policy variable as the StoragePolicy parameter value.

---

### Parameters
#### **BackupRepository**
Specifies the user backup repository that will be used to store replica metadata files. If not set, the default backup repository will be used. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

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
Enables network mapping. Use the following parameters to set the network mapping rules:
* SourceNetwork
* TargetNetwork

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies the array of VMs. The cmdlet will add the selected VMs to the vCD replication job. Accepts the IViItem[] object.  To get this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput |
|-------------|--------|--------|--------------|
|`[IViItem[]]`|true    |named   |True (ByValue)|

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

#### **OrganizationvDC**
Specifies the cloud Organization vDC. The job will store the replicas on the selected Organization vDC. Accepts the VBRvCDCloudOrganizationvDC object. To get this object, run the Get-VBRvCDCloudOrganizationvDC cmdlet.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRvCDCloudOrganizationvDC]`|true    |named   |False        |

#### **OriginalVM**
For replica mapping. Specifies an array of production VMs that you want to replicate using replica mapping. The replication job will map these VMs to selected replica VMs on the Disaster Recovery site. Use the ReplicaVM parameter to specify the replica VM on the Disaster Recovery site. Accepts the CViVmItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **ReplicaVM**
For replica mapping. Specifies an array of VMs on the Disaster Recovery site that you want to use as the replication target.  The replication job will map the production VMs to these VMs. Use the OriginalVM parameter to specify the production VM. Accepts the VBRvCDCloudVM object. To get this object, run the Get-VBRvCDCloudVM cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRvCDCloudVM[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding. Specifies the backup repository where the seed (the full backup) resides. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **SourceNetwork**
For the network mapping option. Specifies the array of the production networks, to which the VMs in the job are connected. NOTE: The number of the source and the target networks must be the same. Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies the source proxy that will be used by the job. Default: Automatic selection Accepts the CViProxy[] object.  To get this object, run the Get-VBRViProxy cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **SourceRepository**
Used for building a replica from backup files. Specifies the backup repository that will be used to read the VM data from the already existing backup chain. NOTE: You cannot specify a cloud repository. Accepts the CBackupRepository[] object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **SourceWANAccelerator**
Specifies the WAN accelerator configured in the source site that will be used for data transfer. NOTE: You can set the source WAN accelerator only if the cloud provider has a target WAN accelerator configured. Accepts the CWanAccelerator object.  To get this object, run the Get-VBRWANAccelerator cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the vCD cloud storage policy.  The job will create replicas per the policy settings. Accepts the VBRvCDCloudStoragePolicy object. To get this object, run the Get-VBRvCDCloudStoragePolicy cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRvCDCloudStoragePolicy]`|true    |named   |False        |

#### **Suffix**
Specifies the suffix that will be appended to the name of the VM you are replicating. This name will be used to register the replicated VM on the target server. If omitted, the replicated VMs will have the '_replica' suffix by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
For the network mapping option. Specifies the network in the Disaster Recovery site. The replicated VMs will be connected to these networks. NOTE: The number of the source and the target networks must be the same. Accepts the VBRvCDCloudNetworkInfo[] object. To get this object, run the Get-VBRvCDCloudNetworkInfo cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRvCDCloudNetworkInfo[]]`|false   |named   |False        |

#### **vApp**
Specifies the vApp container. The job will store the replicas on the selected vApp. NOTE: if you do not specify the vApp container, the job will store the replicas on the default vApp. Accepts the VBRvCDCloudvApp object. To get this object, run the Get-VBRvCDCloudvApp cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRvCDCloudvApp]`|false   |named   |False        |

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
Add-VBRvCDCloudReplicaJob [-BackupRepository <CBackupRepository>] [-Description <String>] [-DiskType {Source | Thick | Thin | ThickEagerZeroed}] [-EnableNetworkMapping] -Entity <IViItem[]> [-Force] 
```
```PowerShell
[-HighPriority] [-Name <String>] -OrganizationvDC <VBRvCDCloudOrganizationvDC> [-OriginalVM <CViVmItem[]>] [-ReplicaVM <VBRvCDCloudVM[]>] [-RepositorySeed <CBackupRepository>] [-SourceNetwork 
```
```PowerShell
<VBRViNetworkInfo[]>] [-SourceProxy <CViProxy[]>] [-SourceRepository <CBackupRepository[]>] [-SourceWANAccelerator <CWanAccelerator>] -StoragePolicy <VBRvCDCloudStoragePolicy> [-Suffix <String>] [-TargetNetwork 
```
```PowerShell
<VBRvCDCloudNetworkInfo[]>] [-vApp <VBRvCDCloudvApp>] [<CommonParameters>]
```
