Add-VBRvCDReplicaJob
--------------------

### Synopsis
Creates Cloud Director replication jobs.

---

### Description

This cmdlet creates Cloud Director replication jobs.
Note that when you create a Cloud Director replication jobs, you need to run it manually unless you enable a job schedule.
Run the Start-VBRvCDReplicaJob cmdlet to run the job manually.

---

### Related Links
* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

---

### Examples
> Creating vDC Replication Job

$vapp = Find-VBRvCloudEntity -Name "AvP04" -VApp
$orgvdc = Find-VBRvCloudEntity -Name "Org07" -OrganizationVdc
Add-VBRvCDReplicaJob -SourceObject $vapp -OrganizationVdc $orgvdc -Name "vCD_05j" -Description "AvP04 replica"
This example shows how to create the vCD_05j VDC replication job to replicate the AvP04 vApp to the Org07 organization VDC.

Perform the following steps:
1. Run the Find-VBRvCloudEntity cmdlet. Specify the Name parameter value. Save the result to the $vapp variable.
2. Run the Find-VBRvCloudEntity cmdlet. Specify the Name parameter value. Provide the OrganizationVdc parameter. Save the result to the $orgvdc variable.
3. Run the Add-VBRvCDReplicaJob cmdlet. Specify the following settings:
- Set the $vapp variable as the SourceObject parameter value.
- Set the $orgvdc variable as the OrganizationVdc parameter value.
- Specify the Name parameter value.
- Specify the Description parameter value.

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
Specifies the description that you want to assign to the VDC replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ExcludedObject**
Specifies an array of VM containers that you want to exclude from the VDC replication job.
You can exclude the following types of Cloud Director source objects:
* Organization
* Organization VDC
* vApp

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[IVcdItem[]]`|false   |named   |False        |

#### **GeneralStoragePolicy**
Specifies the storage policy.
The cmdlet will create VDC replication jobs according to the policy settings.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdOrgVdcStorageProfile]`|false   |named   |False        |

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

#### **IndividualVAppStoragePolicy**
Specifies the individual storage policy for a Cloud Director VM.
The job will create VDC replicas of these VMs according to the policy settings.

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[VBRvCDIndividualObjectStoragePolicy[]]`|false   |named   |False        |

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

#### **OrganizationVdc**
Specifies the cloud organization VDC.
The job will store the Cloud Director replicas on the selected organization VDC.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[CVcdOrganizationVdcItem]`|true    |named   |False        |

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
Specifies a vApp on the disaster recovery site. The cmdlet will map the production vApp to this vApp, and the VDC replication job will replicate data to this vApp.
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
Specifies an array of the production networks, to which the vApps are connected.
Note: The number of the source and the target networks must be the same.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRvCDOrgVdcNetworkInfo[]]`|false   |named   |False        |

#### **SourceObject**
Specifies an array of vApps that you want to replicate.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[IVcdItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.Infrastructure.IVcdItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRvCDReplicaJob [-CompressionLevel {None | DedupeFriendly | Optimal | High | Extreme}] [-Description <String>] [-ExcludedObject <IVcdItem[]>] [-GeneralStoragePolicy <CVcdOrgVdcStorageProfile>] 
```
```PowerShell
[-GuestProcessingOptions <VBRReplicaApplicationProcessingOptions>] [-HighPriority] [-IndividualVAppStoragePolicy <VBRvCDIndividualObjectStoragePolicy[]>] [-MetadataRepository <CBackupRepository>] [-Name 
```
```PowerShell
<String>] [-NotificationOptions <VBRNotificationOptions>] -OrganizationVdc <CVcdOrganizationVdcItem> [-OriginalVApp <CVcdVappItem[]>] [-ReplicaVApp <CVcdVappItem[]>] [-RepositorySeed <CBackupRepository>] 
```
```PowerShell
[-RestorePointsToKeep <Int32>] [-ScheduleOptions <VBRServerScheduleOptions>] [-SourceNetwork <VBRvCDOrgVdcNetworkInfo[]>] -SourceObject <IVcdItem[]> [-SourceProxy <CViProxy[]>] [-SourceWanAccelerator 
```
```PowerShell
<CWanAccelerator>] [-Suffix <String>] [-TargetNetwork <VBRvCDOrgVdcNetworkInfo[]>] [-TargetProxy <CViProxy[]>] [-TargetWanAccelerator <CWanAccelerator>] [<CommonParameters>]
```
