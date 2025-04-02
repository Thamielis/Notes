Add-VBRHvReplicaJob
-------------------

### Synopsis
Creates Hyper-V replication jobs.

---

### Description

This cmdlet creates a new Hyper-V replication job.
You can select a data source from which VM data must be read:
- Actual VM: Veeam Backup & Replication will copy an actual VM from production storage. The created replica will mirror an actual VM state.
Use the Entity parameter to indicate the VMs you want to replicate.
- Replica from backup files:  Veeam Backup & Replication will build a replica from backup files stored in a backup repository. The created replica will be in the latest state the VM is available in backups.
Use the Entity parameter to indicate the VMs you want to replicate and the BackupRepository parameter to set the repository from where the backup files must be read.
Note that when you create a replica job, you need to run it manually unless you enable a job schedule.
Run the Start-VBRJob cmdlet to start the created job manually.
Run the Set-VBRJobSchedule cmdlet to set schedule for the job and run it automatically.
The cmdlet will not run if the geographic location of the VMs added to the job and the job target repository location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Examples
> Example 1

$entity = Find-VBRHvEntity -Name "sql02"
$targetserver = Get-VBRServer -Type HvServer -Name "Hv_Server"
Add-VBRHvReplicaJob -Name "SQL02 Replica job" -Entity $entity -Server $targetserver -Path "c:\Replicas" -Suffix "_replicated" -Description "SQL02 replication"
This example shows how to create a VM replica from a production storage.

Perform the following steps:
1. Run the Find-VBRHvEntity cmdlet. Specify the Name parameter value. Save the result to the $entity variable.
2. Run the Get-VBRServer cmdlet. Set the HvServer value as the Type parameter value. Specify the Name parameter value. Save it to the $targetserver variable.
3. Run the Add-VBRHvReplicaJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $entity variable as the Entity parameter value.
- Set the $targetserver variable as the Server parameter value.
- Specify the Path parameter value.
- Specify the Suffix parameter value.
- Specify the Description parameter value.
> Example 2

$sql02 = Find-VBRHvEntity -Name "HvExchange"
$targetserver = Get-VBRServer -Type HvServer -Name "Hv_Server"
$repository = Get-VBRBackupRepository -Name "Backups Vol2"
Add-VBRHvReplicaJob -Name "SQL02 Replica job" -Server $targetserver -Path "c:\Replicas" -Entity $sql02 -Description "SQL02 replication" -SourceRepository $repository
This example shows how to create a VM replica from backup files.
Perform the following steps:
1. Run the Find-VBRHvEntity cmdlet. Specify the Name parameter value. Save the result to the $sql02 variable.
2. Run the Get-VBRServer cmdlet. Set the HvServer value as the Type parameter value. Specify the Name parameter value. Save it to the $targetserver variable.
3. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save it to the $repository variable.
4. Run the Add-VBRHvReplicaJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $targetserver variable as the Server parameter value.
- Specify the Path parameter value.
- Set the $sql02 variable as the Entity parameter value.
- Specify the Description parameter value.
- Set the $repository variable as the SourceRepository parameter value.

---

### Parameters
#### **BackupRepository**
Specifies the backup repository that will be used to store replica metadata files.
Default: default backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Description**
Specifies the description of the replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Entity**
Specifies the array of VMs you want to add to this job.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IHvItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
|`[CHvVmItem[]]`|false   |named   |False        |

#### **Path**
Specifies the Hyper-V volume where the created replica will be stored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ReIpRule**
Specifies the re-IP rules.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRHvReplicaReIpRule[]]`|false   |named   |False        |

#### **ReplicaVM**
For replica mapping.
Specifies the VM on the DR site you want to use as the replication target. The replication job will map the production VM to this VM.
Use the OriginalVM parameter to specify the production VM.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CHvVmItem[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding.
Specifies the backup repository where the seed (the full backup) resides.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Server**
Specifies the target Hyper-V host where the created replica will be stored.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **SourceRepository**
For building replica from backup files.
Specifies the backup repository that will be used to read the VM data from the already existing backup chain.
You cannot specify cloud repository.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that will be appended to the name of the VM you are replicating. This name will be used to register the replicated VM on the target server.
Default: "_replica".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.HyperV.Infrastructure.IHvItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRHvReplicaJob [-BackupRepository <CBackupRepository>] [-Description <String>] -Entity <IHvItem[]> [-Force] [-HighPriority] [-Name <String>] [-OriginalVM <CHvVmItem[]>] [-Path <String>] [-ReIpRule 
```
```PowerShell
<VBRHvReplicaReIpRule[]>] [-ReplicaVM <CHvVmItem[]>] [-RepositorySeed <CBackupRepository>] -Server <CHost> [-SourceRepository <CBackupRepository[]>] [-Suffix <String>] [<CommonParameters>]
```
