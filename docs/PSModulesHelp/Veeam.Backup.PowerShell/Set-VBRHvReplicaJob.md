Set-VBRHvReplicaJob
-------------------

### Synopsis
Modifies Hyper-V replication jobs.

---

### Description

This cmdlet modifies an existing Hyper-V replication job.
Consider the following:
- The cmdlet will not run if the geographic location of the VMs added to the job and the job target repository location do not match. If you still want to run the cmdlet, use the Force parameter.
- To modify settings, specify new values for the necessary parameters, After you run this cmdlet, the previous settings will be rewritten with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRServer](Get-VBRServer)

* [Find-VBRHvEntity](Find-VBRHvEntity)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRHvReplicaReIpRule](New-VBRHvReplicaReIpRule)

* [Get-VBRReplica](Get-VBRReplica)

---

### Examples
> Example 1

$job = Get-VBRJob -Name "Hawk Replication"
$reiprule = New-VBRHvReplicaReIpRule -SourceIp 172.16.*.* -SourceMask 255.255.0.0 -TargetIp 172.17.*.* -TargetMask 255.255.0.0 -TargetGateway 172.17.0.1
Set-VBRHvReplicaJob -Job $job -EnableReIp -ReIpRule $reiprule
This example shows how to configure a re-IP rule for a replication job.

Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save it to the $job variable.
2. Run the New-VBRHvReplicaReIpRule cmdlet. Specify the SourceIp, SourceMask, TargetIp, TargetMask, TargetGateway parameter value. Save it to the $reiprule variable.
3. Run the Set-VBRHvReplicaJob cmdlet. Set the $job variable as the Job parameter value. Provide the EnableReIp parameter. Set the $reiprule variable as the ReIpRule parameter value.
> Example 2

$job = Get-VBRJob -Name "Hawk Replication"
$repository = Get-VBRBackupRepository -Name "Backup Volume 01"
Set-VBRHvReplicaJob -Job $job -EnableSeeding -RepositorySeed $repository
This example shows how to configure seeding for a replication job.

Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save it to the $job variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save it to the $repository variable.
3. Run the Set-VBRHvReplicaJob cmdlet. Set the $job variable as the Job parameter value. Provide the EnableSeeding parameter. Set the $repository variable as the RepositorySeed parameter value.
> Example 3

$job = Get-VBRJob -Name "Hawk Replication"
$originalvm = Find-VBRHvEntity -Server "Production Host" -Name "Original VM"
$replicavm = Find-VBRHvEntity -Server "DR Host" -Name "Replica VM"
Set-VBRHvReplicaJob -Job $job -EnableVMMapping -OriginalVM $originalvm -ReplicaVM $replicavm
This example shows how to configure VM mapping for a replication job.

Perform the following steps:
1. un the Get-VBRJob cmdlet. Specify the Name parameter value. Save it to the $job variable.
2. Run the Find-VBRHvEntity cmdlet. Specify the Server and Name parameter values. Save it to the $originalvm variable.
3. Run the Find-VBRHvEntity cmdlet. Specify the Server and Name  parameter values. Save it to the $replicavm variable.
4. Run the Set-VBRHvReplicaJob cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Provide the EnableVMMapping parameter.
- Set the $originalvm variable as the OriginalVM parameter value.
- Set the $replicavm variable as the ReplicaVM parameter value.

---

### Parameters
#### **BackupRepository**
Specifies the backup repository that will be used to store replica metadata files. Default: default backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Description**
Specifies the description of the replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Specifies the array of VMs you want to add to this job.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[IHvItem[]]`|false   |named   |True (ByPropertyName)|

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
Specifies the Hyper-V host where the created replica will be stored.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

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
Veeam.Backup.Core.CBackupJob

Veeam.Backup.Core.HyperV.Infrastructure.IHvItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRHvReplicaJob [-BackupRepository <CBackupRepository>] [-Description <String>] [-EnableReIp] [-EnableSeeding] [-EnableVMMapping] [-Entity <IHvItem[]>] [-Force] [-HighPriority] -Job <CBackupJob> [-Name 
```
```PowerShell
<String>] [-OriginalVM <CHvVmItem[]>] [-Path <String>] [-ReIpRule <VBRHvReplicaReIpRule[]>] [-ReplicaVM <CHvVmItem[]>] [-RepositorySeed <CBackupRepository>] [-Server <CHost>] [-SourceRepository 
```
```PowerShell
<CBackupRepository[]>] [-Suffix <String>] [<CommonParameters>]
```
