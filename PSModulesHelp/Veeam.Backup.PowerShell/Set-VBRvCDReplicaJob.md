Set-VBRvCDReplicaJob
--------------------

### Synopsis
Modifies Cloud Director replication jobs.

---

### Description

Modifies Cloud Director replication jobs.

---

### Related Links
* [Get-VBRvCDReplicaJob](Get-VBRvCDReplicaJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Modifying vDC Replicas Metadata Repository

$job = Get-VBRvCDReplicaJob -Name "Win20049"
$repository = Get-VBRBackupRepository -Name "Repository08"
Set-VBRvCDReplicaJob -Job $job -MetadataRepository $repository
This example shows how to assign the Repository08 metadata  repository to the Win20049 vDC replication job.

Perform the following steps:
1. Run the Get-VBRvCDReplicaJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Set-VBRvCDReplicaJob cmdlet. Set the $job variable as the Job parameter value. Set the $repository variable as the MetadataRepository parameter value.

---

### Parameters
#### **CompressionLevel**
Specifies the compression level of the replicated data:
* None: use this option if you do not want to enable data compression.
* Dedupe-friendly: use this option to set a dedupe-friendly compression level.
* Optimal: use this option to set an optimal compression level.
* High: use this option to set a high compression level.
* Extreme: use this option to set an extreme compression level.
Default: Optimal.
Valid Values:

* None
* DedupeFriendly
* Optimal
* High
* Extreme

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRCompressionLevel]`|false   |named   |False        |

#### **Description**
Specifies the description that you want to assign to assign to the VDC replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableGuestProcessing**
Enables guest processing options.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableInitialSeeding**
Enables replica seeding.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableNetworkMapping**
Enables network mapping.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableReplicaMapping**
Enables replica mapping.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableScheduleOptions**
Enables schedule for a VDC replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableWanAccelerators**
Enables the WAN accelerator option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludedObject**
Specifies an array of VM containers that you want to exclude from the VDC replication job.
You can exclude the following types of Cloud Director source objects:
* Organization
* Organization VDC
* vApp

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[IVcdItem[]]`|false   |named   |False        |

#### **GuestProcessingOptions**
Specifies guest processing options of a VDC replication job.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRReplicaApplicationProcessingOptions]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the Cloud Director replication jobs that you want to modify.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[VBRvCDReplicaJob]`|true    |named   |True (ByValue)|

#### **MetadataRepository**
Specifies a backup repository that will store metadata for VDC replicas.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Name**
Specifies the name that you want to assign to the VDC replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification options of a VDC replication job.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OriginalVApp**
For replica mapping.
Specifies a production vApp that you want to replicate using replica mapping.
The VDC replication job will map this vApp to the vApp on the disaster recovery site.
Use the ReplicaVApp parameter to specify the vApp on the disaster recovery site.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CVcdVappItem[]]`|false   |named   |False        |

#### **ReplicaVApp**
For replica mapping.
Specifies a vApp on the disaster recovery site.
The cmdlet will map the production vApp to this vApp, and the VDC replication job will replicate data to this vApp.
Use the OriginalVApp parameter to specify the production vApp.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CVcdVappItem[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding.
Specifies the backup repository that keeps a full backup of a VM that you want to replicate.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RestorePointsToKeep**
Specifies a number of restore points you want to keep for of VDC replicas.
Permitted values: 1 to 28.
Default: 7.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies a schedule for a VDC replication job.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRServerScheduleOptions]`|false   |named   |False        |

#### **SourceNetwork**
For the network mapping option.
Specifies an array of the production networks, to which the VMs in the job are connected.
Note: The number of the source and the target networks must be the same.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRvCDOrgVdcNetworkInfo[]]`|false   |named   |False        |

#### **SourceObject**
Specifies an array of vApps that you want to replicate.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[IVcdItem[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies an array of the source proxies.
The cmdlet will assign these proxies to the VDC replication job.
Default: Automatic selection.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **SourceWanAccelerator**
Specifies the WAN accelerator configured in the source site.
The cmdlet will use this WAN accelerator data transfer.
Default: Not set.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that the cmdlet will add to the name of VDC replicas.
Default: "_replica".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
For the network mapping option.
Specifies the network in the Disaster Recovery site. The replicated VMs will be connected to these networks.
Note: The number of the source and the target networks must be the same.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRvCDOrgVdcNetworkInfo[]]`|false   |named   |False        |

#### **TargetProxy**
Specifies an array of the target proxies.
The cmdlet will assign these proxies to the VDC replication job.
Default: Automatic selection.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **TargetWanAccelerator**
Specifies the WAN accelerator configured in the target site.
The cmdlet will use this WAN accelerator data transfer.
Default: Not set.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRvCDReplicaJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRvCDReplicaJob [-CompressionLevel {None | DedupeFriendly | Optimal | High | Extreme}] [-Description <String>] [-EnableGuestProcessing] [-EnableInitialSeeding] [-EnableNetworkMapping] 
```
```PowerShell
[-EnableReplicaMapping] [-EnableScheduleOptions] [-EnableWanAccelerators] [-ExcludedObject <IVcdItem[]>] [-GuestProcessingOptions <VBRReplicaApplicationProcessingOptions>] [-HighPriority] -Job 
```
```PowerShell
<VBRvCDReplicaJob> [-MetadataRepository <CBackupRepository>] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-OriginalVApp <CVcdVappItem[]>] [-ReplicaVApp <CVcdVappItem[]>] [-RepositorySeed 
```
```PowerShell
<CBackupRepository>] [-RestorePointsToKeep <Int32>] [-ScheduleOptions <VBRServerScheduleOptions>] [-SourceNetwork <VBRvCDOrgVdcNetworkInfo[]>] [-SourceObject <IVcdItem[]>] [-SourceProxy <CViProxy[]>] 
```
```PowerShell
[-SourceWanAccelerator <CWanAccelerator>] [-Suffix <String>] [-TargetNetwork <VBRvCDOrgVdcNetworkInfo[]>] [-TargetProxy <CViProxy[]>] [-TargetWanAccelerator <CWanAccelerator>] [<CommonParameters>]
```
